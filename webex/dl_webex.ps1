Trap {
	$err = $_.Exception
	write-error $err.Message
	while ( $err.InnerException) 
	{
		$err = $err.InnerException
		Write-Error $err.Message
	}
	break;/
}

Set-PSDebug -Strict
$ErrorActionPreference = "stop"

$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$currentScriptName = $MyInvocation.MyCommand.Name
$currentExecutingPath = $fullPathIncFileName.Replace($currentScriptName, "")

$regkey =  "HKCU:\Software\Microsoft\Internet Explorer"


function global:Get-WebexRecordings
{
	Param
	(
		$WebexRecordingCSV = $(
		Add-Type -AssemblyName System.Windows.Forms
		$dlg = New-Object -TypeName System.Windows.Forms.OpenFileDialog
		$dlg.Filter = "CSV Files (*.csv)|*.csv"

		if ($dlg.ShowDialog() -eq 'OK')
			{ $dlg.FileName }
		else
			{ throw "No filename submitted"}
	),

	[System.IO.DirectoryInfo]$RecordingOutputFileFolder = $(
		Add-Type -AssemblyName System.Windows.Forms
		$dlg = New-Object -TypeName System.Windows.Forms.FolderBrowserDialog
		$dlg.Description = "Location for recording output"
		$dlg.SelectedPath = [io.path]::GetDirectoryName($_)
		if ($dlg.ShowDialog() -eq 'OK')
		{ $dlg.SelectedPath }
		else
		{ throw "No output path submitted"}
		)
	)
	
	function validFolder($path)
	{
		return (test-Path -Path $path -PathType container)
	}

	function SetDLDir
	{
		param
		(
			[Parameter(Mandatory=$true, Position=1)]
			[ValidateScript({validFolder($_)})]
			[string]$DLpath
		)

		Set-ItemProperty $regkey -name "Download Directory" $DLPath
	}

	$regkey =  "HKCU:\Software\Microsoft\Internet Explorer"

	$WebexRecordingFile = import-csv $WebexRecordingCSV | where {$_."Link Type" -match "Download"}

	$p_count = 0
	#$WebexRecordingFile | foreach {
	foreach ($WebexRecording in $WebexRecordingFile){

	$p_count+=1
	$percentComplete = (($($p_count)/$($WebexRecordingFile.count))*100)
	$percentComplete = "{0:N2}" -f $percentComplete

	
	$RecordingOutputFileFolder_mod = "{0}\{1}" -f $RecordingOutputFileFolder,$WebexRecording."Host Username"
	#write-host $RecordingOutputFileFolder_mod, $RecordingOutputFileFolder

	if (!(validFolder $RecordingOutputFileFolder_mod))
	{
		New-Item -ItemType Directory -Force -Path $RecordingOutputFileFolder_mod
	}

	$oldDLDir = Get-ItemProperty $regkey -name "Download Directory"
	SetDLDir $RecordingOutputFileFolder_mod

	#$dlFile = 

	$dlFile = "{0}\{1}" -f $RecordingOutputFileFolder_mod, ([RegEx]::Replace( $WebexRecording.Topic, "[{0}]" -f ([RegEx]::Escape(-join [System.IO.Path]::GetInvalidFileNameChars())), '')).trim()

	#write-verbose $dlFile

			$dlFile_mod = $dlFile -replace [regex]"([\(\)])", '{$1}'
		
		
		$activity = "[{1} of {2}] Downloading {0}" -f $dlFile,$p_count,$WebexRecordingFile.count
		write-progress -id 1 -Activity $activity -Status "$($percentComplete)% Complete" -PercentComplete $percentComplete
	
	if (!(Test-Path -Path "$dlFile.*" -PathType leaf))
	{


		
		$ie = New-Object -ComObject InternetExplorer.Application
		$ie.visible = $true
		$ie.height = 400
		$ie.width = 400
		
		try{
			$ie.navigate2($WebexRecording."New Recording Links")
			start-sleep 3
			if (!($ie.LocationUrl -match "(?i)^http\:\/\/iphly.phly.net"))
			{
				do {
					$dl_pid = (get-process -name iexplore | where {$_.MainWindowTitle -match  [regex]"(?i)^Download\ file"}).id 
					sleep -s 5
				}
			
				until ( $dl_pid -ne $null )

				$wshell = new-object -ComObject Wscript.Shell

				start-sleep 5
				$wshell.SendKeys("%S")
				start-sleep 3

				$wshell.SendKeys($dlFile_mod)
				$wshell.SendKeys("%S")
				
				$ie.visible = $false
				
				Do { start-sleep -s 10}
				until ((get-process iex* | where {$_.MainWindowTitle -match "Download complete"}) -ne $null)

				 [System.IO.FileInfo]$fi = $dlFile
				 
				 start-sleep 3
				 try {
					 $fi.CreationTime = $WebexRecording.Created
					 $fi.LastWriteTime = $WebexRecording.LastmodifiedTime
				 }
				 catch{}

				$wshell.SendKeys("{Esc}")

				SetDLDir $oldDLDir."Download Directory"
			}
		}
		catch{}
		finally { $ie.Quit() }
		}
	}
}

Write-Host "New Command added:" -ForegroundColor Green
Write-Host "`tGet-WebexRecordings" 
Write-Host "`nFor command usage, please use the Get-Help command." -ForegroundColor Yellow