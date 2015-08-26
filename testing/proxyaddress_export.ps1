foreach ($user in get-qaduser larry.wapnitsky  | where {
    ($_.accountisdisabled -eq $false) -and
    ($_.proxyaddresses -ne $null) })
  {
#  $x =  New-object -type PSObject -property @{
    $username = $user.samaccountname
    $name = $user.name
    $dottedname = $name.replace(' ','.')
    $proxyAddresses = (@($user.proxyAddresses) -join ',')
    [System.Collections.ArrayList]$pas = $proxyAddresses -split ','
    $mngMail = $dottedname + "@MNGDirect.com"
#  }

  $mngExists = $false

  foreach ($line in $pas) {
    $rx  = [regex]::matches($line,"((?i)SMTP)\:(.*)((?i)\@mngdirect\.com)")
    if ($rx.success -eq $true)
    {
      switch ($rx.groups[0] -match $dottedname)
      {
        true
        {
          switch ($rx.groups[0] -match [regex]"SMTP")
          {
            false
            {
              $repline = [regex]::Replace($line,"((?-i)smtp)", "SMTP")
              $mngExists = $True
            }
          }
        }
        default
        {
          $repline = [regex]::Replace($line,"((?-i)SMTP)","smtp")
        }
      }
    }
    else {    $repline = [regex]::Replace($line,"((?-i)SMTP)","smtp") }

    $pas = $pas.replace($line, $repline)
  }

  $pas.sort()


  if (!($mngExists))
    #if (!(($pas.BinarySearch("smtp:"+$mngmail)) -or ($pas.BinarySearch("SMTP:"+$mngMail))))
  {
    $pas.add("SMTP:" + $mngMail) | out-null
    $newpas = $pas -join ','
    [string]$pas = $newpas

#    set-qaduser $user -ObjectAttributes @{ProxyAddresses = $newpas} | out-null

    #$pas
  }
#  else {write-host "exists";}

  #set-qaduser $user -ObjectAttributes @{ProxyAddresses = $newpas} | out-null
}

#

#$userinfo | export-csv -NoTypeInformation "c:\users\larry.wapnitsky\documents\metapharm\active_proxyaddresses_20150814.csv"
#$userinfo
