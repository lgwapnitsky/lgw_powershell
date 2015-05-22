IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PathnetCMMI')
DROP USER [PathnetCMMI]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PathnetCMMI')
CREATE USER [PathnetCMMI] FOR LOGIN [PathnetCMMI] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PathnetCMMI'
GO
