IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Acct_Producttype]') AND type in (N'U'))
DROP TABLE [dbo].[sb_Acct_Producttype]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Acct_Producttype]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_Acct_Producttype](
	[accountnumber] [int] NULL,
	[effectiveYear] [int] NULL,
	[Account_ProductType_P] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_S] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_U] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_O] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_A] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_L] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
