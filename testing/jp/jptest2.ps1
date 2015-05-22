if ( (Get-PSSnapin -Name Quest.ActiveRoles.* -ErrorAction SilentlyContinue) -eq $null )
{
	Add-PsSnapin Quest.ActiveRoles.*
}

$csvFile = "$pwd\ComputerNames.CSV"

$userData = Import-CSV $csvFile
$user_counter = 0

$userData  | where {($_."User Name".length -gt 0) -and
			($_."E-Mail".length -eq 0)
		} | foreach-Object {
		
	$user_counter += 1
	
	try
	{
		$_."E-Mail" = $((get-qaduser $_."User Name").email)
		Write-Progress -Id 1 -Activity "Getting email address for $($_."User Name")" -Status "$($_."E-Mail")" -PercentComplete (($($user_counter)/$($userData.Count))*100)
	}
	catch {}
}

write-progress -Activity "Writing CSV file" -status $csvFile
$userData | export-csv -Path $csvFile -NoTypeInformation