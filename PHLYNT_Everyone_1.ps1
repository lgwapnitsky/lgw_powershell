$root = "c:\"
$oldDom = "PHLYNT"
$oldGroup = "EVERYONE"
$phlynt_everyone = "{0}\{1}" -f $oldDom, $oldGroup
$phlynt_LGW = "PHLYNT\lwapnits"

$newDom = "CORP"
$newGroup = "ImageRight - All CORP Users"
$newIRgroup = "{0}\{1}" -f $newDom, $newGroup

$b = (get-acl "i:\12_acct").Access

$subs = get-ChildItem -Path $root | where { $_.PSIsContainer -eq $true }

foreach ($sub in $subs)
{
	$access = (get-Acl $sub.FullName).Access
	
	foreach ($a in $access)
	{
		if ($a.IdentityReference -eq $phlynt_lgw) 
		{
			$identity = $newaccess.IdentityReference.Value.Replace($oldDom, $newDom)
			$identity = $identity.Replace($oldGroup, $newGroup)
			$permission = $identity,
						  $newaccess.FileSystemRights,
						  $newaccess.InheritanceFlags,
						  $newaccess.PropagationFlags,
						  $newaccess.AccessControlType

			$permission
			$objACE = new-Object system.Security.AccessControl.FileSystemAccessRule $permission
#			
			$objACL = get-Acl $sub.FullName
#			
;			$objACL.AddAccessRule($objACE)
#			
			set-Acl $sub.FullName -AclObject $objACL
		}
	}
}