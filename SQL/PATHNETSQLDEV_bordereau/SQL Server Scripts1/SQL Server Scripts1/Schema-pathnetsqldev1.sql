IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'pathnetsqldev1')
DROP SCHEMA [pathnetsqldev1]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'pathnetsqldev1')
EXEC sys.sp_executesql N'CREATE SCHEMA [pathnetsqldev1]'

GO
