IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detailed_Exp_Price_Monitor_NPDO]') AND type in (N'U'))
DROP TABLE [dbo].[Detailed_Exp_Price_Monitor_NPDO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detailed_Exp_Price_Monitor_NPDO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detailed_Exp_Price_Monitor_NPDO](
	[policy_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[acct_year] [int] NULL,
	[acct_mm] [int] NULL,
	[subline_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Reporting_group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[experienceproduct] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_AY_Month_Ending] [int] NULL,
	[Fiscal_AY_Year] [int] NULL,
	[acctngyear] [int] NULL,
	[currentwrittenpremium] [decimal](15, 2) NULL,
	[currentearnedpremium] [decimal](15, 2) NULL
) ON [PRIMARY]
END
GO
