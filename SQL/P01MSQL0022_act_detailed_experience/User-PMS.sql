IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PMS')
DROP USER [PMS]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PMS')
CREATE USER [PMS] FOR LOGIN [PMS] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PMS'
GO
