#$ex = new-pssession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell -Credential $(get-credential) -Authentication basic -AllowRedirection

#Import-PSSession $ex

#$mbx = get-mailbox larry.wapnitsky
$mboxinfo = foreach ($mbx in $(get-mailbox)){
  $al_count = 0
  write-progress -id 1 -activity "Getting aliases" -status $mbx.alias
  try{
    [System.Collections.Arraylist]$aliases = $mbx | select -expandproperty emailaddresses alias | where {$_ -match [regex]"(?i)^smtp\:"}
  }
  catch{
    $aliases = new-object -type System.Collections.ArrayList
    $aliases.add($($mbx | select -expandproperty emailaddresses alias | where {$_ -match [regex]"(?i)^smtp\:"}))
  }
  $info = new-object -type PSObject -property @{
    Name = $mbx.alias
    "Primary Email" =  $aliases | where {$_ -match [regex]"(?-i)^SMTP"}
  }


  if ($aliases.gettype().Name -eq "ArrayList") {
    $aliases.removeat($aliases.indexof($info."Primary Email"))
    $aliases | foreach {
      $al_count += 1
      $alname = "Alias$($al_count)"
      add-member -inputobject $info -MemberType NoteProperty -Name $alname -value $_
    }
  }
  $info
}

$mboxinfo | export-csv -notypeinformation name_aliases$(get-date -format yyyyMMdd_HHmmss).csv
#Remove-PSSession $ex
