$domain = "CORP"
$context = new-object System.DirectoryServices.ActiveDirectory.DirectoryContext("Domain", $Domain)
$dom = [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($context)
$domDN = $dom.distinguishedname
$domroot = $dom.GetDirectoryEntry()

$connect = $domroot.path
$connect

$ads = New-Object System.DirectoryServices.DirectorySearcher([ADSI]"$Connect")
$ads.PageSize = 25000
$ads.Filter = "(&(objectCategory=OrganizationalUnit))"
$ads.SearchScope = "Subtree"
#$ads.PropertiesToLoad.AddRange(("canonicalName".split()))
$x = $ads.FindAll() # foreach { $_.properties.canonicalname } | sort
$x[20].properties
