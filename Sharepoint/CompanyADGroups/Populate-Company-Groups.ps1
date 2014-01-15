<#
.SYNOPSIS
Populates SharePoint security groups with users for a specified member company
.EXAMPLE
./Populate-Company-Groups -Company "TMNAS" -SiteURL "http://services.corp.tmnas.com" -ReportOnly "true"
#>

[CmdletBinding()]

# Command line parameters
Param
(
    [Parameter(Mandatory=$true)]
		[ValidateSet("TMNAS","PHLY","TMM", "FICOH")] 
		[String]$Company,

    [Parameter(Mandatory=$true)]
		[ValidateScript({validURL($_)})]
		[String]$SiteURL,

    [Parameter(Mandatory=$true)]
		[Boolean]$ReportOnly
)

function validURL($url)
{
	$rx = [regex]"^(http|https)\://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&amp;%\$#\=~])*$"
	return $url -match $rx
}

#############################
# Script Functions          #
#############################  

Function GetUsers([System.Collections.ArrayList]$UserList,[String]$LDPath,[String]$EmailSuffix,[String]$DomainPrefix)
{
    $DirectoryEntry = new-object System.DirectoryServices.DirectoryEntry($LDPath)

    # Set the search criteria and execute the search
    $search = new-object System.DirectoryServices.DirectorySearcher($DirectoryEntry);
    $search.PageSize = 2000;
	$search.Filter = "(&(objectCategory=User)(mail=$EmailSuffix)(!(userAccountControl:1.2.840.113556.1.4.803:=2)))"
    $result = $search.FindAll()

    # Add users to results list
    foreach ($User in $result)
    {
        $TheName = $User.Properties.samaccountname
        $UserList.Add("$DomainPrefix\$TheName") | Out-Null
    }
}

Function GetUsersOld([System.Collections.ArrayList]$UserList,[String]$DomainPrefix,[String]$EmailSuffix,[String]$StartingOU)
{
    Get-ADUser -Properties EmailAddress -Filter { (EmailAddress -like $EmailSuffix) -and (enabled -eq $true) } -SearchBase $StartingOU | Select SamAccountName | 
        foreach { $UserList.Add("$DomainPrefix\$($_.SamAccountName)") | Out-Null }
}

Function AddUsersToGroup
{
	Param
	(
		[System.Collections.ArrayList]$UserList,
		[String]$SiteURL,
		[String]$GroupName,
		[Boolean]$ReportOnly
	)
    
    Process
    {
		# Report Mode - Just list the users that will be added
		if ($ReportOnly)
		{
			$UserList | out-file "Users.txt"
			Write-Host 'User list written to file Users.txt' 
		}

		# Standard Mode - Empty the group and add the new users
		else
		{
			$SPWeb = Get-SPWeb $SiteURL
			$TheGroup = $SPWeb.SiteGroups[$GroupName]

			# Remove existing users from group
			$OldUsers = $TheGroup.Users
			foreach ($UserName in $OldUsers) 
			{ 
				$TheGroup.RemoveUser($UserName) 
			}    

			# Add new users to group
			foreach ($UserName in $UserList)
			{
				Write-Host 'Adding user:' $UserName
				$TheUser = $SPWeb.Site.RootWeb.EnsureUser($UserName)
				$TheGroup.AddUser($TheUser)
			}
		}
	}
}

#####################################
# Main Script                       #
#####################################

# Stop processing on any errors
$ErrorActionPreference = "Stop"

# Load Assemblies
[System.Reflection.Assembly]::LoadWithPartialName("System.DirectoryServices")

# Populate user list for the target company
$UserList = New-Object System.collections.ArrayList
switch ($Company) 
{ 
    "TMNAS"
    {
        #GetUsers $UserList "LDAP://OU=Employees,OU=Users,OU=TMNAS,DC=corp,DC=tmnas,DC=com" "*tmnas.com" "CORP"
        #AddUsersToGroup $UserList $SiteURL "ALL_USERS_TMNAS" $ReportOnly
		Write-Host 'The TMNAS SharePoint group is now mapped to the AD group u00dept_TMNAS_Everyone'
    } 
    "PHLY"
    {
        GetUsers $UserList "LDAP://OU=Employees,OU=Users,OU=PHLY,DC=corp,DC=tmnas,DC=com" "*phly.com" "CORP"
        AddUsersToGroup $UserList $SiteURL "ALL_USERS_PHLY" $ReportOnly
    } 
    "TMM"
    {
        GetUsers $UserList "LDAP://OU=Users,OU=TMM,DC=corp,DC=tmnas,DC=com" "*tokiom.com" "CORP"
        GetUsers $UserList "LDAP://DC=tokiom-ad,DC=tokiom,DC=com" "*tokiom.com" "TOKIOM-AD"
        AddUsersToGroup $UserList $SiteURL "ALL_USERS_TMM" $ReportOnly
    } 
    "FICOH"
    {
        GetUsers $UserList "LDAP://DC=ficoh,DC=com" "*ficoh.com" "FIRST_DOM"
        AddUsersToGroup $UserList $SiteURL "ALL_USERS_FICOH" $ReportOnly
        #Write-Host 'FICOH user information not yet available'
    } 
    default
    {
        Write-Host 'The company could not be determined.'
    }
}
