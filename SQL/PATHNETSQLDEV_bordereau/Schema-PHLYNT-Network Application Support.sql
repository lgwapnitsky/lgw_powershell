IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\Network Application Support')
DROP SCHEMA [PHLYNT\Network Application Support]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\Network Application Support')
EXEC sys.sp_executesql N'CREATE SCHEMA [PHLYNT\Network Application Support]'

GO
