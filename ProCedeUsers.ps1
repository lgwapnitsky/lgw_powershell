Trap {"Error: $_"; Break;}
clear

function queryAll
{
	Param
	(
		[Parameter(Mandatory=$true)]
			[string]$tableName,
		[Parameter(Mandatory=$true)]
			[string]$connString
	)
	
	$SQLconn = New-Object System.Data.SqlClient.SqlConnection
	$SQLconn.ConnectionString = $connString
	
	$SQLcommand = New-Object system.Data.SqlClient.SqlCommand
	$SQLcommand.connection = $SQLconn
	$SQLcommand.commandText = "select * from {0}" -f $tableName
	
	$SQLadapter = New-Object system.Data.SqlClient.SqlDataAdapter
	
	$dataset = New-Object system.Data.DataSet
	
	$sqlconn.Open()
	$SQLadapter.SelectCommand = $SQLcommand
	$SQLadapter.Fill($dataset)
	$sqlconn.Close()

	return ,$dataset.Tables[0].Rows
}

$ProCedeDBServer = "P01APPPROC0212.phly.net"
$ProCedeDBName = "PES_PROD"

$tbl_User = "SystemUser"
$tbl_SecurityGroup = "SecurityGroup"
$tbl_UserGroup = "UserGroup"
$tbl_Affiliate = "Affiliate"

$connString = "data source={0};integrated security=SSPI;persist security info=False;Trusted_Connection=Yes;Database={1}" -f $ProCedeDBServer, $ProCedeDBName

$users = queryAll -tableName $tbl_User $connString
$SGs = queryAll -tableName $tbl_SecurityGroup $connString
$UGs = queryAll -tableName $tbl_UserGroup $connString
$affiliates = queryAll -tableName $tbl_Affiliate $connString
$dict_affiliates = @{}
foreach ($affiliate in $affiliates[1])
{
	$dict_affiliates.Add($affiliate["AffiliateUID"],$affiliate["CompanyCode"])
}


foreach ($user in $users[1])
{
	"{0}, {1} ({2}) {3}" -f $user["LastName"], $user["FirstName"], $user["LogonID"], $user["CreationTimeStamp"]
	if ($user["UserStatus"] -match 'T')
	{
		"Account Status: Terminated"
	}
	else
	{
		"Account Status: Active`nMember Of:"
		foreach ($ug in $UGs[1])
		{
			if ($ug["SystemUserUID"] -match $user["SystemUserUID"])
			{
				foreach ($sg in $SGs[1])
				{
					if ($sg["SecurityGroupUID"] -match $ug["SecurityGroupUID"])
					{
						"`t{0} - {1}" -f $sg["Description"], $dict_affiliates.get_Item($sg["SecurityGroupUID"])
					}
				}
			}
		}
	}
	"`n"
}
