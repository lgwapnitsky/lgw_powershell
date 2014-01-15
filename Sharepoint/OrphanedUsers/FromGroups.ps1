Trap {
	$err = $_.Exception
	write-error $err.Message
	while ( $err.InnerException) 
	{
		$err = $err.InnerException
		Write-Error $err.Message
	}
	break;
}

Set-PSDebug -Strict
#$ErrorActionPreference = "stop"
$ErrorActionPreference = "SilentlyContinue"

$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$currentScriptName = $MyInvocation.MyCommand.Name
$currentExecutingPath = $fullPathIncFileName.Replace($currentScriptName, "")

Function GetGroupUsers
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[Microsoft.SharePoint.SPGroup]$rg
	)
	
	$gu_hash = @{}
	$gu_hash.Add($rg.Name, $(New-Object system.Collections.ArrayList))
	
	
	$rg.users | ForEach-Object {

		if ((ValidUser $_) -eq $false)
		{
			$gu_hash[$rg.Name].Add($_.LoginName) | Out-Null
		}
	}
	return $gu_hash
}

Function Loop-Sites
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[Microsoft.SharePoint.SPWeb]$SPWeb
	)

	try
	{
		$WebApp = Get-SPWebApplication $WebAppURL
		
	[Microsoft.SharePoint.SPSecurity]::RunWithElevatedPrivileges( {
		foreach ($site in $WebApp.Sites)
		{
			$siteCount = 0

			try {$WebsColl = $site.AllWebs | where {($_.HasUniqueRoleAssignments -eq $True) -and ($_.SiteUsers -ne $null)} }
			catch { $WebsColl = @($(Get-SPWeb $site.URL)) }
			
			$WebsColl | ForEach-Object {
				Write-Progress -Id 1 -Activity "Searching for orphans...[$($site.url)]" -Status $_.Title -PercentComplete $($(($siteCount++)/($WebsColl.Count))*100)

				Loop-Groups($_)
			}
		}
	} )
	}
	catch{Write-Host "Invalid Site: $($site.url)" -ForegroundColor Red}
}

Function Loop-Groups
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[Microsoft.SharePoint.SPWeb]$SPWeb
	)
	
	
	
	$user_al = New-Object system.Collections.ArrayList
	
	foreach ($roleAssignment in $SPWeb.RoleAssignments)
	{
		$principal = $roleAssignment.Member

		switch ($principal.gettype())
		{
			Microsoft.SharePoint.SPGroup
			{
				$GroupHash = GetGroupUsers($principal)
			}
			
			Microsoft.SharePoint.SPUser
			{
				if ((ValidUser $principal) -eq $false)
				{
					$user_al.Add($principal.LoginName) | Out-Null
				}
			}
		}
	}
	
	$return = New-Object -TypeName PSObject -Property @{
		Groups = $GroupHash
		Users = $user_al
	}
	
	$hashtable.Add($SPWeb.URL, $return)
}

Function Remove-GroupOrphans
{
	param ($siteHash)
	
	Process
	{
		$objectcount = 0
		foreach ($object in $siteHash.GetEnumerator())
		{
			$Groups = $object.value.Groups
			$Users = $object.value.Users
			
			$siteURL = $object.key
			[Microsoft.SharePoint.SPSecurity]::RunWithElevatedPrivileges( { $SPSite = Get-SPSite $siteURL })
			
			Write-Progress -Id 1 -Activity "Going through hash" -Status $siteURL -PercentComplete $($(($objectcount++)/($siteHash.count))*100)
	
			$siteCount = 0
			foreach ($site in $SPSite.allwebs) {
				$siteGroups = New-Object System.Collections.ArrayList
				$site.groups | foreach {$siteGroups.add($_.name)} | Out-Null
				
				#$site.users | where { $Users.Contains($_.loginname)} | foreach {
					#$site.users.Remove($_.loginname)
				#write-host $site.url
				$users | foreach { 
					try {
					$Site.Users.Remove($_)
					#Write-Host "User: $($_.loginname)"
					#write-host "User: $($_)"
					}
					catch{}
				}
				
				Write-Progress -Id 2 -ParentId 1 -Activity "Removing Orphans" -Status $SPSite.URL  -PercentComplete $($(($siteCount++)/($SPSite.AllWebs.Count))*100)

				foreach ($group in $Groups.GetEnumerator()| where {$users.count -gt 0})
				{
				
					if ($siteGroups.contains($group.name))
					{
						$site.groups[$group.name].users | where { $Users.contains($_.loginname)} | foreach { 
							try { 
								[Microsoft.SharePoint.SPSecurity]::RunWithElevatedPrivileges( { $Site.Users.Remove($User) } )
								#Write-Host "$($group.name): $($_.loginname)" 
							}
							catch{}
						
						}
					}
				}
			}
		}
	}
}

function Get-GroupOrphans
{
	[CmdletBinding(DefaultParametersetName="Report")]
	param(
		[Parameter(ParameterSetName="DeleteOrphans", Mandatory=$true, ValueFromPipeline=$true)]
			[string]$WebAppURL,
		
		[Parameter(ParameterSetName="DeleteOrphans", Position=2, Mandatory=$true, ValueFromPipeline=$true)]
			[string]$Domain
	)
	
	PROCESS {
		$hashtable = @{}

		$DOM = $(Get-Domain)
		$DOMroot = $DOM.GetDirectoryEntry()

		$rootSPWeb = Get-SPWeb $WebAppURL
		Loop-Sites($rootSPWeb)
		$rootSPWeb.Dispose()

		
		#$hashtable
		
		Remove-GroupOrphans $hashtable
	}
}


#$url = "http://balaapd003:81"
#$domain = "phlynt"

