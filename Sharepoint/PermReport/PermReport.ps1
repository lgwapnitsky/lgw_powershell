Function New-Underline
{
 [CmdletBinding()]
param(
      [Parameter(Mandatory = $true,Position = 0,valueFromPipeline=$true)]
      [string]
      $stringIN,
      [string]
      $char = "_"
 )
  $underLine= $char * $stringIn.length
  $stringIn
  $underLine
} #end function new-underline

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

Clear-Host

$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$currentScriptName = $MyInvocation.MyCommand.Name
$currentExecutingPath = $fullPathIncFileName.Replace($currentScriptName, "")

$SPCmdlets = "{0}SP_cmdlets.ps1" -f $currentExecutingPath
. $SPCmdlets

$url = "http://balaapd003:81/dept/claims"

$rootSPWeb = Get-SPWeb $url
#$rootSite = Get-SPSite $url

LoopGroups($rootSPWeb)
#$rootSPWeb.Dispose()