IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\Internal Audit ACL')
DROP SCHEMA [PHLYNT\Internal Audit ACL]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'PHLYNT\Internal Audit ACL')
EXEC sys.sp_executesql N'CREATE SCHEMA [PHLYNT\Internal Audit ACL]'

GO
