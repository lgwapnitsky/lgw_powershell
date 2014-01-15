clear-host

$ef = import-csv "c:\Users\lwapnits\Documents\eFreedom\eFreedom users.csv"

foreach ($info in $ef)
{
	$computer = $info.'computer name'
	
	if (Test-Connection -ComputerName $computer -Count 2 -Quiet)
	{
		$success = "{0} is alive and pinging - {1} ({2})"-f $computer, $info.'E-Mail', $info.userID
		Write-Host $success -ForegroundColor Green
	}
	else
	{
		$warning = "{0} is not responding - {1} ({2})" -f $computer, $info.'E-Mail', $info.userID
		Write-Warning $warning
	}
}