$dbServers = @("norrdbp007","phlysql09")
$dbNames = @("WebSystem","AccessPHLY")

$resultVals = @(0,0)

$dayOne = "{0:yyyy-MM-dd 00:00:00.000}" -f (Get-Date -Day 01)

$sql_commands = @(
	"SELECT SUM(comm_amt) FROM [dbo].[commission] where comm_account_period = '$dayOne'"
	"SELECT SUM(CommissionAmt) FROM [dbo].[z_tmp_commextract]"
)
for ($i=0; $i -lt $dbServers.Length; $i++)
{
	$connString = "data source={0};integrated security=SSPI;persist security info=False;Trusted_Connection=Yes;Database={1}" -f $dbServers[$i],$dbNames[$i]
	
	$conn = New-Object System.Data.SqlClient.SqlConnection
	$conn.ConnectionString = $connString
	

	$command = New-Object System.Data.SqlClient.SqlCommand
	$command.Connection = $conn
	$command.CommandText = $sql_commands[$i]

	$conn.Open()
	
	$reader = $command.ExecuteReader()
	
	[Void]$reader.Read()
	$resultVals[$i] = $reader.GetValue(0)
	
	$conn.Close()
}

if ($resultVals[0] -ne $resultVals[1])
{

	for ($i=0; $i -lt $dbServers.Length; $i++)
	{
		$errMsg += "DB: {0}`tServer: {1}`tValue:{2}`n" -f $dbNames[$i], $dbServers[$i], $resultVals[$i].ToString("c")
	}
		throw $errMsg
}