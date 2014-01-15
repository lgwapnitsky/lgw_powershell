[cmdletbinding()]

param([Parameter(ValueFromPipeline=$true,
	ValueFromPipelineByPropertyName=$true,
	Mandatory=$true)]$AQSServer)

$dbName = "PI_AQS_SYSTEM_PROD"

$SQLCommandQuery = "SELECT u.usrLogin
						  ,u.usrLastName
						  ,u.usrFirstName,
						  u.usrEmail,
						  s.[sngLastChecked]
					FROM {0}
					AS u
					INNER JOIN (
						SELECT [sng_userID]
							  ,MAX(sngLastChecked) AS [sngLastChecked]
						FROM [{0}].[dbo].[secSngLogin]
						GROUP BY sng_userID )
					AS S
					ON u.usrID = s.sng_usrID
					ORDER BY sngLastChecked DESC" -f $dbName

$connString = "data source={0};integrated security=SSPI;persist security info=False;Trusted_Connection=Yes;Database={1}" -f $AQSServer,$dbName

$conn = New-Object System.Data.SqlClient.SqlConnection
$conn.ConnectionString = $connString

$command = New-Object System.Data.SqlClient.SqlCommand
$command.Connection = $conn
$command.CommandText = $SQLCommandQuery

$conn.Open()

$reader = $command.ExecuteReader()

while ($reader.Read())
{
	$reader.GetValue(0)
}

$conn.Close()