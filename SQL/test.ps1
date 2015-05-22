Set-PSDebug -Strict
$ErrorActionPreference = "stop"

$MS = "Microsoft.SQLServer"
@('.SMO','.SmoExtended','.ConnectionInfo') | 
ForEach-Object {
	if ([System.Reflection.Assembly]::LoadWithPartialName("$MS$_") -eq $null)
	{
		Throw "missing SMO component $MS$_"
	}
}

$SMO = "$MS.Management.Smo"
$BadChars = '[\\\/\:\.]'

$Server = "pathnetsqldev"
$database = "AccessPHLY"
$directory = ".\"
$bcpflags = " -T -N"

$sqlconn = New-Object ("$SMO.Server") $Server
$db = $sqlconn.Databases[$database]

$db.tables | ForEach-Object {
	$tableName = "[" + $database +"].["+$_.Schema+"].["+$_.Name+"]"
	$filename = '"'+$directory+$database+"."+$_.Schema.Replace("\","") + "." + $_.Name+'.bcp"'
	$bcpCall = "bcp.exe "+$tableName+ " out " + $filename + " -S " + $Server + " " + $bcpflags
	Write-Host "Now calling $bcpcall"
	Invoke-Expression $bcpCall
}