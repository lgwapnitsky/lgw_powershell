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

$ScriptBlock = {
	#Functions to Imitate SharePoint 2010 Cmdlets in MOSS 2007
	function global:Get-SPWebApplication($WebAppURL)
	 { 
	  return [Microsoft.SharePoint.Administration.SPWebApplication]::Lookup($WebAppURL)
	 }
	 
	function global:Get-SPSite($url)
	 {
	    return new-Object Microsoft.SharePoint.SPSite($url)
	 }
	 
	function global:Get-SPWeb($url)
	{
	  $site= New-Object Microsoft.SharePoint.SPSite($url)
	        if($site -ne $null)
	            {
	               $web=$site.OpenWeb();       
	            }
	    return $web
	}
}

try { Add-PSSnapin microsoft.SharePoint.powershell -ErrorAction Stop }
catch
{
	Invoke-Command $ScriptBlock
}


function global:Add-SPWebsiteToUPM
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[ValidateScript({$_ -match [regex]'(?i)\.csv$'})]
			$CSVFile = $(
				Add-Type -AssemblyName System.Windows.Forms
				$dlg = New-Object -TypeName System.Windows.Forms.OpenFileDialog
				$dlg.Filter = "CSV Files (*.csv)|*.csv"
				
				if ($dlg.ShowDialog() -eq 'OK')
					{ $dlg.FileName }
				else
					{ throw "No CSV file submitted"}
			),
		[Parameter(Mandatory=$true)]
			[ValidateScript({($_.AbsoluteURI -ne $null) -and ($_.Scheme -match '[http|https]')})]
			[System.URI]$URI,
		[Parameter(Mandatory=$true)]
			[string]$DestField,
		[Parameter()]
			[bool]$DisabledUsers=$false
	)
	
	function ImportFromCSV
	{
		$import = import-csv $CSVFile
		switch ($DisabledUsers)
		{
			$true
				{ $import }
			$false
				{ $import | where { $_.DisabledInAD -eq [string]$False } }
		}
	}
	
	$x = ImportFromCSV
	$x.count
}