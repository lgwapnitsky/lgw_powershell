[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint") 
 
 
#Get All Web Applications
Function global:Get-SPWebApplication($WebAppURL)
{  
 if($WebAppURL -eq $null)  #Get All Web Applications
    {
  $Farm = [Microsoft.SharePoint.Administration.SPFarm]::Local
  $websvcs = $farm.Services | where -FilterScript {$_.GetType() -eq [Microsoft.SharePoint.Administration.SPWebService]}
  $WebApps = @()
  foreach ($websvc in $websvcs) {
      foreach ($WebApp in $websvc.WebApplications) {
          $WebApps = $WebApps + $WebApp
      }
  }
  return $WebApps
 }
 else #Get Web Application for given URL
 {
  return [Microsoft.SharePoint.Administration.SPWebApplication]::Lookup($WebAppURL)
 }
}
 
Function global:Get-SPSite($url)
{
 if($url -ne $null)
    {
    return New-Object Microsoft.SharePoint.SPSite($url)
 }
}
  
Function global:Get-SPWeb($url)
{
  $site= Get-SPSite($url)
        if($site -ne $null)
            {
               $web=$site.OpenWeb();
       
            }
    return $web
}
 
Function GetUserAccessReport ($WebAppURL, $SearchUser)
{
 #Get All Site Collections of the WebApp
 $SiteCollections = Get-SPWebApplication($WebAppURL)
 $SiteCollections= $SiteCollections.Sites
  
 
 #Write CSV- TAB Separated File) Header
 "URL `t Site/List `t Title `t PermissionType `t Permissions" | out-file UserAccessReport_$($SearchUser.Replace('\','_')).csv
 
  #Check Whether the Search Users is a Farm Administrator
        $ca= [Microsoft.SharePoint.Administration.SPAdministrationWebApplication]::Local.Sites[0].RootWeb
        #Get Central Admin
    $AdminSite = Get-SPWeb($ca.URL)
    $AdminGroupName = $AdminSite.AssociatedOwnerGroup.Name
 
    $FarmAdminGroup = $AdminSite.SiteGroups[$AdminGroupName]
 
     foreach ($user in $FarmAdminGroup.users)
      {
       if($user.LoginName -eq $SearchUser)
    {
     "$($AdminSite.URL) `t Farm `t $($AdminSite.Title)`t Farm Administrator `t Farm Administrator" | Out-File UserAccessReport_$($SearchUser.Replace('\','_')).csv -Append
    }      
      }
 
 #Check Web Application Policies
 $WebApp= Get-SPWebApplication $WebAppURL
 
 foreach ($Policy in $WebApp.Policies) 
   {
   #Check if the search users is member of the group
  if($Policy.UserName -eq $SearchUser)
     {
    #Write-Host $Policy.UserName
     $PolicyRoles=@()
     foreach($Role in $Policy.PolicyRoleBindings)
    {
     $PolicyRoles+= $Role.Name +";"
    }
    #Write-Host "Permissions: " $PolicyRoles
     
    "$($WebAppURL) `t Web Application `t $($AdminSite.Title)`t  Web Application Policy `t $($PolicyRoles)" | Out-File UserAccessReport_$($SearchUser.Replace('\','_')).csv -Append
   }
   }
   
   
  #Loop through all site collections
   foreach($Site in $SiteCollections) 
    {
   #Check Whether the Search User is a Site Collection Administrator
   foreach($SiteCollAdmin in $Site.RootWeb.SiteAdministrators)
       {
    if($SiteCollAdmin.LoginName -eq $SearchUser)
   {
    "$($Site.RootWeb.Url) `t Site `t $($Site.RootWeb.Title)`t Site Collection Administrator `t Site Collection Administrator" | Out-File UserAccessReport_$($SearchUser.Replace('\','_')).csv -Append
   }      
  }
   
    #Loop throuh all Sub Sites
       foreach($Web in $Site.AllWebs) 
       { 
   if($Web.HasUniqueRoleAssignments -eq $True)
             {
          #Get all the users granted permissions to the list
             foreach($WebRoleAssignment in $Web.RoleAssignments ) 
                 { 
                   #Is it a User Account?
      if($WebRoleAssignment.Member.userlogin)    
       {
          #Is the current user is the user we search for?
          if($WebRoleAssignment.Member.LoginName -eq $SearchUser)
         {
          #Write-Host  $SearchUser has direct permissions to site $Web.Url
          #Get the Permissions assigned to user
           $WebUserPermissions=@()
             foreach ($RoleDefinition  in $WebRoleAssignment.RoleDefinitionBindings)
             {
                             $WebUserPermissions += $RoleDefinition.Name +";"
                            }
          #write-host "with these permissions: " $WebUserPermissions
          #Send the Data to Log file
          "$($Web.Url) `t Site `t $($Web.Title)`t Direct Permission `t $($WebUserPermissions)" | Out-File UserAccessReport_$($SearchUser.Replace('\','_')).csv -Append
         }
       }
     #Its a SharePoint Group, So search inside the group and check if the user is member of that group
     else  
      {
                        foreach($user in $WebRoleAssignment.member.users)
                            {
           #Check if the search users is member of the group
         if($user.LoginName -eq $SearchUser)
          {
           #Write-Host  "$SearchUser is Member of " $WebRoleAssignment.Member.Name "Group"
            #Get the Group's Permissions on site
         $WebGroupPermissions=@()
            foreach ($RoleDefinition  in $WebRoleAssignment.RoleDefinitionBindings)
            {
                           $WebGroupPermissions += $RoleDefinition.Name +";"
                           }
         #write-host "Group has these permissions: " $WebGroupPermissions
          
         #Send the Data to Log file
         "$($Web.Url) `t Site `t $($Web.Title)`t Member of $($WebRoleAssignment.Member.Name) Group `t $($WebGroupPermissions)" | Out-File UserAccessReport_$($SearchUser.Replace('\','_')).csv -Append
        }
       }
      }
                    }
    }
     
    #********  Check Lists with Unique Permissions ********/
              foreach($List in $Web.lists)
              {
                  if($List.HasUniqueRoleAssignments -eq $True -and ($List.Hidden -eq $false))
                  {
                     #Get all the users granted permissions to the list
                foreach($ListRoleAssignment in $List.RoleAssignments ) 
                    { 
                      #Is it a User Account?
         if($ListRoleAssignment.Member.userlogin)    
          {
             #Is the current user is the user we search for?
             if($ListRoleAssignment.Member.LoginName -eq $SearchUser)
            {
             #Write-Host  $SearchUser has direct permissions to List ($List.ParentWeb.Url)/($List.RootFolder.Url)
             #Get the Permissions assigned to user
              $ListUserPermissions=@()
                foreach ($RoleDefinition  in $ListRoleAssignment.RoleDefinitionBindings)
                {
                                $ListUserPermissions += $RoleDefinition.Name +";"
                               }
             #write-host "with these permissions: " $ListUserPermissions
              
             #Send the Data to Log file
             "$($List.ParentWeb.Url)/$($List.RootFolder.Url) `t List `t $($List.Title)`t Direct Permissions `t $($ListUserPermissions)" | Out-File UserAccessReport_$($SearchUser.Replace('\','_')).csv -Append
            }
          }
          #Its a SharePoint Group, So search inside the group and check if the user is member of that group
         else  
          {
                             foreach($user in $ListRoleAssignment.member.users)
                                 {
              if($user.LoginName -eq $SearchUser)
               {
                #Write-Host  "$SearchUser is Member of " $ListRoleAssignment.Member.Name "Group"
                 #Get the Group's Permissions on site
              $ListGroupPermissions=@()
                 foreach ($RoleDefinition  in $ListRoleAssignment.RoleDefinitionBindings)
                 {
                                $ListGroupPermissions += $RoleDefinition.Name +";"
                                }
              #write-host "Group has these permissions: " $ListGroupPermissions
               
              #Send the Data to Log file
              "$($Web.Url) `t Site `t $($List.Title)`t Member of $($ListRoleAssignment.Member.Name) Group `t $($ListGroupPermissions)" | Out-File UserAccessReport_$($SearchUser.Replace('\','_'))_$($SearchUser.Replace('\','_')).csv -Append
             }
            }
         } 
                       }
                }
              }
    } 
   }
      
  }
 
 
#Call the function to Check User Access
#GetUserAccessReport "http://SharePoint.company.com" "Domain\User"

#$users = @('corp\mweber', 'corp\dlauterbach', 'corp\ckozlowski', 'corp\yross', 'corp\bkrukar', 'corp\jrennhac', 'corp\jvanalte')
#$users | foreach { GetUserAccessReport "http://insidephly.phly.net" $_ }

GetUserAccessReport "http://epm.phly.net/project" "corp\u00dept_tmnas_internal audit"