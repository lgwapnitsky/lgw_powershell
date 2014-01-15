function get-localadmin
{
    param ($strComputer)

    $result = @()
    $result += $strComputer

    try 
    {
        $group = [ADSI]"WinNT://$strComputer/administrators"

        $members = $group.members()
        $members | foreach { $result += $_.GetType().InvokeMember("ADSPath","GetProperty", $null, $_, $null) }
        

        return $result -join "`n"
    }
    
    catch
    {
        Write-Host "Can't check machine $strComputer"
    }
}


get-localadmin phlywbp055