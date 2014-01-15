Add-PSSnapin Quest.ActiveRoles.*
## only returns Active Roles commands 
function get-qcommand
{
	if ($args[0] -eq $null)
	{
		get-command -pssnapin Quest.ActiveRoles*
	}
	else
	{
		get-command $args[0] | where { $_.psSnapin -ilike 'Quest.ActiveRoles*' }
	}
}


#module imports
Import-Module "PowerTab" -ArgumentList "C:\Users\lwapnits\Documents\WindowsPowerShell\PowerTabConfig.xml"  -ErrorAction SilentlyContinue
#Import-Module PSCodeGen -ErrorAction SilentlyContinue
Import-Module EZOut -ErrorAction SilentlyContinue
Import-Module FileSystem -ErrorAction SilentlyContinue
Import-Module PSSystemTools -ErrorAction SilentlyContinue
Import-Module ScriptCop -ErrorAction SilentlyContinue
import-module PSCX -ErrorAction SilentlyContinue

# custom module imports
Import-Module LGW


#aliases
New-Item alias:np -value 'C:\Program Files (x86)\Notepad++\notepad++.exe'


$Shell                        = $Host.UI.RawUI

Function IsAdmin()
{
	$CurrentUser              = [System.Security.Principal.WindowsIdentity]::GetCurrent()
	$principal                = new-object System.Security.Principal.WindowsPrincipal($CurrentUser)
	
	switch ($principal.IsInRole("Administrators"))
	{
		$true
		{
			$Marker           = "#"
			$Role             = "Admin User"
		}
		$false
		{
			$Marker           = ">"
			$Role             = "Regular User"
		}
	}
	$Return                   = new-Object PSObject -Property @{
		Marker                = $Marker
		Role                  = $Role
	}
	$Return
}

Function Get-Bits(){
	Switch ([System.Runtime.InterOpServices.Marshal]::SizeOf([System.IntPtr])) {
		4 { Return "32-bit" }
		
		8 { Return "64-bit" }
		
		default { Return "Unknown Type" }
	}
}


function prompt
{
	$Now                      = $(get-date).ToString("HH:mm:ss | yyyy-MM-dd")
	$IsAdmin                  = IsAdmin
	"# ($(Get-Bits)) $env:username@$env:computername | $Now `n# `[$(((Get-History).Count)+1)`] $(get-location) $($IsAdmin.Marker) `n"
	$Host.UI.RawUI.WindowTItle= "$($IsAdmin.Role) - $env:username@$env:computername | $(get-location)"
}



Clear-Host