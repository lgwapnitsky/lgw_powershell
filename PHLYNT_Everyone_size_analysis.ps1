clear
$path="i:\"
$everyone = "phlynt\everyone"


$sum = 0

$subs = get-ChildItem -Path $path | where { $_.PSIsContainer -eq $true }
foreach ($sub in $subs)
		{
			$access = (Get-Acl  $sub.FullName).Access
			$IDRefs = $access | Select-Object IdentityReference
			foreach ($a in $access)
			{
				if ($a.IdentityReference -match  [regex]::escape($everyone))
				{
                    try
                    {
                        $colItems = (Get-ChildItem -path $sub.FullName -Recurse | Measure-Object -Property length -Sum)
                        "{0} : {1:N2}" -f $sub.FullName, ($colItems.sum / 1MB) + " MB"
						$sum += $colItems.sum
                    }
                    catch{}
                }
    }
}

"{0:N2}" -f ($sum / 1MB) + " MB"