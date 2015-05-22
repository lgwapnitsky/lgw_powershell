$n = Get-WmiObject Win32_NetworkAdapterConfiguration | where {$_.IPAddress -ne $null } #| select Description,IPAddress | format-table -HideTableHeaders

$na = Get-WmiObject Win32_NetworkAdapter | where {$_.physicaladapter -eq $true  }# | select name, netenabled,netconnectionid


$nacs =  foreach ($nac in $n) {
	$fobs = $na | where { $nac.description -eq $_.name }
	
	foreach ($f in $fobs) {
		new-object PSObject -Property @{
			Interface = $f.netconnectionid
			IPAddress = ($nac.IPAddress | % { $_ -join '\n' })
		}
	}
}

$nacs | format-table  -HideTableHeaders