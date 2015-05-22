IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_15_premium_summary_May]') AND type in (N'U'))
DROP TABLE [dbo].[ALL_POLICIES_15_premium_summary_May]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_15_premium_summary_May]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ALL_POLICIES_15_premium_summary_May](
	[accountnumber] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyeffectivedate] [datetime] NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Reporting_group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[experienceproduct] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_AY_Month_Ending] [int] NULL,
	[Fiscal_AY_Year] [int] NULL,
	[acctngyear] [int] NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[currentwrittenpremium] [decimal](15, 2) NULL,
	[currentearnedpremium] [decimal](15, 2) NULL,
	[Policy_count_All_Cov_Combined_WP] [float] NULL,
	[Policy_count_Reporting_Coverage_WP] [float] NULL,
	[Policy_count_Coverage_Group_WP] [float] NULL,
	[Policy_count_All_Cov_Combined] [float] NULL,
	[Policy_count_Reporting_Coverage] [float] NULL,
	[Policy_count_Coverage_Group] [float] NULL,
	[Policy_count_All_Cov_Combined_Total] [float] NULL,
	[Policy_count_Reporting_Coverage_Total] [float] NULL,
	[Policy_count_Coverage_Group_Total] [float] NULL,
	[Loss_Evaluation_Month] [int] NULL,
	[Loss_Evaluation_Year] [int] NULL,
	[Loss_ALAE_Cap] [float] NULL,
	[COL_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_Breach_of_Contract_Count_rptd] [decimal](15, 2) NULL,
	[COL_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_Discrimination_Count] [decimal](15, 2) NULL,
	[COL_Discrimination_Count_rptd] [decimal](15, 2) NULL,
	[COL_Discrimination_Loss] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Count] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Count_rptd] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Loss] [decimal](15, 2) NULL,
	[COL_Harrassment_Count] [decimal](15, 2) NULL,
	[COL_Harrassment_Count_rptd] [decimal](15, 2) NULL,
	[COL_Harrassment_Loss] [decimal](15, 2) NULL,
	[COL_DO_Other_Count] [decimal](15, 2) NULL,
	[COL_DO_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_DO_Other_Loss] [decimal](15, 2) NULL,
	[COL_EPL_Other_Count] [decimal](15, 2) NULL,
	[COL_EPL_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_EPL_Other_Loss] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Count] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Loss] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Count] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Loss] [decimal](15, 2) NULL,
	[COL_Internet_Other_Count] [decimal](15, 2) NULL,
	[COL_Internet_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_Internet_Other_Loss] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Count] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Loss] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Contract_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Fiduciary_Liability_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2) NULL,
	[COL_AE_Financial_Advisor_Count] [decimal](15, 2) NULL,
	[COL_AE_Financial_Advisor_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Financial_Advisor_Loss] [decimal](15, 2) NULL,
	[COL_AE_Misconduct_Count] [decimal](15, 2) NULL,
	[COL_AE_Misconduct_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Misconduct_Loss] [decimal](15, 2) NULL,
	[COL_AE_Wills_Estate_Count] [decimal](15, 2) NULL,
	[COL_AE_Wills_Estate_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Wills_Estate_Loss] [decimal](15, 2) NULL,
	[COL_AE_Corporate_Count] [decimal](15, 2) NULL,
	[COL_AE_Corporate_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Corporate_Loss] [decimal](15, 2) NULL,
	[COL_AE_Tax_Liability_Count] [decimal](15, 2) NULL,
	[COL_AE_Tax_Liability_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Tax_Liability_Loss] [decimal](15, 2) NULL,
	[COL_AE_Violation_GAAP_Count] [decimal](15, 2) NULL,
	[COL_AE_Violation_GAAP_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Violation_GAAP_Loss] [decimal](15, 2) NULL,
	[COL_AE_All_Other_Count] [decimal](15, 2) NULL,
	[COL_AE_All_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_All_Other_Loss] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Contract_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Fiduciary_Liability_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2) NULL,
	[COL_CL_Financial_Advisor_Count] [decimal](15, 2) NULL,
	[COL_CL_Financial_Advisor_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Financial_Advisor_Loss] [decimal](15, 2) NULL,
	[COL_CL_Misconduct_Count] [decimal](15, 2) NULL,
	[COL_CL_Misconduct_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Misconduct_Loss] [decimal](15, 2) NULL,
	[COL_CL_Wills_Estate_Count] [decimal](15, 2) NULL,
	[COL_CL_Wills_Estate_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Wills_Estate_Loss] [decimal](15, 2) NULL,
	[COL_CL_Corporate_Count] [decimal](15, 2) NULL,
	[COL_CL_Corporate_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Corporate_Loss] [decimal](15, 2) NULL,
	[COL_CL_Tax_Liability_Count] [decimal](15, 2) NULL,
	[COL_CL_Tax_Liability_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Tax_Liability_Loss] [decimal](15, 2) NULL,
	[COL_CL_Violation_GAAP_Count] [decimal](15, 2) NULL,
	[COL_CL_Violation_GAAP_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Violation_GAAP_Loss] [decimal](15, 2) NULL,
	[COL_CL_Negligent_Training_Count] [decimal](15, 2) NULL,
	[COL_CL_Negligent_Training_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Negligent_Training_Loss] [decimal](15, 2) NULL,
	[COL_CL_Electronic_Data_Damage_Count] [decimal](15, 2) NULL,
	[COL_CL_Electronic_Data_Damage_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Electronic_Data_Damage_Loss] [decimal](15, 2) NULL,
	[COL_CL_All_Other_Count] [decimal](15, 2) NULL,
	[COL_CL_All_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_All_Other_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Malpractice_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Malpractice_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Malpractice_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Fraud_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Fraud_Breach_of_Contract_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Fraud_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Injury_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Injury_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Injury_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Other_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Other_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_PropertyDamage_Count] [decimal](15, 2) NULL,
	[COL_GLBI_PropertyDamage_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_PropertyDamage_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Theft_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Theft_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Theft_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_SlanderDefamtion_Count] [decimal](15, 2) NULL,
	[COL_GLBI_SlanderDefamtion_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_SlanderDefamtion_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Discrim_WrongfulTermination_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Discrim_WrongfulTermination_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Discrim_WrongfulTermination_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Fire_Lightning_Explosion_Count] [decimal](15, 2) NULL,
	[COL_Prop_Fire_Lightning_Explosion_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Fire_Lightning_Explosion_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Theft_Van_Count] [decimal](15, 2) NULL,
	[COL_Prop_Theft_Van_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Theft_Van_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Water_Sprinkler_Count] [decimal](15, 2) NULL,
	[COL_Prop_Water_Sprinkler_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Water_Sprinkler_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Water_Other_Count] [decimal](15, 2) NULL,
	[COL_Prop_Water_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Water_Other_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Wind_Hail_Count] [decimal](15, 2) NULL,
	[COL_Prop_Wind_Hail_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Wind_Hail_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Other_Count] [decimal](15, 2) NULL,
	[COL_Prop_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Other_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_AllOther_Count] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_AllOther_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_AllOther_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_PropDam_Count] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_PropDam_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_PropDam_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Coll_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Coll_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Coll_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Glass_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Glass_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Glass_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Other_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Other_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Theft_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Theft_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Theft_Loss] [decimal](15, 2) NULL,
	[Case_Loss] [decimal](15, 2) NULL,
	[Case_ALAE] [decimal](15, 2) NULL,
	[Paid_Loss] [decimal](15, 2) NULL,
	[Paid_ALAE] [decimal](15, 2) NULL,
	[Sal_Subro] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS_NonCat] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS_CatOnly] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat] [decimal](15, 2) NULL,
	[Ult_LDF_Capped_Inc_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](15, 2) NULL,
	[Reported_Claims] [decimal](15, 2) NULL,
	[Open_Claims] [decimal](15, 2) NULL,
	[Closed_With_Pay_Claims] [decimal](15, 2) NULL,
	[Closed_Without_Pay_Claims] [decimal](15, 2) NULL,
	[Incurred_Claims] [decimal](15, 2) NULL,
	[Experience_Product_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Case_Loss_PremSt] [decimal](15, 2) NULL,
	[Case_ALAE_PremSt] [decimal](15, 2) NULL,
	[Paid_Loss_PremSt] [decimal](15, 2) NULL,
	[Paid_ALAE_PremSt] [decimal](15, 2) NULL,
	[Sal_Subro_PremSt] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_CatOnly_PremSt] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS_NonCat_PremSt] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS_CatOnly_PremSt] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_NonCat_PremSt] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS_PremSt] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_PremSt] [decimal](15, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS_PremSt] [decimal](15, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat_PremSt] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_PremSt] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly_PremSt] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat_PremSt] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_PremSt] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly_PremSt] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat_PremSt] [decimal](15, 2) NULL,
	[Ult_LDF_Capped_Inc_Loss_ALAE_with_SS_PremSt] [decimal](15, 2) NULL,
	[Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat_PremSt] [decimal](15, 2) NULL,
	[Reported_Claims_PremSt] [decimal](15, 2) NULL,
	[Open_Claims_PremSt] [decimal](15, 2) NULL,
	[Closed_With_Pay_Claims_PremSt] [decimal](15, 2) NULL,
	[Closed_Without_Pay_Claims_PremSt] [decimal](15, 2) NULL,
	[Incurred_Claims_PremSt] [decimal](15, 2) NULL,
	[Commission_pct] [float] NULL,
	[Commission_dollars] [float] NULL,
	[Commission_Premiums] [decimal](15, 2) NULL,
	[FA_Number_of_Buildings] [float] NULL,
	[FA_Number_of_Locations] [float] NULL,
	[TIV] [float] NULL,
	[Term_Factor] [float] NULL,
	[Written_Premium_Policy_FireAllied] [float] NULL,
	[Earned_Buildings] [float] NULL,
	[Earned_Locations] [float] NULL,
	[Earned_TIV] [float] NULL,
	[Earned_Buildings_Total] [float] NULL,
	[Earned_Locations_Total] [float] NULL,
	[Earned_TIV_Total] [float] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_15_premium_summary_May]') AND name = N'IX_accountnumber')
