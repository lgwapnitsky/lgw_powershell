IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'CORP\sysbri')
DROP USER [CORP\sysbri]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'CORP\sysbri')
CREATE USER [CORP\sysbri] FOR LOGIN [CORP\sysbri] WITH DEFAULT_SCHEMA=[CORP\sysbri]
GO
