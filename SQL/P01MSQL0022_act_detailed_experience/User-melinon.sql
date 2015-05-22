IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'melinon')
DROP USER [melinon]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'melinon')
CREATE USER [melinon] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'melinon'
GO
