# clear-host

# foreach ($info in $ef)
# {
	# $computer = $info.'computer name'
	
	# if (Test-Connection -ComputerName $computer -Count 2 -Quiet)
	# {
		# $success = "{0} is alive and pinging" -f $computer
		# Write-Host $success -ForegroundColor Green
	# }
	# else
	# {
		# $warning = "{0} is not responding - {1} ({2})" -f $computer
		# Write-Warning $warning
	# }
# }

Trap {
	$err = $_.Exception
	write-error $err.Message
	while ( $err.InnerException) 
	{
		$err = $err.InnerException
		Write-Error $err.Message
	}
	break;
}

Set-PSDebug -Strict
$ErrorActionPreference = "stop"

$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$currentScriptName = $MyInvocation.MyCommand.Name
$currentExecutingPath = $fullPathIncFileName.Replace($currentScriptName, "")

function global:massPinger
{


}