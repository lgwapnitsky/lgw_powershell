Clear-Host

$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$currentScriptName = $MyInvocation.MyCommand.Name
$currentExecutingPath = $fullPathIncFileName.Replace($currentScriptName, "")

$SPCmdlets = "{0}SP_cmdlets.ps1" -f $currentExecutingPath
. $SPCmdlets

$SPSGroup = "CORP\SharePoint Services"
$url = "http://balaapd003:81"
$rootSPWeb = Get-SPWeb $url

$rootsite = Get-SPSite $url

#$groupToAdd = $rootSPWeb.Site.RootWeb.EnsureUser($SPSGroup)

Function LoopSites
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[Microsoft.SharePoint.SPWeb]$SPWeb
	)

	$site = Get-SPSite $spweb.Url
	
	foreach ($sitecoll in $site.webapplication.sites)
	{
		Write-Host $sitecoll.Url
		$tempSPWeb = Get-SPWeb $sitecoll.Url
		$groupToAdd = $tempSPWeb.Site.RootWeb.EnsureUser($SPSGroup)
		try 
		{
			foreach ($web in $sitecoll.AllWebs)
			{
				if ($web.HasUniqueRoleAssignments)
				{
					foreach ($roleAssignment in $web.RoleAssignments)
					{
						$principal = $roleAssignment.Member
						if ($principal.gettype() -eq [Microsoft.SharePoint.SPGroup])
						{
							$rolegroup = [Microsoft.SharePoint.SPGroup]$principal
							if ($rolegroup.name -match "(?i)owners") 
							{
							#$x = "rg: {0} | og: {1} | web: {2}" -f $rolegroup.name, $web.associatedownergroup.name, $web.Name
						 	#Write-Output $x

								$gg = $tempSPWeb.SiteGroups[$rolegroup]
								write-host $gg
								$gg.RemoveUser($groupToAdd)
								#$gg.AddUser($groupToAdd)
							}
						}
					}
				} 
			}
		}
		catch{Write-Host 'error'}
	}
}

LoopSites($rootSPWeb)

$rootSPweb.Dispose()