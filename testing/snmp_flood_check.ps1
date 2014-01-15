[cmdletbinding()]

Param
(
	[Parameter(Mandatory=$true)]
		[ValidateScript({Test-Path $_ -PathType Container})] 
		[string]$Path,
	[Parameter(Mandatory=$false)]
		[string]$Filter="*.xml"
)

Process
{
	$UniqueLog = @{}
	
	$rx = [regex]"(?<First>2[0-4]\d|25[0-5]|[01]?\d\d?)\.(?<Second>2[0-4]\d|25[0-5]|[01]?\d\d?)\.(?<Third>2[0-4]\d|25[0-5]|[01]?\d\d?)\.(?<Fourth>2[0-4]\d|25[0-5]|[01]?\d\d?)"
	
	Write-Progress -id 1 -Activity "Getting Folder Listing for $($Path)" -CurrentOperation "Counting files" -Status "Please Wait..." -PercentComplete -1
	$FileCountTotal = $(Get-ChildItem $($Path) -Force | Measure-Object).Count
	Write-Progress -id 1 -Activity "Getting Folder Listing for $($Path)" -CurrentOperation "$($FileCountTotal) files" -Status "Please Wait..." -PercentComplete -1

	
	$FileCount = 0
	$UniqueIPs = 0
	foreach ($file in $(Get-ChildItem $($Path) -Filter $Filter))
	{
		$FileCount++
		write-progress -id 1 -Activity "Analyzing Log Files in $($Path), filtered by $($Filter)" -CurrentOperation "$($File.Name) ($($FileCount)\$($FileCountTotal))" -Status "$($UniqueIPs) Unique IPs found" -PercentComplete ($(($FileCount)/($FileCountTotal))*100)
		
		$ipMatch = $rx.Match($file.name)
		if ($ipMatch.Success -eq $true) {
			$ipAddress = $ipMatch.Groups[0].ToString()
			#write-host $ipAddress
			
			switch ($UniqueLog.ContainsKey($ipAddress))
			{
				$true
				{
					$UniqueLog[$ipAddress]++
				}
				
				$false
				{
					$UniqueLog.Add($ipAddress, 1)
					$UniqueIPs++
				}
			}
		}
	}
	
	$LogOutput = Foreach ($object in $UniqueLog.GetEnumerator())
	{
		New-Object -TypeName PSObject -Property @{
			IP_Address = $object.Name
			TrapCount = $object.Value
		}
	}
	
	$LogOutput 
}
