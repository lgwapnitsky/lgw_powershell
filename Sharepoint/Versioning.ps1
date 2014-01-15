# Trap {
	# $err = $_.Exception
	# write-error $err.Message
	# while ( $err.InnerException) 
	# {
		# $err = $err.InnerException
		# Write-Error $err.Message
	# }
	# break;
# }

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

function FilenameFromURL
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[string]$URL
	)

	$rx_URL = [regex]"^http[s]*\:/{2}(.*)"
	return ((([regex]::Match($URL,$rx_url)).Groups[1].Value + ".csv") -replace "/","=")
}

function FindVersionedDocLibraries()
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[string]$WebAppURL
	)
	
	$WebApp = Get-SPWebApplication $WebAppURL
	$WebappSites_ProgCount=0
	
	$SiteColl_Dict = @{}
	$LibDict = @{}
			

		
	$VersionedDocLibraries = foreach ($site in $WebApp.Sites)
	{
		foreach ($sitecoll in $site.webapplication.sites | where {($SiteColl_Dict.ContainsKey($_.URL) -eq $false)})
		{
		$SiteColl_Dict.Add($SiteColl.URL, $SiteColl.Title)

			Write-Progress -Id 1 -Activity "Processing websites under the SharePoint application: $($WebAppURL)" -Status "Analyzing $($SiteColl.URL)" #-PercentComplete (($($WebappSites_ProgCount)/$($WebApp.Sites.Count))*100)
			$WebappSites_ProgCount++
			
			$sitecoll.AllWebs | Foreach-Object {
				$URL = $_.url
				$spweb = get-spweb $URL
				
				$List_Count = 0
				
				foreach ($list in $spweb.Lists | where {($_.EnableVersioning) -and 
														($_.MajorVersionLimit -eq 0) -and
														($_.BaseType -eq [Microsoft.SharePoint.SPBaseType]::DocumentLibrary) -and
														($_.RootFolder.URL -notmatch [regex]"^_")
														}
						)
				{
					$LibraryURL = "$($URL)/$($List.RootFolder.URL)"
					
					if ($LibDict.ContainsKey($LibraryURL) -eq $false) {
						$LibDict.Add($LibraryURL, $List.Title)
						
						$List_Count++
						Write-Progress -Id 2 -ParentID 1 -Activity "$($SPWeb.Title)" -Status "$($List.Title) : $($LibraryURL)" -PercentComplete (($($List_Count)/$($Spweb.Lists.Count))*100)
						
						New-Object -TypeName PSObject -Property @{
							SiteURL = $URL
							Title = $List.Title
							LibraryURL = $LibraryURL
						}
					}
				}
			}
		}
	}
	$VersionedDocLibraries | where {$_ -ne $null} | export-csv -path $(FilenameFromURL $WebAppURL) -NoTypeInformation 
}

function VersionIdentify
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[string]$LibURL
	)

	Process
	{
		$spweb = Get-SPWeb $LibURL
		$LibTitle = $LibURL -Replace "$($spweb.URL)/",""
		$List = $spweb.Lists[$LibTitle]
		
		Write-Progress -ID 1 -Activity $SPWeb.URL -Status "$($SPWeb.Title)"
		
		$Vers = Foreach ($Item in $List.Items | Where {$_.Versions.Count -gt 5}) {
			$DocURL = "$($spweb.url)/$($Item.URL)"
		
			New-Object -TypeName PSObject -Property @{
				Library = $LibURL
				Doc = $Item.Name
				DocURL = $DocURL
				Versions = $Item.Versions.Count
			}
			Write-Progress -id 2 -ParentID 1 -Activity "Last File Added:" -Status "$($DocURL)"

		}
		$filename = FilenameFromURL $LibURL
		
		$Vers| where {$_ -ne $null } | export-csv -path $filename -NoTypeInformation 
	}
}


#$WebAppURL = "http://epm.phly.net"
#FindVersionedDocLibraries $WebAppURL
Import-CSV ".\epm.phly.net.csv" | foreach {VersionIdentify $_.LibraryURL}

#$WebAppURL = "http://insidephly.phly.net"
#FindVersionedDocLibraries $WebAppURL
Import-CSV ".\Insidephly.phly.net.csv" | foreach {VersionIdentify $_.LibraryURL}
