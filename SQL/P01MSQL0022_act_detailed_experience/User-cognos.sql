IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'cognos')
DROP USER [cognos]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'cognos')
CREATE USER [cognos] FOR LOGIN [cognos] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'cognos'
GO
