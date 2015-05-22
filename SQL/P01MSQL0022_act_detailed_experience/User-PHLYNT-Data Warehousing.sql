IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Data Warehousing')
DROP USER [PHLYNT\Data Warehousing]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Data Warehousing')
CREATE USER [PHLYNT\Data Warehousing] FOR LOGIN [PHLYNT\Data Warehousing]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PHLYNT\Data Warehousing'
GO
