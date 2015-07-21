Param([string]$computer = $env:COMPUTERNAME)
$hklm = 2147483650
$key = "SOFTWARE\Microsoft\Internet Explorer"
$value = "Version"
$wmi = [wmiclass]"\\$computer\root\default:stdRegProv"
($wmi.GetStringValue($hklm,$key,$value)).svalue
