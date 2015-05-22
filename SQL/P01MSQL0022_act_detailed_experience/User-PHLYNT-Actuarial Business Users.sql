IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Actuarial Business Users')
DROP USER [PHLYNT\Actuarial Business Users]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Actuarial Business Users')
CREATE USER [PHLYNT\Actuarial Business Users] FOR LOGIN [PHLYNT\Actuarial Business Users]
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'PHLYNT\Actuarial Business Users'
GO
