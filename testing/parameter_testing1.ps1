[cmdletbinding(defaultparametersetname="one")]
param
(
	[Parameter(ParameterSetName="one", Mandatory=$true)]
	[Parameter(ParameterSetName="two", Mandatory=$false)]
		[switch]$first,
	
	[Parameter(ParameterSetName="two", Mandatory=$true)]
		[switch]$second
)

Process
{
	switch ($PsCmdlet.ParameterSetName)
	{
		"one"
		{
			write-host "one"
		}
		"two"
		{
			write-host "two"
		}
	}
}