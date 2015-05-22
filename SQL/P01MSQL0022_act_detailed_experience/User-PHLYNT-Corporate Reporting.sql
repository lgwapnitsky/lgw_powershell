IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Corporate Reporting')
DROP USER [PHLYNT\Corporate Reporting]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Corporate Reporting')
CREATE USER [PHLYNT\Corporate Reporting] FOR LOGIN [PHLYNT\Corporate Reporting]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PHLYNT\Corporate Reporting'
GO
