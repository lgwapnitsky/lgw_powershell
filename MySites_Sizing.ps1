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

[Reflection.Assembly]::LoadWithPartialName("Microsoft.Office.Server") | Out-Null

###########################################

function GetWebSizes ($StartWeb)
{
    $web = Get-SPWeb $StartWeb
    [long]$total = 0
    $total += GetWebSize -Web $web
    $total += GetSubWebSizes -Web $web
    $totalInMb = ($total/1024)/1024
    $totalInMb = "{0:N2}" -f $totalInMb
    $totalInGb = (($total/1024)/1024)/1024
    $totalInGb = "{0:N2}" -f $totalInGb
  #  write-host "Total size of all sites below" $StartWeb "is" $total "Bytes,"
  #  write-host "which is" $totalInMb "MB or" $totalInGb "GB"
    
    $Return = New-Object -type PSObject -Property @{
		URL = $StartWeb
		Total_B = $total
		Total_MB = $totalInMb
		Total_GB = $totalInGb
		UserName = ""
		ExistsInAD = ""
		DisabledInAD = ""
		PublicURL = ""
    }
  
    return $Return
     
    $web.Dispose()
}

function GetWebSize ($Web)
{
    [long]$subtotal = 0
    foreach ($folder in $Web.Folders)
    {
        $subtotal += GetFolderSize -Folder $folder
    }
    #write-host "Site" $Web.Title "is" $subtotal "KB"
    return $subtotal
}

function GetSubWebSizes ($Web)
{
    [long]$subtotal = 0
    foreach ($subweb in $Web.GetSubwebsForCurrentUser())
    {
        [long]$webtotal = 0
        foreach ($folder in $subweb.Folders)
        {
            $webtotal += GetFolderSize -Folder $folder
        }
        #write-host "Site" $subweb.Title "is" $webtotal "Bytes"
        $subtotal += $webtotal
        $subtotal += GetSubWebSizes -Web $subweb
    }
    return $subtotal
}

function GetFolderSize ($Folder)
{
	[long]$folderSize = 0 
	foreach ($file in $Folder.Files)
	{
		if ($file.Versions -ne $NULL -and $file.Versions.Count -gt 1) {
		foreach ($version in $file.Versions)
			{
				$folderSize += $version.Size;
			}
		}
		else {
			$folderSize += $file.Length;
			}
	}
	foreach ($fd in $Folder.SubFolders)
	{
		$folderSize += GetFolderSize -Folder $fd
	}
	return $folderSize
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


$mySite = Get-SPSite "http://mysite.phly.net:8888"

$context = [Microsoft.Office.Server.ServerContext]::GetContext($mysite)
$upm =  New-Object Microsoft.Office.Server.UserProfiles.UserProfileManager($context)

$rx_UserName = [regex]"(?i).*accountname\=((.*)\\(.*))"

$AllProfiles = $upm.GetEnumerator()
$ap_count = $upm.Count
$p_count = 0


$sizes = foreach ($profile in $AllProfiles)
{
	$p_count+=1
	$percentComplete = (($($p_count)/$($ap_count))*100)
	$percentComplete = "{0:N2}" -f $percentComplete
	
	write-progress -id 1 -Activity "Calculating size of: $($profile.PersonalSite.URL)" -Status "$($percentComplete)% Complete" -PercentComplete $percentComplete
	try 
	{

		
		$profile.PublicURL -match $rx_UserName | out-null
		$UserName = $matches[1]
		$domain = $matches[2]
		$sAMAccountName = $matches[3]
		
		$DOM = $(Get-Domain)
		$DOMroot = $DOM.GetDirectoryEntry()
		
		$output = GetWebSizes -StartWeb $profile.PersonalSite.URL
		$output.UserName = $UserName
		$output.ExistsInAD = $(UserExistsInAD $samAccountName)
		$output.DisabledInAD = $(UserDisabledInAD $samAccountName)
		$output.PublicURL = $profile.PublicURL
		
		$output
	}
	catch{}
#	if ($p_count -eq 11) {break}
}

$sizes | select URL,PublicURL,Total_B,Total_MB,Total_GB,UserName,ExistsInAD,DisabledInAD | export-csv -NoTypeInformation -Path "$pwd\MySites_Sizing.csv"

$mysite.dispose()