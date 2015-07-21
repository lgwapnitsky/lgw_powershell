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


function global:Update-Icon
{
	<#
	.SYNOPSIS

	.DESCRIPTION

	.NOTES
		Author     : Larry G. Wapnitsky - larry.wapnitsky@tmnas.com
	.EXAMPLE

	.PARAMETER appURL

	.PARAMETER Source_User

	.PARAMETER Destination_User

	#>
	Param
	(
		[Parameter(Mandatory=$true)]
			[URI]$appURL,
		[Parameter(Mandatory=$true)]
			[URI]$oldIcon,
		[Parameter(Mandatory=$true)]
			[string]$newIcon,
		[Parameter(Mandatory=$false)]
			[bool]$report=$true,
		[Parameter(Mandatory=$false)]
			[bool]$execute=$false
	)


if ($report -or $execute){
		$stopwatch = new-object system.diagnostics.stopwatch
		$timeSpan = new-object System.TimeSpan

		$stopwatch.start()

		$WebApp = Get-SPWebApplication $appURL
		$iconsToChange = @()

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

					write-progress -id 1 -Activity "Processing subsites of $($site.URL)" -CurrentOperation "Analyzing $($spweb.SiteLogoURL)" -PercentComplete (($($subsiteCounter)/$($subsites.Count))*100) -Status "Elapsed Time - $($et)"
					if ($oldIcon.OriginalString -match $spweb.SiteLogoURL)
					{
						if ($report) { $iconsToChange += $spweb.URL}
						if ($execute) {
							write-progress -id 2 -parentID 1 -Activity "Changing icon" -Status $spweb.URL
							$spweb.SiteLogoURL = $newIcon
							$spweb.update()
						}
					}
				}
			}
		})
		$stopwatch.stop()
		$iconsToChange | out-file ".\sitewithbadicons.txt"
	}
}


Write-Host "New Commands added:" -ForegroundColor Green
Write-Host "`tupdate-icon"
Write-Host "`nFor command usage, please use the Get-Help command." -ForegroundColor Yellow
