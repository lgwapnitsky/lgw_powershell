
###########################################################################
#
# NAME: Ping-Host.ps1
#
# AUTHOR: Joshua Schofield
#
# COMMENT: If using a CSV file, you must have a column named DNSName in order for script to complete.
#
# EXAMPLE: c:\scripts\ping-host.ps1 -sourcefile c:\scripts\csv\servers.csv -oufile c:\scripts\logs\logfile.csv
#
# VERSION HISTORY: 1
#
# VERSION DATE:    8/21/2012
#
# VERSION COMMENTS: Tested and Validated
#
#
###########################################################################

param (

	[Parameter(Mandatory = $true)]
	$SourceFile,

	[Parameter(Mandatory = $true)]
	$OutFile

)

Function Ping-Hosts {

param ($server)

$test = Test-Connection $server -Count 1 -Quiet -ErrorAction SilentlyContinue
$ip = Test-Connection $server -Count 1 | select ipv4address -ErrorAction SilentlyContinue
$ip = $ip.IPV4Address

if ($test.ToString() -like "true") {

	Write-Host "$server $ip is pingable" -ForegroundColor green
	Write-Output "$server,$ip,yes" | Out-File $OutFile -Append

}
else {
	Write-Host "$server not pingable" -ForegroundColor Red
	Write-Output "$server,$ip,no" | Out-File $OutFile -Append

}

$test = $null
$name = $null
$server = $null
$ip = $null
}

$filetype = $SourceFile.split(".")[1]

Write-Output "ServerName,IP,RespondsToPING" | Out-File $OutFile -force

if ($filetype -eq "txt"){

	gc $sourcefile | % {

		ping-hosts $_

}
}

Elseif ($filetype -eq "csv"){

	Import-Csv $sourcefile | % {

		ping-hosts $_.dnsname

}
}

else{

Write-Host "Filetype: $filetype not recognized. Filetype must be .csv or .txt . Please try again." -ForegroundColor DarkRed -BackgroundColor White

}

