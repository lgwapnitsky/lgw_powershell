IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'P01MSQL0022_Linked')
DROP USER [P01MSQL0022_Linked]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'P01MSQL0022_Linked')
CREATE USER [P01MSQL0022_Linked] FOR LOGIN [P01MSQL0022_Linked] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'P01MSQL0022_Linked'
GO
