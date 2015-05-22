IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'pathnet_reporting')
DROP USER [pathnet_reporting]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'pathnet_reporting')
CREATE USER [pathnet_reporting] FOR LOGIN [pathnet_reporting] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'pathnet_reporting'
GO
