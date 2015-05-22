IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'interface')
DROP USER [interface]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'interface')
CREATE USER [interface] FOR LOGIN [interface] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'interface'
GO
