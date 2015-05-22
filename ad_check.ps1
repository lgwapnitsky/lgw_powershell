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


try { Add-PSSnapin microsoft.SharePoint.powershell -ErrorAction Stop }
catch
{
	Invoke-Command $ScriptBlock
}

function validPath($path)
{
	return !(test-Path -Path $path -PathType leaf)
}

function validFile($path)
{
	return (Test-Path -Path $path -PathType leaf)
}
  
function Get-Domain
{
	$context = new-object System.DirectoryServices.ActiveDirectory.DirectoryContext("Domain", $Domain)
	$domainContext = [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($context)
	return $domainContext
}
  
function UserExistsInAD
{
	param(
		[Parameter(Mandatory=$true)]
		[string]$UserLoginID
	)
	
	Process
	{
		$search = [System.DirectoryServices.DirectorySearcher]$DOMroot
		$search.Filter = "(&(objectCategory=User)(samAccountName=$UserLoginID))"
		$result = $search.FindOne()
		return $result -ne $null
	}
}

function UserDisabledInAD
{
	param(
		[Parameter(Mandatory=$true)]
		[string]$AccountName
	)
	
	Process
	{
		$domainDN = $DOMRoot.DistinguishedName
		
		$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]"LDAP://$domainDN")
		$Searcher.filter = "(&(objectCategory=person)(objectClass=user)(sAMAccountName=$AccountName)(userAccountControl:1.2.840.113556.1.4.803:=2))"
		
		return $($Searcher.FindOne()) -ne $null
	}
}
