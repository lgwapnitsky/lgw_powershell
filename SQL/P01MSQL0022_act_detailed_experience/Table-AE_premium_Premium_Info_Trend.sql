IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AE_premium_Premium_Info_Trend]') AND type in (N'U'))
DROP TABLE [dbo].[AE_premium_Premium_Info_Trend]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AE_premium_Premium_Info_Trend]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AE_premium_Premium_Info_Trend](
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[acctngyear] [int] NULL,
	[acctngmonth] [int] NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[currentearnedpremium] [decimal](38, 2) NULL
) ON [PRIMARY]
END
GO
