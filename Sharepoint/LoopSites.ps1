Clear-Host

$SPSGroup = "CORP\Sharepoint Services"
$url = "http://tmnas.corp.tmnas.com"

$rootSPWeb = Get-SPWeb $url
$rootsite = Get-SPSite $url

Function LoopSites
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[Microsoft.Sharepoint.SPWeb]$SPWeb
	)
	
	$site = Get-SPSite $SPWeb.Url
	
	foreach ($sitecoll in $site.webapplication.sites)
	{
		Write-Host $sitecoll.Url
		$tempSPWeb = Get-SPWeb $sitecoll.URL
		$groupToAdd = $tempSPWeb.Site.RootWeb.EnsureUser($SPSGroup)
		
		try
		{
			foreach ($web in $sitecoll.AllWebs)
			{
				if ($web.HasUniqueRoleAssignments)
				{
					foreach ($roleAssignment in $web.RoleAssignments)
					{
						$principal = $roleAssignment.member
						if ($principal.gettype() -eq [Microsoft.Sharepoint.SPGroup])
						{
							$roleGroup = [Microsoft.Sharepoint.SPGroup]$principal
							if ($roleGroup.name -match [regex]"(?i)owners$")
							{
								$tempSPWeb.SiteGroups[$roleGroup] | ForEach {
									Write-Output $_.name
									#$_.RemoveUser($groupToAdd)
									$_.AddUser($groupToAdd)
								}
							}
						}
					}
				}
			}
		}
		catch [Exception] {Write-Error $_.Exception.Message	}
	}
}

LoopSites($rootSPWeb)

$rootSPweb.Dispose()