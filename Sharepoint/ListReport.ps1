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

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint") | Out-Null
 
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


Function Global:Get-ListReport {
    Param(
        [Parameter(Mandatory=$true)]
			[string]$AppURL,
        [Parameter(Mandatory=$true)]
			[string]$ListURL
    )
    
    PROCESS {
        $SPWeb = Get-SPWeb $appURL
        $list = $SPWeb.GetList($ListURL)
        $report = foreach ($entry in $list.items) {
            New-Object -TypeName PSObject -Property @{
                Name = $entry.file.name
                Size = $entry.file.length
                Path = $entry.file.URL
                ModifiedBy = $entry.file.ModifiedBy
                ModifiedDate = $entry.file.TimeLastModified
                Type = [System.IO.Path]::GetExtension($entry.file.name)
            }
        }
        
        $report | export-csv -Path "$($list.Title).csv" -NoTypeInformation
    }
}

Write-Host "New Command added:" -ForegroundColor Green
Write-Host "`tGet-ListReport" 
#Write-Host "`nFor command usage, please use the Get-Help command." -ForegroundColor Yellow
