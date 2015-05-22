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

##############################################################################################
##  This script requires the free Quest ActiveRoles Management Shell for Active Directory
##  snapin  http://www.quest.com/powershell/activeroles-server.aspx
##############################################################################################

Add-PSSnapin Quest.ActiveRoles.ADManagement -ErrorAction SilentlyContinue
$ErrorActionPreference = "SilentlyContinue"

$webexCSV = import-csv "$pwd\TMNASSiteUsers.csv" -Delimiter "`t"

$count = 0

$results = foreach ($user in $webexCSV) {
	
	
	
	$count+=1
	$percentComplete = (($($count)/$($webexCSV.count))*100)
	$percentComplete = "{0:N2}" -f $percentComplete
	
	write-progress -id 1 -Activity "Checking WebEx Status of $($user.FirstName) $($user.LastName) ($($user.UserName))" -Status "$($percentComplete)% Complete" -PercentComplete $percentComplete

	$qaduser = $(get-qaduser -ProxyAddress "smtp:$($user.Email)") #-SamAccountName $user.UserName)
	
	if (!($qaduser -eq $null) -and ($qaduser.AccountIsDisabled))
	{
		new-object PSObject -Property @{
			#UserID=$user.UserID
			WebexUserName = $user.UserName
			FirstName = $qaduser.FirstName
			LastName = $qaduser.LastName
			ADUserName = $qaduser.SamAccountName
			Active = $user.Active
			Disabled = $true
		}
	}
	else { if ($qaduser -eq $null)
		{
			new-object PSObject -Property @{
				#UserID=$user.UserID
				WebExUserName = $user.UserName
				FirstName = $user.FirstName
				LastName = $user.LastName
				Disabled = "User Not In AD"
			}
		}
	}
	
}

$results | select WebExUserName, Active, FirstName, LastName, ADUserName, Disabled | export-csv "$pwd\WebEx_ADDisabled_TMNAS.csv" -notypeinformation