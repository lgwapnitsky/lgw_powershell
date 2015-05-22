Trap {
	$err = $_.Exception
	write-error $err.Message
	while ( $err.InnerException) 
	{
		$err = $err.InnerException
		Write-Error $err.Message
	}
	break;
}

Set-PSDebug -Strict
$ErrorActionPreference = "stop"

$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$currentScriptName = $MyInvocation.MyCommand.Name
$currentExecutingPath = $fullPathIncFileName.Replace($currentScriptName, "")

#if ( (Get-PSSnapin -Name Quest.ActiveRoles.* -ErrorAction SilentlyContinue) -eq $null )
#{
#	Add-PsSnapin Quest.ActiveRoles.*
#}

#Requires -PSSnapin Quest.ActiveRoles.ADManagement

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

function get-nestedsecgroups
{
	param(
		[Parameter(Mandatory=$true)]
			[string] $username
	)
	
	(Get-QADUser $username).nestedmemberof | foreach { Get-QADGroup $_ | Where-Object { $_.grouptype -match [regex]'(?i)security' } } | Select-Object name,dn | Sort-Object name
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

filter colorize-row{
    param(
        [string]$color="green",
        [string]$prop="name",
        [string]$regex=$(throw "must supply regular expression pattern")

    )
    
    # save current console colors
    #$bgc=[console]::BackgroundColor;
    $fgc=[console]::ForegroundColor;

    if($_.$prop -match $regex){[console]::ForegroundColor=$color; $_}
    else{[console]::ForegroundColor=$fgc; $_}

    # revert to saved console colors
    #[console]::BackgroundColor=$bgc;
    [console]::ForegroundColor=$fgc; 
}

#Import-Module $currentExecutingPath\JSON_XML

