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
			$BGColor		  = "Black"
			$FGColor		  = "Green"
		}
		$false
		{
			$Marker           = ">"
			$Role             = "Regular User"
			$BGColor		  = "DarkBlue"
			$FGColor		  = "White"
		}
	}
	$Return                   = new-Object PSObject -Property @{
		Marker                = $Marker
		Role                  = $Role
		BGColor				  = $BGColor
		FGColor				  = $FGColor
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
	#$IsAdmin                  = IsAdmin
	#Write-Host "# ($(Get-Bits)) $env:username@$env:computername | $Now `n# `[$(((Get-History).Count)+1)`] $(get-location) $($IsAdmin.Marker)" -ForegroundColor Cyan -NoNewLine
	#Write-Host "# ($(Get-Bits)) $env:username@$env:computername | " -NoNewLine -ForegroundColor cyan
	Write-Host "# $env:username@$env:computername | " -NoNewLine -ForegroundColor cyan

	Switch ((get-date).tostring('tt'))
	{
		'AM'{
				$dateFGColor = "Yellow"
				$dateBGColor = "DarkGray"
			}
		'PM'{
				$dateFGColor = "DarkGray"
				$dateBGColor = "Blue"
			}
	}
	Write-Host " $Now" -ForegroundColor $dateFGColor -BackgroundColor $dateBGColor
	Write-Host "# `[$(((Get-History).Count)+1)`] $(get-location) $($IsAdmin.Marker)" -ForegroundColor Cyan -NoNewLine

	$Host.UI.RawUI.WindowTitle= "$($IsAdmin.Role) - $env:username@$env:computername | $(get-location)"
	Return " "
}


$IsAdmin = IsAdmin

# Display Settings
$Host.UI.RawUI.BackgroundColor = $($IsAdmin.BGColor)
$Host.UI.RawUI.ForegroundColor = $($IsAdmin.FGColor)

Clear-Host


# Custom Parameter Settings
$PSDefaultParameterValues['Format-[wt]*:Autosize'] = $true


#module imports
Import-Module "PowerTab" -ArgumentList "C:\Users\larry.wapnitsky\Documents\WindowsPowerShell\PowerTabConfig.xml"  -ErrorAction SilentlyContinue | out-null
#Import-Module PSCodeGen -ErrorAction SilentlyContinue
Import-Module EZOut -ErrorAction SilentlyContinue | out-null
Import-Module FileSystem -ErrorAction SilentlyContinue | out-null
Import-Module PSSystemTools -ErrorAction SilentlyContinue | out-null
#Import-Module ScriptCop -ErrorAction SilentlyContinue | out-null
import-module PSCX -ErrorAction SilentlyContinue | out-null
Import-Module TabExpansion++

# custom module imports
Import-Module LGW | out-null


#aliases
New-Item alias:np -value 'C:\Program Files (x86)\Notepad++\notepad++.exe' | out-null

# PSDrives
New-PSDrive -Name PowerShell -Root ~\Documents\WindowsPowerShell -PSProvider FileSystem | out-null

$Shell                        = $Host.UI.RawUI


# Custom Characters
$global:greenCheck = @{
  Object = [Char]8730
  ForegroundColor = 'Green'
  NoNewLine = $true
  }
