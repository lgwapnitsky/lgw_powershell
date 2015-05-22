IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'phlynt\corsco')
DROP USER [phlynt\corsco]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'phlynt\corsco')
CREATE USER [phlynt\corsco] FOR LOGIN [PHLYNT\corsco] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'phlynt\corsco'
GO
