IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AE_premium_freq]') AND type in (N'U'))
DROP TABLE [dbo].[AE_premium_freq]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AE_premium_freq]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AE_premium_freq](
	[accountnumber] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyeffectivedate] [datetime] NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Reporting_group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[experienceproduct] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[acctngyear] [int] NULL,
	[acctngmonth] [int] NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[currentwrittenpremium] [decimal](15, 2) NULL,
	[currentearnedpremium] [decimal](15, 2) NULL
) ON [PRIMARY]
END
GO
