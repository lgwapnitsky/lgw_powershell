IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ldrps')
DROP USER [ldrps]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ldrps')
CREATE USER [ldrps] FOR LOGIN [ldrps] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'ldrps'
GO
