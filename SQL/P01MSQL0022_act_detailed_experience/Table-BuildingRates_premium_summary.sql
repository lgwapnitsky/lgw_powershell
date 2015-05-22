IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuildingRates_premium_summary]') AND type in (N'U'))
DROP TABLE [dbo].[BuildingRates_premium_summary]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuildingRates_premium_summary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BuildingRates_premium_summary](
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
	[Policy_count_All_Cov_Combined] [float] NULL,
	[Policy_count_Reporting_Coverage] [float] NULL,
	[Policy_count_Coverage_Group] [float] NULL,
	[Loss_Evaluation_Month] [int] NULL,
	[Loss_Evaluation_Year] [int] NULL,
	[Loss_ALAE_Cap] [float] NULL,
	[COL_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_Discrimination_Count] [decimal](15, 2) NULL,
	[COL_Discrimination_Loss] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Count] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Loss] [decimal](15, 2) NULL,
	[COL_Harrassment_Count] [decimal](15, 2) NULL,
	[COL_Harrassment_Loss] [decimal](15, 2) NULL,
	[COL_DO_Other_Count] [decimal](15, 2) NULL,
	[COL_DO_Other_Loss] [decimal](15, 2) NULL,
	[COL_EPL_Other_Count] [decimal](15, 2) NULL,
	[COL_EPL_Other_Loss] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Count] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Loss] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Count] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Loss] [decimal](15, 2) NULL,
	[COL_Internet_Other_Count] [decimal](15, 2) NULL,
	[COL_Internet_Other_Loss] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Count] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Loss] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2) NULL,
	[COL_AE_Financial_Advisor_Count] [decimal](15, 2) NULL,
	[COL_AE_Financial_Advisor_Loss] [decimal](15, 2) NULL,
	[COL_AE_Misconduct_Count] [decimal](15, 2) NULL,
	[COL_AE_Misconduct_Loss] [decimal](15, 2) NULL,
	[COL_AE_Wills_Estate_Count] [decimal](15, 2) NULL,
	[COL_AE_Wills_Estate_Loss] [decimal](15, 2) NULL,
	[COL_AE_Corporate_Count] [decimal](15, 2) NULL,
	[COL_AE_Corporate_Loss] [decimal](15, 2) NULL,
	[COL_AE_Tax_Liability_Count] [decimal](15, 2) NULL,
	[COL_AE_Tax_Liability_Loss] [decimal](15, 2) NULL,
	[COL_AE_Violation_GAAP_Count] [decimal](15, 2) NULL,
	[COL_AE_Violation_GAAP_Loss] [decimal](15, 2) NULL,
	[COL_AE_All_Other_Count] [decimal](15, 2) NULL,
	[COL_AE_All_Other_Loss] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2) NULL,
	[COL_CL_Financial_Advisor_Count] [decimal](15, 2) NULL,
	[COL_CL_Financial_Advisor_Loss] [decimal](15, 2) NULL,
	[COL_CL_Misconduct_Count] [decimal](15, 2) NULL,
	[COL_CL_Misconduct_Loss] [decimal](15, 2) NULL,
	[COL_CL_Wills_Estate_Count] [decimal](15, 2) NULL,
	[COL_CL_Wills_Estate_Loss] [decimal](15, 2) NULL,
	[COL_CL_Corporate_Count] [decimal](15, 2) NULL,
	[COL_CL_Corporate_Loss] [decimal](15, 2) NULL,
	[COL_CL_Tax_Liability_Count] [decimal](15, 2) NULL,
	[COL_CL_Tax_Liability_Loss] [decimal](15, 2) NULL,
	[COL_CL_Violation_GAAP_Count] [decimal](15, 2) NULL,
	[COL_CL_Violation_GAAP_Loss] [decimal](15, 2) NULL,
	[COL_CL_Negligent_Training_Count] [decimal](15, 2) NULL,
	[COL_CL_Negligent_Training_Loss] [decimal](15, 2) NULL,
	[COL_CL_Electronic_Data_Damage_Count] [decimal](15, 2) NULL,
	[COL_CL_Electronic_Data_Damage_Loss] [decimal](15, 2) NULL,
	[COL_CL_All_Other_Count] [decimal](15, 2) NULL,
	[COL_CL_All_Other_Loss] [decimal](15, 2) NULL,
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
	[COL_Prop_Fire_Lightning_Explosion_Count] [decimal](15, 2) NULL,
	[COL_Prop_Fire_Lightning_Explosion_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Theft_Van_Count] [decimal](15, 2) NULL,
	[COL_Prop_Theft_Van_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Water_Sprinkler_Count] [decimal](15, 2) NULL,
	[COL_Prop_Water_Sprinkler_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Water_Other_Count] [decimal](15, 2) NULL,
	[COL_Prop_Water_Other_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Wind_Hail_Count] [decimal](15, 2) NULL,
	[COL_Prop_Wind_Hail_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Other_Count] [decimal](15, 2) NULL,
	[COL_Prop_Other_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_AllOther_Count] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_AllOther_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_PropDam_Count] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_PropDam_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Coll_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Coll_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Glass_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Glass_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Other_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Other_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Theft_Count] [decimal](15, 2) NULL,
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
	[Experience_Product_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Renewals] [int] NULL,
	[Renewals_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriterPID] [int] NULL,
	[Companycode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyid] [int] NULL,
	[billplancode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[product_group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_monoline] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policy_effective_year] [int] NULL,
	[policy_effective_month] [int] NULL,
	[policyexpirationdate] [datetime] NULL,
	[canceldate] [datetime] NULL,
	[reinstatementdate] [datetime] NULL,
	[Prior_Policy_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Tail] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branchcode] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renew_New_Auto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[First_Policy_Year_Temp] [datetime] NULL,
	[Term_factor] [float] NULL,
	[Latest_PY] [varchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[First_Policy_Year] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[written_premium_policy] [float] NULL,
	[underwriter] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillplanshortDesc] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Office] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Region] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zipcode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NAICS] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Program_Code] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Business_Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Business_Desc] [char](72) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County] [nvarchar](511) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County_Pop_Density] [float] NULL,
	[program] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County_Pop_Density_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_Elite] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_Elite_YN] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_Elite] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_Elite_YN] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Number_of_Locations] [int] NULL,
	[FA_Number_of_Buildings] [int] NULL,
	[FA_Building_Exposure] [float] NULL,
	[FA_Contents_Exposure] [float] NULL,
	[FA_Business_Interuption_Exposure] [float] NULL,
	[FA_Extra_Expense_Exposure] [float] NULL,
	[TIV] [float] NULL,
	[FA_Building_Prem] [float] NULL,
	[FA_Contents_Prem] [float] NULL,
	[FA_Deductible] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[constr_Code_1_Exposure] [float] NULL,
	[constr_Code_2_Exposure] [float] NULL,
	[constr_Code_3_Exposure] [float] NULL,
	[constr_Code_4_Exposure] [float] NULL,
	[constr_Code_5_Exposure] [float] NULL,
	[constr_Code_6_Exposure] [float] NULL,
	[constr_Code_7_Exposure] [float] NULL,
	[constr_Code_8_Exposure] [float] NULL,
	[constr_Code_9_Exposure] [float] NULL,
	[constr_Code_10_Exposure] [float] NULL,
	[protect_class_1_Exposure] [float] NULL,
	[protect_class_2_Exposure] [float] NULL,
	[protect_class_3_Exposure] [float] NULL,
	[protect_class_4_Exposure] [float] NULL,
	[protect_class_5_Exposure] [float] NULL,
	[protect_class_6_Exposure] [float] NULL,
	[protect_class_7_Exposure] [float] NULL,
	[protect_class_8_Exposure] [float] NULL,
	[protect_class_9_Exposure] [float] NULL,
	[protect_class_10_Exposure] [float] NULL,
	[Population_Density_Zone_Metro_Exposure] [float] NULL,
	[Population_Density_Zone_Urban_Exposure] [float] NULL,
	[Population_Density_Zone_Suburban_Exposure] [float] NULL,
	[Population_Density_Zone_SemiSuburban_Exposure] [float] NULL,
	[Population_Density_Zone_Rural_Exposure] [float] NULL,
	[FA_Frost_State] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Earned_Buildings] [float] NULL,
	[Earned_Locations] [float] NULL,
	[Earned_TIV] [float] NULL,
	[TIV_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Avg_TIV_per_BLD] [float] NULL,
	[FA_Avg_Bld_Rate] [float] NULL,
	[FA_Avg_Cts_Rate] [float] NULL,
	[FA_Deductible_to_TIV] [float] NULL,
	[FA_Deductible_to_TIV_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Avg_Bld_Rate_rd2] [float] NULL,
	[FA_Avg_Bld_Rate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Avg_Cts_Rate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Avg_TIV_per_BLD_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Constr_code_Tot_Exposure] [float] NULL,
	[FA_Constr_Code_Max_Exposure] [float] NULL,
	[FA_Constr_Code_Dominant] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Constr_Code_Dominant_Percent] [float] NULL,
	[FA_Constr_Code_Dominant_NAME] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_protect_class_Tot_Exposure] [float] NULL,
	[FA_protect_class_Max_Exposure] [float] NULL,
	[FA_protect_class_Dominant] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_protect_class_Dominant_Percent] [float] NULL,
	[FA_Population_Density_Zone_Tot_Exposure] [float] NULL,
	[FA_Population_Density_Zone_Max_Exposure] [float] NULL,
	[FA_Population_Density_Zone_Dominant] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Population_Density_Zone_Dominant_Percent] [float] NULL,
	[Hail_A_Exposure] [float] NULL,
	[Hail_B_Exposure] [float] NULL,
	[Hail_C_Exposure] [float] NULL,
	[Hail_D_Exposure] [float] NULL,
	[Hail_E_Exposure] [float] NULL,
	[Hail_F_Exposure] [float] NULL,
	[Hail_G_Exposure] [float] NULL,
	[Hail_H_Exposure] [float] NULL,
	[FA_Hail_Tot_Exposure] [float] NULL,
	[FA_Hail_Max_Exposure] [float] NULL,
	[FA_Hail_Dominant] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Hail_Dominant_Percent] [float] NULL
) ON [PRIMARY]
END
GO
