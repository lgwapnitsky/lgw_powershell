IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PathRating')
DROP USER [PathRating]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PathRating')
CREATE USER [PathRating] FOR LOGIN [PathRating] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PathRating'
GO
