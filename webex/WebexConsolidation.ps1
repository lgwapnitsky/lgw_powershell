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

import-module "$pwd\import-excel"

$global:rx_hyphensallowed = [regex]"[^\w\ \-]"
$global:rx_alphaOnly = [regex]"[^a-zA-Z\ ]"
$global:rx_alphaNumeric = [regex]"[^\w\ ]"
$global:rx_numeric = [regex]"[^\d]"
$global:rx_phone = [regex]"^(?:[0-1]){0,1}([\d]{10})"

function global:validFile($path)
{
	return (Test-Path -Path $path -PathType leaf)
}

function global:substringTrim
{
	param
	(
		[string]$text,
		[int]$maxLength
	)
	
	PROCESS
	{
		$trimLength = (@($maxLength, $text.length) | measure-object -Minimum).Minimum
		return $text.substring(0, $trimLength)
	}
}

function global:splitSuffix($lastname)
{
	$object = new-object -type PSObject -Property @{
		lastname = ""
		suffix = ""
	}
	
	$rx_suffixSplit = [regex]"(?<Name>.*)[\ \,](?<Suffix>.*)"
	$split = $rx_suffixSplit.Match($lastname)
	if ($split.Success)
	{
		$object.lastname = $split.Groups[1].Value
		$object.suffix = $split.Groups[2].Value
	}
	else
	{
		$object.lastname = $lastname
	}
	
	return $object
}

function global:userObject ($user)
{
	$qaduser = get-qaduser -ProxyAddress "smtp:$($user.Email)"
	
	$splitSuffix = splitSuffix $qaduser.lastname
	
	$object = New-Object -type PSObject -Property @{
		firstname = $null
		middleinitial = $null
		lastname = $null
		suffix = $null
		address1 = $null
		address2 = $null
		address3 = $null
		city = $null
		state = $null
		country = $null
		zip = $null
		phonenumber = $null
		emailaddress = $null
	}

		$object.firstname = substringTrim $rx_hyphensallowed.Replace($user.firstname,"") 20
		$object.middleinitial = substringTrim $rx_alphaOnly.Replace($user.initials,"") 1
		$object.lastname = substringTrim $rx_hyphensallowed.Replace($splitSuffix.lastname, "") 30
		$object.suffix = substringTrim $rx_hyphensallowed.Replace($splitSuffix.suffix,"") 3
		$object.city = substringTrim $rx_alphaOnly.Replace($qaduser.City, "") 20
		$object.country = $null
		$object.zip = substringTrim $rx_numeric.Replace($qaduser.PostalCode,"") 5
		$object.phonenumber = $rx_phone.Match($rx_numeric.Replace($qaduser.PhoneNumber, "")).Groups[1].Value
		$object.emailaddress = $user.Email
	
	try
	{
		$address = $qaduser.StreetAddress.Split(",")
		try { $object.address1 = substringTrim $rx_alphaNumeric.Replace($address[0], "") 30 }
		catch {}
		
		try {$object.address2 = substringTrim $rx_alphaNumeric.Replace($address[1].trim(), "") 30 }
		catch {}
		
		try {$object.address3 = substringTrim $rx_alphaNumeric.Replace($address[2].trim(), "") 30 }
		catch {}
	}
	catch { $object.address1 = substringTrim $rx_alphaNumeric.Replace($qaduser.address, "") 30 }
	
	try { $object.state = substringTrim $qaduser.st.ToUpper() 2 }
	catch {}
	
	return $object
}

function global:Consolidate-Webex
{
	[CmdletBinding()]
	
	param 
	(
		[Parameter(Mandatory=$true)]
			[ValidateScript({validFile($_)})]
			[string]$FileName,
		[Parameter(Mandatory=$false)]
			[string]$WorksheetName,
		[bool]$DisplayProgress = $true
	)
	
	PROCESS
	{
		$webexUserInfo = Import-Excel $FileName $WorksheetName
		if ($webexUserInfo.count -eq $null)
		{ $userCount = 1 }
		else { $userCount = $webexUserInfo.count }
		
		$xl = new-object -ComObject "Excel.Application"
		$xl.Visible = $true
		$workbook = $xl.Workbooks.Open("$pwd\Mass Imp Template FINAL.xlsx")
		$sheet = $workbook.Sheets.Item("Americas")
		$sheet.Activate()
		$cells = $sheet.cells
		
		$currentRow = $sheet.UsedRange.Rows.Count
		
		$p_count = 0
		
		$output = foreach ($user in $webexUserInfo)
		{
			$p_count+=1
			
			
			$percentComplete = (($($p_count)/$($UserCount))*100)
			$percentComplete = "{0:N2}" -f $percentComplete
			
			write-progress -id 1 -Activity "Consolidating Webex Users" -Status "$($percentComplete)% Complete" -PercentComplete $percentComplete
			
			userObject($user)
		}
		
		$output | foreach {
			$currentRow += 1
			$cells.item($currentRow, 2) = $_.firstname
			$cells.item($currentRow, 3) = $_.lastname
			$cells.item($currentRow, 4) = $_.middleinitial
			$cells.item($currentRow, 5) = $_.suffix
			$cells.item($currentRow, 6) = $_.address1
			$cells.item($currentRow, 7) = $_.address2
			$cells.item($currentRow, 8) = $_.address3
			$cells.item($currentRow, 9) = $_.city
			$cells.item($currentRow, 10) = $_.state
			$cells.item($currentRow, 11) = $_.country
			$cells.item($currentRow, 12) = $_.zip
			$cells.item($currentRow, 13) = $_.phonenumber
			$cells.item($currentRow, 14) = $_.emailaddress
		}
		
		$newFile = $filename.TrimEnd(".xlsx")
		
		try { $workbook.SaveAs("$pwd\$newFile $(get-date -Format yyyyMMdd_HHmm).xlsx")}
		catch {}
		finally {
			$workbook.Close()
			$xl.Quit()
		}
	}
}