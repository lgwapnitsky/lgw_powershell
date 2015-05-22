IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mnam')
DROP USER [mnam]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mnam')
CREATE USER [mnam] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'mnam'
GO
