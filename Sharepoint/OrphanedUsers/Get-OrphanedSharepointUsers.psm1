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

function validPath($path)
{
	return !(test-Path -Path $path -PathType leaf)
}

function validFile($path)
{
	return (Test-Path -Path $path -PathType leaf)
}
  
function Get-Domain
{
	$context = new-object System.DirectoryServices.ActiveDirectory.DirectoryContext("Domain", $Domain)
	$domainContext = [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($context)
	return $domainContext
}
  
function UserExistsInAD
{
	param(
		[Parameter(Mandatory=$true)]
		[string]$UserLoginID
	)
	
	Process
	{
		$search = [System.DirectoryServices.DirectorySearcher]$DOMroot
		$search.Filter = "(&(objectCategory=User)(samAccountName=$UserLoginID))"
		$result = $search.FindOne()
		return $result -ne $null
	}
}

function UserDisabledInAD
{
	param(
		[Parameter(Mandatory=$true)]
		[string]$AccountName
	)
	
	Process
	{
		$domainDN = $DOMRoot.DistinguishedName
		
		$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]"LDAP://$domainDN")
		$Searcher.filter = "(&(objectCategory=person)(objectClass=user)(sAMAccountName=$AccountName)(userAccountControl:1.2.840.113556.1.4.803:=2))"
		
		return $($Searcher.FindOne()) -ne $null
	}
}

