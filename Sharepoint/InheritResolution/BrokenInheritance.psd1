@{
# Assemblies that must be loaded prior to importing this module
#RequiredAssemblies = @('Microsoft.Sharepoint')

# Script module or binary module file associated with this manifest
ModuleToProcess = 'BrokenInheritance.psm1'

# Version number of this module.
ModuleVersion = '1.0'

# ID used to uniquely identify this module
GUID = '3ACDA0DB-30CE-4405-8D0B-3A0F541183EC'

# Author of this module
Author = 'LGW'

# Company or vendor of this module
CompanyName = ''

# Copyright statement for this module
Copyright = '2013'

# Description of the functionality provided by this module
Description = ''

FunctionsToExport = 'Get-SPSite', 'Get-SPWeb', 'Get-SPWebApplication', 
					'validPath', 'validFile', 'Get-Domain'
}