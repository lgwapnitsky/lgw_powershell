IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ODSUser')
DROP USER [ODSUser]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ODSUser')
CREATE USER [ODSUser] FOR LOGIN [ODSUser] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'ODSUser'
GO
