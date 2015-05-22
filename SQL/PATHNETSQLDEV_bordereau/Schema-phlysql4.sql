IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'phlysql4')
DROP SCHEMA [phlysql4]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'phlysql4')
EXEC sys.sp_executesql N'CREATE SCHEMA [phlysql4]'

GO
