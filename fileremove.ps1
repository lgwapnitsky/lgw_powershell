Trap {"Error: $_"; Break;}

Function validPath
{
    Param([string]$filename)
    
    return (!(Test-Path -Path $filename -PathType Leaf))
}


function Remove-FourMonthsOld
{
	Param
	(
		[Parameter(Mandatory=$true, Position=1)]
			[ValidateScript({validPath($_)})]
			[string]$path
	)
	#$path = "\\vmirdevfs\images$\12_POL"
	
	$dayOneFMA = "{0:yyyy-MM-dd 00:00:00.000}" -f `
		[DateTime](Get-Date -Day 01).AddMonths(-4)

	$folders = Get-ChildItem $path 
	foreach ($folder in $folders)
	{
		$fdt = ([DateTime](Get-Item $folder.FullName).LastWriteTime.Date)
		if ($fdt -lt $dayOneFMA) 
		{ 
			"Removing {0} :: {1}" -f $folder.FullName, $folder.LastWriteTime
			Remove-Item $folder -Recurse -Confirm
		}
	}
}