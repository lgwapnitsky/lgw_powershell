IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\accbun')
DROP USER [PHLYNT\accbun]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\accbun')
CREATE USER [PHLYNT\accbun] FOR LOGIN [PHLYNT\accbun] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PHLYNT\accbun'
GO
