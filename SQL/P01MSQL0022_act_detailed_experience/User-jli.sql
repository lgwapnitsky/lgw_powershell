IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jli')
DROP USER [jli]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jli')
CREATE USER [jli] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'jli'
GO
