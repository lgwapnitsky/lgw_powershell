IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'CORP\sysbri')
DROP SCHEMA [CORP\sysbri]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'CORP\sysbri')
EXEC sys.sp_executesql N'CREATE SCHEMA [CORP\sysbri]'

GO
