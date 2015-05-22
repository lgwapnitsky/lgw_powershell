IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Philadelphia Web Administrators')
DROP USER [PHLYNT\Philadelphia Web Administrators]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Philadelphia Web Administrators')
CREATE USER [PHLYNT\Philadelphia Web Administrators] FOR LOGIN [PHLYNT\Philadelphia Web Administrators]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PHLYNT\Philadelphia Web Administrators'
GO
