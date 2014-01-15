@{
# Assemblies that must be loaded prior to importing this module
#RequiredAssemblies = @('Microsoft.Sharepoint')

# Script module or binary module file associated with this manifest
ModuleToProcess = 'SharePointOrphans.psm1'

# Version number of this module.
ModuleVersion = '1.0'

# ID used to uniquely identify this module
GUID = '1C56DD00-8C08-4259-BE63-98D77CBD70DF'

# Author of this module
Author = 'LGW'

# Company or vendor of this module
CompanyName = ''

# Copyright statement for this module
Copyright = '2013'

# Description of the functionality provided by this module
Description = ''

FunctionsToExport = 'Get-SPSite', 'Get-SPWeb', 'Get-SPWebApplication', 
					'validPath', 'validFile', 'Get-Domain', 'UserExistsInAd',
					'UserExclusions', 'Loop-Sites', 'Loop-Groups', 'GetGroupUsers',
					'Remove-GroupOrphans'

}