Add-Type -AssemblyName System.DirectoryServices.AccountManagement
$username = read-host -prompt "Enter a username"
$ct = [System.DirectoryServices.AccountManagement.ContextType]::Domain
$user = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($ct, $username)
$groups = $user.GetGroups()
foreach($i in $groups){
	if ($i.IsSecurityGroup) {
		$tlg = $i.SamAccountName
		"Top-Level Group: $tlg"
		
		$x  = $i.Members
		foreach ($m in $x) {
			if($m.issecuritygroup)
			{
				$ng = $m.SamAccountName
				"`tNested Group: $ng"
			}
		}
	}
}