function FindOrphans()
{
	$OrphanedUsers = @{}
	$SiteURLs = @{}
	
	$WebApp = Get-SPWebApplication $WebAppURL
	$WebappSites_ProgCount=0
	
	foreach ($site in $WebApp.Sites)
	{
		$WebappSites_ProgCount += 1
		Write-Progress -Id 1 -Activity "Processing websites under the SharePoint application: $($WebAppURL)" -Status "Analyzing..." -PercentComplete (($($WebappSites_ProgCount)/$($WebApp.Sites.Count))*100)
	
		try{
			try {$WebsColl = $site.AllWebs | where {($_.HasUniqueRoleAssignments -eq $True) -and ($_.SiteUsers -ne $null)} }
			catch { $WebsColl = @($(Get-SPWeb $site.URL)) }
		$WebsColl_ProgCount = 0
		
		$WebsColl | Foreach-Object {
			$URL = $_.url
			$SiteURLs.Add($URL, $(new-object System.Collections.ArrayList))
	
			$WebsColl_ProgCount += 1
			Write-Progress -Id 2 -ParentId 1 -Activity "Looking for orphaned users from domain [$($DOM.Name)]" -Status $url -PercentComplete (($($WebsColl_ProgCount)/$($WebsColl.Count))*100)
			
			$SiteUsers_ProgCount = 0
			foreach ($User in $_.SiteUsers)
			{
				if ((UserExclusions $User) -and ($User -ne $null) -eq $True)
				{
					$AccountName = $User.LoginName.Split("\")[1]
					
					if (((UserExistsInAD $AccountName) -eq $false) -or
						((UserDisabledInAD $AccountName) -eq $true)
						)
					{
						switch ($OrphanedUsers.ContainsKey($User.LoginName))
						{
							$true
							{
								$siteArray = [System.Collections.ArrayList]$OrphanedUsers[$User.LoginName]
								if ($siteArray.Contains($URL) -eq $false)
								{
									$siteArray.Add($URL) | out-null
									$OrphanedUsers.Set_Item($User.LoginName, $siteArray)
								}
							}
							$false 
							{
								$siteArray = New-Object System.Collections.ArrayList
								$siteArray.Add($URL) | out-null
								
								$OrphanedUsers.Add($User.LoginName, $siteArray) | out-null
							}
						}
						
						if ($SiteURLs[$URL].Contains($User.LoginName) -eq $false)
						{
							$SiteURLs[$URL].Add($User.LoginName) | out-null
						}
					}
					}
				}
			} 
		 }	
		 catch{ Write-Host "Invalid Site: $($site.url)" -ForegroundColor Red}
	}
	
	
	$Return = New-Object PSObject -Property @{
		Users = $OrphanedUsers
		Sites = $SiteURLs
	}
	
	$Return
}

function UserExclusions
{
	param (
		[Parameter(Mandatory=$true)]
		[Microsoft.SharePoint.SPPrincipal]$User
	)
	return (($User.LoginName -notmatch [regex]"(?i)$([regex]::escape('nt authority\authenticated users'))") -and
			($User.LoginName -notmatch [regex]"(?i)$([regex]::escape('sharepoint\system'))") -and
			($User.LoginName -notmatch [regex]"(?i)$([regex]::escape('nt authority\local service'))") -and
			($User.LoginName -match [regex]"^(?i)$($Domain)\\.*") -and
			($User.IsDomainGroup -eq $false)
			)
}

function Out-Report
{	
	param
	(
		$reporthash, 
		[ValidateSet("BySite","ByUser")]
			[string]$ReportType
	)
    
    Process
    {
    	$name = [io.path]::GetFileNameWithoutExtension($currentScriptName)
    	$timestamp = Get-Date -Format yyyyMMdd_HHmm
    	
    	$filename = "$($reportPath)\$($name)_$($ReportType)_$($Domain)_$($timestamp).txt"
    	
		switch ($ReportType)
		{
			"BySite"
			{
				$reportOut = foreach ($object in $reporthash.GetEnumerator())
				{
		    		New-Object -TypeName PSObject -Property @{
		    			Site = $object.Name
		    			LoginName = [string]::join("`n", $object.value.ToArray())
		    		} | where {$object.value -ne $null}
				}
				$reportOut | Select-Object Site, LoginName | format-list | Out-File $filename -Force
			}
			
			"ByUser"
			{
				$reportOut = foreach ($object in $reporthash.GetEnumerator())
				{
					New-Object -TypeName PSObject -Property @{
						Site = [string]::Join("`n",$object.value.ToArray())
						LoginName = $object.Name
					} 
				}
				$reportOut | Select-Object LoginName, Site | format-list | Out-File $filename -Force
	    	}
		}
		
    	
        write-Host "Report written to $filename" -ForegroundColor Green
		
    }
}
function Import-Bysite
{
	$bySite = get-content $ImportPath
	$hashtable = @{}

	$site = $null

	$objCount = 0
	foreach ($object in $bySite)
	{
		Write-Progress -Id 1 -Activity "Importing Report..." -PercentComplete $((($objCount += 1)/$bySite.Count)*100) -Status "Processing..."
		$obj_rx = [regex]::match($object, "^([a-zA-Z]*)\ *\:\ *(.*)|\ *(.*)")
		$switchVal = $obj_rx.groups[1].value
		switch -regex ($switchVal)
		{
			"^(?i)Site"
			{
				$site = $obj_rx.groups[2].value
				if (!$hashtable.contains($site))
				{ 
					$hashtable.add($site, $(new-object system.collections.arraylist)) | out-null
				}
			}
			"^(?i)LoginName"
			{
				$hashtable[$site].add($obj_rx.groups[2].value) | out-null
			}
			default
			{
				$val = $obj_rx.groups[3].value.trim()
				if ($val.length -gt 0) { $hashtable[$site].add($val) | out-null}
			}
		}
	}
	Write-Progress -Id 1 -Completed -Activity "Importing Report..." -Status "Complete!"
	return $hashtable
}

function Remove-Orphans
{
	param($SiteHash)
	
	Process
	{
		$SiteCount = 0

		foreach ($object in $SiteHash.GetEnumerator())
		{
			$UserCount = 0
			$SiteCount += 1
			$SPWeb = Get-SPWeb $object.Name
			Write-Progress -Id 1 -Activity "Analyzing site..." -Status $object.Key -PercentComplete $((($SiteCount)/($SiteHash.count))*100)
			foreach ($User in $object.Value)
            { 
				$UserCount += 1
				Write-Progress -id 2 -ParentId 1 -Activity "Removing Orphaned Users..." -Status $User -PercentComplete ($(($UserCount)/($($object.value.count)))*100)
                try { $SPWeb.SiteUsers.Remove($User) }
				catch{}
            }
		}
	}
}

function global:Get-OrphanedSharepointUsers {
	<# 
	.SYNOPSIS 
		Search through a SharePoint Web Application (2007/2010)
		and find orphaned users, i.e. users whose accounts
		either don't exist or are disabled in Active Directory,
		and produce a report (by site or user) or remove them
		from the application
	.NOTES 
		Author     : Larry G. Wapnitsky - larry.wapnitsky@tmnas.com
	.EXAMPLE 
		Get-OrphanedSharepointUsers -WebAppURL http://site:80 -Domain MyDomain -Report BySite -ReportPath c:\temp  
		
		Looks at all subsites of the web application located at http://site:80 
		and produces a report of users in each site considered to be an orphan
		saved to the value specified by ReportPath
	.EXAMPLE 
		Get-OrphanedSharepointUsers -WebAppURL http://site:80 -Domain MyDomain -Report ByUser -ReportPath c:\temp  
		
		Looks at all subsites of the web application located at http://site:80 
		and produces a report of sites of which each orphaned user is a member
		saved to the value specified by ReportPath
	.EXAMPLE
		Get-OrphanedSharepointUsers -WebAppURL http://site:80 -Domain MyDomain -DeleteOrphans
		
		Looks at all subsites of the web application located at http://site:80 
		and removes all users considered to be orphaned.
		Does not produce any output.
	.EXAMPLE
		Get-OrphanedSharepointUsers -WebAppURL http://site:80 -Domain MyDomain -DeleteOrphans -FromReport -ReportPath c:\temp\sitereport.txt
		
		Delete orphaned users based on the output of a prior run.
		Data is retrieved from an existing site report
	.PARAMETER WebAppURL
		The location of the SharePoint Web Application to be examined.  The full
		URL, including protocol, must be provided, e.g. http://site.
		
		Optionally, you may include a port number afterwards if required,
		e.g. http://site:80
	.PARAMETER Domain
		The Active Directory domain against which you will be checking users.
		This can be specified using either the FQDN or NetBIOS version of
		the domain name, e.g. MyDomain, MyDomain.Company.Net
	.PARAMETER Report
		Generate reports of orphaned users.
		Two reports are generated - By Site and By User
	.PARAMETER ReportPath
		The location to which the site/user report will be saved/imported
		Must be a valid path.
	.PARAMETER DeleteOrphans
		Used to go through the web application's sites and remove orphaned users
	.PARAMETER FromReport
		Imports a By Site report rather than running a fresh analysis.
		Much quicker if a report has already been generated.
	#> 
	 
	[CmdletBinding(DefaultParametersetName="Report")]
	param(
		[Parameter(ParameterSetName="DeleteOrphans", Mandatory=$true, ValueFromPipeline=$true)]
		[Parameter(ParameterSetName="Report", Position=1, Mandatory=$true, ValueFromPipeline=$true)]
			[string]$WebAppURL,
		
		[Parameter(ParameterSetName="DeleteOrphans", Position=2, Mandatory=$true, ValueFromPipeline=$true)]
		[Parameter(ParameterSetName="Report", Position=2, Mandatory=$true, ValueFromPipeline=$true)]
			[string]$Domain,

		[Parameter(ParameterSetName="Report", Mandatory=$true)]
			[switch]$Report,
			
		[Parameter(ParameterSetName="Report", Mandatory=$true)]
		[Parameter(ParameterSetName="DeleteOrphans", Mandatory=$false)]
			[ValidateScript({validPath($_)})]
			[string]$ReportPath,

		[Parameter(ParameterSetName="DeleteOrphans")]
			[switch]$DeleteOrphans,
			
		[Parameter(ParameterSetName="DeleteOrphans", Mandatory=$false)]
			[switch]$FromReport,
		
		[Parameter(ParameterSetName="DeleteOrphans", Mandatory=$false)]
			[ValidateScript({validFile($_)})]
			[string]$ImportPath
	)
			
	PROCESS {
		$DOM = $(Get-Domain)
		$DOMroot = $DOM.GetDirectoryEntry()
		
		switch ($PsCmdlet.ParameterSetName)
		{
			"Report"
			{
				$Orphans = FindOrphans
       
				Out-Report $($Orphans.Sites) BySite
				Out-Report $($Orphans.Users) ByUser
			}
			"DeleteOrphans"
			{
				switch ($FromReport)
				{
					$false
					{
						Remove-Orphans $((FindOrphans).Sites)
					}
					$true
					{	
						switch ($ImportPath -ne $null)
						{
						$true
							{	Remove-Orphans $(Import-BySite $ReportPath) }
						$false
							{ 	Write-Host "You must specify a valid path/filename for a report to import" -ForegroundColor Red }
						}
					}
				}
			}
		}
        
	}
}

