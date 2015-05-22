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

#$jiveCSV = import-csv "$pwd\registeredlist10012014.csv"
$jiveCSV = import-csv "$pwd\userresults1.csv" | sort username

$count = 0

$results = foreach ($user in $jiveCSV) {
	
	$count+=1
	$percentComplete = (($($count)/$($jiveCSV.count))*100)
	$percentComplete = "{0:N2}" -f $percentComplete
	
	write-progress -id 1 -Activity "Checking AD Status of $($user.username) - ID# $($user."User ID")" -Status "$($percentComplete)% Complete" -PercentComplete $percentComplete

	$qaduser = $(get-qaduser -ProxyAddress "smtp:$($user.username)") #-SamAccountName $user.UserName)
	
	if ($qaduser -eq $null)
	{
		$user.username -match [regex]"(.*)\.(.*)\@.*$" | out-null
		$firstname,$lastname = $matches[1],$matches[2]
		$qaduser =  $(get-qaduser -FirstName $firstname -LastName $lastname)
	}
	
	if (!($qaduser -eq $null) -and ($qaduser.AccountIsDisabled))
	{
		write-progress -id 2 -parentID 1 -Activity "$($user.username) - ID# $($user."User ID") is disabled in AD" -Status "logging..."
		
		new-object PSObject -Property @{
			UserID=$user."User ID"
			JiveUserName = $user.UserName
			FirstName = $qaduser.FirstName
			LastName = $qaduser.LastName
			ADUserName = $qaduser.SamAccountName
			Active = $user.Active
			ADDisabled = $true
		}
	}
	else { if ($qaduser -eq $null) 
		{
		write-progress -id 2 -parentID 1 -Activity "$($user.username) - ID# $($user."User ID") does not exist in AD" -Status "logging..."

		
			new-object PSObject -Property @{
				#UserID=$user.UserID
				JiveUserName = $user.UserName
				ADDisabled = "User Not In AD"
			}
		}
	}
	
}

$results | select JiveUserName, Active, FirstName, LastName, ADUserName, ADDisabled | export-csv "$pwd\Jive_ADDisabled.csv" -notypeinformation