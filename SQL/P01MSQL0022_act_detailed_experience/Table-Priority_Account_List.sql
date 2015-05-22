IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Priority_Account_List]') AND type in (N'U'))
DROP TABLE [dbo].[Priority_Account_List]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Priority_Account_List]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Priority_Account_List](
	[PriorityEffectiveDate] [datetime] NULL,
	[PriorityExpirationDate] [datetime] NULL,
	[Current_YN] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountNumber] [float] NULL,
	[AccountName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Priority_Account_Level] [float] NULL,
	[Pricing_Priority_Account Comments] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
