IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\INTERFACE TEAM')
DROP SCHEMA [PHLYNT\INTERFACE TEAM]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\INTERFACE TEAM')
EXEC sys.sp_executesql N'CREATE SCHEMA [PHLYNT\INTERFACE TEAM]'

GO
