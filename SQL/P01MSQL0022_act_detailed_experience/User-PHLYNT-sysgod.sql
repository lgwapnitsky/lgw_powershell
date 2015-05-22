IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\sysgod')
DROP USER [PHLYNT\sysgod]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\sysgod')
CREATE USER [PHLYNT\sysgod] FOR LOGIN [PHLYNT\sysgod] WITH DEFAULT_SCHEMA=[PHLYNT\sysgod]
GO
