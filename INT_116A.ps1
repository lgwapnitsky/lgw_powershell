Add-PSSnapin MVPSI.JAMS -ErrorAction SilentlyContinue

$SMTP = "smtp.tmnas.com"
$Recipients = "SAPINT116A@tmnas.com"
#$Recipients = "Larry.Wapnitsky@tmnas.com"
$FromAddress = "JAMS@tmnas.com"

$FTPCred = Get-JAMSCredential "FTP Account - Bank of Tokyo - INT116A" -Server NORRJAMSP001

try
{
	$connectionTries = 1
	while ($connectionTries -le 3)
	{
		try
		{
			#write-host "Connection Try # $connectionTries"
			$SFTP = Connect-JSFTP sftp.tradinggrid.gxs.com -JAMSCredential $FTPCred -Timeout 300 -Binary -Verbose -AcceptKey
		}
		catch {}
		finally { $connectionTries++ }
		
		if ($SFTP) {break}
	}
	
	Set-JFSLocation "/././POLLABLE"
	
	$AvailableFiles = @(Get-JFSChildItem "%BTMU*")
	
	switch($AvailableFiles.count)
	{
		0
		{
			$Subject = "Bank of Tokyo BAI (INT116A) Download"
			$Body = "There are no Bank of Tokyo BAI files (INT116A) available for download."
			
			break;
		}
		
		default
		{
			try
			{
				$AvailableFiles | Foreach {
					Receive-JFSItem -InputObject $_ -Destination "\\p00cifs0369\share\apps\FTP\TMM\SAP\Prod\INT_116A\IN\" -verbose
				}
				
				$Subject = "Bank of Tokyo BAI Files (INT116A) Download was Successful"
				$Body = "Bank of Tokyo BAI (INT116A) downloaded successfully"
			}
			
			catch
			{
				$FTE = $true
				throw "file transfer error"
			}
		}
	}
}

catch
{
	$Subject = "Bank of Tokyo BAI (INT116A) Download Error"
	$Body = "There was an error acquiring the Bank of Tokyo BAI (INT116A) files."
}

finally
{
	Send-MailMessage -To $Recipients -Subject $Subject -SMTPServer $SMTP -From $FromAddress -body "$Body"

	#write-host "Disonnecting"
	Disconnect-JFS -Verbose
	
	if ($AvailableFiles.Count -eq 0)
	{
		#write-host "breaking"
		$thisEntry = Get-JamsEntry $Host.PrivateData.JAMSEntry
		$setupEntry = Get-JAMSEntry $thisEntry.MasterEntry
		Stop-JAMSEntry $setupEntry -Severity Success -confirm:$false -verbose
	}
	else
	{
		if (!($FTE))
		{
			$AvailableFiles | Foreach { Remove-JFSItem $_ -Confirm:$false -verbose }
		}
	}
}