function validPath($path)
{
	return !(test-Path -Path $path -PathType leaf)
}

function validFile($path)
{
	return (Test-Path -Path $path -PathType leaf)
}
  

Function test
{	
	[CmdletBinding()]
	param
	(
		[Parameter(Position=1, Mandatory=$true, ValueFromPipeline=$true)]
			[string]$WebAppURL,
		
		[Parameter(Position=2, Mandatory=$true, ValueFromPipeline=$true)]
			[string]$Domain,
			
		[Parameter(Position=3, Mandatory=$false, ValueFromPipeline=$true)]
			[system.array]$Filter,

		[Parameter(Mandatory=$true)]
			[ValidateScript({validPath($_)})]
				[string]$ReportPath
	)
			
	PROCESS 
	{
		$sFilter = "(&(objectCategory=User))"
		$Filter | foreach {
			$sFilter = [regex]::Replace($sFilter,"\)$", "($($_)))")
		}
		
		write-host $sfilter
		
		#$DOM = $(Get-Domain)
		#$DOMroot = $DOM.GetDirectoryEntry()
		
		#$Orphans = FindOrphans
		   
		#Out-Report $($Orphans.Sites) BySite
		#Out-Report $($Orphans.Users) ByUser
	}
}

test -WebAppURL "http://cnn.com" -Domain "corp" -Filter @("mail=*ficoh.com","sAMAccountName=*") -ReportPath "c:\temp\test"