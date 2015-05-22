IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\svc-bordereau')
DROP SCHEMA [PHLYNT\svc-bordereau]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\svc-bordereau')
EXEC sys.sp_executesql N'CREATE SCHEMA [PHLYNT\svc-bordereau]'

GO
