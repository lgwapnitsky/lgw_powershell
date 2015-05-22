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

function Get-SPUserEffectivePermissions(
    [object[]]$users, 
    [Microsoft.SharePoint.SPSecurableObject]$InputObject) {
    
    begin { }
    process {
        $so = $InputObject
        if ($so -eq $null) { $so = $_ }
        
        if ($so -isnot [Microsoft.SharePoint.SPSecurableObject]) {
            throw "A valid SPWeb, SPList, or SPListItem must be provided."
        }
        
        foreach ($user in $users) {
            # Set the users login name
            $loginName = $user
            if ($user -is [Microsoft.SharePoint.SPUser] -or $user -is [PSCustomObject]) {
                $loginName = $user.LoginName
            }
            if ($loginName -eq $null) {
                throw "The provided user is null or empty. Specify a valid SPUser object or login name."
            }
            
            try{
            # Get the users permission details.
            $permInfo = $so.GetUserEffectivePermissionInfo($loginName)
            
            # Determine the URL to the securable object being evaluated
            $resource = $null
            if ($so -is [Microsoft.SharePoint.SPWeb]) {
                $resource = $so.Url
            } elseif ($so -is [Microsoft.SharePoint.SPList]) {
                $resource = $so.ParentWeb.Site.MakeFullUrl($so.RootFolder.ServerRelativeUrl)
            } elseif ($so -is [Microsoft.SharePoint.SPListItem]) {
                $resource = $so.ParentList.ParentWeb.Site.MakeFullUrl($so.Url)
            }

            # Get the role assignments and iterate through them
            $roleAssignments = $permInfo.RoleAssignments
            if ($roleAssignments.Count -gt 0) {
                foreach ($roleAssignment in $roleAssignments) {
                    $member = $roleAssignment.Member
                    
                    # Build a string array of all the permission level names
                    $permName = @()
                    foreach ($definition in $roleAssignment.RoleDefinitionBindings) {
                        $permName += $definition.Name
                    }
                    
                    # Determine how the users permissions were assigned
                    $assignment = "Direct Assignment"
                    if ($member -is [Microsoft.SharePoint.SPGroup]) {
                        $assignment = $member.Name
                    } else {
                        if ($member.IsDomainGroup -and ($member.LoginName -ne $loginName)) {
                            $assignment = $member.LoginName
                        }
                    }
                    
                    # Create a hash table with all the data
                    $hash = @{
                        Resource = $resource
                        "Resource Type" = $so.GetType().Name
                        User = $loginName
                        Permission = $permName -join ", "
                        "Granted By" = $assignment
                    }
                    
                    # Convert the hash to an object and output to the pipeline
                    New-Object PSObject -Property $hash
                }
            }
            }
            catch{}
        }
    }
    end {}
}
$p_count = 0

$rootURL = "tmnas.corp.tmnas.com"

$PermList = @()

$FICOHUsers = Import-CSV "$pwd\FICOH2.csv"

$FICOHUsers | ForEach-Object {
	$user = $_.NTAccountName
	$site = Get-SPSite "http://$rootURL"
	
	$p_count+=1
	$percentComplete = (($($p_count)/$($FICOHUsers.count))*100)
	$percentComplete = "{0:N2}" -f $percentComplete
	
	write-progress -id 1 -Activity "Getting Web Permissions" -Status "$($user) on $($site.url) [$($p_count)/$($FICOHUsers.count)]" -PercentComplete $percentComplete
	$webPermissions = $site | Get-SPWeb -Limit All | Get-SPUserEffectivePermissions $user
	write-progress -id 1 -Activity "Getting list Permissions" -Status "$($user) on $($site.url) [$($p_count)/$($FICOHUsers.count)]" -PercentComplete $percentComplete	
	$listPermissions = $site | Get-SPWeb -Limit All | %{$_.Lists | Get-SPUserEffectivePermissions $user}
	
	$PermList += $webPermissions
	$PermList += $listPermissions
	
	
}
$PermList | Export-CSV -NoTypeInformation "$pwd\$($rootURL)_FICOH2.csv"
