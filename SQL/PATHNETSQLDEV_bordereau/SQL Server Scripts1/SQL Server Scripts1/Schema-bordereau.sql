IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'bordereau')
DROP SCHEMA [bordereau]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'bordereau')
EXEC sys.sp_executesql N'CREATE SCHEMA [bordereau]'

GO
