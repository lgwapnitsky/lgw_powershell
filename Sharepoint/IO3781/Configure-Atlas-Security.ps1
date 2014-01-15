<#
.SYNOPSIS
Creates security groups and assigns permissions to Atlas sites
.EXAMPLE
./Configure-Atlas-Security -Url http://atlasdev
#>

[CmdletBinding()]

# Command line parameters
Param
(
    [Parameter(Mandatory=$true)]
    [String]$Url
)

#############################
# Script Functions          #
#############################  

# Function: CreateSecurityGroup
# Description: Creates the specified security group
Function CreateSecurityGroup([Microsoft.SharePoint.SPWeb]$SPWeb, [String]$GroupName, [string]$Owner)
{
    $SPWeb.SiteGroups.Add($GroupName, $SPWeb.Site.Owner, $SPWeb.Site.Owner, "")
    $Group = $SPWeb.SiteGroups[$GroupName]
    $Group.AllowMembersEditMembership = $false
    if (($Owner -ne $Null) -and ($Owner -ne ""))
    {
        $OwnerGroup = $SPWeb.SiteGroups[$Owner]
        $Group.Owner = $OwnerGroup
    }
    $Group.Update()
}

# Function: GrantPermissions
# Description: Grants the specified permissions to the specified group
Function GrantPermissions([Microsoft.SharePoint.SPWeb]$SPWeb, [String]$GroupName, [String]$PermissionLevel)
{
  $TheGroup = $SPWeb.SiteGroups[$GroupName]
  if ($TheGroup -ne $null)
  {
    $TheGroupAssignment = new-object Microsoft.SharePoint.SPRoleAssignment($TheGroup)
    $TheRoleDefinition = $SPWeb.Site.RootWeb.RoleDefinitions[$PermissionLevel]
    $TheGroupAssignment.RoleDefinitionBindings.Add($TheRoleDefinition)
    $SPWeb.RoleAssignments.Add($TheGroupAssignment)
    $SPWeb.Update()
  }
  else
  {
    Write-Host "ERROR: The specified group" $GroupName "is invalid. Group not added to security." -ForegroundColor Yellow 
  }
}

# Function: AddUserToGroup
# Description: Adds the specified user to the specified group
Function AddUserToGroup([Microsoft.SharePoint.SPWeb]$SPWeb, [String]$GroupName, [String]$UserName)
{
    # Assign group and user names to variables
    $TheGroup = $SPWeb.SiteGroups[$GroupName]
    $TheUser = $SPWeb.Site.RootWeb.EnsureUser($UserName)

    # Add user to group
    $TheGroup.AddUser($TheUser)
}

#####################################
# Main Script                       #
#####################################

$TheDate = Get-Date
Write-Host "`nExecution started at " $TheDate.toShortTimeString()

# Include the common functions
$thisScript = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ($thisScript + '.\Common-Functions.ps1')

# Stop processing on any errors
$ErrorActionPreference = "Continue"

# Iterate the divisions and configure each site
$divisions = New-Object System.collections.ArrayList
GetDivisionInformation $divisions
Foreach ($division in $divisions)
{
    $SiteUrl = $Url+"/"+$division[1]
    $SPWeb = Get-SPWeb($SiteUrl)
    Write-Host "Configuring division site:" $SiteUrl

    # Derive the name of the division content admin group
    $AdminGroupName = "Content Admins - "+$SPWeb.Title

    # Create the security groups
    CreateSecurityGroup $SPWeb "Super Admins" "Super Admins"
    CreateSecurityGroup $SPWeb "IT Admins" "Super Admins"
    CreateSecurityGroup $SPWeb "Content Reviewers" "Super Admins"
    CreateSecurityGroup $SPWeb $AdminGroupName "Super Admins"
    CreateSecurityGroup $SPWeb "End Users" "Super Admins"

    # Grant permissions
    GrantPermissions $SPWeb "Super Admins" "Full Control"
    GrantPermissions $SPWeb "IT Admins" "Contribute"
    GrantPermissions $SPWeb "Content Reviewers" "Contribute"
    GrantPermissions $SPWeb $AdminGroupName "Contribute"
    GrantPermissions $SPWeb "End Users" "Read"
    
    # Add test users to groups
    AddUserToGroup $SPWeb "Super Admins" "cable\!EASAtlasSA"
    AddUserToGroup $SPWeb "IT Admins" "cable\!EASAtlasIT"
    AddUserToGroup $SPWeb $AdminGroupName "cable\!EASAtlasCAD"
    AddUserToGroup $SPWeb "Content Reviewers" "cable\!EASAtlasCR"
    AddUserToGroup $SPWeb "End Users" "cable\!EASAtlasEU"

    # Remove permissions for site default groups
    $DefaultGroups = ( "Owners", "Members", "Visitors")
    Foreach ($Group in $DefaultGroups)
    {
        $GroupName = $SPWeb.Title + " " + $Group
        $SPWeb.SiteGroups.Remove($GroupName)
    }
}

# Iterate the markets and configure each site
$markets = New-Object System.collections.ArrayList
GetMarketInformation $markets
Foreach ($market in $markets)
{
    $SiteUrl = $Url+$market[1]
    $SPWeb = Get-SPWeb($SiteUrl)
    Write-Host "Configuring market site:" $SiteUrl

    # Break security inheritance
    $SPWeb.BreakRoleInheritance($true, $true)

    # Derive the name of the market content admin group
    $MarketAdminGroup = "Content Admins - "+$SPWeb.Title
    CreateSecurityGroup $SPWeb $MarketAdminGroup "Super Admins"
    GrantPermissions $SPWeb $MarketAdminGroup "Contribute"
    
    # Add test users to groups
    AddUserToGroup $SPWeb $MarketAdminGroup "cable\!EASAtlasCAM"
}

Write-Host "`nExecution completed at " $TheDate.toShortTimeString()
