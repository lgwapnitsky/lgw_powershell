IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Philadelphia Deployment Administrators')
DROP SCHEMA [Philadelphia Deployment Administrators]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Philadelphia Deployment Administrators')
EXEC sys.sp_executesql N'CREATE SCHEMA [Philadelphia Deployment Administrators]'

GO
