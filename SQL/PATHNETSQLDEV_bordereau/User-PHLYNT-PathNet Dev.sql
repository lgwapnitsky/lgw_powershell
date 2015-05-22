IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\PathNet Dev')
DROP USER [PHLYNT\PathNet Dev]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\PathNet Dev')
CREATE USER [PHLYNT\PathNet Dev] FOR LOGIN [PHLYNT\PathNet Dev]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PHLYNT\PathNet Dev'
GO
