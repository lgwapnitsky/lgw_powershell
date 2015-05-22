IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'simasud')
DROP USER [simasud]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'simasud')
CREATE USER [simasud] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'simasud'
GO
