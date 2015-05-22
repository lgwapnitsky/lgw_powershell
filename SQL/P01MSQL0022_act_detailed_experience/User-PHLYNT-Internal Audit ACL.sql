IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Internal Audit ACL')
DROP USER [PHLYNT\Internal Audit ACL]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Internal Audit ACL')
CREATE USER [PHLYNT\Internal Audit ACL] FOR LOGIN [PHLYNT\Internal Audit ACL]
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'PHLYNT\Internal Audit ACL'
GO
