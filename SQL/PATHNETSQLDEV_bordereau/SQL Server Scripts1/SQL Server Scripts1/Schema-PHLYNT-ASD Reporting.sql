IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\ASD Reporting')
DROP SCHEMA [PHLYNT\ASD Reporting]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\ASD Reporting')
EXEC sys.sp_executesql N'CREATE SCHEMA [PHLYNT\ASD Reporting]'

GO
