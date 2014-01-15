[cmdletbinding()]
Param
(
	[Parameter(
		Mandatory=$true,
		ValueFromPipeline=$true,
		ValueFromPipelineByPropertyName=$true)]
		[string]$url
)


Function GetPerms
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[Microsoft.SharePoint.SPRoleAssignment]$ra
	)
	
	$bindings = $ra.RoleDefinitionBindings
	$perms = $bindings | ForEach-Object {
		$perm = $_
		New-Object -TypeName PSObject -Property @{
			Permission = $perm.Name
			Desc = $perm.Description
			Rights = $perm.BasePermissions
		}
	}
	
	return $perms
}

Function GetGroupUsers
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[Microsoft.SharePoint.SPGroup]$rg
	)
	
	$users = $rg.users | ForEach-Object {
		$user = $_
		New-Object -TypeName PSObject -Property @{
			Name = $user.name
			Email = $user.email
			Login = $user.LoginName
			SiteAdmin = $user.issiteadmin
		}
	} 
	
	return $users
}

Function LoopGroups
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[Microsoft.SharePoint.SPWeb]$SPWeb
	)

	$indUsers = @()

	foreach ($roleAssignment in $SPWeb.RoleAssignments)
	{
		$principal = $roleAssignment.Member
		if ($principal.gettype() -eq [Microsoft.SharePoint.SPGroup])
		{
			$rolegroup = [Microsoft.SharePoint.SPGroup]$principal
			"Group: $rolegroup"  | new-underline

			$perms = GetPerms $roleAssignment
			$users = GetGroupUsers $rolegroup
			
			$perms  | Format-Table -AutoSize -Property @{ Expression="    "},Permission, Desc|Out-Host
			$users | Format-Table -AutoSize -Property @{ Expression="    "},name, login, siteadmin| Out-Host
		}
		else
		{
			$indUsers = $indUsers + ([Microsoft.SharePoint.SPUser]$principal)
		}
	}
	
		if ($indUsers.Count -gt 0)
		{
			$iu = $indUsers | ForEach-Object {
				$user = $_
				New-Object -TypeName PSObject -Property @{
					Name = $user.name
					Email = $user.email
					Login = $user.LoginName
					SiteAdmin = $user.issiteadmin
				}
			}
			
			"Individual Users" | New-Underline
			$iu | Format-Table -AutoSize -Property @{Expression="    "},name,Login,Siteadmin | Out-Host
		}
}

Function LoopSites
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[Microsoft.SharePoint.SPWeb]$SPWeb
	)

	$site = Get-SPSite $SPWeb.Url
	
	foreach ($sitecoll in $site.webapplication.sites)
	{
		foreach ($web in $sitecoll.Allwebs)
		{
			if ($Web.Url.startswith($url))
			{
				"Site: $web`tURL: {0}" -f $Web.Url  | New-Underline
				LoopGroups($web)
			}
		}
	}
}


Clear-Host

$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$currentScriptName = $MyInvocation.MyCommand.Name
$currentExecutingPath = $fullPathIncFileName.Replace($currentScriptName, "")

$SPCmdlets = "{0}SP_cmdlets.ps1" -f $currentExecutingPath
. $SPCmdlets

$utilFuncs = "{0}util_funcs.ps1" -f $currentExecutingPath
. $utilFuncs

$rootSPWeb = Get-SPWeb $url
#$rootSite = Get-SPSite $url

LoopSites($rootSPWeb)

$rootSPWeb.Dispose()