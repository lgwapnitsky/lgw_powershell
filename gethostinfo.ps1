param([Parameter(ValueFromPipeline=$True,
    ValueFromPipelineByPropertyName=$True)]$HostName = 'localhost')
	
$ips = [System.Net.Dns]::GetHostAddresses($HostName)

foreach ($ip in $ips)
{
	[System.Net.Dns]::GetHostEntry($ip)
}