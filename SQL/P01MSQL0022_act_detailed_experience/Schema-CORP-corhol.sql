IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'CORP\corhol')
DROP SCHEMA [CORP\corhol]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'CORP\corhol')
EXEC sys.sp_executesql N'CREATE SCHEMA [CORP\corhol]'

GO
