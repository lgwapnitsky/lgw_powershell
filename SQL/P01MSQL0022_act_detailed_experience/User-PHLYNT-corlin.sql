IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\corlin')
DROP USER [PHLYNT\corlin]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\corlin')
CREATE USER [PHLYNT\corlin] FOR LOGIN [PHLYNT\corlin] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'PHLYNT\corlin'
GO
