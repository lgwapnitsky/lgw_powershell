IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'CORP\corhol')
DROP USER [CORP\corhol]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'CORP\corhol')
CREATE USER [CORP\corhol] FOR LOGIN [CORP\corhol] WITH DEFAULT_SCHEMA=[CORP\corhol]
GO
