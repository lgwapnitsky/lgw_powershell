function get-dn
{
	Param(
		[Parameter(Mandatory=$true)]
			[string]$groupToAdd
	)
	
	
	$root = [ADSI]''
	$searcher = new-object System.DirectoryServices.DirectorySearcher($root)
	$searcher.filter = "(&(objectCategory=group)(sAMAccountName=$groupToAdd))"
	$results = $searcher.findone()
	return $results.Path
}

function add-grouptoservergroup
{
    param 
    (
		[Parameter(Mandatory=$true)]
			[string]$server,
		[Parameter(Mandatory=$true)]
			[string]$serverGroup,
		[Parameter(Mandatory=$true)]
			[string]$groupToAdd
	)

    #$result = @()
    #$result += $server

    try 
    {
        $sgroup = [ADSI]"WinNT://$strComputer/$serverGroup"

		$gtaDN = [ADSI](get-dn -groupToAdd $groupToAdd)
		
		write-host $gtaDN
		
        #$members = $group.members()
        #$members | foreach { $result += $_.GetType().InvokeMember("ADSPath","GetProperty", $null, $_, $null) }
        #return $result -join "`n"
        
        $sgroup.PSBase.Invoke('Add',$gtaDN.PSBase.Path)
    }
    
    catch
    {
        Write-Host "Can't check machine $server"
    }
}


add-grouptoservergroup -server norrspd005 -serverGroup Administrators -groupToAdd g00sqlserviceaccounts