IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_latest]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_latest]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_latest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_latest](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[coverage_group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[FA_Frost_State] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renewal_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Renewal_calc_RateChangePrem_onExpiringTermPrem] [float] NULL,
	[Prior_MIPS_PolTerm_WP] [float] NULL,
	[Standard_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Standard_Premium_Curr] [float] NULL,
	[Benchmark_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Benchmark_NormPrem] [float] NULL,
	[Benchmark_Curr_Exposure] [float] NULL,
	[Price_Monitor_Standard_CovGrp_GL_Monitored] [float] NULL,
	[Price_Monitor_Standard_Portion_of_CovGrp_GL_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Portion_of_All_Cov_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Changes_of_All_Cov_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Portion_of_Cov_Grp_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Changes_of_Cov_Grp_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Portion_of_CovGrp_St_Class_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored] [float] NULL,
	[Price_Monitor_Standard_Portion_of_All_Cov_Monitored] [float] NULL,
	[Price_Monitor_Standard_Changes_of_All_Cov_Monitored] [float] NULL,
	[Price_Monitor_Standard_Portion_of_Cov_Grp_Monitored] [float] NULL,
	[Price_Monitor_Standard_Cov_Grp_Monitored] [float] NULL,
	[Price_Monitor_Benchmark_Rate] [float] NULL,
	[Price_Monitor_Benchmark_CW_for_Class] [float] NULL,
	[Price_Monitor_Standard_CovGrp_GL_Monitored_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price_Monitor_Standard_Cov_Grp_Monitored_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price_Monitor_Benchmark_Rate_to_CW_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Territory_Dominant] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Territory_Dominant_Percent] [float] NULL,
	[GL_Dom_Terr_Description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Dom_Region_in_State] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
