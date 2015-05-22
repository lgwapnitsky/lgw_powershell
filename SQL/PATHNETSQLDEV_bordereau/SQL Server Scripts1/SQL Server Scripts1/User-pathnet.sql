IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'pathnet')
DROP USER [pathnet]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'pathnet')
CREATE USER [pathnet] FOR LOGIN [pathnet] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'pathnet'
GO
