# collects all users of the local domain and exports their groupmember count and estimated ticketsize
#
#
# 20120314 Version 1.1  detailed Output in file, Fix for unhandlet groups
# 20120319 Version 1.2  Groups as Hash, result as array, additional errorhandling
# 20120319 Version 1.3  Tokengroup with LDAP instead of GC
# 20120320 Version 1.4  not by SID resolvable Groups handlet as 40bytes
# 20120520 Version 1.5  export with delimiter
# 20120628 Version 1.6  Bugfix missing declaration of ticketsize as int = 0
#

param (
	[string]$filter="(&(objectclass=user)(!objectclass=computer)(!userAccountControl:1.2.840.113556.1.4.803:=2)(samaccountname=lwapnits))",
	[switch]$debug
)

$ErrorActionPreference = "stop"
Set-PSDebug -Strict

if ($debug) {
	$DebugPreference = "continue"
}

[string]$now = (Get-Date -Format yyyyMMdd.HHmmss)
[array]$result=@()
[hashtable]$grouphash=@{}

$root = [system.directoryservices.activedirectory.forest]::getcurrentforest().rootdomain.name
$objSearcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]"GC://$root")
$objSearcher.PageSize = 100
$objSearcher.Filter = $filter
$colResults = $objSearcher.FindAll()

foreach ($objResult in $colResults) {
	Write-Host "Processing" $objResult.path
	$psoresult = New-Object PSObject
	$psoresult | Add-Member NoteProperty "path" ""
	$psoresult | Add-Member NoteProperty "groupcount" 0
	$psoresult | Add-Member NoteProperty "ticketsize" 0

	if ($objResult.Path -match "^.*?,(dc=.*)$") {
		$userdomain = $matches[1].tolower()
	}
	else {
		Write-Error "Unable to determine User Domain by RegEx"
	}
	Write-Host "   UserDomain" $userdomain 
	[string]$userdn = "LDAP://" + $objResult.Properties.distinguishedname[0]
	$UserAccount = [ADSI]$userdn
	#$UserAccount = $objResult.getdirectoryentry()
	$UserAccount.GetInfoEx(@("tokenGroups"),0) | Out-Null
	$ErrorActionPreference = "continue"
	$error.Clear()
	$groups = $UserAccount.GetEx("tokengroups")
	if ($Error) {
		Write-Warning "  Tokengroups not readable"
		$Groups=@()   #empty enumeration
	}
	Write-Host "   Total Usergroups " $groups.Count

	#[int]$tokensize = 1200;
	[int]$ticketsize = 1200
	foreach($token in $groups) {
		$strSID = (New-Object System.Security.Principal.SecurityIdentifier($token,0)).value
		$key = $strSID
		if (!$grouphash.containskey($key)) {
			Write-Host "Adding Group SID:$strSID "
			$grouphash.add($key,("" | select domain,group,scope,sid))
			$grouphash.item($key).sid = $strSID 
			$Error.Clear()
			$grp = [ADSI]"LDAP://<SID=$strSID>"
			if ($grp.Path -eq $null) {
				Write-Warning "   SID $strSID not found by LDAP"
				$grouphash.item($key).scope="notfound"
			}
			else {
				$grpdn = $grp.distinguishedName.tostring().ToLower()
				[string]$grouphash.item($key).group = $grpdn
				Write-Host "   Group: $grpdn"
				if ($grpdn -match "^.*?,(dc=.*)$") {
					$grouphash.item($key).domain = $matches[1].tolower()
				}
				else {
					Write-Error "   Unable to determine Group Domain by RegEx"
				}
				$grouptype = $grp.groupType.psbase.value
				if ($grouptype -band 0x80000000){	
					Write-Host "     Securitygroup" -NoNewline
					if ($grouptype -band 1){
						Write-Host " buildin" -NoNewline
						$grouphash.item($key).scope="buildin"
					}
					elseif ($grouptype -band 2){
						Write-Host "     global" -NoNewline
						$grouphash.item($key).scope="global"
					}
					elseif ($grouptype -band 4){
						Write-Host "     local" -NoNewline
						$grouphash.item($key).scope="local"
					}
					elseif ($grouptype -band 8){	
						Write-Host "     universal" -NoNewline
						$grouphash.item($key).scope="universal"
					}
					else {
						write-error "   unhandled group $grouptype"
						$grouphash.item($key).scope="unknown"
					}
				}
				else {	
					Write-Host "     Distributiongroup" -NoNewline
					$grouphash.item($key).scope="dlist"
				}
			}
			Write-Host "   Done processing group"
		}
		else {
			Write-Host -BackgroundColor Green "H" -NoNewline
		}
        #[int]$ticketsize=1200
		Write-Host -BackgroundColor blue "G" -NoNewline
		switch ($grouphash.item($key).scope) {
			"buildin"{
				write-host "buildin"
				$ticketsize = $ticketsize + 8
			}
			"local" {
				write-host "local"
				$ticketsize = $ticketsize + 40
			}
			"global" {
				$ticketsize = $ticketsize + 8
			}
			"universal" {
				if ($userdomain -eq $grouphash.item($key).domain) {
					# Same Domain
					
					Write-Host "S" -BackgroundColor blue -NoNewline
					$ticketsize = $ticketsize + 8
				}
				else {
					$ticketsize = $ticketsize + 40
					}
			}
			"dlist" {
				#$ticketsize = $ticketsize + 0
			}
			"notfound" {
				# group was not found. assuming worst case
				$ticketsize = $ticketsize + 40
			}
			"unknown" {
				break
			}
			default {
				break
			}
		}
		write-host $ticketsize
	}	

	$psoresult.path = $UserAccount.distinguishedName.tostring()
	$psoresult.groupcount = $groups.Count
	$psoresult.ticketsize = $ticketsize;
	$psoresult
	$result+=$psoresult
}
$grouphash.Values | export-clixml .\dump-ticketsize.$now.grouphash.xml
$result | export-csv .\dump-ticketsize.$now.result.csv -notypeinformation -delimiter ";"