CREATE NONCLUSTERED INDEX [IX_accountnumber] ON [dbo].[ALL_POLICIES_15_premium_summary_May]
(
	[accountnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_15_premium_summary_May]') AND name = N'IX_Coverage_Form')
CREATE NONCLUSTERED INDEX [IX_Coverage_Form] ON [dbo].[ALL_POLICIES_15_premium_summary_May]
(
	[Coverage_Form] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_15_premium_summary_May]') AND name = N'IX_Coverage_Group')
CREATE NONCLUSTERED INDEX [IX_Coverage_Group] ON [dbo].[ALL_POLICIES_15_premium_summary_May]
(
	[Coverage_Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_15_premium_summary_May]') AND name = N'IX_Coverage_Reporting_group')
CREATE NONCLUSTERED INDEX [IX_Coverage_Reporting_group] ON [dbo].[ALL_POLICIES_15_premium_summary_May]
(
	[Coverage_Reporting_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_15_premium_summary_May]') AND name = N'IX_Fiscal_AY_Year')
CREATE NONCLUSTERED INDEX [IX_Fiscal_AY_Year] ON [dbo].[ALL_POLICIES_15_premium_summary_May]
(
	[Fiscal_AY_Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_15_premium_summary_May]') AND name = N'IX_policynumber')
CREATE NONCLUSTERED INDEX [IX_policynumber] ON [dbo].[ALL_POLICIES_15_premium_summary_May]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_15_premium_summary_May]') AND name = N'IX_productcode')
CREATE NONCLUSTERED INDEX [IX_productcode] ON [dbo].[ALL_POLICIES_15_premium_summary_May]
(
	[productcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_15_premium_summary_May]') AND name = N'IX_statecode')
CREATE NONCLUSTERED INDEX [IX_statecode] ON [dbo].[ALL_POLICIES_15_premium_summary_May]
(
	[statecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
