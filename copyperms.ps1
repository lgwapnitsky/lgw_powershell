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


function global:Copy-UserPermissions
{
	<# 
	.SYNOPSIS 
		Copy SharePoint permissions from user-to-user 
	.DESCRIPTION 
		Allows you to copy SharePoint permissions from one user to another
		on a site-wide/appliation-wide basis
	.NOTES 
		Author     : Larry G. Wapnitsky - larry.wapnitsky@tmnas.com
	.EXAMPLE 
		Copy-UserPermissions -appURL http://site -Source_User SourceDom\UserA -Destination_User DestDOM\UserB
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
			
			
			$srcPerms = $spweb.RoleAssignments | where {$_.member -imatch [regex]::Escape($Source_User) }
			
			if ($srcPerms -ne $null) {
				$srcPerms | foreach-Object {
					$RDB = $_.RoleDefinitionBindings
					$RDB | foreach-Object {
						if ($_.Name -ne "Limited Access")
						{
							$spRoleAssignment = New-Object Microsoft.SharePoint.SPRoleAssignment($($spweb.EnsureUser($Destination_User)))
							$spRoleAssignment.RoleDefinitionBindings.Add($spWeb.RoleDefinitions[$($_.Name)])
							
							write-progress -id 2 -parentID 1 -Activity "Copying $($Source_User) rights for $($Destination_User)" -status "$($_.Name) on $($_.ParentWeb)"# -Status "Elapsed Time - $($et)"
							
							try {
									$spweb.RoleAssignments.Add($spRoleAssignment)
									$spWeb.Update()
							}
							
							catch 
							{
								write-warning "Rights are inherited from parent - [$($spweb.URL)]" 
							}
						} 
					}
				}
			}
			
			$GrpColls = @($_.key.SiteGroups, $_.key.Groups)
			foreach ($GrpColl in $GrpColls) {
				$GrpColl | Foreach-Object {

					$Group = $_
					$Group.users | Foreach-Object {
						if ($_.LoginName -imatch [regex]::Escape($Source_User))
						{   
							$timespan_bulk = $stopwatch.Elapsed
							$et_bulk = "{0:00}:{1:00}:{2:00}" -f $timespan_bulk.hours, $timespan_bulk.minutes, $timespan_bulk.seconds
							write-progress -id 2 -parentID 1 -Activity "Copying $($Source_User) rights for $($Destination_User)" -CurrentOperation "Group: $($Group.Name)" -Status "Elapsed Time - $($et)"
							$Group.AddUser($($spWeb.EnsureUser($Destination_User)))
						}
						
					} | where {$Group.Users.Count -gt 0}
				}
			} 
		}
	}
	})
	$stopwatch.stop()
}

function global:Copy-UserPermissionsBulk
{
	<# 
	.SYNOPSIS 
		Copy SharePoint permissions from user-to-user in bulk 
	.DESCRIPTION 
		Allows you to specify a CSV file of users and a text file of sites
		to do a mass copy of SharePoint permissions.
	.NOTES 
		Author     : Larry G. Wapnitsky - larry.wapnitsky@tmnas.com
	.EXAMPLE 
		Copy-UserPermissionsBulk -UserCSV users.csv -SiteList sitelist.txt
	.PARAMETER UserCSV
	   		User CSV File Format:
		
			"SourceAccount","DestAccount"
			"SourceDom\UserA","DestDOM\UserB"
			
			Please note that the first line is REQUIRED
	.PARAMETER SiteList
		Site File Format:
		
			http://site1
			http://site2
	#> 
 
	Param
	(
		[Parameter(Mandatory=$True,ValueFromPipeline=$true)]
			[ValidateScript({Test-Path $_ -PathType Leaf})] 
			[string]$UserCSV="",
		[Parameter(Mandatory=$true,ValueFromPipeline=$true)]
			[ValidateScript({Test-Path $_ -PathType Leaf})] 
			[string]$SiteList=""
	)
	Process
	{	
		$stopwatch_bulk = new-Object System.Diagnostics.Stopwatch
		$TimeSpan_bulk = new-object system.timeSpan
		
		$SL = $(Get-Content $SiteList)	
		
		$UL = $(Import-CSV $UserCSV)
		if ($UL.Count -eq $null) { $ulCount = 1 }
		else { $ulCount = $UL.Count }
		
		$uCount = 1
		
		$stopwatch_bulk.start()
		
		$UL | Foreach-Object {
			$User = $_
			
			$SL | Foreach-Object {
				$timespan_bulk = $stopwatch_bulk.Elapsed
				$et_bulk = "{0:00}:{1:00}:{2:00}" -f $timespan_bulk.hours, $timespan_bulk.minutes, $timespan_bulk.seconds
				Write-Progress -ID 10 -Activity "Copying user rights" -CurrentOperation "$($User.SourceAccount) to $($User.DestAccount)" -Status "Bulk Processing Time - $($et_bulk)" -PercentComplete $((($uCount++)/$ULCount)*100)

				#write-host "Copy-UserPermissions -appURL $_ -Source_User $($User.SourceAccount) -Destination_User $($User.DestAccount)"
				try
				{
					Copy-UserPermissions -appURL $($_) -Source_User $($User.SourceAccount) -Destination_User $($User.DestAccount)
				}
				catch
				{
					write-warning "Unable to copy permissions from $($User.SourceAccount) to $($User.DestAccount) on $($_)"
				}
			}
		}
	}
}

Write-Host "New Commands added:" -ForegroundColor Green
Write-Host "`tCopy-UserPermissions" 
Write-Host "`tCopy-UserPermissionsBulk"  
Write-Host "`nFor command usage, please use the Get-Help command." -ForegroundColor Yellow
