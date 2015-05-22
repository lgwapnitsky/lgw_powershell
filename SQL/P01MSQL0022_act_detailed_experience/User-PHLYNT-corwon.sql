IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\corwon')
DROP USER [PHLYNT\corwon]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PHLYNT\corwon')
CREATE USER [PHLYNT\corwon] FOR LOGIN [PHLYNT\corwon] WITH DEFAULT_SCHEMA=[dbo]
GO
