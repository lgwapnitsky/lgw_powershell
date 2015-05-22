IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\IT Security')
DROP USER [PHLYNT\IT Security]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\IT Security')
CREATE USER [PHLYNT\IT Security] FOR LOGIN [PHLYNT\IT Security]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PHLYNT\IT Security'
GO
