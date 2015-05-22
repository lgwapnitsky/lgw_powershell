IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mmeatheo')
DROP USER [mmeatheo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mmeatheo')
CREATE USER [mmeatheo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'mmeatheo'
GO
