<# 
.SYNOPSIS 
    A summary of what this script does 
    In this case, this script documents the auto-help text in PSH CTP 3 
    Appears in all basic, -detailed, -full, -examples 
.DESCRIPTION 
    A more in depth description of the script 
    Should give script developer more things to talk about 
    Hopefully this can help the community too 
    Becomes: "DETAILED DESCRIPTION" 
    Appears in basic, -full and -detailed 
.NOTES 
    Additional Notes, eg 
    File Name  : Get-AutoHelp.ps1 
    Author     : Thomas Lee - tfl@psp.co.uk 
    Appears in -full  
.LINK 
    Adapted from 
    http://import-powershell.blogspot.com/2012/03/excel-part-1.html
    http://import-powershell.blogspot.com/2012/04/excel-part-2-import-excel.html
.EXAMPLE 
    The first example - just text documentation 
    You should provide a way of calling the script, plus expected output 
    Appears in -detailed and -full 
.EXAMPLE 
    The second example - more text documentation 
    This would be an example calling the script differently. You can have lots 
    and lots, and lots of examples if this is useful. 
    Appears in -detailed and -full 
.INPUTTYPE 
   Documentary text, eg: 
   Input type  [Universal.SolarSystem.Planetary.CommonSense] 
   Appears in -full 
.RETURNVALUE 
   Documentary Text, eg: 
   Output type  [Universal.SolarSystem.Planetary.Wisdom] 
   Appears in -full 
.COMPONENT 
   Not sure how to specify or use 
   Does not appear in basic, -full, or -detailed 
   Should appear in -component 
.ROLE  
   Not sure How to specify or use 
   Does not appear in basic, -full, or -detailed 
   Should appear with -role 
.FUNCTIONALITY 
   Not sure How to specify or use 
   Does not appear in basic, -full, or -detailed 
   Should appear with -functionality 
.PARAMETER foo 
   The .Parameter area in the script is used to derive the contents of the PARAMETERS in Get-Help output which  
   documents the parameters in the param block. The section takes a value (in this case foo, 
   the name of the first actual parameter), and only appears if there is parameter of that name in the 
   params block. Having a section for a parameter that does not exist generate no extra output of this section 
   Appears in -det, -full (with more info than in -det) and -Parameter (need to specify the parameter name) 
.PARAMETER bar 
   Example of a parameter definition for a parameter that does not exist. 
   Does not appear at all. 
#> 
 

#Load the Excel Assembly, Locally or from GAC
try {
    Add-Type -ASSEMBLY "Microsoft.Office.Interop.Excel"  | out-null
}
catch {
#If the assembly can't be found this will load the most recent version in the GAC
    [Reflection.Assembly]::LoadWithPartialname("Microsoft.Office.Interop.Excel") | out-null
}

Function Open-ExcelApplication {
Param([switch] $Visible,[switch] $HideAlerts) 
    $app = New-Object Microsoft.Office.Interop.Excel.ApplicationClass
    $app.Visible  = $Visible
    $app.DisplayAlerts = -not $HideAlerts
    return $app
}

function New-ExcelWorkBook {
	Param
	(
		[parameter(ValueFromPipeline=$true)] $ExcelApplication,
		[switch] $Visible
	)

	process
	{
		if ($ExcelApplication -eq $null ) {  
		$ExcelApplication  = Open-ExcelApplication -Visible:$Visible 
		} 
		$WorkBook = $ExcelApplication.WorkBooks.Add()
		return $WorkBook
	}
}

function Get-ExcelWorkBook {
	Param
	(
		[parameter(Mandatory=$true,ValueFromPipeline=$true)] $inputObject,
		[switch] $Visible,
		[switch] $readonly
	)

	[Microsoft.Office.Interop.Excel.ApplicationClass] $app = $null 
	if ($inputObject -is [Microsoft.Office.Interop.Excel.ApplicationClass]) {
	  $app = $inputObject
	  $WorkBook = $app.ActiveWorkbook
	} 
	else {
		$app = Open-ExcelApplication -Visible:$Visible  
		try {
			if ($inputObject.Contains("\\") -or $inputObject.Contains("//")) 
			{
				$WorkBook = $app.Workbooks.Open($inputObject,$true,[System.Boolean]$readonly)
			} 
			else 
			{
				$WorkBook = $app.Workbooks.Open((Resolve-path $inputObject),$true,[System.Boolean]$readonly)
			}
		} 
		catch 
		{
			$WorkBook = $app.Workbooks.Open((Resolve-path $inputObject),$true,[System.Boolean]$readonly)
		}
	} 
	#todo: Add Switch to toggle Full Rebuild (this does an update data)
	$app.CalculateFullRebuild() 
	return $WorkBook
}

