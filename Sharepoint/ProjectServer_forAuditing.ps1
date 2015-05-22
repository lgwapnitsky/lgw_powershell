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

$global:Sizes = @()
$objSize = @{
	"Site Name" = $null
	"URL" = $null
	"Total in B" = 0
	"Total in KB" = 0
	"Total in MB" = 0
	"Total in GB" = 0
	"Last Modified Date" = $null
}

function Write-SizeCSV
{
		$global:Sizes | select "Site Name", "URL", "Last Modified Date", "Total in B", "Total in KB", "Total in MB", "Total in GB"  | Export-CSV -NoTypeInformation -path "$pwd\$([regex]::Replace($rootURL, "[\W]","_")).csv" -Force
}

function ConvertSize ($sizeInBytes)
{
	$Conversions = New-object -type PSObject -Property @{
		B = $sizeInBytes
		KB = "{0:N2}" -f $($sizeInBytes/1024)
		MB = "{0:N2}" -f $($sizeInBytes/([System.Math]::Pow(1024,2)))
		GB = "{0:N2}" -f $($sizeInBytes/([System.Math]::Pow(1024,3)))
	}
	
	return $Conversions
}

function GetWebSizes ($StartWeb)
{
    $web = Get-SPWeb $StartWeb
    [long]$total = 0
    $total += GetWebSize -Web $web
    $total += GetSubWebSizes -Web $web
    
    $fileSizes = ConvertSize $total
    
    write-host "Total size of all sites below" $StartWeb "is" $total "Bytes,"
    write-host "which is" $totalInMb "MB or" $totalInGb "GB"
    $web.Dispose()
    
    $webSize = new-object -type PSObject -property $objSize
    $webSize."Site Name" = $Web.Name
    $webSize."URL" = $Web.URL
    $webSize."Total in B" = $fileSizes.B
    $webSize."Total in KB" = $fileSizes.KB
    $websize."Total in MB" = $fileSizes.MB
    $webSize."Total in GB" = $fileSizes.GB
    $webSize."Last Modified Date" = $Web.LastItemModifiedDate
    
    $global:sizes += $websize
	Write-SizeCSV
}

function GetWebSize ($Web)
{
    [long]$subtotal = 0
    foreach ($folder in $Web.Folders)
    {
        $subtotal += GetFolderSize -Folder $folder
    }
    write-progress -id 1 -Activity "Site: $($Web.Title)" -Status "$($subtotal) KB"
    return $subtotal
}

function GetSubWebSizes ($Web)
{
    [long]$subtotal = 0
    $p_count = 0
    
    foreach ($subweb in $Web.GetSubwebsForCurrentUser())
    {
        [long]$webtotal = 0
        foreach ($folder in $subweb.Folders)
        {
            $webtotal += GetFolderSize -Folder $folder
        }
                
        $p_count+=1
		$percentComplete = (($($p_count)/$($Web.GetSubwebsForCurrentUser().Count))*100)
		$percentComplete = "{0:N2}" -f $percentComplete

        write-progress -id 2 -ParentID 1 -Activity "SubSite: $($subweb.Title) | $($subweb.URL)" -Status "$($webtotal) Bytes" -PercentComplete $percentComplete
        
		#$global:Sizes | Export-CSV -NoTypeInformation -path "$pwd\$([regex]::Replace($rootURL, "[\W]","_")).csv" -Force
        $subtotal += $webtotal
        
        $subfileSizes = ConvertSize $subtotal

		$subwebSize = new-object -type PSObject -property $objSize
		$subwebSize."Site Name" = $subWeb.Title
		$subwebSize."URL" = $subWeb.URL
		$subwebSize."Total in B" = $subfileSizes.B
		$subwebSize."Total in KB" = $subfileSizes.KB
		$subwebsize."Total in MB" = $subfileSizes.MB
		$subwebSize."Total in GB" = $subfileSizes.GB
		$subwebSize."Last Modified Date" = $subWeb.LastItemModifiedDate
		
		
		$global:sizes += $subwebSize
		Write-SizeCSV
		
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


###############

$rootURL = "http://epm.phly.net/project"
#$SPSite = Get-SPSite $rootURL #"http://epm.phly.net/project"
#$SPSite.AllWebs | Select-Object Name,URL | Export-CSV "ProjectServer.csv"
#$SPSite.AllWebs | foreach { GetWebSizes -StartWeb $_.URL | where {$_.url -ne $rootURL } }


GetWebSizes -StartWeb $rootURL
