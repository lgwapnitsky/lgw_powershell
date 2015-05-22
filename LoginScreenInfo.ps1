# check if HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background  key exists 
if(!(Test-Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background )) 
{ 
    New-Item "HKLM:\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\" -Name "Background" -Force 
} 
New-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" -Name "OEMBackground" -Value 1 -PropertyType "DWord" -Force 
Add-Type -AssemblyName system.drawing 
md "$($env:windir)\system32\oobe\info" -Force 
md "$($env:windir)\system32\oobe\info\backgrounds" -Force 
$filename = "$($env:windir)\system32\oobe\info\backgrounds\backgroundDefault.jpg" 
$bmp = New-Object System.Drawing.Bitmap 1024,768                                                                                                                                                   
$font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Regular) 
 
$brushbg = [System.Drawing.Brushes]::Black                                                                                                                                                         
$brushfg = [System.Drawing.Brushes]::White 
$graphics = [System.Drawing.Graphics]::FromImage($bmp)                                                                                                                                             
$graphics.FillRectangle($brushbg,0,0,$bmp.Width,$bmp.Height) 
 
$graphics.DrawString("Computername: $($env:COMPUTERNAME)",$font,$brushfg,800,100) 
$graphics.DrawString(" Logonserver: $($env:LOGONSERVER)",$font,$brushfg,800,120) 
$boottime = gwmi Win32_OperatingSystem 
$boottime = $boottime.converttodatetime($boottime.lastbootuptime) 
$graphics.DrawString(" Last Boot: $($boottime)",$font,$brushfg,800,140) 
 
$hdds = gwmi Win32_LogicalDisk -Filter "DriveType=3" 
$yPos = 160 
foreach($hdd in $hdds) { 
    if(($hdd.Freespace/1GB) -lt 10) 
    { 
        $brushfg = [System.Drawing.Brushes]::Yellow 
    }     
    elseif(($hdd.Freespace/1GB) -lt 5) 
    { 
        $brushfg = [System.Drawing.Brushes]::Red 
    } 
    else{ 
        $brushfg = [System.Drawing.Brushes]::Green 
    } 
    $hddString = " $($hdd.DeviceID) ({0:n2} GB/{1:n2} GB)" -f ($hdd.FreeSpace/1GB),($hdd.Size/1GB) 
    $graphics.DrawString($hddString,$font,$brushfg,800,$yPos) 
    $yPos+=20 
} 
 
$graphics.Dispose() 
$bmp.Save($filename) 
#Invoke-Item $filename    