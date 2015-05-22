IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\ssegal')
DROP SCHEMA [PHLYNT\ssegal]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\ssegal')
EXEC sys.sp_executesql N'CREATE SCHEMA [PHLYNT\ssegal]'

GO
