IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'phlyact')
DROP USER [phlyact]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'phlyact')
CREATE USER [phlyact] FOR LOGIN [phlyact] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'phlyact'
GO
