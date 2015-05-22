IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PhlyReloaded')
DROP USER [PhlyReloaded]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PhlyReloaded')
CREATE USER [PhlyReloaded] FOR LOGIN [PhlyReloaded] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PhlyReloaded'
GO
