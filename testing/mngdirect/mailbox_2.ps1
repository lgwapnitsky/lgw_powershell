$ex = new-pssession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell -Credential $(get-credential) -Authentication basic -AllowRedirection
Import-PSSession $ex

#$mboxinfo = import-csv "name_aliases.csv" | where {($_."Primary Email" -ne "") -and ($_.sn -match [regex]"\A[^\W\d_]+\z") -and ($_.givenName -match [regex]"\A[^\W\d_]+\z")}
$mboxinfo = import-csv "name_aliases.csv" | where {($_."Primary Email" -match  "nexgen")}


foreach ($mbox in $mboxinfo)
{
  $newMNGemail = "$($mbox.givenname.trim()).$($mbox.sn.trim())@mngdirect.com"
  $newMNGemail = $newMNGemail -replace " ",""
  $x = $mbox | get-member -type NoteProperty | where {$_ -match "alias"}
  $y = $x | foreach {$mbox.$($_.name) }
  try{
    [System.Collections.ArrayList]$z = $y | where {$_ -match [regex]"(?i)^smtp"}
  }
  catch {
    $z = new-object -type System.Collections.ArrayList
    $z.insert(0,$(($y | where { $_ -match [regex]"(?i)^smtp" })))
  }

  try{
    $z.insert(0,($($mbox."Primary Email") ))
  }
  catch{
    $z = new-object -type System.Collections.ArrayList
    $z.add($mbox."Primary Email")
  }

  $mng = $z.indexof($($z | where {$_ -match [regex]"(?i)\@mngdirect.com$"}))
  switch ($mng)
  {
    -1 {
      #$z.insert(0,"$($mbox.givenName).$($mbox.sn)@MNGDirect.com")
      #$z.add("$($mbox.givenName).$($mbox.sn)@MNGDirect.com")
      $z.add($newMNGemail)
    }
    default {
      switch ($z[$mng] -match $newMNGemail){
        true {
          #$tmp = $z[$mng]
          #$z.remove($tmp)
          #$z.insert(0, $tmp)
        }
        false {
          #$z.insert(0,$newMNGemail)
          $z.add($newMNGemail)
        }
      }
    }
  }

  $z = $z | foreach {$_ -replace "smtp:", ""}
  $z = $z | foreach {$_ -replace "SMTP:", ""}

  [string]$w = $z -join ','


  $exstring = "set-mailbox -identity $($mbox.name) -EmailAddresses $($w)"
  try{
    set-mailbox -identity $(($mbox.name).trim()) -EmailAddresses @{add=$z}
  #  write-host "$($mbox.name) successful"
  }
  catch {
    write-host "issue with $mbox.name"
  }
  write-host $exstring
}

Remove-PSSession $ex
