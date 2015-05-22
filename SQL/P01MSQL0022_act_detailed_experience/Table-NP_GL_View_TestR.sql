IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NP_GL_View_TestR]') AND type in (N'U'))
DROP TABLE [dbo].[NP_GL_View_TestR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NP_GL_View_TestR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NP_GL_View_TestR](
	[Fiscal_AY_Year] [int] NULL,
	[Policy_count_Reporting_Coverage] [float] NULL,
	[currentearnedpremium] [decimal](38, 2) NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_NonCat] [decimal](38, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](38, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat] [decimal](38, 2) NULL,
	[Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](38, 2) NULL,
	[Reported_Claims] [decimal](38, 2) NULL,
	[New_Renew_Tail] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COL_GLBI_Malpractice_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Malpractice_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Fraud_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Fraud_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Injury_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Injury_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Other_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Other_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_PropertyDamage_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_PropertyDamage_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Theft_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Theft_Count] [decimal](15, 2) NULL,
	[COL_GLBI_SlanderDefamtion_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_SlanderDefamtion_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Discrim_WrongfulTermination_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Discrim_WrongfulTermination_Count] [decimal](15, 2) NULL,
	[Renewals_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renew_New_Auto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[First_Policy_Year] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County_Pop_Density_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price_Monitor_Standard_Cov_Grp_Monitored_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Deductible] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Occurrence_Limit] [float] NULL,
	[Written_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Reporting_group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GLDX_Indicator] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Class_NP_HCFac_AvgRate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Class_NP_Outpatient_AvgRate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Class_NP_Office_AvgRate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_OCC_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Aggregate_Limit] [float] NULL,
	[Latest_Product] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Companycode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Dom_Region_in_State] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Class_NP_YMCA_YWCA_AvgRate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Class_NP_Boarding_Rooming_Houses_AvgRate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Class_NP_Shelter_Mission_HalfwayHouse_AvgRate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
