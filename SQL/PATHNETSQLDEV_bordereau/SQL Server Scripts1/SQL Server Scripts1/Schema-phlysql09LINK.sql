IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'phlysql09LINK')
DROP SCHEMA [phlysql09LINK]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'phlysql09LINK')
EXEC sys.sp_executesql N'CREATE SCHEMA [phlysql09LINK]'

GO
