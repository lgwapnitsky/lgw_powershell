<# 
.SYNOPSIS 
	Use this script to dismount/mount SharePoint Content Datbases with proper Timer Job disabling/enabling.
	You must use this to dismount before mounting to handle Timer Jobs.
.DESCRIPTION 
.NOTES 
    File Name  	: 	Refresh-ContentDatabase.ps1 
    Author     	: 	Larry G. Wapnitsky
	Last Updated	:	2013.07.12
.EXAMPLE
	.\Refresh-ContentDatabase.ps1 -Dismount -ContentDBName "ContentDBName" 
.EXAMPLE
	.\Refresh-ContentDatabase.ps1 -Mount -ContentDBName "ContentDBName" -WebApplication "Web Application Name" -DBServer "DBServerName"
.PARAMETER Dismount
	Use this switch to dismount a SharePoint Content Database
.PARAMETER Mount
	Use this switch to mount a SharePoint Content Database
.PARAMETER ContentDBName
	The name of the Content Database as it appears in MS SQL Server
	Required for both MOUNT and DISMOUNT functions
.PARAMETER WebApplication
	The name of the SharePoint Web Application to which this Content Database is associated
	Required for MOUNT function
.PARAMETER DBServer
	The name of the MS SQL Server on which the database is located
	Required for MOUNT function
#> 
 
[CmdletBinding()]
Param
(
	[Parameter(	Position=1,
				ParameterSetName='Dismount',
				HelpMessage="Dismount content database")]
		[switch]$Dismount,
	[Parameter(	Position=1,
				ParameterSetName='Mount',
				HelpMessage="Mount content database")]
		[switch]$Mount,
	[Parameter(	Position=0,
				Mandatory=$true,
				HelpMessage="Name of the content database to mount/dismount"
				)]
		[string]$ContentDBName,
	[Parameter(	Position=2,
				Mandatory=$true,
				ParameterSetName="Mount")]
		[string]$WebApplication,
	[Parameter(	Position=2,
				Mandatory=$true,
				HelpMessage="Name of SQL DB Server",
				ParameterSetName="Mount")]
		[string]$DBServer
)

if ( (Get-PSSnapin -Name Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue) -eq $null )
{
	Write-Output 'Reading in Sharepoint SnapIn'
	Add-PsSnapin Microsoft.Sharepoint.Powershell;
}



function dismountCDB
{
	$SPCDB = Get-SPContentDatabase | where { $_.name -imatch $ContentDBName }
	
	$tmrJobsFile = "$($env:temp)\$($SPCDB.WebApplication).txt"
	Get-SPTimerJob -WebApplication $SPCDB.WebApplication | Select-Object Name | Out-File $tmrJobsFile -Encoding ASCII
	foreach ($tmrJob in (Get-Content $tmrJobsFile)) { Get-SPTimerJob -Identity $tmrjob | Disable-SPTimerJob }
	
	Dismount-SPContentDatabase -Identity $SPCDB.Name -Confirm:$false
}

function mountCDB
{
	$tmrJobsFile = "$($env:temp)\SPWebApplication Name=$($WebApplication).txt"
	switch (test-path  $tmrjobsfile)
	{
		$false
		{
			write-error "$($tmrJobsFile) does not exists.  You will need to restart timer jobs manually"
		}
		
		$true
		{
			Get-SPTimerJob -WebApplication $WebApplication | Select-Object Name | Out-File $tmrJobsFile -Encoding ASCII
			foreach ($tmrJob in (Get-Content $tmrJobsFile)) { Get-SPTimerJob -Identity $tmrjob | Enable-SPTimerJob }
		}
	}
	
	Mount-SPContentDatabase -DatabaseServer $DBServer -WebApplication $WebApplication $ContentDBName -Confirm:$false
}

$badChoice = "You must choose either MOUNT or DISMOUNT"

Switch ($mount -or $dismount)
{
	$true
	{
		Switch ($mount -and $dismount)
		{
			$true
			{
				Write-Error $badChoice
			}
			
			$false
			{
				Switch ($psCmdlet.ParameterSetname)
				{
				"Mount"
					{ mountCDB }
				
				
				"Dismount"
					{ dismountCDB }
				}
			}
		}
	}
	
	$false
	{
		Write-Error $badChoice
	}
}

