Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue
 
$URL = "http://norrspd005:51475" 
$CSVPath = ".\JP_Mailing_Lists.csv"

#Read the CSV file - Map the Columns to Named Header (CSV File doesn't has Column Header)
#$CSVData = Import-CSV -path "C:\Data.csv" -Header("Title", "Description", "Priority", "AssignedTo", "DueDate", "Status")
$CSVData = Import-CSV -path $CSVPath -Header ("Title","First Name","Middle Name","Last Name","Suffix","Company","Department","Job Title","Home City","Home State","Business Mail","Internet Address","Location","Comments")
 
#Get the Web
#$web = Get-SPWeb -identity "http://sharepoint.crescent.com/sites/Marketing/"
$web = Get-SPWeb -identity $URL
 
#Get the Target List
#$list = $web.Lists["Log"]
$list = $web.Lists["contacts test"]

 
$rowCount = 0
#Iterate through each Row in the CSV
foreach ($row in $CSVData)
{
	$rowCount += 1
	$ListItems = $list.Items | Where-Object { ($_.Item("Last Name") -eq $row."Last Name") -and 
												($_.Item("First Name") -eq $row."First Name") -and
												($_.Item("Company") -eq $row.Company)
											}
	if ($ListItems -eq $null)
	{
	   $item = $list.Items.Add();
		
		$item["Salutation"] = $row.Title
		$item["First Name"] = $row."First Name"
		$item["Last Name"] = $row."Last Name"
		$item["Company"] = $row.Company
		$item["Comments"] = $row.Department
		$item["Job Title"] = $row."Job Title"
		$item["City"] = $row."Home City"
		$item["State/Province"] = $row."Home State"
		$item["E-mail Address"] = $row."Internet Address"
		$item["Country/Region"] = $row.Location

		$lastName = $row."Last Name"
	 
	#   #Set the People Picker Field value
	#   $item["Assigned To"] = Get-SPUser -Identity $row.AssignedTo -web "http://sharepoint.crescent.com/sites/Marketing/"
		 
	#   #Set the Date Field value
	#   $item["Due Date"] = Get-Date $row.DueDate
	 
	#   $item["Status"] = $row.Status
	   $item.Update()
	   Write-Progress -id 1 -Activity "Importing from CSV ($CSVPath to $URL)" -Status "$LastName" -PercentComplete (($($rowCount)/$($CSVData.Count))*100)
	}
}

#Read more: http://www.sharepointdiary.com/2013/04/import-from-csv-file-to-sharepoint-list-using-powershell.html#ixzz2piu3S6Ph