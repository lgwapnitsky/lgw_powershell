$filter="(&(objectclass=user)(!objectclass=computer)(!userAccountControl:1.2.840.113556.1.4.803:=2))"#(samaccountname=lwapnits))"
$rx_DN = "^.*?,(dc=.*)$"


[string]$now = (Get-Date -Format yyyyMMdd.HHmmss)

$root = [system.directoryservices.activedirectory.forest]::getcurrentforest().rootdomain.name
$objSearcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]"GC://$root")
$objSearcher.PageSize = 100
$objSearcher.Filter = $filter
$colResults = $objSearcher.FindAll()

$colResults.count

$objResult_count = 0

$results = @()
$groupHash = @{}

foreach ($objResult in $colResults)
{
	$ticketSize = 1200

	$objResult_count += 1
	$objResult_pct = (($($objResult_count) / $($colResults.count))*100)
	
	Write-Progress -ID 1 -Activity "Examining users..." -status " $($objResult.path)" -PercentComplete $objResult_pct
	
	if ($objResult.Path -match $rx_DN)
	{
		$userDomain = $matches[1].tolower()
	}
	else
	{
		write-error "Unable to determine User Domain by RegEx"
	}
	
	$userDN = "LDAP://" + $objResult.Properties.distinguishedname[0]
	$userAccount = [ADSI]$userdn
	$userAccount.GetInfoEX(@("tokenGroups"), 0) 
	
	try { $groups = $userAccount.GetEx("tokengroups") }
	catch { $groups = @() }
	
	$grp_count = 0
	foreach ($token in $groups)
	{
		$strSID = (New-Object System.Security.Principal.SecurityIdentifier($token,0)).value
		$key = $strSID

		if (!$groupHash.containskey($key)) {
			$groupHash.add($key, ("" | select domain, group, scope, sid))
			$groupHash.item($key).sid = $strSID
			
			$grp_count += 1
			$grp_pct = (($($grp_count) / ($groups.count)) * 100)
			
			$strSID = (New-Object System.Security.Principal.SecurityIdentifier($token, 0)).value
			$grp = [ADSI]"LDAP://<SID=$strSID>"
			
			if ($grp.Path -eq $null)
			{
				#write-warning "`tSID $strSID not found by LDAP"
				$groupHash.item($key).scope="notfound"
				$grpDN = "no dn"
			}
			else
			{
				$grpDN = $grp.distinguishedName.tostring().ToLower()
				$groupHash.item($key).group = $grpDN
				if ($grpdn -match $rx_DN)
				{
					$groupHash.item($key).domain = $matches[1].tolower()
				}
			}
			
			$grouptype = $grp.groupType.psbase.value
			if ($grouptype -band 0x80000000)
			{
				if ($grouptype -band 1){
					$grouphash.item($key).scope="buildin"
				}
				elseif ($grouptype -band 2){
					$grouphash.item($key).scope="global"
				}
				elseif ($grouptype -band 4){
					$grouphash.item($key).scope="local"
				}
				elseif ($grouptype -band 8){	
					$grouphash.item($key).scope="universal"
				}
				else {
					$grouphash.item($key).scope="unknown"
				}
			}
			else { $groupHash.item($key).scope = "dlist" }
		}
	
		switch ($groupHash.item($key).scope)
		{
			"builtin" { $ticketSize += 8 }
			"local" { $ticketSize += 40 }
			"global" { $ticketSize += 8 }
			"universal"
			{
				if ($userDomain -eq $groupHash.item($key).domain) 
					{ $ticketSize += 8 }
				else { $ticketSize += 40 }
			}
			"notfound" { $ticketSize += 40 } # worst-case scenario
			default { break }
		}
		
		#write-progress -id 2 -parentid 1 -activity "ticket size" -status $ticketSize
	}
	$psoResult = New-Object PSObject -Property @{
		path = $userAccount.distinguishedName.tostring()
		ticketSize = $ticketSize
		groupCount = $groups.Count
		userName = $userAccount.sAMAccountname.ToString()
		displayName = $userAccount.displayName.ToString()
	}
	$results += $psoResult
}	

$groupHash.Values | export-clixml .\dump-ticketsize.xml
$results | export-csv .\dump-ticketsize.csv -notypeinformation
