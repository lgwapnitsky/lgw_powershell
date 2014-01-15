function paramTest()
{
	PARAM(
		[Parameter(Mandatory=$true)]
			[ValidateSet("Set","Remove")]
			[String]$action,
		[Parameter(Mandatory=$false)]
			[String]$old,
		[Parameter(Mandatory=$true)]
			[String]$new,
		[Parameter(Mandatory=$true)]
			[String]$rootPath
	)
	Process
	{
		$grp_params = @($old,$new)
		
		foreach ($group in $grp_params)
		{
			$dom, $grp = $group.split("\")
			$searcher = new-Object DirectoryServices.DirectorySearcher("ldap://" + $dom)
			$searcher.filter = "(&(objectCategory=Group)(objectClass=Group)(cn=$grp))"
			[system.DirectoryServices.SearchResultCollection]$Results = $searcher.FindAll()
			if ($Results.count -lt 1) { throw "Invalid Group: " + $group }
		}
		
		if ((test-Path $rootPath -PathType leaf) -ne $false) { throw "Invalid Path: " + $rootPath }
	}
}

function addGroup
{
	
}

$warningMsg = "
		To set/remove group permissions,
		you must specify, in order:
		the action (set or remove)
		the group name to copy permissions from (DOMAIN\GROUP) [set only]
		the group name to copy to/remove (DOMAIN\GROUP)
		the root path of the folders to modify
		"
		
switch ($args[0])
{
	"set"
	{
		$action = $args[0]
		$old = $args[1]
		$new = $args[2]
		$rootPath = $args[3]
		
		if ($args.Length -ne 3)
		{
			write-Warning $warningMsg
			exit
		}
		
		paramTest -action $action -old $old -new $new -rootpath $rootpath
	}
	
	"remove"
	{
		if ($args.Length -ne 3)
		{
			write-Warning $warningMsg
			exit
		}
		
		$action = $args[0]
		$new = $args[1]
		$rootpath = $args[2]
		
		paramTest -action $action -old $new -new $new -rootpath $rootpath
	}
	
	default
	{
		write-Warning $warningMsg
		
		exit
	}
}


#$root = "c:\"
#$oldDom = "PHLYNT"
#$oldGroup = "EVERYONE"
#$phlynt_everyone = "{0}\{1}" -f $oldDom, $oldGroup
#
#$newDom = "CORP"
#$newGroup = "ImageRight - All CORP Users"
#$newIRgroup = "{0}\{1}" -f $newDom, $newGroup
#
#$subs = get-ChildItem -Path $root | where { $_.PSIsContainer -eq $true }
#
#foreach ($sub in $subs)
#{
#	$access = (get-Acl $sub.FullName).Access
#	
#	foreach ($a in $access)
#	{
#		if ($a.IdentityReference -eq $phlynt_everyone) 
#		{
#			$identity = $newaccess.IdentityReference.Value.Replace($oldDom, $newDom)
#			$identity = $identity.Replace($oldGroup, $newGroup)
#			$permission = $identity,
#						  $newaccess.FileSystemRights,
#						  $newaccess.InheritanceFlags,
#						  $newaccess.PropagationFlags,
#						  $newaccess.AccessControlType
#
#			$permission
#			$objACE = new-Object system.Security.AccessControl.FileSystemAccessRule $permission
#			$objACL = get-Acl $sub.FullName
#			$objACL.AddAccessRule($objACE)
#			set-Acl $sub.FullName -AclObject $objACL
#		}
#	}
#}
