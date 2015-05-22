IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'webuser')
DROP USER [webuser]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'webuser')
CREATE USER [webuser] FOR LOGIN [webuser] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'webuser'
GO
