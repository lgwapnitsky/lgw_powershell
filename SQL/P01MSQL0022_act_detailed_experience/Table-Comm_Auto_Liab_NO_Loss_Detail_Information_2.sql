IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comm_Auto_Liab_NO_Loss_Detail_Information_2]') AND type in (N'U'))
DROP TABLE [dbo].[Comm_Auto_Liab_NO_Loss_Detail_Information_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comm_Auto_Liab_NO_Loss_Detail_Information_2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Comm_Auto_Liab_NO_Loss_Detail_Information_2](
	[Accountnumber] [int] NULL,
	[PolicyNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Experienceproduct] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accident_Year] [int] NULL,
	[Fiscal_AY_Month_Ending] [float] NULL,
	[Fiscal_AY_Year] [float] NULL,
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
	[Closed_Without_Pay_Claims] [decimal](15, 2) NULL
) ON [PRIMARY]
END
GO
