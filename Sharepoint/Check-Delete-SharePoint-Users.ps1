function ListUsers([string]$SiteCollectionURL, [string]$LoginToDel, [string]$LoginNewAdmin)
{
	[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint") > $null
	$site = new-object Microsoft.SharePoint.SPSite($SiteCollectionURL)
	$web = $site.openweb()

	#Debugging - show SiteCollectionURL
	Write-Host "SiteCollectionURL", $SiteCollectionURL

	$siteCollAdmins = $web.SiteAdministrators

	$checkadmin = 0

	foreach($Admin in $siteCollAdmins)
	{
		if($Admin.LoginName -eq $LoginToDel)
		{
			Write-Host "  ADMIN: ", $Admin.LoginName
			$checkadmin = 1
		}
		#Write-Host "  ADMIN: ", $Admin.LoginName
	}

	$checkuser = 0
	$siteCollUsers = $web.SiteUsers

	if($checkadmin -eq 1)
	{
		$siteCollUsers.Add($LoginNewAdmin, "", "", "")
		Write-Host "  ADMIN ADDED: ", $LoginNewAdmin
		$web.Update()
		$myuser = $siteCollUsers[$LoginNewAdmin]

		if($site.Owner.LoginName -eq $LoginToDel)
		{
			$site.Owner = $myuser
			$myuser.Update()
			$web.Update()
		}
		if($site.SecondaryContact.LoginName -eq $LoginToDel)
		{
			$site.SecondaryContact = $myuser
			$myuser.Update()
			$web.Update()
		}
		$myuser.IsSiteAdmin = $TRUE
		$myuser.Update()
		$siteCollAdmins.remove($LoginToDel)
		$web.Update()
	}
	
	foreach($MyUser in $siteCollUsers)
	{
		if($MyUser.LoginName -eq $LoginToDel)
		{
			Write-Host "  USER: ", $MyUser.LoginName
			$checkuser = 1
		}
	}
	if($checkuser -eq 1)
	{
		$siteCollUsers.Remove($LoginToDel)
		Write-Host " DELETE USER OK: ", $LoginToDel
		$web.Update()
	}
	
	$web.Dispose()
	$site.Dispose()
}

function ListUsersForAllCollections([string]$WebAppURL, [string]$LoginToDelete, [string]$LoginNewSiteAdmin)
{

	[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint") > $null

	$Thesite = new-object Microsoft.SharePoint.SPSite($WebAppURL)
	$oApp = $Thesite.WebApplication

	foreach ($Sites in $oApp.Sites)
	{
		$mySubweb = $Sites.RootWeb
		$TempRelativeURL = $mySubweb.Url
		ListUsers $TempRelativeURL $LoginToDelete $LoginNewSiteAdmin
    }

}
function StartProcess()
{
	# Create the stopwatch
	[System.Diagnostics.Stopwatch] $sw;
	$sw = New-Object System.Diagnostics.StopWatch
	$sw.Start()
	cls
	$usertoreplaceinsiteadmin = "DOMAIN\MyNewSiteCollAdminLogin"

	$userloginstodelete = "DOMAIN\login1, DOMAIN\login2, DOMAIN\login3, DOMAIN\login4"

	
	
	foreach ($userlogintodelete in $userloginstodelete)
	{
		ListUsersForAllCollections "http://myWebApplication01" $userlogintodelete $usertoreplaceinsiteadmin
		ListUsersForAllCollections "http://myWebApplication01" $userlogintodelete $usertoreplaceinsiteadmin
	}

	$sw.Stop()

	# Write the compact output to the screen
	write-host $userloginstodelete.Count, " Logins deleted in Time: ", $sw.Elapsed.ToString()
}

StartProcess


