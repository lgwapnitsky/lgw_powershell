$userinfo = foreach ($user in get-qaduser "larry.wapnitsky" | where {
    ($_.accountisdisabled -eq $false) -and
    ($_.proxyaddresses -ne $null) })
{
  New-object -type PSObject -property @{
  username = $user.samaccountname
  name = $user.name
  proxyAddresses = (@($user.proxyAddresses) -join ',')
  }
}#

$userinfo | export-csv -NoTypeInformation "c:\users\larry.wapnitsky\documents\metapharm\active_proxyaddresses_20150814.csv"


[System.Collections.ArrayList]$pas = $userinfo[0].proxyAddresses -split ','
foreach ($line in $pas){
  $repline = [regex]::Replace($line,"((?-i)SMTP)","smtp")
  $pas = $pas.replace($line, $repline)
}

$newpas = $pas -join ','
[string]$pas = $newpas
