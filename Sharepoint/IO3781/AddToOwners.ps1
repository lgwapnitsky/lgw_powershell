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

function global:Add-ToOwnersGroups
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[ValidateScript({($_.AbsoluteURI -ne $null) -and ($_.Scheme -match '[http|https]')})]
			[System.URI]$Site,
		[Parameter(Mandatory=$true)]
			[String]$GroupToAdd
	)
	
	$spweb = Get-SPWeb $Site.AbsoluteURI
	$spsite = Get-SPSIte $spweb.URL
	
	$was_count = $spsite.webapplication.sites.count
	$p_count = 0
	
	[Microsoft.SharePoint.SPSecurity]::RunWithElevatedPrivileges(
	{
	foreach ($sitecoll in $spsite.webapplication.sites)
	{
		$percentComplete = (($($p_count)/$($was_count))*100)
		$percentComplete = "{0:N2}" -f $percentComplete
		
		write-progress -id 1 -Activity "Examining $($SiteColl.URL)" -Status "$($percentComplete)% Complete" -PercentComplete $percentComplete
	
		$tempSPWeb = Get-SPWeb $sitecoll.URL
		$tempGroupToAdd = $tempSPWeb.Site.RootWeb.EnsureUser($GroupToAdd)
		
		try
		{
			foreach ($web in $sitecoll.AllWebs | where {$_.HasUniqueRoleAssignments -eq $true})
			{
				foreach ($roleAssignment in $web.RoleAssignments)
				{
					if (($roleAssignment.Member.GetType() -eq [Microsoft.SharePoint.SPGroup]) -and (($roleAssignment.Member.Name) -match [regex]"(?i)owners"))
					{
						write-progress -id 2 -ParentID 1 -Activity "Adding $GroupToAdd" -Status "$($roleAssignment.Member.Name)"
						$gg = $tempSPWeb.SiteGroups[[Microsoft.SharePoint.SPGroup]$roleAssignment.Member]
						$gg.AddUser($tempGroupToAdd)
					}
				}
			}
		}
		
		catch {write-host "error"} 
		
		$p_count+=1
	}
	})
}