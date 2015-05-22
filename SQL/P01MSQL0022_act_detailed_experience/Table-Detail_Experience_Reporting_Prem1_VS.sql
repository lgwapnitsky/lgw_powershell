IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detail_Experience_Reporting_Prem1_VS]') AND type in (N'U'))
DROP TABLE [dbo].[Detail_Experience_Reporting_Prem1_VS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detail_Experience_Reporting_Prem1_VS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detail_Experience_Reporting_Prem1_VS](
	[account_number] [float] NOT NULL,
	[policy_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policy_effective_date] [datetime] NOT NULL,
	[policy_effective_month] [int] NOT NULL,
	[premium_state] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subline_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Reporting_group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exp_Product] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_AY_Month_Ending] [float] NULL,
	[Fiscal_AY_Year] [float] NULL,
	[acctngyear] [float] NULL,
	[currentwrittenpremium] [decimal](15, 2) NULL,
	[currentearnedpremium] [decimal](15, 2) NULL,
	[Prior_Claims] [float] NULL,
	[Prior_GL_Claim_Counts] [float] NULL,
	[Prior_Professional_Claim_Counts] [float] NULL,
	[Prior_Fire_Allied_Claim_Counts] [float] NULL,
	[Prior_Auto_Liability_Claim_Counts] [float] NULL,
	[Secondary_producer] [float] NULL,
	[Primary_producer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_producer_type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Commission_Pct] [float] NULL,
	[Secondary_Commission_Pct] [float] NULL,
	[Renewal_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Renewal_calc_RateChangePrem_onExpiringTermPrem] [float] NULL,
	[Prior_MIPS_PolTerm_WP] [float] NULL,
	[Standard_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Standard_Premium_Curr] [float] NULL,
	[Benchmark_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Benchmark_NormPrem] [float] NULL,
	[Benchmark_Curr_Exposure] [float] NULL
) ON [PRIMARY]
END
GO
