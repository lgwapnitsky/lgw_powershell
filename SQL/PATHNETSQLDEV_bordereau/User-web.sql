IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'web')
DROP USER [web]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'web')
CREATE USER [web] FOR LOGIN [web] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'web'
GO
