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

function global:AfterLog
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[ValidateScript({$_ -match [regex]'(?i)\.log$'})]
			$LogFile = $(
				Add-Type -AssemblyName System.Windows.Forms
				$dlg = New-Object -TypeName System.Windows.Forms.OpenFileDialog
				$dlg.Filter = "Log Files (*.log)|*.log"
				
				if ($dlg.ShowDialog() -eq 'OK')
					{ $dlg.FileName }
				else
					{ throw "No Log file submitted"}
			),
		[Parameter(Mandatory=$true)]
			[ValidateScript({$_ -ne $null})]
			$SearchString = $(
				$ss = Read-Host -Prompt "Search String"
				if ($ss -ne $null)
					{ $ss }
				else { throw "No search string submitted" }
			)
	)
	
	$LogFileData = get-content $LogFile
	$LogMatches = $LogFileData | where {$_ -match $SearchString}
	$LogMatchLastIndex = (($LogMatches | foreach {$LogFileData.IndexOf($_)}) | Measure-Object -max).Maximum
	
	$LastItem = $LogFileData.Count -1
	
	$output = $LogFileData[$LogMatchLastIndex..$LastItem]
	
	$output[ValidateScript({$_ -match [regex]'(?i)\.csv$'})]
			$CSVFile = $(
				Add-Type -AssemblyName System.Windows.Forms
				$dlg = New-Object -TypeName System.Windows.Forms.OpenFileDialog
				$dlg.Filter = "CSV Files (*.csv)|*.csv"
				
				if ($dlg.ShowDialog() -eq 'OK')
					{ $dlg.FileName }
				else
					{ throw "No CSV file submitted"}
			),
}