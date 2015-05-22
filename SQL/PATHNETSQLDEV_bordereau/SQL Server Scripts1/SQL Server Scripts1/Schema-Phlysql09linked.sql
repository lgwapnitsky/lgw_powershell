IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Phlysql09linked')
DROP SCHEMA [Phlysql09linked]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Phlysql09linked')
EXEC sys.sp_executesql N'CREATE SCHEMA [Phlysql09linked]'

GO
