function TraverseFolders($folder, $remainingDepth) {
  Get-ChildItem $folder | Where-Object { $_.PSIsContainer } | ForEach-Object {
    if ($remainingDepth -gt 1) {
      TraverseFolders $_.FullName ($remainingDepth - 1)
    }
	else {return $_.fullname}
  }
}

$subs = traversefolders i:\12_cl01\20120216 1
$group = "corp\claims"
$count = 0

foreach ($sub in $subs) {
	$access = (get-acl $sub).access
	foreach ($a in $access)
	{
		if (($a.identityreference -match [regex]::Escape($group)) -and
			($a.IsInherited -eq $false))
		{
			$count++
			$parent = Split-Path $sub -Parent
			$sub
			$p_access = (Get-Acl $parent).access
			foreach ($p in $p_access)
			{

			}
		}
	}
#	$idrefs = $access | select-object IdentityReference
#	$inhs = $access | Select-Object isinherited
}
$count