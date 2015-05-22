IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Philadelphia Deployment Administrators')
DROP USER [Philadelphia Deployment Administrators]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Philadelphia Deployment Administrators')
CREATE USER [Philadelphia Deployment Administrators] FOR LOGIN [PHLYNT\Philadelphia Deployment Administrators]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'Philadelphia Deployment Administrators'
GO
