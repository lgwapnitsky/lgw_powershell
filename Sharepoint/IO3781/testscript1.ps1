Clear-Host

$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$currentScriptName = $MyInvocation.MyCommand.Name
$currentExecutingPath = $fullPathIncFileName.Replace($currentScriptName, "")

$SPCmdlets = "{0}SP_cmdlets.ps1" -f $currentExecutingPath
. $SPCmdlets

#[CmdletBinding()]
#Param
#(
#	[Parameter(Mandatory=$true)]
#		[String]$url,
#	[Parameter
#)

$SPSGroup = "CORP\SharePoint Services"
$url = "http://balaapd003:81"
$SPWeb = Get-SPWeb $url

#$gplist = $SPWeb.Groups | ForEach-Object {
#	$group = $_
#	New-Object -TypeName PSObject -Property @{
#		name = $group.Name
#		users = $group.Users
#	}
#}

$site = Get-SPSite $url
$groupToAdd = $SPWeb.Site.RootWeb.EnsureUser($SPSGroup)


$oglist = New-Object system.Collections.ArrayList
foreach ($sitecoll in $site.webapplication.sites)
{
	try {
		foreach ($web in $sitecoll.AllWebs)
		{
			try {
				$og = $web.AssociatedOwnerGroup.Name
				if ($oglist -notcontains $og)
				{
					$oglist.Add($og) > null
				}
			}
			catch {}
		} 
	}
	catch{}
}

$oglist | foreach {
	try {
		$og = $SPWeb.SiteGroups[$_]
		Write-Output $og.name
		#$og.AddUser($groupToAdd)
		$og.RemoveUser($groupToAdd)
	}
	catch{}
}