#Windows PowerShell Code###########################################################################
#
# AUTHOR: John Grenfell
#
###########################################################################

<#
.SYNOPSIS
   Exports an ico and bmp file from a given source to a given destination
.DESCRIPTION
   You need to set the Source and Destination locations. First version of a script, I found other examples but all I wanted to do as grab and ico file from an exe but found getting a bmp useful. Others might find useful
   No error checking I'm afraid so make sure your source and destination locations exist!
.EXAMPLE
    .\Icon_Exporter.ps1
.NOTES
        VERSION HISTORY:
        1.1 2012.03.8
#>


$SourceLocation = "C:\Windows\SysWOW64\WindowsPowerShell\v1.0\"
$DestinationLocation = "C:\Windows\SysWOW64\WindowsPowerShell\v1.0\"

$Items = @(Get-ChildItem $SourceLocation -Recurse -Force -filter *.exe)

ForEach ($Item in $Items){
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($Item)
    [System.Drawing.Icon]::ExtractAssociatedIcon("$($Item.FullName)").ToBitmap().Save("$($DestinationLocation)\$BaseName.bmp")
    $image = [System.Drawing.Icon]::ExtractAssociatedIcon("$($Item.FullName)").ToBitmap()
    $bitmap = new-object System.Drawing.Bitmap $image
    $bitmap.SetResolution(72,72)
    $icon = [System.Drawing.Icon]::FromHandle($bitmap.GetHicon())
    $stream = [System.IO.File]::OpenWrite("$($DestinationLocation)\$BaseName.ico")
    $icon.save($stream)
    $stream.close()
 
} 
