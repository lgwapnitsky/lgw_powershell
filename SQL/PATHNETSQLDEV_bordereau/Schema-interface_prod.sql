IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'interface_prod')
DROP SCHEMA [interface_prod]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'interface_prod')
EXEC sys.sp_executesql N'CREATE SCHEMA [interface_prod]'

GO
