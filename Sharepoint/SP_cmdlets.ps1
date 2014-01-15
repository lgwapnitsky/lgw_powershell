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
		#$spRoleAssignment = New-Object Microsoft.Sharepoint.SPRoleAssignment($($spweb.EnsureUser($LoginName)))
		
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

function global:SPUser-CreateUserCSV
{
	Param
	(
		[Parameter(Mandatory=$true,ValueFromPipeline=$true)]
			[ValidateScript({Test-Path $_ -PathType Leaf})] 
			[string]$CSVFile="",
		[Parameter(Mandatory=$true)]
			[string]$url,
		[Parameter(Mandatory=$true)]
			[string]$RoleDef
	)

	#Import-Csv $CSVFile | ForEach-Object { SPUser-CreateUser -url $url -LoginName $_.NTAccountName -Name $_.Name -Email $_.Email -RoleDef $RoleDef }
	Import-Csv $CSVFile | ForEach-Object { SPUser-CreateUser -url $url -LoginName $_.NTAccountName -RoleDef $RoleDef }
}