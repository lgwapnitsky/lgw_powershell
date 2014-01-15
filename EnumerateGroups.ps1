<#
.SYNOPSIS
Enumerate a local computer/domain group and its subgroups down to the user level
.DESCRIPTION

.PARAMETER ind
Run this cmdlet on an individual computer/domain
.PARAMETER Computer
Computer/Domain name
.PARAMETER Group
Group Name (use quotation marks if it contains spaces or special characters)
.PARAMETER file
Use a CSV file of computer/domain names and groups as the input
.PARAMETER filename
CSV Filename
.EXAMPLE
PS C:\> EnumGroups -ind -Computer MyComputer -Group Administrators
Enumerate the group "Administrators" on the computer named "MyComputer"
.EXAMPLE
PS C:\> EnumGroups -file -filename ManyMachines.csv
Enumerate the groups from the machines/domains listed in ManyMachines.csv
.NOTES
NAME        :  EnumGroups
VERSION     :     
LAST UPDATED:  10/23/2012
AUTHOR      :  PHLYNT\lwapnits
.INPUTS
None
.OUTPUTS
None
#>

Trap {"Error: $_"; Break;}

Function EnumLocalGroup($LocalGroup)
{
    # Invoke the Members method and convert to an array of member objects.
    $Members= @($LocalGroup.psbase.Invoke("Members"))

    ForEach ($Member In $Members)
    {
        $Name = $Member.GetType().InvokeMember("Name", 'GetProperty', $Null, $Member, $Null)
		$D = $Member.GetType().InvokeMember("fullName", 'GetProperty', $null, $Member, $null)
        $Path = $Member.GetType().InvokeMember("ADsPath", 'GetProperty', $Null, $Member, $Null)
        #$Path
        # Check if this member is a group.
        If ($Member.GetType().InvokeMember("Class", 'GetProperty', $Null, $Member, $Null) -eq "group")
        {
            "Group: $Name"
            # Check if this group is local or domain.
            If ($Path -like "*/$strComputer/*")
            {
                # Enumerate members of local group.
                EnumLocalGroup $Member
            }
            Else
            {
                # Enumerate members of domain group.
                EnumDomainGroup $Member $Name $True
            }
        }
        else { "`tUser: $Name`t ($D)" }
    }
}

Function EnumDomainGroup($DomainGroup, $NTName, $blnNT)
{
    If ($blnNT -eq $True)
    {
        # Convert NetBIOS domain name of group to Distinguished Name.
        $objNT.InvokeMember("Set", "InvokeMethod", $Null, $objTrans, (3, "$strNetBIOSDomain$NTName"))
        $DN = $objNT.InvokeMember("Get", "InvokeMethod", $Null, $objTrans, 1)
        $DN = $DN.Replace("/", "\/")
        $Group = [ADSI]"LDAP://$DN"
    }
    Else
    {
        $DN = $DomainGroup.distinguishedName
        $Group = $DomainGroup
    }
    ForEach ($MemberDN In $Group.Member)
    {
        $MemberDN = $MemberDN.Replace("/", "\/")
        $MemberGroup = [ADSI]"LDAP://$MemberDN"
        #$MemberGroup.ADsPath
        # Check if this member is a group.
        If ($MemberGroup.Class -eq "group")
        {
            $MemberGroup.Name
            EnumDomainGroup $MemberGroup $MemberGroup.Name $False
        }
        else { 
            "`tUser: " + $membergroup.samaccountname + " (" + $MemberGroup.DisplayName + ")"
        }
    }
}

Function validFile
{
    Param([string]$filename)
    
    return Test-Path -Path $filename -PathType Leaf
}

Function EnumGroups
{
    Param
    (
        [Parameter(ParameterSetName="individual", Mandatory=$true, Position=1)]
            [switch] $ind,
        [Parameter(ParameterSetName="individual", Mandatory=$true, Position=2)]
            [string] $Computer,
        [Parameter(ParameterSetName="individual", Mandatory=$true, Position=3)]
            [string] $Group,

        [Parameter(ParameterSetName="file", Mandatory=$true, Position=1)]
            [switch] $file,
        [Parameter(ParameterSetName="file", Mandatory=$true, Position=2)]
            [ValidateScript({validFile($_)})]
            [string] $filename
    )

    switch ($PSCmdLet.ParameterSetName)
    {
        "individual"
        {
            EnumGroupsProcess $Computer $Group
        }
        "file"
        {
            $serverGroupList = import-csv -Path $filename
            $serverGroupList | foreach { EnumGroupsProcess $_.Server $_.Group }
        }
    }
}

Function EnumGroupsProcess
{
    Param(
        [Parameter(Mandatory=$true, Position=0)]
            [string]$strComputer,
        [Parameter(Mandatory=$true, Position=1)]
            [string]$strGroup
    )

    # Retrieve Distinguished Name of current domain.
    $Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
    $Root = $Domain.GetDirectoryEntry()
    $Base = ($Root.distinguishedName)

    # Use the NameTranslate object.
    $objTrans = New-Object -comObject "NameTranslate"
    $objNT = $objTrans.GetType()

    # Initialize NameTranslate by locating the Global Catalog.
    $objNT.InvokeMember("Init", "InvokeMethod", $Null, $objTrans, (3, $Null))

    # Retrieve NetBIOS name of the current domain.
    $objNT.InvokeMember("Set", "InvokeMethod", $Null, $objTrans, (1, "$Base"))
    $strNetBIOSDomain = $objNT.InvokeMember("Get", "InvokeMethod", $Null, $objTrans, 3)

    # Specify the computer.
    "Computer: $strComputer"

    # Bind to the group object with the WinNT provider.
    $Group = [ADSI]"WinNT://$strComputer/$strGroup,group"
    "Group: $strGroup"

    EnumLocalGroup $Group
    "------`n`n"

}