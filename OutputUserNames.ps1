function validPath($path)
{
	Write-Output $path
	return (test-Path -Path $path -PathType leaf)
}

function OutputUsernames
{
	Param(
		[Parameter(Mandatory=$true)]
			[ValidateScript({validPath($_)})]
			[string] $Filename
	)

	$rx_mail = '\<(?i)([a-z0-9\.\-]+\@[a-z0-9\-]+\.(?:net|com))\>'

	$userlist = Get-Content $Filename | ForEach {
		$email = ([regex]$rx_mail).match($_).groups[1].value
		$user = Get-QADUser -Email $email
		New-Object -TypeName PSObject -Property @{
			username = 'CORP\{0};' -f $user.samaccountname
		}
	}
	Write-Output $userlist
}		