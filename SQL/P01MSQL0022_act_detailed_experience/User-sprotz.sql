IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'sprotz')
DROP USER [sprotz]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'sprotz')
CREATE USER [sprotz] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'sprotz'
GO
