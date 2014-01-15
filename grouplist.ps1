param(
	[Parameter(ValueFromPipeline=$True,
    	ValueFromPipelineByPropertyName=$True,
		Mandatory=$true)]
		$groupName = '',
	[Parameter(Mandatory=$true)]
		[string] $csv
	)
	
$mems = (Get-QADGroup $groupName).members

$userlist = foreach ($mem in $mems)
{
	$user = Get-QADUser $mem
	New-Object -TypeName PSObject -Property @{
		username = $user.samaccountname
		name = $user.name
		grp = $groupName
	}
}

$userlist | ConvertTo-Csv | Add-Content -Path $csv

