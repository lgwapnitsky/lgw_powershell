IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\data warehousing')
DROP USER [PHLYNT\data warehousing]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\data warehousing')
CREATE USER [PHLYNT\data warehousing] FOR LOGIN [PHLYNT\data warehousing]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PHLYNT\data warehousing'
GO
