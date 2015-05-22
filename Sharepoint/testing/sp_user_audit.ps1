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
$ErrorActionPreference = "stop"

$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$currentScriptName = $MyInvocation.MyCommand.Name
$currentExecutingPath = $fullPathIncFileName.Replace($currentScriptName, "")

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint") | Out-Null
 
$ScriptBlock = {
	#Functions to Imitate SharePoint 2010 Cmdlets in MOSS 2007
	function global:Get-SPWebApplication($WebAppURL)
	 { 
	  return [Microsoft.SharePoint.Administration.SPWebApplication]::Lookup($WebAppURL)
	 }
	 
	function global:Get-SPSite($url)
	 {
	    return new-Object Microsoft.SharePoint.SPSite($url)
	 }
	 
	function global:Get-SPWeb($url)
	{
	  $site= New-Object Microsoft.SharePoint.SPSite($url)
	        if($site -ne $null)
	            {
	               $web=$site.OpenWeb();       
	            }
	    return $web
	}
}

try { Add-PSSnapin microsoft.SharePoint.powershell -ErrorAction Stop }
catch
{
	Invoke-Command $ScriptBlock
}

function validPath($path)
{
	return !(test-Path -Path $path -PathType leaf)
}

function validFile($path)
{
	return (Test-Path -Path $path -PathType leaf)
}
  
function Get-Domain
{
	$context = new-object System.DirectoryServices.ActiveDirectory.DirectoryContext("Domain", $Domain)
	$domainContext = [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($context)
	return $domainContext
}
 
function UserExistsInAD
{
	param(
		[Parameter(Mandatory=$true)]
		[string]$UserLoginID
	)
	
	Process
	{
		$search = [System.DirectoryServices.DirectorySearcher]$DOMroot
		$search.Filter = "(&(objectCategory=User))"
		$Filter | foreach {
			$search.Filter = [regex]::Replace($sFilter,"\)$", "($($_)))")
		}
		$result = $search.FindOne()
		return $result -ne $null
	}
}

function UserExclusions
{
	param (
		[Parameter(Mandatory=$true)]
		[Microsoft.SharePoint.SPPrincipal]$User
	)
	return (($User.LoginName -notmatch [regex]"(?i)$([regex]::escape('nt authority\authenticated users'))") -and
			($User.LoginName -notmatch [regex]"(?i)$([regex]::escape('sharepoint\system'))") -and
			($User.LoginName -notmatch [regex]"(?i)$([regex]::escape('nt authority\local service'))") -and
			($User.LoginName -match [regex]"^(?i)$($Domain)\\.*") -and
			($User.IsDomainGroup -eq $false)
			)
}

function FindAuditUsers()
{
	$AuditedUsers = @{}
	$SiteURLs = @{}
	
	$WebApp = Get-SPWebApplication $WebAppURL
	$WebappSites_ProgCount=0
	
	foreach ($site in $WebApp.Sites)
	{
		$WebappSites_ProgCount += 1
		Write-Progress -Id 1 -Activity "Processing websites under the SharePoint application: $($WebAppURL)" -Status "Analyzing..." -PercentComplete (($($WebappSites_ProgCount)/$($WebApp.Sites.Count))*100)
	
		try{
			try {$WebsColl = $site.AllWebs | where {($_.HasUniqueRoleAssignments -eq $True) -and ($_.SiteUsers -ne $null)} }
			catch { $WebsColl = @($(Get-SPWeb $site.URL)) }
		$WebsColl_ProgCount = 0
		
		$WebsColl | Foreach-Object {
			$URL = $_.url
			$SiteURLs.Add($URL, $(new-object System.Collections.ArrayList))
	
			$WebsColl_ProgCount += 1
			Write-Progress -Id 2 -ParentId 1 -Activity "Looking for Audited users from domain [$($DOM.Name)] using filter [$($Filter)]" -Status $url -PercentComplete (($($WebsColl_ProgCount)/$($WebsColl.Count))*100)
			
			$SiteUsers_ProgCount = 0
			foreach ($User in $_.SiteUsers)
			{
				if ((UserExclusions $User) -and ($User -ne $null) -eq $True)
				{
					$AccountName = $User.LoginName.Split("\")[1]
					
					if (((UserExistsInAD $AccountName) -eq $true) -or
						((UserDisabledInAD $AccountName) -eq $false)
						)
					{
						switch ($AuditedUsers.ContainsKey($User.LoginName))
						{
							$true
							{
								$siteArray = [System.Collections.ArrayList]$AuditedUsers[$User.LoginName]
								if ($siteArray.Contains($URL) -eq $false)
								{
									$siteArray.Add($URL) | out-null
									$AuditedUsers.Set_Item($User.LoginName, $siteArray)
								}
							}
							$false 
							{
								$siteArray = New-Object System.Collections.ArrayList
								$siteArray.Add($URL) | out-null
								
								$AuditedUsers.Add($User.LoginName, $siteArray) | out-null
							}
						}
						
						if ($SiteURLs[$URL].Contains($User.LoginName) -eq $false)
						{
							$SiteURLs[$URL].Add($User.LoginName) | out-null
						}
					}
					}
				}
			} 
		 }	
		 catch{ Write-Host "Invalid Site: $($site.url)" -ForegroundColor Red}
	}
	
	
	$Return = New-Object PSObject -Property @{
		Users = $AuditedUsers
		Sites = $SiteURLs
	}
	
	$Return
}


function Out-Report
{	
	param
	(
		$reporthash, 
		[ValidateSet("BySite","ByUser")]
			[string]$ReportType
	)
    
    Process
    {
    	$name = [io.path]::GetFileNameWithoutExtension($currentScriptName)
    	$timestamp = Get-Date -Format yyyyMMdd_HHmm
    	
    	$filename = "$($reportPath)\$($name)_$($ReportType)_$($Domain)_$($timestamp).txt"
    	
		switch ($ReportType)
		{
			"BySite"
			{
				$reportOut = foreach ($object in $reporthash.GetEnumerator())
				{
		    		New-Object -TypeName PSObject -Property @{
		    			Site = $object.Name
		    			LoginName = [string]::join("`n", $object.value.ToArray())
		    		} | where {$object.value -ne $null}
				}
				$reportOut | Select-Object Site, LoginName | format-list | Out-File $filename -Force
			}
			
			"ByUser"
			{
				$reportOut = foreach ($object in $reporthash.GetEnumerator())
				{
					New-Object -TypeName PSObject -Property @{
						Site = [string]::Join("`n",$object.value.ToArray())
						LoginName = $object.Name
					} 
				}
				$reportOut | Select-Object LoginName, Site | format-list | Out-File $filename -Force
	    	}
		}
		
    	
        write-Host "Report written to $filename" -ForegroundColor Green
		
    }
}

function global:Audit-SharepointUsers {
	[CmdletBinding()]
	param
	(
		[Parameter(Position=1, Mandatory=$true, ValueFromPipeline=$true)]
			[string]$WebAppURL,
		
		[Parameter(Position=2, Mandatory=$true, ValueFromPipeline=$true)]
			[string]$Domain,
			
		[Parameter(Position=3, Mandatory=$false, ValueFromPipeline=$true)]
			[system.array]$Filter,

		[Parameter(Mandatory=$true)]
			[ValidateScript({validPath($_)})]
				[string]$ReportPath
	)
			
	PROCESS 
	{
		$DOM = $(Get-Domain)
		$DOMroot = $DOM.GetDirectoryEntry()
		
		$AuditedUsers = FindAudits
		   
		Out-Report $($AuditedUsers.Sites) BySite
		Out-Report $($AuditedUsers.Users) ByUser
	}
}

