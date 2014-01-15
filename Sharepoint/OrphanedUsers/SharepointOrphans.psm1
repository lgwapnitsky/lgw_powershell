[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint") | Out-Null

#region Common Functions
. $psScriptRoot\OrphanCommonFunctions.ps1
#endregion

#region Group Commands
. $psScriptRoot\FromGroups.ps1
#endRegion
