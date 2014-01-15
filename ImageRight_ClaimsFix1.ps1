<#
.SYNOPSIS
Assign a group to subfolders based on an existing group's rules
.DESCRIPTION

.PARAMETER set
Copies and sets group rules on subfolders
.PARAMETER newGroup
The Domain/Group that you would like to add to the subfolders
.PARAMETER remove
Removes group rules on subfolders
.PARAMETER path
Root path to examine
.PARAMETER oldGroup
[SET]Group/Domain to look for and copy rules from 
[REMOVE]Group/Domain to remove from subfolders
.NOTES
NAME        :  GroupAssign
VERSION     :     
LAST UPDATED:  10/17/2012
AUTHOR      :  PHLYNT\lwapnits (Larry G. Wapnitsky)
.INPUTS
None
.OUTPUTS
None
#>
function LogWrite
{
	Param(
		[string]$logfile,
		[string]$loginput
	)
	
	$logstring = "{0} - {1}" -f (get-Date), $loginput
	
	Add-Content $logfile -Value $logstring
	write-Host $logstring
}

function TraverseFolders($folder, $remainingDepth) {
  Get-ChildItem $folder | Where-Object { $_.PSIsContainer } | ForEach-Object {
    if ($remainingDepth -gt 1) {
      TraverseFolders $_.FullName ($remainingDepth - 1)
    }
	else {return $_.fullname}
  }
}


function validPath($path)
{
	return !(test-Path -Path $path -PathType leaf)
}

function groupSplit
{
	Param([string]$group)

	return $group.split("\");
}

function validGroup($group)
{
	$dom,$grp = groupSplit($group)
	$contextType = [System.DirectoryServices.ActiveDirectory.DirectoryContextType]::Domain
	$context = new-Object -TypeName System.DirectoryServices.ActiveDirectory.DirectoryContext `
		-ArgumentList $contextType, $dom
	$domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($context)
	$searcher = new-Object DirectoryServices.DirectorySearcher($domain.GetDirectoryEntry(), $filter)
	$searcher.filter = "(&(objectCategory=Group)(objectClass=Group)(cn=$grp))"
	[System.DirectoryServices.SearchResultCollection]$Results = $searcher.FindAll()
	return $Results.count -ge 1
}

function AclAce
{
	param (
		[string]$identity,
		[system.Security.AccessControl.FileSystemAccessRule]$access,
		[string]$folder
	)

	$propagation = [system.security.accesscontrol.PropagationFlags]"InheritOnly"

	$permission = $identity,
				  $access.FileSystemRights,
				  $access.InheritanceFlags,
				  $propagation,
				  $access.AccessControlType
	
	$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
	$ACL = Get-Acl -Path $folder
	
	return $ACE, $ACL
}

function applyACL
{
	Param (
		[string]$folder,
		[system.Security.AccessControl.DirectorySecurity] $objACL,
		[string]$action,
		[string]$logfile
	)
	
	try {
		# set-Acl -Path $folder -AclObject $objACL
		$folder
		$objACL
		$success = $true
		}
	catch { $success = $false }
	finally {
		$logmsg = "{0}: {1} : {2}" -f  $action, $success, $folder
		LogWrite $logfile $logmsg
		}
}

function GroupAssign ()
{
	PARAM(
		[Parameter(ParameterSetName="set", Position=1)]
			[switch] $set,
		[Parameter(ParameterSetName="set", Mandatory=$true, Position=4)]
			[ValidateScript({validGroup($_)})]
			[string] $newGroup,

		[Parameter(ParameterSetName="remove", Position=1)]
			[switch] $remove,

		[Parameter(ParameterSetName="set", Mandatory=$true, Position=2)]
		[Parameter(ParameterSetName="remove", Mandatory=$true, Position=2)]
			[ValidateScript({validPath($_)})]
			[string] $path,
		[Parameter(ParameterSetName="set", Mandatory=$true, Position=3)]
		[Parameter(ParameterSetName="remove", Mandatory=$true, Position=3)]
			[ValidateScript({validGroup($_)})]
			[string] $oldGroup
	)
	
	process
	{
		#$subs = get-ChildItem -Path $path | where { $_.PSIsContainer -eq $true }
		$subs = TraverseFolders $path 2
		$newDom, $newGrp = groupSplit($newGroup)
		$oldDom, $oldGrp = groupSplit($oldGroup)
		$rootowner = (Get-ACL -path $path).Owner

		foreach ($sub in $subs)
		{
			#$access = (Get-Acl  $sub.FullName).Access
			$access = (Get-Acl  $sub).Access
			$IDRefs = $access | Select-Object IdentityReference
			foreach ($a in $access)
			{
				if ($a.IdentityReference -match  [regex]::escape($oldGroup))
				{
					switch ($PSCmdlet.ParameterSetName)
					{
						"set"
						{
							$logfile = "{0}{1}_{2}.log" -f (Resolve-Path $path | convert-Path), $newDom, $newGrp
						
							if (!($IDRefs -match [regex]::escape($newGroup)))
							
							{
								$identity = $a.IdentityReference.Value -replace [regex]::escape($oldDom), $newDom
								$identity = $identity -Replace [regex]::escape($oldGrp), $newGrp
								
								#$objACE, $objACL = AclAce $identity $a $sub.fullname
								$objACE, $objACL = AclAce $identity $a $sub
								
								$objACL.SetOwner((New-Object System.Security.Principal.NTAccount($rootOwner)))
								$objACL.AddAccessRule($objACE)
								
								$objACE
								#ApplyACL $sub.FullName $objACL $PSCmdlet.ParameterSetName $logfile
								ApplyACL $sub $objACL $PSCmdlet.ParameterSetName $logfile
							}
						}
						
						"remove"
						{
							$logfile = "{0}{1}_{2}.log" -f (Resolve-Path $path | convert-Path), $oldDom, $oldGrp

							#$objACE, $objACL = AclACE $a.IdentityReference $a $sub.fullname
							$objACE, $objACL = AclACE $a.IdentityReference $a $sub
							$objACL.RemoveAccessRule($objACE)
							
							ApplyACL $sub.FullName $objACL $PSCmdlet.ParameterSetName $logfile
						}
						
						default
						{
						}
					}
				}
			}
		}
	}
}
