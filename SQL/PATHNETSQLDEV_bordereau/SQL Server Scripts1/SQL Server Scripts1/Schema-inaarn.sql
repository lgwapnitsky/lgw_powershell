IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'inaarn')
DROP SCHEMA [inaarn]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'inaarn')
EXEC sys.sp_executesql N'CREATE SCHEMA [inaarn]'

GO
