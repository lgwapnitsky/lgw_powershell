IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'forbordereau')
DROP SCHEMA [forbordereau]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'forbordereau')
EXEC sys.sp_executesql N'CREATE SCHEMA [forbordereau]'

GO
