if ( (Get-PSSnapin -Name Quest.ActiveRoles.* -ErrorAction SilentlyContinue) -eq $null )
{
	Add-PsSnapin Quest.ActiveRoles.*
}

function get-userinfo
{
	param(
		[Parameter(Mandatory=$true)]
			[string] $user
	)
	get-qaduser $user | select-object name,samaccountname,ntaccountname,email,AccountIsDisabled, AccountIsLockedOut, PasswordNeverExpires, UserMustChangePassword, AccountIsExpired, PasswordIsExpired, AccountExpirationStatus, PasswordStatus
}

function get-userinfo-CSV
{
	Param
	(
		[Parameter(Mandatory=$true,ValueFromPipeline=$true)]
			[ValidateScript({Test-Path $_ -PathType Leaf})] 
			[string]$userFile="",
		[Parameter(Mandatory=$true)]
			[string]$CSVFile
	)
	Get-Content $userFile | ForEach-Object { get-userinfo $_ } | Export-Csv $CSVFile -Force -NoTypeInformation
}

function get-secgroups
{
	param(
		[Parameter(Mandatory=$true)]
			[string] $username
	)
	
	(Get-QADUser $username).memberof | foreach { Get-QADGroup $_ | Where-Object { $_.grouptype -match [regex]'(?i)security' } } | Select-Object name,dn | Sort-Object name
}

function remote-SharePoint
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[string]$ServerName
	)
	
		$cred = Get-Credential
		$session = New-PSSession -Computername $Servername -Credential $cred 
		Invoke-Command -Session $session -ScriptBlock { 
			try { Add-PSSnapin Microsoft.Sharepoint.Powershell -ErrorAction SilentlyContinue }
			catch { [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.Sharepoint") > null }
			finally { $Shell = $Host.UI.RawUI }
		}
		#Import-PSSession -Session $session -Prefix Remote
		Enter-PSSession $session
}