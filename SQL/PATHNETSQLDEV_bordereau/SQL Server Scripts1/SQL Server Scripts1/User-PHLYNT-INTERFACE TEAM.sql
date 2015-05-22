IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\INTERFACE TEAM')
DROP USER [PHLYNT\INTERFACE TEAM]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\INTERFACE TEAM')
CREATE USER [PHLYNT\INTERFACE TEAM] FOR LOGIN [PHLYNT\INTERFACE TEAM]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PHLYNT\INTERFACE TEAM'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'PHLYNT\INTERFACE TEAM'
GO
