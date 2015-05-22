#TFS Powershell script to dump users by groups 

#for all team projects (or a specific team project) in a given collection

#

#Author: Marcelo Silva (marcelo.silva@microsoft.com)

#

#Copyright 2013

#

function global:Get-TFSGroupMembership

{

    Param([string] $CollectionUrlParam,

          [string[]] $Projects, 

          [switch] $ShowEmptyGroups)

 

    $identation = 0

    $max_call_depth = 30

 

    function write-idented([string]$text)

    {

        Write-Output $text.PadLeft($text.Length + (6 * $identation)) 

    }

 

 

    function list_identities ($queryOption,

                              $tfsIdentity,

                              $readIdentityOptions

                              )

    {

        $identities = $idService.ReadIdentities($tfsIdentity, $queryOption, $readIdentityOptions)

        

        $identation++

    

        foreach($id in $identities)

        {

            if ($id.IsContainer)

            {

                if ($id.Members.Count -gt 0) 

                {

                    if ($identation -lt $max_call_depth) #Safe number for max call depth

                    { 

                        write-idented "Group: ", $id.DisplayName

                        list_identities $queryOption $id.Members $readIdentityOptions

                    }

                    else 

                    {

                        Write-Output "Maximum call depth reached. Moving on to next group or project..."

                    }

                }

                else 

                {

                    if ($ShowEmptyGroups)

                    {

                        write-idented "Group: ", $id.DisplayName

                        $identation++;

                        write-idented "-- No users --"

                        $identation--;

                    }

                }

            }

            else

            {

                if ($id.UniqueName)  {

                    write-idented "Member user: ", $id.UniqueName

                }

                else {

                    write-idented "Member user: ", $id.DisplayName

                }

            }  

        }

 

        $identation--

    }

 

 

    # load the required dlls

 

    Add-Type -AssemblyName "Microsoft.TeamFoundation.Client, Version=11.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a",

                           "Microsoft.TeamFoundation.Common, Version=11.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a",

                           "Microsoft.TeamFoundation, Version=11.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

 

    #[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.Client")

    #[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.Common")

    #[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation")

 

    $tfs

    $projectList = @()

 

    if ($CollectionUrlParam)

    {

        #if collection is passed then use it and select all projects

        $tfs = [Microsoft.TeamFoundation.Client.TfsTeamProjectCollectionFactory]::GetTeamProjectCollection($CollectionUrlParam)

 

        $cssService = $tfs.GetService("Microsoft.TeamFoundation.Server.ICommonStructureService3")    

    

        if ($Projects)

        {

            #validate project names

            foreach ($p in $Projects)

            {

                try

                {

                    $projectList += $cssService.GetProjectFromName($p)

                }

                catch

                {

                    Write-Error "Invalid project name: $p"

                    exit

                }

            }        

        }

        else

        {

            $projectList = $cssService.ListAllProjects()

        }

    }

    else

    {

        #if no collection specified, open project picker to select it via gui

        $picker = New-Object Microsoft.TeamFoundation.Client.TeamProjectPicker([Microsoft.TeamFoundation.Client.TeamProjectPickerMode]::MultiProject, $false)

        $dialogResult = $picker.ShowDialog()

        if ($dialogResult -ne "OK")

        {

            exit

        }

 

        $tfs = $picker.SelectedTeamProjectCollection

        $projectList = $picker.SelectedProjects

    }

 

 

    try 

    {

        $tfs.EnsureAuthenticated()

    }

    catch 

    {

        Write-Error "Error occurred trying to connect to project collection: $_ " 

        exit 1

    }

 

    $idService = $tfs.GetService("Microsoft.TeamFoundation.Framework.Client.IIdentityManagementService")

 

    Write-Output ""

    Write-Output "Team project collection: " $CollectionUrlParam

    Write-Output ""

    Write-Output "Membership information: "

 

    $identation++

 

    foreach($teamProject in $projectList)

    {        

        Write-Output ""

        write-idented "Team project: ",$teamProject.Name 

    

        foreach($group in $idService.ListApplicationGroups($teamProject.Name,

                                                           [Microsoft.TeamFoundation.Framework.Common.ReadIdentityOptions]::TrueSid))

        {

            list_identities  ([Microsoft.TeamFoundation.Framework.Common.MembershipQuery]::Direct) $group.Descriptor ([Microsoft.TeamFoundation.Framework.Common.ReadIdentityOptions]::TrueSid)

        } 

    }

 

    $identation = 1

 

    Write-Output ""

    Write-Output "Users that have access to this collection but do not belong to any group:"

    Write-Output ""

 

    $validUsersGroup =  $idService.ReadIdentities([Microsoft.TeamFoundation.Framework.Common.IdentitySearchFactor]::AccountName,

                                                  "Project Collection Valid Users",

                                                  [Microsoft.TeamFoundation.Framework.Common.MembershipQuery]::Expanded,

                                                  [Microsoft.TeamFoundation.Framework.Common.ReadIdentityOptions]::TrueSid)

 

    foreach($member in $validUsersGroup[0][0].Members)

    {

        $user = $idService.ReadIdentity($member, 

                                        [Microsoft.TeamFoundation.Framework.Common.MembershipQuery]::Expanded,

                                        [Microsoft.TeamFoundation.Framework.Common.ReadIdentityOptions]::TrueSid)

 

        if ($user.MemberOf.Count -eq 1 -and -not $user.IsContainer)

        {

            if ($user.UniqueName)  {

                write-idented "User: ", $user.UniqueName

            }

            else  {

                write-idented "User: ", $user.DisplayName

            }

        }

                                                              

    }

}