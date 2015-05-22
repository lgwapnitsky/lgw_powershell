IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\interface')
DROP SCHEMA [PHLYNT\interface]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\interface')
EXEC sys.sp_executesql N'CREATE SCHEMA [PHLYNT\interface]'

GO
