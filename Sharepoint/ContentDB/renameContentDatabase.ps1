# Created by Dennis Alzoubi    
# Version 1.6
# Last Updated 8/16/2012 11:35 am
# Purpose: Rename a SharePoint content database
param([Parameter(Position=0, Mandatory=$true, HelpMessage="Name of the content database to rename")][string]$databaseName,
      [Parameter(Position=1, Mandatory=$true, HelpMessage="New name for the content database")][string]$newDatabaseName)
      
if ( (Get-PSSnapin -Name Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue) -eq $null )
{
    Write-Host 'Reading in SharePoint SnapIn'
    Add-PsSnapin Microsoft.SharePoint.PowerShell;
}
 
#Load the assemblies required for the SQL database rename.
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo") 
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO")
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended")
 
#Method that renames the Database in SQL
function RenameDatabase($dbServerName, $oldDatabaseName, $newDatabaseName)
{
    try
    {
        Write-Host "Getting SQL server information" -foregroundcolor "Yellow"
        $srv = new-Object Microsoft.SqlServer.Management.Smo.Server($dbServerName)
        Write-Host "Getting database information" -foregroundcolor "Yellow"
        $db = $srv.Databases.Item($oldDatabaseName)
        Write-Host "Killing all active connections to the SQL database" -foregroundcolor "Yellow"
        $srv.KillAllprocesses($oldDatabaseName)
        Write-Host "Renaming the database" -foregroundcolor "Yellow"
        $db.Rename($newDatabaseName)
    }
    catch
    {
        Write-Error "Error in 'RenameDatabase'"
        Write-Error $_.Exception.Message
    }
}
 
Write-Host "Getting the content database to Rename" -foregroundcolor "Yellow"
$contentDB = Get-SPContentDatabase | Where-object {$_.Name -eq $databaseName}
 
Write-Host "Getting the content database settings to preserve" -foregroundcolor "Yellow"
$webApp = $contentDB.WebApplication.Url
$dbServer = $contentDB.Server
$maxSites = $contentDB.MaximumSiteCount
$warningSites = $contentDB.WarningSiteCount
 
try
{
    Write-Host Dismounting $databaseName -foregroundcolor "Yellow"
    Dismount-SPContentDatabase $databaseName -Confirm:$False
 
    Write-host Renaming Database: $databaseName to $newDatabaseName -foregroundcolor "Yellow"
    RenameDatabase $dbServer $databaseName $newDatabaseName
 
    Write-host Mounting Database: $newDatabaseName -foregroundcolor "Yellow"
    Mount-SPContentDatabase -Name $newDatabaseName -WebApplication $webApp -DatabaseServer $dbServer -MaxSiteCount $maxSites -WarningSiteCount $warningSites | out-null
}
catch
{
    Write-Error "Error in 'Process'"
    Write-Error $_.Exception.Message
}
finally
{
    Write-Host "Press any key to continue ..."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}