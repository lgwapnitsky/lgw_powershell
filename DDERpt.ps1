Trap {"Error: $_"; Break;}

function colOutput
{
	Param
	(
		[Parameter(ParameterSetName="headers", Mandatory=$true, Position=1)]
			[switch] $headers,
		[Parameter(ParameterSetName="rows", Mandatory=$true, Position=1)]
			[switch] $rows
	)

	for ($col=0;$col -lt $reader.FieldCount;$col++)
	{
		switch ($PSCmdlet.ParameterSetName)
		{
			"headers"
			{ $csv += "{0}," -f $reader.GetName($col) }
			
			"rows"
			{ $csv += "{0}," -f $reader[$col] }
		}
	}
	$csv = $csv -replace '\,$',''
	
	return $csv
}

function DDERpt
{
	Param
	(
		[Parameter(Mandatory=$true, Position=1)]
			[string]$dbServer,
		[Parameter(Mandatory=$true, Position=2)]
			[string]$dbName,
		[Parameter(Mandatory=$true, Position=3)]
			[string]$csvFile
	)

	$csvtemp = $csvFile -replace '\.csv$','.tmp'
	
	$sql_command_query = "SELECT producer.producer_id, producer.producer_name,`
			producer.producer_region, producer_profile.EnteredByTimeStamp, `
			producer_profile.prodprof_recv_prenote_sentdate,`
			producer_Profile.ApprovedByTimeStamp, producer.producer_type, `
			producer.producer_state, producer.producer_status `
		FROM PRODUCER
		inner Join PRODUCER_PROFILE
		ON producer.producer_id=producer_profile.prodprof_filter"
		
	$connString = "data source={0};integrated security=SSPI;persist security info=False;Trusted_Connection=Yes;Database={1}" -f $dbServer,$dbName

	$conn = New-Object System.Data.SqlClient.SqlConnection
	$conn.ConnectionString = $connString

	$command = New-Object System.Data.SqlClient.SqlCommand
	$command.Connection = $conn
	$command.CommandText = $sql_command_query

	$conn.Open()

	$reader = $command.ExecuteReader()
	colOutput -headers | Out-File $csvtemp

	while ($reader.Read())
	{
		colOutput -rows | Out-File $csvtemp -Append
	}
	Import-Csv $csvtemp | Export-Csv $csvFile -NoTypeInformation
	Remove-Item -Force $csvtemp
}

#$dbServer = "norrdbp007"
#$dbname = "Websystem"
#$csvfile = "c:\test\export.csv"

DDERpt norrdbp007 Websystem c:\test\export.csv