Function Close-ExcelApplication {
Param([parameter(Mandatory=$true,ValueFromPipeline=$true)] $inputObject)
if ($inputObject -is [Microsoft.Office.Interop.Excel.ApplicationClass]) {
$app = $inputObject  
} else {
$app = $inputObject.Application
Release-Ref $inputObject
}
$app.ActiveWorkBook.Close($false) | Out-Null
$app.Quit() | Out-Null
Release-Ref $app
}

function Release-Ref ($ref) {
([System.Runtime.InteropServices.Marshal]::ReleaseComObject([System.__ComObject]$ref) -gt 0)  | Out-Null
[System.GC]::Collect() | Out-Null
[System.GC]::WaitForPendingFinalizers() | Out-Null
}

function Get-ExcelWorkSheet {
Param([parameter(Mandatory=$true,ValueFromPipeline=$true)] $inputObject
  ,$SheetName
  ,[switch] $Visible
  ,[switch] $readonly)
  if ($inputObject -is [Microsoft.Office.Interop.Excel.Workbook]) {
    $WorkBook = $inputObject
  } else {
    $WorkBook = Get-ExcelWorkBook $inputObject -Visible:$Visible -readonly:$readonly
  }
  if (($SheetName -eq $null) -or $SheetName -eq 0) {
    $WorkBook.ActiveSheet
  } else {
    $WorkBook.WorkSheets.item($SheetName)
  } 
}

Function Import-Row {
   Param($Row,[hashtable] $Headers =@{},$ColumnStart = 1,$ColumnCount = $Row.Value2.Count)
   $output = @{}
   for ($index=$ColumnStart;$index -le $ColumnCount;$index ++)
   {
        If ($Headers.Count -eq 0)
        {
            $Key = $Index
        } Else {
            $Key = $Headers[$index]
        }
        $output.Add($Key,$row.Cells.Item(1,$index).Text)
   }
   return $output
}

Function Import-Excel {
	Param
	(
		[parameter(Mandatory=$true,ValueFromPipeline=$true)] $inputObject,
		[Object] $SheetName,
		[switch] $Visible,
		[switch] $readonly,
		[int] $startOnLineNumber =1,
		[switch] $closeExcel,
		[switch] $asHashTable,
		[hashtable] $FieldNames =@{}
	)

	#Check what the input is. 
	if ($inputObject -is [Microsoft.Office.Interop.Excel.range]) 
	{ 
		$range = $inputObject
	} 
	elseif ($inputObject -isnot [Microsoft.Office.Interop.Excel.Worksheet]) 
	{ 
		$WorkSheet = Get-ExcelWorkSheet $inputObject -SheetName $SheetName -Visible:$Visible -readonly:$readonly  
		$range = $WorkSheet.UsedRange
	} 
	else 
	{
		$WorkSheet = $inputObject
		$range = $WorkSheet.UsedRange
	}

	# populate the Header 
	if ($FieldNames.Count -eq 0)
	{
		$FieldNames = Import-Row $range.Rows.Item($startOnLineNumber++)  
	}

    for ($RowIndex=$startOnLineNumber;$RowIndex -le $range.Rows.Count;$RowIndex++) 
    {
		$output = Import-Row $range.Rows.Item($RowIndex) -Headers $FieldNames
		$output."E-mail" = $((get-qaduser $($output."User Name")).email)
		if ($asHashtAble) 
		{
			#Write-Output $output
			
			#write-host $range
			
		} 
		else 
		{
			New-Object PSObject -property $output | out-null
			$range.rows.item($RowIndex, 5).text = $output."E-mail"
			#$range.CalculateFullRebuild()
		}
	}  

	# If we opened Excel, we should close Excel.
	if ($closeExcel)
	{   
		$WorkSheet.Activate() | Out-Null
		Close-ExcelApplication $WorkSheet
	} 
}


Import-Excel "$PWD\ComputerNames.xlsx" -Visible -closeExcel
