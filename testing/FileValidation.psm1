function global:validCSV($path)
{
	return ((Test-Path -Path $path -PathType leaf) -and
			($path -match [regex]"(?i)\.csv$"))
}
