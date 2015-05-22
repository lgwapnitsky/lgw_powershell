IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kng')
DROP USER [kng]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kng')
CREATE USER [kng] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'kng'
GO
