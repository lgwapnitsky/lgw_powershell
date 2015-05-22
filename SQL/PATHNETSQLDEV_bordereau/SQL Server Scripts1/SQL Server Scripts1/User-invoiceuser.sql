IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'invoiceuser')
DROP USER [invoiceuser]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'invoiceuser')
CREATE USER [invoiceuser] FOR LOGIN [invoiceuser] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'invoiceuser'
GO
