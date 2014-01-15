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

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint") | Out-Null
 
$ScriptBlock = {
	#Functions to Imitate SharePoint 2010 Cmdlets in MOSS 2007
	function global:Get-SPWebApplication($WebAppURL)
	 { 
	  return [Microsoft.SharePoint.Administration.SPWebApplication]::Lookup($WebAppURL)
	 }
	 
	function global:Get-SPSite($url)
	 {
	    return new-Object Microsoft.SharePoint.SPSite($url)
	 }
	 
	function global:Get-SPWeb($url)
	{
	  $site= New-Object Microsoft.SharePoint.SPSite($url)
	        if($site -ne $null)
	            {
	               $web=$site.OpenWeb();       
	            }
	    return $web
	}
}

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
		[string]$AccountName
	)
	
	Process
	{
		$search = [System.DirectoryServices.DirectorySearcher]$DOMroot
		$search.Filter = "(&(objectCategory=User)(samAccountName=$($AccountName)))"
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
		
		return $Searcher.FindOne() -ne $null
	}
}

function UserExclusions
{
	param (
		[Parameter(Mandatory=$true)]$User
		#[Microsoft.SharePoint.SPPrincipal]$User
		
	)
	return (			
			($User.Get_IsDomainGroup() -eq $false) -and
			($User.LoginName -notmatch [regex]"(?i)$([regex]::escape('nt authority\authenticated users'))") -and
			($User.LoginName -notmatch [regex]"(?i)$([regex]::escape('sharepoint\system'))") -and
			($User.LoginName -notmatch [regex]"(?i)$([regex]::escape('nt authority\local service'))") -and
			($User.LoginName -match [regex]"^(?i)$($Domain)\\.*")
			)
}

function validUser
{
	param (
		[Parameter(Mandatory=$true)]
		[Microsoft.SharePoint.SPPrincipal]$User
	)
	
	$AccountName = $User.LoginName.Split("\")[1]
	
	$ux = $(UserExclusions $User)
	if ($ux) {
		return (((UserExistsInAd $AccountName) -eq $false ) -or
				(UserDisabledInAD $AccountName) -eq $false)
	}
	else { return $true }


#	return ((UserExclusions $User) -and	
#			((UserExistsInAd $AccountName) -eq $false) -and 
#			(UserDisabledInAD $AccountName))
}