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
    write-host "Total size of all sites below" $StartWeb "is" $total "Bytes,"
    write-host "which is" $totalInMb "MB or" $totalInGb "GB"
    $web.Dispose()
}

function GetWebSize ($Web)
{
    [long]$subtotal = 0
    foreach ($folder in $Web.Folders)
    {
        $subtotal += GetFolderSize -Folder $folder
    }
    write-host "Site" $Web.Title "is" $subtotal "KB"
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
        write-host "Site" $subweb.Title "is" $webtotal "Bytes"
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

#GetWebSizes -StartWeb "http://epm.phly.net/project/2009_Paybase Upgrade"
