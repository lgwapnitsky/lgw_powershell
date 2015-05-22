IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[coverage_group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[FA_Frost_State] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renewal_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Reporting_Premium_After_Rate_Change_GrossExpense] [float] NULL,
	[Reporting_Premium_Before_Rate_Change_GrossExpense] [float] NULL,
	[Prior_MIPS_PolTerm_WP] [float] NULL,
	[Standard_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Standard_Premium_Curr] [float] NULL,
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
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]') AND name = N'IX_coverage_group')
CREATE NONCLUSTERED INDEX [IX_coverage_group] ON [dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]
(
	[coverage_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]') AND name = N'IX_policynumber')
CREATE NONCLUSTERED INDEX [IX_policynumber] ON [dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]') AND name = N'IX_Productcode')
CREATE NONCLUSTERED INDEX [IX_Productcode] ON [dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]
(
	[Productcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]') AND name = N'IX_statecode')
CREATE NONCLUSTERED INDEX [IX_statecode] ON [dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_February]
(
	[statecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
