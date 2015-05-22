IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\ssegal')
DROP USER [PHLYNT\ssegal]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\ssegal')
CREATE USER [PHLYNT\ssegal] FOR LOGIN [PHLYNT\ssegal] WITH DEFAULT_SCHEMA=[PHLYNT\ssegal]
GO
