IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\sysgod')
DROP SCHEMA [PHLYNT\sysgod]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\sysgod')
EXEC sys.sp_executesql N'CREATE SCHEMA [PHLYNT\sysgod]'

GO
