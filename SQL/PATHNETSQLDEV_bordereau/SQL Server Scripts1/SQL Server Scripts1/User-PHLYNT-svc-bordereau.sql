IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\svc-bordereau')
DROP USER [PHLYNT\svc-bordereau]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\svc-bordereau')
CREATE USER [PHLYNT\svc-bordereau] FOR LOGIN [PHLYNT\svc-bordereau] WITH DEFAULT_SCHEMA=[PHLYNT\svc-bordereau]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PHLYNT\svc-bordereau'
GO
