$sessionList = import-csv ".\SessionSummaryReport_09e32c0df49072e7e0533e84fc0a58d1.csv" -Delimiter "`t"

#$time = "{0:HH:mm}" -f [datetime]$x[0]."Start Time"

$30daysago =  ([datetime]::Today).AddDays(-30)

$within30days = $sessionList | foreach-object {
	$_
} | where {$_."Start Time" -lt $30daysago}

$sessionCount = @{} #new-object System.Collections.Hashtable

$within30days | foreach-object {
	$username = $_.Username
	try 
	{
		$sessionCount.Add($Username, 1)
	}
	catch
	{
		$sessionCount[$username] += 1
	}
}

$activeList = foreach ($user in $sessionCount.GetEnumerator()) {
	$activeUser = $sessionList | where {$_.username -match $user.Name} | get-unique
	New-Object -type PSObject -Property @{
		Username = $user.Name
		Name = "{0}, {1}" -f $activeUser."Last Name", $activeUser."First Name"
		Sessions = $user.Value
	}
}
$activeList | export-csv -NoTypeInformation .\active30days.csv


$inactiveList = @{}

foreach ($user in $sessionList) {
	if (!($sessionCount.ContainsKey($user.Username))) {
		$Username = $user.username
		$Name = "{0}, {1}" -f $user."Last Name", $user."First Name"
		try {$inactiveList.Add($Username, $Name)}
		catch {}
		# New-Object -type PSObject -Property @{
			# UserName = $user.username
			# Name = "{0}, {1}" -f $user."Last Name", $user."First Name"
		# }
	}
} 


$inactiveList.GetEnumerator() | export-csv -NoTypeInformation .\inactive30days.csv
