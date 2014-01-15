$gpgpath = "c:\program files (x86)\GNU\GnuPG\gpg2.exe"

$recipient = "larry.wapnitsky@tmnas.com"

$files = Get-ChildItem -Path "c:\Users\lwapnits\Documents\testing"

foreach ($file in $files)
{
	# look for files that begin with 's', end with '.pdf', case-insensitive
	if ($file.Name -match [regex]("(?i)^s.*\.pdf$")) 
	{
		# get the proper path of the matched filename
		$infile = Resolve-Path $file.get_FullName()
		# replace 'pdf' extension with 'gpg' for output file
		$outfile = $infile -replace ([regex]("(?i)pdf$"), "gpg")

		$gpgargs = '--encrypt --recipient "{0}" --output "{1}" "{2}"' `
			-f  $recipient, $outfile, $infile
		
		# encrypt using gpg
		$p = Start-Process $gpgpath -ArgumentList $gpgargs -Wait -NoNewWindow -PassThru -Debug
		$p.HasExited
		$p.ExitCode
	}
}