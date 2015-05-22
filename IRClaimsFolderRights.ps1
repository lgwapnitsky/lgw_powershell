Import-Module PSCX

function quit { exit }

function validFolder($fname)
{
    if ((test-path -Path $fname -pathtype leaf ) -eq $true) 
	{
		write-warning "Please specify a directory, not a filename." ;
		quit
	}
}

function validRestoreFolder
{
	if (!(test-Path -Path $rightsBak))
	{
		write-warning "The restore folder you specified`n$rightsBak`ndoes not exist."
		quit
	}
	validFolder($rightsBak)
}

function RestoreRights
{
	$restoreFiles = Get-ChildItem $rightsBak -name -filter "*.csv"
	foreach ($rf in $restoreFiles) {
		$csv = "{0}\{1}" -f $rightsBak, $rf
		$rights = import-csv $csv
		$rf -match '(.*)\.csv$'
		$fname = "{0}\{1}" -f $FolderName, $matches[1]
		$fname
		RemoveInherit($fname)
		setRights($fname, $rights)
	}
}

function notInherited
{
	$subs = Get-ChildItem -Path $FolderName | where { $_.PSIsContainer -eq $true }
    $rootowner = (Get-ACL -path $FolderName).Owner
        
	foreach ($sub in $subs)
	{
        $acl = get-acl -path $sub.fullname
		$access = $acl.Access
 
        $sub

		if ( $access[0].isinherited -ne $true )
		{
			$rightsBak = "{0}_rights.bak" -f $sub.Parent 
			if (!(test-Path $rightsBak))
			{
				new-Item $rightsBak -type Directory
			}
			$filename = "{0}\{1}.csv" -f $rightsBak,$sub.name#,$owner.Replace("\",'-')
			$access | select-Object -Skip 0 | export-Csv -Path $filename
			#Inherit($sub.FullName)
            Inherit $acl $rootOwner $sub.FullName
		}
	}
}


function Inherit
{
    Param
    (
        [system.Security.AccessControl.DirectorySecurity]$objACL,
        [string]$rootOwner,
        [string]$SF
    )
	write-host "inheriting..."
	$subFolder = Resolve-Path $SF | Convert-Path
	write-host $subFolder
	#$objACL = get-Acl $subFolder
    $owner = $objACL.Owner

    $owner, $rootowner
    $owner -notmatch [regex]::escape($rootowner)

    if ($owner -notmatch [regex]::Escape($rootOwner))
    {
        $objACL.SetOwner((New-Object System.Security.Principal.NTAccount($rootOwner)))
        #$acl | Set-Acl -path $sub.FullName
    }

	foreach ($ACL in $objACL.Access)
	{
		if ($ACL.IsInherited -eq $false)
		{
			$objACL.RemoveAccessRule($ACL)
		}

	}
	$objACL.SetAccessRuleProtection($false,$true)
	try {
		set-Acl $subFolder -AclObject $objACL
	}
	catch {
		write-Host "error"
	}
}

function setRights($fname, $rights)
{
	foreach ($ACL in $rights)
	{
		$objACE = New-Object System.Security.AccessControl.FileSystemAccessRule `
    		($ACL.IdentityReference, 
			$ACL.FileSystemRights,
			$ACL.InheritanceFlags, 
			$ACL.PropagationFlags,
			$ACL.AccessControlType) 
			
		$objACL = get-Acl $fname
		
		
		write-Host "setting..."
		$objACL.AddAccessRule($objACE)
		
		set-Acl $fname -AclObject $objACL
	}
}

function RemoveInherit($fname)
{
	$objACL = [System.IO.Directory]::GetAccessControl($fname)
	$objACL.SetAccessRuleProtection($true, $true)
	[System.IO.Directory]::SetAccessControl($fname, $objACL)
}

$ArgsLength = $args.length

switch -regex ($ArgsLength) {
	2 {
		$FolderName = Resolve-Path $args[1] | Convert-Path
		validFolder($FolderName)

		switch -regex ($args[0]) {
			"^inherit$" {
				notInherited
			}
			
			"^restore$" {
				$rightsBak = "{0}\{1}_rights.bak" -f $FolderName, (Get-Item $FolderName).Name
				validRestoreFolder
				RestoreRights($rightsBak)
			}
			
			default {
				write-warning "Invalid number of parameters..."
				quit
			}
		}
	}

	3 {
		$FolderName = Resolve-Path $args[1] | Convert-Path
		validFolder($FolderName)

		switch -regex ($args[0]) {
			"^restore$" {
			$rightsBak = $args[2] 
			validRestoreFolder
			RestoreRights($rightsBak)
			}
			
			default {
				write-warning "Invalid number of parameters..."
				quit
			}
		}
	}

	default {
		Write-warning "Invalid number of arguments..."
		quit
	}
}