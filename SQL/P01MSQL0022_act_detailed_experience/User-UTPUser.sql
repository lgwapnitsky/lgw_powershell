IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'UTPUser')
DROP USER [UTPUser]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'UTPUser')
CREATE USER [UTPUser] FOR LOGIN [UTPUser] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'UTPUser'
GO
