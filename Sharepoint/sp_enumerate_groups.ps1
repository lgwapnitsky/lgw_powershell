function Get-SPGroupsAndMembers()
{
<#
.SYNOPSIS
Use this PowerShell script to retrieve SharePoint Groups and its members
.DESCRIPTION
This PowerShell script connects to a SharePoint 2007 or SharePoint2010 website using webservices. It enumerates all groups and its members
.PARAMETER WebUrl
The full URL of the SharePoint site
.PARAMETER Credentials
Credentials for authenticating to SharePoint
.EXAMPLE
Get-SPGroupsAndMembers -WebUrl "http://intranet"
This example enumerates all SharePoint groups and members from the SharePoint site at 'http://intranet'
.EXAMPLE
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList "DOMAIN\Administrator", ("secret" | ConvertTo-SecureString -AsPlainText -Force  )
Get-SPGroupsAndMembers -WebUrl "http://intranet" -Credential $cred
This example enumerates all SharePoint groups and members from the SharePoint site at 'http://intranet' connecting to SharePoint with the given credentials
.NOTES
Use must have permissions to view SharePoint groups and enumerate their members in order to execute this function
.OUTPUTS
A collection of User Objects
#>
[CmdletBinding()]
Param(
	[Parameter(Position=0,Mandatory=$true,ValueFromPipeline=$true)][Alias("w")]
		[string]$WebUrl=(Read-Host "Please enter a Web URL (Example: http://intranet)"),
	[Parameter(Position=1,Mandatory=$false, ValueFromPipeline=$false)][Alias("c")]
		[System.Management.Automation.PSCredential]$Credentials
)
$WebUrl = $WebUrl -replace "([/])$","";
 
if ($Credentials) {
	$SPService = New-WebServiceProxy -Uri ($WebUrl + "/_vti_bin/UserGroup.asmx?WDSL") -Credential $Credentials
}
    else {
	$SPService = New-WebServiceProxy -Uri ($WebUrl + "/_vti_bin/UserGroup.asmx?WDSL") -UseDefaultCredential
}
 
$SPService.Url = $WebUrl + "/_vti_bin/UserGroup.asmx?WDSL"
 
    $WebGroups = $SPService.GetGroupCollectionFromWeb().Groups;
    $WebGroups.Group | ForEach-Object {
 		$GroupName = $_.Name;
		$GroupMembers = $SPService.GetUserCollectionFromGroup($_.Name).Users;
		$GroupMembers.User | ForEach-Object {
			New-Object PSObject -Property @{Group = $GroupName; Name = $_.Name; User = $_.LoginName; UserID = $_.ID; EMail=$_.Email}
        }
    }
}