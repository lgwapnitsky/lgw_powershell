IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'sgelbwas')
DROP USER [sgelbwas]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'sgelbwas')
CREATE USER [sgelbwas] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'sgelbwas'
GO
