IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Imaging Team')
DROP USER [PHLYNT\Imaging Team]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\Imaging Team')
CREATE USER [PHLYNT\Imaging Team] FOR LOGIN [PHLYNT\Imaging Team]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PHLYNT\Imaging Team'
GO
