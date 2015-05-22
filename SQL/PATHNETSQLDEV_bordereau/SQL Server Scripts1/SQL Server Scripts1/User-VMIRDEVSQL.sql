IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VMIRDEVSQL')
DROP USER [VMIRDEVSQL]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VMIRDEVSQL')
CREATE USER [VMIRDEVSQL] FOR LOGIN [VMIRDEVSQL] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'VMIRDEVSQL'
GO
