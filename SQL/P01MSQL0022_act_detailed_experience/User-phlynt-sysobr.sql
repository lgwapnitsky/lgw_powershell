IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'phlynt\sysobr')
DROP USER [phlynt\sysobr]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'phlynt\sysobr')
CREATE USER [phlynt\sysobr] FOR LOGIN [PHLYNT\sysobr] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'phlynt\sysobr'
GO
