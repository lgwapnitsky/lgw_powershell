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

###############


function global:Change-Alerts
{
	<# 
	.SYNOPSIS 
		Change SharePoint alerts from user-to-user 
	.DESCRIPTION 
		Allows you to change SharePoint alerts from one user to another
		on a site-wide/appliation-wide basis
	.NOTES 
		Author     : Larry G. Wapnitsky - larry.wapnitsky@tmnas.com
	.EXAMPLE 
		Change-Alerts -appURL http://site -Source_User SourceDom\UserA -Destination_User DestDOM\UserB
	.PARAMETER appURL
	   		Root URL of the site/application on which you will be copying permissions
	.PARAMETER Source_User
		Domain and username of source user from which you are copying permissions
	.PARAMETER Destination_User
		Domain and username of destination user to which you are copying permissions
	#>
	
	Param
	(
		[Parameter(Mandatory=$true)]
			[string]$appURL,
		[Parameter(Mandatory=$true)]
			[string]$Source_User,
		[Parameter(Mandatory=$true)]
			[string]$Destination_User
	)
	
	$stopwatch = new-object system.diagnostics.stopwatch
	$timeSpan = new-object System.TimeSpan

	$stopwatch.start()
	
	$WebApp = Get-SPWebApplication $appURL
	
	[Microsoft.SharePoint.SPSecurity]::RunWithElevatedPrivileges( {
	$SiteCollections = $WebApp.Sites

	foreach ($site in $sitecollections)
	{
		$subsites = @{}
		$site.allwebs | foreach { $subsites.add($(get-spweb $_.url), $_.url)} 
		
		$subsiteCounter = 0
	 
		$subsites.GetEnumerator() | foreach {
			$spweb = $_.key
			$subsiteCounter += 1
			
			$timespan = $stopwatch.Elapsed
			$et = "{0:00}:{1:00}:{2:00}" -f $timespan.hours, $timespan.minutes, $timespan.seconds

			write-progress -id 1 -Activity "Processing subsites of $($site.URL)" -CurrentOperation "Analyzing $($spweb.URL)" -PercentComplete (($($subsiteCounter)/$($subsites.Count))*100) -Status "Elapsed Time - $($et)"
			
			$srcUserEnsured = $spweb.ensureuser($Source_User)
			$destUserEnsured = $spweb.ensureuser($Destination_User)
			
			$SPAlertCollection = $srcUserEnsured.Alerts
			foreach ($alert in $SPAlertCollection)
			{
				write-host -f Green $alert.Title
				$alert.User = $destUserEnsured
				$alert.Update()
			}
		}
	}
	})
	$stopwatch.stop()
}

Write-Host "New Commands added:" -ForegroundColor Green
Write-Host "`tChange-Alerts" 
Write-Host "`nFor command usage, please use the Get-Help command." -ForegroundColor Yellow
