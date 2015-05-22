$x = import-csv ".\2014-12-1 workspace analysis.csv"

$y = @{}

$z = $x | sort owner | foreach {
	try
	{
		if (!($y.ContainsKey($_.owner))){
			write-host "adding " + $_.owner
			$uinfo = get-userinfo ($_.owner).Replace(";",",")
			$y.Add($_.owner, $uinfo)
		}
		else 
		{
			$uinfo = $y.Item($_.owner)
		}
		new-object -type PSObject -Property @{
			Workspace = $_.Name
			"Last Accessed" = $_."Last Access Date"
			Computer = $_.Computer
			"InActive Owner Account" = $uinfo.AccountIsDisabled
			Owner = $_.owner
		}
	}
	catch {
		write-warning "Failed to add " $_.owner
	}
}

$z | export-csv -notypeinformation ".\2014-12-1 workspace full analysis.csv"