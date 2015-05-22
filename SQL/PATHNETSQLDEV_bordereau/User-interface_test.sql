IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'interface_test')
DROP USER [interface_test]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'interface_test')
CREATE USER [interface_test] FOR LOGIN [Interface_test] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'interface_test'
GO
