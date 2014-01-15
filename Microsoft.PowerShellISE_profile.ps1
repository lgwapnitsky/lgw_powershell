#module imports
Import-Module IsePack
Import-Module IsePackV2
Import-Module PowerShellPack
Import-Module PSSystemTools
Import-Module Pscx
Import-Module ScriptCop



#aliases
New-Item alias:np -value 'C:\Program Files (x86)\Notepad++\notepad++.exe'


$Shell = $Host.UI.RawUI

Clear-Host