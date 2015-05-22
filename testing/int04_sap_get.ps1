Add-PSSnapin MVPSI.JAMS -ErrorAction SilentlyContinue

#
# Get the FTP credentials
#
$FTPCred = Get-JAMSCredential "FTP Account - TMM SAP Test" -Server NORRJAMST001

#
# Connect to the FTP location
#
$SFTP = Connect-JSFTP 172.25.165.105 -JAMSCredential $FTPCred -ServerType UNIX -Binary -Verbose -AcceptKey

Set-JFSLocation "/OTHERS/"

# Determining the number of files that exist for transfer
#
$file1 = @(Get-JFSChildItem "payment_notif_t0004908cr3o_*.txt")

$totalfilecount = $file1.count 
 
If ($totalfilecount -eq 0)

{
#
# Send an email

$SMTP = "smtp.tmnas.com"
$Subject = "TEST-INT04_Outbound_Payment_data_to_Concur_Process"
$Body = "There is no Concur outbound Payment (INT04) file available for upload to Concur."
$Recipients = "Carl.gaines@tmnas.com", "kerry.bretzius@tmnas.com"
$FromAddress = "JAMS@tmnas.com"
$ToAddress = $Recipients
Send-MailMessage -To $ToAddress -Subject "$Subject" -SMTPServer $SMTP -From $FromAddress -body "$Body"

#
# Disconnect from the FTP session
# 
Disconnect-JFS -verbose
 
#
# Cancel the Setup and its remaining Jobs
#
$thisEntry = Get-JAMSEntry $Host.PrivateData.JAMSEntry
$setupEntry = Get-JAMSEntry $thisEntry.MasterEntry
Stop-JAMSEntry $setupEntry -Severity Success -confirm:$false -verbose
}
 
else
{
#
# Download the files
# 
If ($file1.Count -gt 0)
{
Receive-JFSItem -InputObject $file1 -Destination "\\p00cifs0369\share\apps\FTP\TMNA\SAP\Test\INT04\IN\" -verbose
}

#
# Remove the files that have been downloaded
#
Remove-JFSItem $file1 -Confirm:$false -verbose
#Remove-JFSItem $file2 -Confirm:$false -verbose
 
#
# Disconnect from the FTP session
# 
Disconnect-JFS -verbose


$SMTP = "smtp.tmnas.com"
$Subject = "TEST-INT04_Outbound_Payment_data_to_Concur_Process"
$Body = "The Concur outbound file for (INT04) has been successfully downloaded."
$Recipients = "Carl.gaines@tmnas.com", "kerry.bretzius@tmnas.com"
$FromAddress = "JAMS@tmnas.com"
$ToAddress = $Recipients
Send-MailMessage -To $ToAddress -Subject "$Subject" -SMTPServer $SMTP -From $FromAddress -body "$Body"
}
