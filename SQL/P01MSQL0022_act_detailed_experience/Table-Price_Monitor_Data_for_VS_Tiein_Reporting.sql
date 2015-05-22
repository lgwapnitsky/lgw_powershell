IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Price_Monitor_Data_for_VS_Tiein_Reporting]') AND type in (N'U'))
DROP TABLE [dbo].[Price_Monitor_Data_for_VS_Tiein_Reporting]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Price_Monitor_Data_for_VS_Tiein_Reporting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Price_Monitor_Data_for_VS_Tiein_Reporting](
	[policy_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Product] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[premium_state] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coverage_group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gen_fil_Error_code] [bigint] NULL,
	[Curr_MIPS_WP] [numeric](38, 2) NULL,
	[Benchmark_Exception_id] [varchar](24) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Benchmark_fil_error_code] [bigint] NULL,
	[Benchmark_NormPrem] [float] NULL,
	[Curr_Exposure] [float] NULL,
	[Renewal_Exception_id] [varchar](21) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renewal_Fil_Error_Code] [bigint] NULL,
	[Prior_MIPS_PolTerm_WP] [float] NULL,
	[Renewal_calc_RateChangePrem_onExpiringTermPrem] [float] NULL,
	[Standard_Exception_id] [varchar](24) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Standard_fil_error_code_curr] [bigint] NULL,
	[Standard_Premium_Curr] [float] NULL
) ON [PRIMARY]
END
GO
