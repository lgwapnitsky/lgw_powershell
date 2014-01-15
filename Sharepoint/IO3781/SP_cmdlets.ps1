[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.Sharepoint") > null

Function global:Get-SPWeb($url)
{
	$site = New-Object Microsoft.SharePoint.SPSite($url)
	if ($site -ne $null)
	{
		$web = $site.OpenWeb()
	}
	return $web
}

Function global:Get-SPSite($url)
{
	return New-Object Microsoft.SharePoint.SPSite($url)
}

function global:SPUser-CreateUser
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[string]$url,
		[Parameter(Mandatory=$true)]
			[string]$LoginName,
		[Parameter(Mandatory=$true)]
			[string]$Name,
		[Parameter(Mandatory=$true)]
			[string]$EMail,
		[Parameter(Mandatory=$false)]
			[string]$Notes="",
		[Parameter(Mandatory=$true)]
			[string]$RoleDef
	)
	
	try
	{
		$spsite = Get-SPSite $url
		$spWeb = Get-SPWeb $url
		
		$spRoleAssignment = New-Object Microsoft.Sharepoint.SPRoleAssignment($LoginName, $EMail, $Name, $Notes)

		$spRoleAssignment.RoleDefinitionBindings.Add($spWeb.RoleDefinitions[$RoleDef])
		$spweb.RoleAssignments.Add($spRoleAssignment)
		
		$spWeb.Update()
	}
	
	catch
	{	
		Write-Error "error"
	}
	finally
	{
		$spweb.Close()
		$spsite.Close()
	}
}
