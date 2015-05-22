IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_2_Losses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_2_Losses]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_2_Losses]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



















CREATE procedure [dbo].[usp_Step_2_Losses] as 
/* *************************************** */
/*  Loss Detail Table  			   */
/* *************************************** */



update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[ALL_POLICIES_12_Detail_Information_1_work]'') AND type in (N''U''))
Drop Table Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work

CREATE TABLE [Act_Detailed_Experience].[dbo].[ALL_POLICIES_12_Detail_Information_1_work](
	[company] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Accountnumber] [int],
	[Policy_Number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Claim_Number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Exp_product] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Product] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Premium_State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Territory] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Coverage_id] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Coverage_Group] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Coverage_Reporting_group] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Coverage_Form] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Accident_Year] [int],
	[Accident_Month] [int],
	[Fiscal_AY_Month_Ending] [float],
	[Fiscal_AY_Year] [float],
	[report_year] [int],
	[report_month] [int],
	[policy_year] [int],
	[policy_month] [int],
	[Loss_Evaluation_Month] [int],
	[Loss_Evaluation_Year] [int],
	[Type_of_Loss] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Type_of_Loss_Desc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Claim_Desc] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS,

	[COL_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_Discrimination_Count] [decimal](15, 2),
	[COL_Discrimination_Count_rptd] [decimal](15, 2),
	[COL_Discrimination_Loss] [decimal](15, 2),

	[COL_Wrongful_Termination_Count] [decimal](15, 2),
	[COL_Wrongful_Termination_Count_rptd] [decimal](15, 2),
	[COL_Wrongful_Termination_Loss] [decimal](15, 2),

	[COL_Harrassment_Count] [decimal](15, 2),
	[COL_Harrassment_Count_rptd] [decimal](15, 2),
	[COL_Harrassment_Loss] [decimal](15, 2),

	[COL_DO_Other_Count] [decimal](15, 2),
	[COL_DO_Other_Count_rptd] [decimal](15, 2),
	[COL_DO_Other_Loss] [decimal](15, 2),

	[COL_EPL_Other_Count] [decimal](15, 2),
	[COL_EPL_Other_Count_rptd] [decimal](15, 2),
	[COL_EPL_Other_Loss] [decimal](15, 2),

	[COL_Fiduciary_Other_Count] [decimal](15, 2),
	[COL_Fiduciary_Other_Count_rptd] [decimal](15, 2),
	[COL_Fiduciary_Other_Loss] [decimal](15, 2),

	[COL_Worplace_Violence_Other_Count] [decimal](15, 2),
	[COL_Worplace_Violence_Other_Count_rptd] [decimal](15, 2),
	[COL_Worplace_Violence_Other_Loss] [decimal](15, 2),

	[COL_Internet_Other_Count] [decimal](15, 2),
	[COL_Internet_Other_Count_rptd] [decimal](15, 2),
	[COL_Internet_Other_Loss] [decimal] (15, 2),

	[COL_SLD_All_Other_Count] [decimal](15, 2),
	[COL_SLD_All_Other_Count_rptd] [decimal](15, 2),
	[COL_SLD_All_Other_Loss] [decimal] (15, 2),

	[COL_AE_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_AE_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_AE_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_AE_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2),
	[COL_AE_Breach_of_Fiduciary_Liability_Count_rptd] [decimal](15, 2),
	[COL_AE_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2),

	[COL_AE_Financial_Advisor_Count] [decimal](15, 2),
	[COL_AE_Financial_Advisor_Count_rptd] [decimal](15, 2),
	[COL_AE_Financial_Advisor_Loss] [decimal](15, 2),

	[COL_AE_Misconduct_Count] [decimal](15, 2),
	[COL_AE_Misconduct_Count_rptd] [decimal](15, 2),
	[COL_AE_Misconduct_Loss] [decimal](15, 2),

	[COL_AE_Wills_Estate_Count] [decimal](15, 2),
	[COL_AE_Wills_Estate_Count_rptd] [decimal](15, 2),
	[COL_AE_Wills_Estate_Loss] [decimal](15, 2),

	[COL_AE_Corporate_Count] [decimal](15, 2),
	[COL_AE_Corporate_Count_rptd] [decimal](15, 2),
	[COL_AE_Corporate_Loss] [decimal](15, 2),

	[COL_AE_Tax_Liability_Count] [decimal](15, 2),
	[COL_AE_Tax_Liability_Count_rptd] [decimal](15, 2),
	[COL_AE_Tax_Liability_Loss] [decimal](15, 2),

	[COL_AE_Violation_GAAP_Count] [decimal](15, 2),
	[COL_AE_Violation_GAAP_Count_rptd] [decimal](15, 2),
	[COL_AE_Violation_GAAP_Loss] [decimal](15, 2),

	[COL_AE_All_Other_Count] [decimal](15, 2),
	[COL_AE_All_Other_Count_rptd] [decimal](15, 2),
	[COL_AE_All_Other_Loss] [decimal](15, 2),

	[COL_CL_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_CL_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_CL_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_CL_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2),
	[COL_CL_Breach_of_Fiduciary_Liability_Count_rptd] [decimal](15, 2),
	[COL_CL_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2),

	[COL_CL_Financial_Advisor_Count] [decimal](15, 2),
	[COL_CL_Financial_Advisor_Count_rptd] [decimal](15, 2),
	[COL_CL_Financial_Advisor_Loss] [decimal](15, 2),

	[COL_CL_Misconduct_Count] [decimal](15, 2),
	[COL_CL_Misconduct_Count_rptd] [decimal](15, 2),
	[COL_CL_Misconduct_Loss] [decimal](15, 2),

	[COL_CL_Wills_Estate_Count] [decimal](15, 2),
	[COL_CL_Wills_Estate_Count_rptd] [decimal](15, 2),
	[COL_CL_Wills_Estate_Loss] [decimal](15, 2),

	[COL_CL_Corporate_Count] [decimal](15, 2),
	[COL_CL_Corporate_Count_rptd] [decimal](15, 2),
	[COL_CL_Corporate_Loss] [decimal](15, 2),

	[COL_CL_Tax_Liability_Count] [decimal](15, 2),
	[COL_CL_Tax_Liability_Count_rptd] [decimal](15, 2),
	[COL_CL_Tax_Liability_Loss] [decimal](15, 2),

	[COL_CL_Violation_GAAP_Count] [decimal](15, 2),
	[COL_CL_Violation_GAAP_Count_rptd] [decimal](15, 2),
	[COL_CL_Violation_GAAP_Loss] [decimal](15, 2),

	[COL_CL_Negligent_Training_Count] [decimal](15, 2),
	[COL_CL_Negligent_Training_Count_rptd] [decimal](15, 2),
	[COL_CL_Negligent_Training_Loss] [decimal](15, 2),

	[COL_CL_Electronic_Data_Damage_Count] [decimal](15, 2),
	[COL_CL_Electronic_Data_Damage_Count_rptd] [decimal](15, 2),
	[COL_CL_Electronic_Data_Damage_Loss] [decimal](15, 2),

	[COL_CL_All_Other_Count] [decimal](15, 2),
	[COL_CL_All_Other_Count_rptd] [decimal](15, 2),
	[COL_CL_All_Other_Loss] [decimal](15, 2),

	[COL_GLBI_Malpractice_Count] [decimal](15, 2),
	[COL_GLBI_Malpractice_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Malpractice_Loss] [decimal](15, 2),

	[COL_GLBI_Fraud_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_GLBI_Fraud_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Fraud_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_GLBI_Injury_Count] [decimal](15, 2),
	[COL_GLBI_Injury_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Injury_Loss] [decimal](15, 2),

	[COL_GLBI_Other_Count] [decimal](15, 2),
	[COL_GLBI_Other_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Other_Loss] [decimal](15, 2),

	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count] [decimal](15, 2),
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Loss] [decimal](15, 2),

	[COL_GLBI_PropertyDamage_Count] [decimal](15, 2),
	[COL_GLBI_PropertyDamage_Count_rptd] [decimal](15, 2),
	[COL_GLBI_PropertyDamage_Loss] [decimal](15, 2),

	[COL_GLBI_Theft_Count] [decimal](15, 2),
	[COL_GLBI_Theft_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Theft_Loss] [decimal](15, 2),

	[COL_GLBI_SlanderDefamtion_Count] [decimal](15, 2),
	[COL_GLBI_SlanderDefamtion_Count_rptd] [decimal](15, 2),
	[COL_GLBI_SlanderDefamtion_Loss] [decimal](15, 2),

	[COL_GLBI_Discrim_WrongfulTermination_Count] [decimal](15, 2), 
	[COL_GLBI_Discrim_WrongfulTermination_Count_rptd] [decimal](15, 2), 
	[COL_GLBI_Discrim_WrongfulTermination_Loss] [decimal](15, 2),

	[COL_Prop_Fire_Lightning_Explosion_Count] [decimal](15, 2),
	[COL_Prop_Fire_Lightning_Explosion_Count_rptd] [decimal](15, 2),
	[COL_Prop_Fire_Lightning_Explosion_Loss] [decimal](15, 2),

	[COL_Prop_Theft_Van_Count] [decimal](15, 2), 
	[COL_Prop_Theft_Van_Count_rptd] [decimal](15, 2), 
	[COL_Prop_Theft_Van_Loss] [decimal](15, 2),

	[COL_Prop_Water_Sprinkler_Count] [decimal](15, 2),
	[COL_Prop_Water_Sprinkler_Count_rptd] [decimal](15, 2),
	[COL_Prop_Water_Sprinkler_Loss] [decimal](15, 2),

	[COL_Prop_Water_Other_Count] [decimal](15, 2),
	[COL_Prop_Water_Other_Count_rptd] [decimal](15, 2),
	[COL_Prop_Water_Other_Loss] [decimal](15, 2),

	[COL_Prop_Wind_Hail_Count] [decimal](15, 2),
	[COL_Prop_Wind_Hail_Count_rptd] [decimal](15, 2),
	[COL_Prop_Wind_Hail_Loss] [decimal](15, 2),

	[COL_Prop_Other_Count] [decimal](15, 2),
	[COL_Prop_Other_Count_rptd] [decimal](15, 2),
	[COL_Prop_Other_Loss] [decimal](15, 2),

	[COL_AUTO_LIAB_AllOther_Count] [decimal](15, 2),
	[COL_AUTO_LIAB_AllOther_Count_rptd] [decimal](15, 2),
	[COL_AUTO_LIAB_AllOther_Loss] [decimal](15, 2),

	[COL_AUTO_LIAB_PropDam_Count] [decimal](15, 2),
	[COL_AUTO_LIAB_PropDam_Count_rptd] [decimal](15, 2),
	[COL_AUTO_LIAB_PropDam_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Coll_Count] [decimal](15, 2), 
	[COL_AUTO_PHYS_Coll_Count_rptd] [decimal](15, 2), 
	[COL_AUTO_PHYS_Coll_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Glass_Count] [decimal](15, 2),
	[COL_AUTO_PHYS_Glass_Count_rptd] [decimal](15, 2),
	[COL_AUTO_PHYS_Glass_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Other_Count] [decimal](15, 2),
	[COL_AUTO_PHYS_Other_Count_rptd] [decimal](15, 2),
	[COL_AUTO_PHYS_Other_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Theft_Count] [decimal](15, 2),
	[COL_AUTO_PHYS_Theft_Count_rptd] [decimal](15, 2),
	[COL_AUTO_PHYS_Theft_Loss] [decimal](15, 2),

	[Case_Loss] [decimal](15, 2),
	[Case_ALAE] [decimal](15, 2),
	[Paid_Loss] [decimal](15, 2),
	[Paid_ALAE] [decimal](15, 2),
	[Sal_Subro] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS_NonCat] [decimal](15, 2),
	[Loss_ALAE_Cap] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS_CatOnly] [decimal](15, 2),
	[Capping_Factor] [decimal](15, 2),
	[Capped_Incurred_Loss_ALAE_with_SS] [decimal](15, 2),
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](15, 2),
	[LDF]  [decimal](15, 3),
	[Capped_LDF]  [decimal](15, 3),
	[Ult_LDF_Incurred_Loss_ALAE_with_SS] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_without_SS] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat] [decimal](15, 2),
	[Ult_LDF_Capped_Inc_Loss_ALAE_with_SS] [decimal](15, 2),
	[Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](15, 2),
	[Reported_Claims] [decimal](15, 2),
	[Open_Claims] [decimal](15, 2),
	[Closed_With_Pay_Claims] [decimal](15, 2),
	[Closed_Without_Pay_Claims] [decimal](15, 2),
	[Incurred_Claims] [decimal](15, 2),
	[Accident_State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Latest_Claim_Trans_Yr_Mm] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Accident_State_has_premium] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Accident_State_for_join] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS,
    [Riskcode] [varchar](25),
    [Risk_Location] [int],
    [Risk_Building] [int],
    [Risk_Vehicle] [varchar](25)
 
) ON [PRIMARY]
--------------------------------------------------------------------------------

--truncate table Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work



Declare @Loss_ALAE_Cap as float
Set @Loss_ALAE_Cap = 250000

Declare @Fiscal_AY_Month_Ending as float
Set @Fiscal_AY_Month_Ending = (select Fiscal_AY_Month_Ending from Detailed_Experience_Parameters)

Declare @Loss_Evaluation_Month as float
Set @Loss_Evaluation_Month = (select Loss_Evaluation_Month from Detailed_Experience_Parameters)		--must match last reporting year from premium

Declare @Loss_Evaluation_Year as float
Set @Loss_Evaluation_Year = (select Loss_Evaluation_Year from Detailed_Experience_Parameters)		--must match last reporting year from premium

insert into Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work
(	company ,
	Accountnumber ,
	Policy_Number ,
	Claim_Number ,
	Exp_product ,
	Product  ,
	Premium_State  ,
	Territory ,
	Coverage_id ,
	Coverage_Group ,
	Coverage_Reporting_group  ,
	Coverage_Form  ,
	Accident_Year ,
	Accident_Month ,
	Fiscal_AY_Month_Ending ,
	Fiscal_AY_Year ,
	report_year ,
	report_month ,
	policy_year ,
	policy_month ,
	Loss_Evaluation_Month ,
	Loss_Evaluation_Year ,
	Type_of_Loss ,
	Type_of_Loss_Desc  ,
	Claim_Desc ,

	COL_Breach_of_Contract_Count,
	COL_Breach_of_Contract_Count_rptd,
	COL_Breach_of_Contract_Loss,

	COL_Discrimination_Count,
	COL_Discrimination_Count_rptd,
	COL_Discrimination_Loss,

	COL_Wrongful_Termination_Count,
	COL_Wrongful_Termination_Count_rptd,
	COL_Wrongful_Termination_Loss,

	COL_Harrassment_Count,
	COL_Harrassment_Count_rptd,
	COL_Harrassment_Loss,

	COL_DO_Other_Count,
	COL_DO_Other_Count_rptd,
	COL_DO_Other_Loss,

	COL_EPL_Other_Count,
	COL_EPL_Other_Count_rptd,
	COL_EPL_Other_Loss,

	COL_Fiduciary_Other_Count,
	COL_Fiduciary_Other_Count_rptd,
	COL_Fiduciary_Other_Loss,

	COL_Worplace_Violence_Other_Count,
	COL_Worplace_Violence_Other_Count_rptd,
	COL_Worplace_Violence_Other_Loss,

	COL_Internet_Other_Count,
	COL_Internet_Other_Count_rptd,
	COL_Internet_Other_Loss,

	COL_SLD_All_Other_Count,
	COL_SLD_All_Other_Count_rptd,
	COL_SLD_All_Other_Loss,

	COL_AE_Breach_of_Contract_Count,
	COL_AE_Breach_of_Contract_Count_rptd,
	COL_AE_Breach_of_Contract_Loss,

	COL_AE_Breach_of_Fiduciary_Liability_Count,
	COL_AE_Breach_of_Fiduciary_Liability_Count_rptd,
	COL_AE_Breach_of_Fiduciary_Liability_Loss,

	COL_AE_Financial_Advisor_Count,
	COL_AE_Financial_Advisor_Count_rptd,
	COL_AE_Financial_Advisor_Loss,

	COL_AE_Misconduct_Count,
	COL_AE_Misconduct_Count_rptd,
	COL_AE_Misconduct_Loss,

	COL_AE_Wills_Estate_Count,
	COL_AE_Wills_Estate_Count_rptd,
	COL_AE_Wills_Estate_Loss,

	COL_AE_Corporate_Count,
	COL_AE_Corporate_Count_rptd,
	COL_AE_Corporate_Loss,

	COL_AE_Tax_Liability_Count,
	COL_AE_Tax_Liability_Count_rptd,
	COL_AE_Tax_Liability_Loss,

	COL_AE_Violation_GAAP_Count,
	COL_AE_Violation_GAAP_Count_rptd,
	COL_AE_Violation_GAAP_Loss,

	COL_AE_All_Other_Count,
	COL_AE_All_Other_Count_rptd,
	COL_AE_All_Other_Loss,

	COL_CL_Breach_of_Contract_Count,
	COL_CL_Breach_of_Contract_Count_rptd,
	COL_CL_Breach_of_Contract_Loss,

	COL_CL_Breach_of_Fiduciary_Liability_Count,
	COL_CL_Breach_of_Fiduciary_Liability_Count_rptd,
	COL_CL_Breach_of_Fiduciary_Liability_Loss,

	COL_CL_Financial_Advisor_Count,
	COL_CL_Financial_Advisor_Count_rptd,
	COL_CL_Financial_Advisor_Loss,

	COL_CL_Misconduct_Count,
	COL_CL_Misconduct_Count_rptd,
	COL_CL_Misconduct_Loss,

	COL_CL_Wills_Estate_Count,
	COL_CL_Wills_Estate_Count_rptd,
	COL_CL_Wills_Estate_Loss,

	COL_CL_Corporate_Count,
	COL_CL_Corporate_Count_rptd,
	COL_CL_Corporate_Loss,

	COL_CL_Tax_Liability_Count,
	COL_CL_Tax_Liability_Count_rptd,
	COL_CL_Tax_Liability_Loss,

	COL_CL_Violation_GAAP_Count,
	COL_CL_Violation_GAAP_Count_rptd,
	COL_CL_Violation_GAAP_Loss,

	COL_CL_Negligent_Training_Count,
	COL_CL_Negligent_Training_Count_rptd,
	COL_CL_Negligent_Training_Loss,

	COL_CL_Electronic_Data_Damage_Count,
	COL_CL_Electronic_Data_Damage_Count_rptd,
	COL_CL_Electronic_Data_Damage_Loss,

	COL_CL_All_Other_Count,
	COL_CL_All_Other_Count_rptd,
	COL_CL_All_Other_Loss,

	COL_GLBI_Malpractice_Count,
	COL_GLBI_Malpractice_Count_rptd,
	COL_GLBI_Malpractice_Loss,

	COL_GLBI_Fraud_Breach_of_Contract_Count,
	COL_GLBI_Fraud_Breach_of_Contract_Count_rptd,
	COL_GLBI_Fraud_Breach_of_Contract_Loss,

	COL_GLBI_Injury_Count,
	COL_GLBI_Injury_Count_rptd,
	COL_GLBI_Injury_Loss,

	COL_GLBI_Other_Count,
	COL_GLBI_Other_Count_rptd,
	COL_GLBI_Other_Loss,

	COL_GLBI_Sexual_Assault_Molest_Abuse_Count,
	COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd,
	COL_GLBI_Sexual_Assault_Molest_Abuse_Loss,

	COL_GLBI_PropertyDamage_Count,
	COL_GLBI_PropertyDamage_Count_rptd,
	COL_GLBI_PropertyDamage_Loss,

	COL_GLBI_Theft_Count,
	COL_GLBI_Theft_Count_rptd,
	COL_GLBI_Theft_Loss,

	COL_GLBI_SlanderDefamtion_Count,
	COL_GLBI_SlanderDefamtion_Count_rptd,
	COL_GLBI_SlanderDefamtion_Loss,

	COL_GLBI_Discrim_WrongfulTermination_Count, 
	COL_GLBI_Discrim_WrongfulTermination_Count_rptd, 
	COL_GLBI_Discrim_WrongfulTermination_Loss,

	COL_Prop_Fire_Lightning_Explosion_Count,
	COL_Prop_Fire_Lightning_Explosion_Count_rptd,
	COL_Prop_Fire_Lightning_Explosion_Loss,

	COL_Prop_Theft_Van_Count, 
	COL_Prop_Theft_Van_Count_rptd, 
	COL_Prop_Theft_Van_Loss,

	COL_Prop_Water_Sprinkler_Count,
	COL_Prop_Water_Sprinkler_Count_rptd,
	COL_Prop_Water_Sprinkler_Loss,

	COL_Prop_Water_Other_Count,
	COL_Prop_Water_Other_Count_rptd,
	COL_Prop_Water_Other_Loss,

	COL_Prop_Wind_Hail_Count,
	COL_Prop_Wind_Hail_Count_rptd,
	COL_Prop_Wind_Hail_Loss,

	COL_Prop_Other_Count,
	COL_Prop_Other_Count_rptd,
	COL_Prop_Other_Loss,

	COL_AUTO_LIAB_AllOther_Count,
	COL_AUTO_LIAB_AllOther_Count_rptd,
	COL_AUTO_LIAB_AllOther_Loss,

	COL_AUTO_LIAB_PropDam_Count,
	COL_AUTO_LIAB_PropDam_Count_rptd,
	COL_AUTO_LIAB_PropDam_Loss,

	COL_AUTO_PHYS_Coll_Count, 
	COL_AUTO_PHYS_Coll_Count_rptd, 
	COL_AUTO_PHYS_Coll_Loss,

	COL_AUTO_PHYS_Glass_Count,
	COL_AUTO_PHYS_Glass_Count_rptd,
	COL_AUTO_PHYS_Glass_Loss,

	COL_AUTO_PHYS_Other_Count,
	COL_AUTO_PHYS_Other_Count_rptd,
	COL_AUTO_PHYS_Other_Loss,

	COL_AUTO_PHYS_Theft_Count,
	COL_AUTO_PHYS_Theft_Count_rptd,
	COL_AUTO_PHYS_Theft_Loss,

	Case_Loss,
	Case_ALAE,
	Paid_Loss,
	Paid_ALAE,
	Sal_Subro,
	Incurred_Loss_ALAE_with_SS,
	Incurred_Loss_ALAE_without_SS,
	Incurred_Loss_ALAE_with_SS_NonCat,
	Incurred_Loss_ALAE_without_SS_NonCat,
	Loss_ALAE_Cap,
	Incurred_Loss_ALAE_with_SS_CatOnly,
	Incurred_Loss_ALAE_without_SS_CatOnly,
	Capping_Factor,
	Capped_Incurred_Loss_ALAE_with_SS,
	Capped_Incurred_Loss_ALAE_with_SS_wo_cat,
	LDF,
	Capped_LDF,
	Ult_LDF_Incurred_Loss_ALAE_with_SS,
	Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly,
	Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat,
	Ult_LDF_Incurred_Loss_ALAE_without_SS,
	Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly,
	Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat,
	Ult_LDF_Capped_Inc_Loss_ALAE_with_SS,
	Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat,
	Reported_Claims,
	Open_Claims,
	Closed_With_Pay_Claims,
	Closed_Without_Pay_Claims,
	Incurred_Claims )
Select
	step3.company,
	step3.accountnumber,
	step3.Policy_number,
	step3.Claim_number,
	step3.Exp_product,
	step3.product,
	step3.Premium_State,
	step3.Territory,
	step3.Coverage_id,
	step3.Coverage_group,
	step3.Coverage_Reporting_Group,
	Coverage_Form,

	step3.Accident_Year,
	step3.accident_month,
	step3.Fiscal_AY_Month_Ending,
	step3.Fiscal_AY_Year,
	step3.report_year,
	step3.report_month,
	step3.policy_year,
	step3.policy_month,
	@Loss_Evaluation_Month as Loss_Evaluation_Month,
	@Loss_Evaluation_Year as Loss_Evaluation_Year,
	step3.type_of_loss,
	step3.Type_of_Loss_desc,
	step3.Claim_desc,

	(Case when Incurred_Claims=0 then 0 When step3.COL_Breach_of_Contract_Count > 1 then 1 else step3.COL_Breach_of_Contract_Count end) as COL_Breach_of_Contract_Count,
	(Case When step3.COL_Breach_of_Contract_Count > 1 then 1 else step3.COL_Breach_of_Contract_Count end) as COL_Breach_of_Contract_Count_rptd,
	COL_Breach_of_Contract_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Discrimination_Count > 1 then 1 else step3.COL_Discrimination_Count end) as COL_Discrimination_Count,
	(Case When step3.COL_Discrimination_Count > 1 then 1 else step3.COL_Discrimination_Count end) as COL_Discrimination_Count_rptd,
	COL_Discrimination_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Wrongful_Termination_Count > 1 then 1 else step3.COL_Wrongful_Termination_Count end) as COL_Wrongful_Termination_Count,
	(Case When step3.COL_Wrongful_Termination_Count > 1 then 1 else step3.COL_Wrongful_Termination_Count end) as COL_Wrongful_Termination_Count_rptd,
	COL_Wrongful_Termination_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Harrassment_Count > 1 then 1 else step3.COL_Harrassment_Count end) as COL_Harrassment_Count, 
	(Case When step3.COL_Harrassment_Count > 1 then 1 else step3.COL_Harrassment_Count end) as COL_Harrassment_Count_rptd,
	COL_Harrassment_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_DO_Other_Count > 1 then 1 else step3.COL_DO_Other_Count end) as COL_DO_Other_Count,
	(Case When step3.COL_DO_Other_Count > 1 then 1 else step3.COL_DO_Other_Count end) as COL_DO_Other_Count_rptd,
	COL_DO_Other_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_EPL_Other_Count > 1 then 1 else step3.COL_EPL_Other_Count end) as COL_EPL_Other_Count,
	(Case When step3.COL_EPL_Other_Count > 1 then 1 else step3.COL_EPL_Other_Count end) as COL_EPL_Other_Count_rptd,
	COL_EPL_Other_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Fiduciary_Other_Count > 1 then 1 else step3.COL_Fiduciary_Other_Count end) as COL_Fiduciary_Other_Count,
	(Case When step3.COL_Fiduciary_Other_Count > 1 then 1 else step3.COL_Fiduciary_Other_Count end) as COL_Fiduciary_Other_Count_rptd,
	COL_Fiduciary_Other_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Worplace_Violence_Other_Count > 1 then 1 else step3.COL_Worplace_Violence_Other_Count end) as COL_Worplace_Violence_Other_Count,
	(Case When step3.COL_Worplace_Violence_Other_Count > 1 then 1 else step3.COL_Worplace_Violence_Other_Count end) as COL_Worplace_Violence_Other_Count_rptd,
	COL_Worplace_Violence_Other_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Internet_Other_Count > 1 then 1 else step3.COL_Internet_Other_Count end) as COL_Internet_Other_Count,
	(Case When step3.COL_Internet_Other_Count > 1 then 1 else step3.COL_Internet_Other_Count end) as COL_Internet_Other_Count_rptd,
	COL_Internet_Other_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_SLD_All_Other_Count > 1 then 1 else step3.COL_SLD_All_Other_Count end) as COL_SLD_All_Other_Count,
	(Case When step3.COL_SLD_All_Other_Count > 1 then 1 else step3.COL_SLD_All_Other_Count end) as COL_SLD_All_Other_Count_rptd,
	COL_SLD_All_Other_Loss,

	(Case when Incurred_Claims=0 then 0 When step3.COL_AE_Breach_of_Contract_Count > 1 then 1 else step3.COL_AE_Breach_of_Contract_Count end) as COL_AE_Breach_of_Contract_Count,
	(Case When step3.COL_AE_Breach_of_Contract_Count > 1 then 1 else step3.COL_AE_Breach_of_Contract_Count end) as COL_AE_Breach_of_Contract_Count_rptd, 
	COL_AE_Breach_of_Contract_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AE_Breach_of_Fiduciary_Liability_Count > 1 then 1 else step3.COL_AE_Breach_of_Fiduciary_Liability_Count end) as COL_AE_Breach_of_Fiduciary_Liability_Count,
	(Case When step3.COL_AE_Breach_of_Fiduciary_Liability_Count > 1 then 1 else step3.COL_AE_Breach_of_Fiduciary_Liability_Count end) as COL_AE_Breach_of_Fiduciary_Liability_Count_rptd,
	COL_AE_Breach_of_Fiduciary_Liability_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AE_Financial_Advisor_Count > 1 then 1 else step3.COL_AE_Financial_Advisor_Count end) as COL_AE_Financial_Advisor_Count,
	(Case When step3.COL_AE_Financial_Advisor_Count > 1 then 1 else step3.COL_AE_Financial_Advisor_Count end) as COL_AE_Financial_Advisor_Count_rptd,
	COL_AE_Financial_Advisor_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AE_Misconduct_Count > 1 then 1 else step3.COL_AE_Misconduct_Count end) as COL_AE_Misconduct_Count,
	(Case When step3.COL_AE_Misconduct_Count > 1 then 1 else step3.COL_AE_Misconduct_Count end) as COL_AE_Misconduct_Count_rptd,
	COL_AE_Misconduct_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AE_Wills_Estate_Count > 1 then 1 else step3.COL_AE_Wills_Estate_Count end) as COL_AE_Wills_Estate_Count,
	(Case When step3.COL_AE_Wills_Estate_Count > 1 then 1 else step3.COL_AE_Wills_Estate_Count end) as COL_AE_Wills_Estate_Count_rptd,
	COL_AE_Wills_Estate_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AE_Corporate_Count > 1 then 1 else step3.COL_AE_Corporate_Count end) as COL_AE_Corporate_Count,
	(Case When step3.COL_AE_Corporate_Count > 1 then 1 else step3.COL_AE_Corporate_Count end) as COL_AE_Corporate_Count_rptd,
	COL_AE_Corporate_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AE_Tax_Liability_Count > 1 then 1 else step3.COL_AE_Tax_Liability_Count end) as COL_AE_Tax_Liability_Count,
	(Case When step3.COL_AE_Tax_Liability_Count > 1 then 1 else step3.COL_AE_Tax_Liability_Count end) as COL_AE_Tax_Liability_Count_rptd,
	COL_AE_Tax_Liability_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AE_Violation_GAAP_Count > 1 then 1 else step3.COL_AE_Violation_GAAP_Count end) as COL_AE_Violation_GAAP_Count,
	(Case When step3.COL_AE_Violation_GAAP_Count > 1 then 1 else step3.COL_AE_Violation_GAAP_Count end) as COL_AE_Violation_GAAP_Count_rptd,
	COL_AE_Violation_GAAP_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AE_ALL_Other_Count > 1 then 1 else step3.COL_AE_ALL_Other_Count end) as COL_AE_ALL_Other_Count,
	(Case When step3.COL_AE_ALL_Other_Count > 1 then 1 else step3.COL_AE_ALL_Other_Count end) as COL_AE_ALL_Other_Count_rptd,
	COL_AE_ALL_Other_Loss,

	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_Breach_of_Contract_Count > 1 then 1 else step3.COL_CL_Breach_of_Contract_Count end) as COL_CL_Breach_of_Contract_Count,
	(Case When step3.COL_CL_Breach_of_Contract_Count > 1 then 1 else step3.COL_CL_Breach_of_Contract_Count end) as COL_CL_Breach_of_Contract_Count_rptd,
	COL_CL_Breach_of_Contract_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_Breach_of_Fiduciary_Liability_Count > 1 then 1 else step3.COL_CL_Breach_of_Fiduciary_Liability_Count end) as COL_CL_Breach_of_Fiduciary_Liability_Count,
	(Case When step3.COL_CL_Breach_of_Fiduciary_Liability_Count > 1 then 1 else step3.COL_CL_Breach_of_Fiduciary_Liability_Count end) as COL_CL_Breach_of_Fiduciary_Liability_Count_rptd,
	COL_CL_Breach_of_Fiduciary_Liability_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_Financial_Advisor_Count > 1 then 1 else step3.COL_CL_Financial_Advisor_Count end) as COL_CL_Financial_Advisor_Count,
	(Case When step3.COL_CL_Financial_Advisor_Count > 1 then 1 else step3.COL_CL_Financial_Advisor_Count end) as COL_CL_Financial_Advisor_Count_rptd,
	COL_CL_Financial_Advisor_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_Misconduct_Count > 1 then 1 else step3.COL_CL_Misconduct_Count end) as COL_CL_Misconduct_Count,
	(Case When step3.COL_CL_Misconduct_Count > 1 then 1 else step3.COL_CL_Misconduct_Count end) as COL_CL_Misconduct_Count_rptd,
	COL_CL_Misconduct_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_Wills_Estate_Count > 1 then 1 else step3.COL_CL_Wills_Estate_Count end) as COL_CL_Wills_Estate_Count,
	(Case When step3.COL_CL_Wills_Estate_Count > 1 then 1 else step3.COL_CL_Wills_Estate_Count end) as COL_CL_Wills_Estate_Count_rptd,
	COL_CL_Wills_Estate_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_Corporate_Count > 1 then 1 else step3.COL_CL_Corporate_Count end) as COL_CL_Corporate_Count,
	(Case When step3.COL_CL_Corporate_Count > 1 then 1 else step3.COL_CL_Corporate_Count end) as COL_CL_Corporate_Count_rptd,
	COL_CL_Corporate_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_Tax_Liability_Count > 1 then 1 else step3.COL_CL_Tax_Liability_Count end) as COL_CL_Tax_Liability_Count,
	(Case When step3.COL_CL_Tax_Liability_Count > 1 then 1 else step3.COL_CL_Tax_Liability_Count end) as COL_CL_Tax_Liability_Count_rptd,
	COL_CL_Tax_Liability_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_Violation_GAAP_Count > 1 then 1 else step3.COL_CL_Violation_GAAP_Count end) as COL_CL_Violation_GAAP_Count,
	(Case When step3.COL_CL_Violation_GAAP_Count > 1 then 1 else step3.COL_CL_Violation_GAAP_Count end) as COL_CL_Violation_GAAP_Count_rptd,
	COL_CL_Violation_GAAP_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_Tax_Liability_Count > 1 then 1 else step3.COL_CL_Tax_Liability_Count end) as COL_CL_Tax_Liability_Count,
	(Case When step3.COL_CL_Tax_Liability_Count > 1 then 1 else step3.COL_CL_Tax_Liability_Count end) as COL_CL_Tax_Liability_Count_rptd,
	COL_CL_Tax_Liability_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_Electronic_Data_Damage_Count > 1 then 1 else step3.COL_CL_Electronic_Data_Damage_Count end) as COL_CL_Electronic_Data_Damage_Count,
	(Case When step3.COL_CL_Electronic_Data_Damage_Count > 1 then 1 else step3.COL_CL_Electronic_Data_Damage_Count end) as COL_CL_Electronic_Data_Damage_Count_rptd,
	COL_CL_Electronic_Data_Damage_Loss,	
	(Case when Incurred_Claims=0 then 0 When step3.COL_CL_ALL_Other_Count > 1 then 1 else step3.COL_CL_ALL_Other_Count end) as COL_CL_ALL_Other_Count,
	(Case When step3.COL_CL_ALL_Other_Count > 1 then 1 else step3.COL_CL_ALL_Other_Count end) as COL_CL_ALL_Other_Count_rptd,
	COL_CL_ALL_Other_Loss,

	(Case when Incurred_Claims=0 then 0 When step3.COL_GLBI_Malpractice_Count > 1 then 1 else step3.COL_GLBI_Malpractice_Count end) as COL_GLBI_Malpractice_Count,
	(Case When step3.COL_GLBI_Malpractice_Count > 1 then 1 else step3.COL_GLBI_Malpractice_Count end) as COL_GLBI_Malpractice_Count_rptd,
	COL_GLBI_Malpractice_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_GLBI_Fraud_Breach_of_Contract_Count > 1 then 1 else step3.COL_GLBI_Fraud_Breach_of_Contract_Count end) as COL_GLBI_Fraud_Breach_of_Contract_Count,
	(Case When step3.COL_GLBI_Fraud_Breach_of_Contract_Count > 1 then 1 else step3.COL_GLBI_Fraud_Breach_of_Contract_Count end) as COL_GLBI_Fraud_Breach_of_Contract_Count_rptd,
	COL_GLBI_Fraud_Breach_of_Contract_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_GLBI_Injury_Count > 1 then 1 else step3.COL_GLBI_Injury_Count end) as COL_GLBI_Injury_Count,
	(Case When step3.COL_GLBI_Injury_Count > 1 then 1 else step3.COL_GLBI_Injury_Count end) as COL_GLBI_Injury_Count_rptd,
	COL_GLBI_Injury_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_GLBI_Other_count > 1 then 1 else step3.COL_GLBI_Other_Count end) as COL_GLBI_Other_Count,
	(Case When step3.COL_GLBI_Other_count > 1 then 1 else step3.COL_GLBI_Other_Count end) as COL_GLBI_Other_Count_rptd,
	COL_GLBI_Other_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_GLBI_Sexual_Assault_Molest_Abuse_count > 1 then 1 else step3.COL_GLBI_Sexual_Assault_Molest_Abuse_Count end) as COL_GLBI_Sexual_Assault_Molest_Abuse_Count,
	(Case When step3.COL_GLBI_Sexual_Assault_Molest_Abuse_count > 1 then 1 else step3.COL_GLBI_Sexual_Assault_Molest_Abuse_Count end) as COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd,
	COL_GLBI_Sexual_Assault_Molest_Abuse_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_GLBI_PropertyDamage_Count > 1 then 1 else step3.COL_GLBI_PropertyDamage_Count end) as COL_GLBI_PropertyDamage_Count, 
	(Case When step3.COL_GLBI_PropertyDamage_Count > 1 then 1 else step3.COL_GLBI_PropertyDamage_Count end) as COL_GLBI_PropertyDamage_Count_rptd, 
	COL_GLBI_PropertyDamage_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_GLBI_Theft_Count > 1 then 1 else step3.COL_GLBI_Theft_Count end) as COL_GLBI_Theft_Count, 
	(Case When step3.COL_GLBI_Theft_Count > 1 then 1 else step3.COL_GLBI_Theft_Count end) as COL_GLBI_Theft_Count_rptd, 
	COL_GLBI_Theft_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_GLBI_SlanderDefamtion_Count > 1 then 1 else step3.COL_GLBI_SlanderDefamtion_Count end) as COL_GLBI_SlanderDefamtion_Count, 
	(Case When step3.COL_GLBI_SlanderDefamtion_Count > 1 then 1 else step3.COL_GLBI_SlanderDefamtion_Count end) as COL_GLBI_SlanderDefamtion_Count_rptd, 
	COL_GLBI_SlanderDefamtion_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_GLBI_Discrim_WrongfulTermination_Count > 1 then 1 else step3.COL_GLBI_Discrim_WrongfulTermination_Count end) as COL_GLBI_Discrim_WrongfulTermination_Count, 
	(Case When step3.COL_GLBI_Discrim_WrongfulTermination_Count > 1 then 1 else step3.COL_GLBI_Discrim_WrongfulTermination_Count end) as COL_GLBI_Discrim_WrongfulTermination_Count_rptd, 
	COL_GLBI_Discrim_WrongfulTermination_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Prop_Fire_Lightning_Explosion_count > 1 then 1 else step3.COL_Prop_Fire_Lightning_Explosion_Count end) as COL_Prop_Fire_Lightning_Explosion_Count,
	(Case When step3.COL_Prop_Fire_Lightning_Explosion_count > 1 then 1 else step3.COL_Prop_Fire_Lightning_Explosion_Count end) as COL_Prop_Fire_Lightning_Explosion_Count_rptd,
	COL_Prop_Fire_Lightning_Explosion_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Prop_Theft_Van_count > 1 then 1 else step3.COL_Prop_Theft_Van_Count end) as COL_Prop_Theft_Van_Count,
	(Case When step3.COL_Prop_Theft_Van_count > 1 then 1 else step3.COL_Prop_Theft_Van_Count end) as COL_Prop_Theft_Van_Count_rptd,
	COL_Prop_Theft_Van_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Prop_Water_Sprinkler_count > 1 then 1 else step3.COL_Prop_Water_Sprinkler_Count end) as COL_Prop_Water_Sprinkler_Count,
	(Case When step3.COL_Prop_Water_Sprinkler_count > 1 then 1 else step3.COL_Prop_Water_Sprinkler_Count end) as COL_Prop_Water_Sprinkler_Count_rptd,
	COL_Prop_Water_Sprinkler_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Prop_Water_Other_count > 1 then 1 else step3.COL_Prop_Water_Other_Count end) as COL_Prop_Water_Other_Count,
	(Case When step3.COL_Prop_Water_Other_count > 1 then 1 else step3.COL_Prop_Water_Other_Count end) as COL_Prop_Water_Other_Count_rptd,
	COL_Prop_Water_Other_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Prop_Wind_Hail_count > 1 then 1 else step3.COL_Prop_Wind_Hail_Count end) as COL_Prop_Wind_Hail_Count,
	(Case When step3.COL_Prop_Wind_Hail_count > 1 then 1 else step3.COL_Prop_Wind_Hail_Count end) as COL_Prop_Wind_Hail_Count_rptd,
	COL_Prop_Wind_Hail_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_Prop_Other_count > 1 then 1 else step3.COL_Prop_Other_Count end) as COL_Prop_Other_Count,
	(Case When step3.COL_Prop_Other_count > 1 then 1 else step3.COL_Prop_Other_Count end) as COL_Prop_Other_Count_rptd,
	COL_Prop_Other_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AUTO_LIAB_AllOther_count > 1 then 1 else step3.COL_AUTO_LIAB_AllOther_Count end) as COL_AUTO_LIAB_AllOther_Count,
	(Case When step3.COL_AUTO_LIAB_AllOther_count > 1 then 1 else step3.COL_AUTO_LIAB_AllOther_Count end) as COL_AUTO_LIAB_AllOther_Count_rptd,
	COL_AUTO_LIAB_AllOther_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AUTO_LIAB_PropDam_count > 1 then 1 else step3.COL_AUTO_LIAB_PropDam_Count end) as COL_AUTO_LIAB_PropDam_Count,
	(Case When step3.COL_AUTO_LIAB_PropDam_count > 1 then 1 else step3.COL_AUTO_LIAB_PropDam_Count end) as COL_AUTO_LIAB_PropDam_Count_rptd,
	COL_AUTO_LIAB_PropDam_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AUTO_PHYS_Coll_count > 1 then 1 else step3.COL_AUTO_PHYS_Coll_Count end) as COL_AUTO_PHYS_Coll_Count,
	(Case When step3.COL_AUTO_PHYS_Coll_count > 1 then 1 else step3.COL_AUTO_PHYS_Coll_Count end) as COL_AUTO_PHYS_Coll_Count_rptd,
	COL_AUTO_PHYS_Coll_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AUTO_PHYS_Glass_count > 1 then 1 else step3.COL_AUTO_PHYS_Glass_Count end) as COL_AUTO_PHYS_Glass_Count,
	(Case When step3.COL_AUTO_PHYS_Glass_count > 1 then 1 else step3.COL_AUTO_PHYS_Glass_Count end) as COL_AUTO_PHYS_Glass_Count_rptd ,
	COL_AUTO_PHYS_Glass_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AUTO_PHYS_Other_count > 1 then 1 else step3.COL_AUTO_PHYS_Other_Count end) as COL_AUTO_PHYS_Other_Count,
	(Case When step3.COL_AUTO_PHYS_Other_count > 1 then 1 else step3.COL_AUTO_PHYS_Other_Count end) as COL_AUTO_PHYS_Other_Count_rptd,
	COL_AUTO_PHYS_Other_Loss,
	(Case when Incurred_Claims=0 then 0 When step3.COL_AUTO_PHYS_Theft_count > 1 then 1 else step3.COL_AUTO_PHYS_Theft_Count end) as COL_AUTO_PHYS_Theft_Count,
	(Case When step3.COL_AUTO_PHYS_Theft_count > 1 then 1 else step3.COL_AUTO_PHYS_Theft_Count end) as COL_AUTO_PHYS_Theft_Count_rptd,
	COL_AUTO_PHYS_Theft_Loss,

	Case_Loss,
	Case_ALAE,
	Paid_Loss,
	Paid_ALAE,
	Sal_Subro,	
	Incurred_Loss_ALAE_with_SS,
	Incurred_Loss_ALAE_without_SS,
	Incurred_Loss_ALAE_with_SS_NonCat,
	Incurred_Loss_ALAE_without_SS_NonCat,
	Loss_ALAE_Cap,
	Incurred_Loss_ALAE_with_SS_CatOnly,
	Incurred_Loss_ALAE_without_SS_CatOnly,
	Capping_Factor,
	Capped_Incurred_Loss_ALAE_with_SS,
	Capped_Incurred_Loss_ALAE_with_SS_wo_cat,
	LDF,
	Capped_LDF,
	Incurred_Loss_ALAE_with_SS * LDF as Ult_LDF_Incurred_Loss_ALAE_with_SS,
	Incurred_Loss_ALAE_with_SS_CatOnly * LDF as Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly,
	Incurred_Loss_ALAE_with_SS_NonCat * LDF as Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat,
	Incurred_Loss_ALAE_without_SS * LDF as Ult_LDF_Incurred_Loss_ALAE_without_SS,
	Incurred_Loss_ALAE_without_SS_CatOnly * LDF as Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly,
	Incurred_Loss_ALAE_without_SS_NonCat * LDF as Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat,
	Capped_Incurred_Loss_ALAE_with_SS * Capped_LDF as Ult_LDF_Capped_Inc_Loss_ALAE_with_SS,
	Capped_Incurred_Loss_ALAE_with_SS_wo_Cat * Capped_LDF as Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat,

	Reported_Claims,
	Open_Claims,
	Closed_With_Pay_Claims,
	Closed_Without_Pay_Claims,
	Incurred_Claims
from (

Select	
	step2.company,
	step2.accountnumber,
	step2.Policy_number,
	step2.Claim_number,
	step2.Exp_product,
	step2.product,
	step2.Premium_State,
	step2.Territory,
	step2.Coverage_id,
	step2.Coverage_group,
	step2.Coverage_Reporting_Group,
	Coverage_Form,
	step2.Accident_Year,
	step2.accident_month,
	step2.Fiscal_AY_Month_Ending,
	step2.Fiscal_AY_Year,
	step2.report_year,
	step2.report_month,
	step2.policy_year,
	step2.policy_month,
	step2.type_of_loss,
	step2.Type_of_Loss_desc,
	step2.Claim_desc,
sum(step2.COL_Breach_of_Contract_Count) as COL_Breach_of_Contract_Count,
sum(step2.COL_Breach_of_Contract_Loss) as COL_Breach_of_Contract_Loss,
sum(step2.COL_Discrimination_Count) as COL_Discrimination_Count,
sum(step2.COL_Discrimination_Loss) as COL_Discrimination_Loss,
sum(step2.COL_Wrongful_Termination_Count) as COL_Wrongful_Termination_Count,
sum(step2.COL_Wrongful_Termination_Loss) as COL_Wrongful_Termination_Loss,
sum(step2.COL_Harrassment_Count) as COL_Harrassment_Count,
sum(step2.COL_Harrassment_Loss) as COL_Harrassment_Loss,
sum(step2.COL_DO_Other_Count) as COL_DO_Other_Count,
sum(step2.COL_DO_Other_Loss) as COL_DO_Other_Loss,
sum(step2.COL_EPL_Other_Count) as COL_EPL_Other_Count,
sum(step2.COL_EPL_Other_Loss) as COL_EPL_Other_Loss,
sum(step2.COL_Fiduciary_Other_Count) as COL_Fiduciary_Other_Count,
sum(step2.COL_Fiduciary_Other_Loss) as COL_Fiduciary_Other_Loss,
sum(step2.COL_Worplace_Violence_Other_Count) as COL_Worplace_Violence_Other_Count,
sum(step2.COL_Worplace_Violence_Other_Loss) as COL_Worplace_Violence_Other_Loss,
sum(step2.COL_Internet_Other_Count) as COL_Internet_Other_Count,
sum(step2.COL_Internet_Other_Loss) as COL_Internet_Other_Loss,
sum(step2.COL_SLD_All_Other_Count) as COL_SLD_All_Other_Count,
sum(step2.COL_SLD_All_Other_Loss) as COL_SLD_All_Other_Loss,

sum(step2.COL_AE_Breach_of_Contract_Count) as COL_AE_Breach_of_Contract_Count,
sum(step2.COL_AE_Breach_of_Contract_Loss) as COL_AE_Breach_of_Contract_Loss,
sum(step2.COL_AE_Breach_of_Fiduciary_Liability_Count) as COL_AE_Breach_of_Fiduciary_Liability_Count,
sum(step2.COL_AE_Breach_of_Fiduciary_Liability_Loss) as COL_AE_Breach_of_Fiduciary_Liability_Loss,
sum(step2.COL_AE_Financial_Advisor_Count) as COL_AE_Financial_Advisor_Count,
sum(step2.COL_AE_Financial_Advisor_Loss) as COL_AE_Financial_Advisor_Loss,
sum(step2.COL_AE_Misconduct_Count) as COL_AE_Misconduct_Count,
sum(step2.COL_AE_Misconduct_Loss) as COL_AE_Misconduct_Loss,
sum(step2.COL_AE_Wills_Estate_Count) as COL_AE_Wills_Estate_Count,
sum(step2.COL_AE_Wills_Estate_Loss) as COL_AE_Wills_Estate_Loss,
sum(step2.COL_AE_Corporate_Count) as COL_AE_Corporate_Count,
sum(step2.COL_AE_Corporate_Loss) as COL_AE_Corporate_Loss,
sum(step2.COL_AE_Tax_Liability_Count) as COL_AE_Tax_Liability_Count,
sum(step2.COL_AE_Tax_Liability_Loss) as COL_AE_Tax_Liability_Loss,
sum(step2.COL_AE_Violation_GAAP_Count) as COL_AE_Violation_GAAP_Count,
sum(step2.COL_AE_Violation_GAAP_Loss) as COL_AE_Violation_GAAP_Loss,
sum(step2.COL_AE_ALL_Other_Count) as COL_AE_ALL_Other_Count,
sum(step2.COL_AE_ALL_Other_Loss) as COL_AE_ALL_Other_Loss,

sum(step2.COL_CL_Breach_of_Contract_Count) as COL_CL_Breach_of_Contract_Count,
sum(step2.COL_CL_Breach_of_Contract_Loss) as COL_CL_Breach_of_Contract_Loss,
sum(step2.COL_CL_Breach_of_Fiduciary_Liability_Count) as COL_CL_Breach_of_Fiduciary_Liability_Count,
sum(step2.COL_CL_Breach_of_Fiduciary_Liability_Loss) as COL_CL_Breach_of_Fiduciary_Liability_Loss,
sum(step2.COL_CL_Financial_Advisor_Count) as COL_CL_Financial_Advisor_Count,
sum(step2.COL_CL_Financial_Advisor_Loss) as COL_CL_Financial_Advisor_Loss,
sum(step2.COL_CL_Misconduct_Count) as COL_CL_Misconduct_Count,
sum(step2.COL_CL_Misconduct_Loss) as COL_CL_Misconduct_Loss,
sum(step2.COL_CL_Wills_Estate_Count) as COL_CL_Wills_Estate_Count,
sum(step2.COL_CL_Wills_Estate_Loss) as COL_CL_Wills_Estate_Loss,
sum(step2.COL_CL_Corporate_Count) as COL_CL_Corporate_Count,
sum(step2.COL_CL_Corporate_Loss) as COL_CL_Corporate_Loss,
sum(step2.COL_CL_Tax_Liability_Count) as COL_CL_Tax_Liability_Count,
sum(step2.COL_CL_Tax_Liability_Loss) as COL_CL_Tax_Liability_Loss,
sum(step2.COL_CL_Violation_GAAP_Count) as COL_CL_Violation_GAAP_Count,
sum(step2.COL_CL_Violation_GAAP_Loss) as COL_CL_Violation_GAAP_Loss,
sum(step2.COL_CL_Negligent_Training_Count) as COL_CL_Negligent_Training_Count,
sum(step2.COL_CL_Negligent_Training_Loss) as COL_CL_Negligent_Training_Loss,
sum(step2.COL_CL_Electronic_Data_Damage_Count) as COL_CL_Electronic_Data_Damage_Count,
sum(step2.COL_CL_Electronic_Data_Damage_Loss) as COL_CL_Electronic_Data_Damage_Loss,
sum(step2.COL_CL_ALL_Other_Count) as COL_CL_ALL_Other_Count,
sum(step2.COL_CL_ALL_Other_Loss) as COL_CL_ALL_Other_Loss,

sum(step2.COL_GLBI_Malpractice_Count) as COL_GLBI_Malpractice_Count,
sum(step2.COL_GLBI_Malpractice_Loss) as COL_GLBI_Malpractice_Loss,
sum(step2.COL_GLBI_Fraud_Breach_of_Contract_Count) as COL_GLBI_Fraud_Breach_of_Contract_Count,
sum(step2.COL_GLBI_Fraud_Breach_of_Contract_Loss) as COL_GLBI_Fraud_Breach_of_Contract_Loss,
sum(step2.COL_GLBI_Injury_Count) as COL_GLBI_Injury_Count,
sum(step2.COL_GLBI_Injury_Loss) as COL_GLBI_Injury_Loss,
sum(step2.COL_GLBI_Other_Count) as COL_GLBI_Other_Count,
sum(step2.COL_GLBI_Other_Loss) as COL_GLBI_Other_Loss,
sum(step2.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) as COL_GLBI_Sexual_Assault_Molest_Abuse_Count,
sum(step2.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) as COL_GLBI_Sexual_Assault_Molest_Abuse_Loss,
sum(step2.COL_GLBI_Theft_Loss) as COL_GLBI_Theft_Loss,
sum(step2.COL_GLBI_Theft_Count) as COL_GLBI_Theft_Count,
sum(step2.COL_GLBI_PropertyDamage_Loss) as COL_GLBI_PropertyDamage_Loss,
sum(COL_GLBI_PropertyDamage_Count) as COL_GLBI_PropertyDamage_Count,
sum(COL_GLBI_SlanderDefamtion_loss) as COL_GLBI_SlanderDefamtion_Loss,
sum(COL_GLBI_SlanderDefamtion_count) as COL_GLBI_SlanderDefamtion_Count,
sum(COL_GLBI_Discrim_WrongfulTermination_Loss) as COL_GLBI_Discrim_WrongfulTermination_Loss,
sum(COL_GLBI_Discrim_WrongfulTermination_Count) as COL_GLBI_Discrim_WrongfulTermination_Count,

sum(step2.COL_Prop_Fire_Lightning_Explosion_Count) as COL_Prop_Fire_Lightning_Explosion_Count,
sum(step2.COL_Prop_Fire_Lightning_Explosion_Loss) as COL_Prop_Fire_Lightning_Explosion_Loss,
sum(step2.COL_Prop_Theft_Van_Count) as COL_Prop_Theft_Van_Count,
sum(step2.COL_Prop_Theft_Van_Loss) as COL_Prop_Theft_Van_Loss,
sum(step2.COL_Prop_Water_Sprinkler_Count) as COL_Prop_Water_Sprinkler_Count,
sum(step2.COL_Prop_Water_Sprinkler_Loss) as COL_Prop_Water_Sprinkler_Loss,
sum(step2.COL_Prop_Water_Other_Count) as COL_Prop_Water_Other_Count,
sum(step2.COL_Prop_Water_Other_Loss) as COL_Prop_Water_Other_Loss,
sum(step2.COL_Prop_Wind_Hail_Count) as COL_Prop_Wind_Hail_Count,
sum(step2.COL_Prop_Wind_Hail_Loss) as COL_Prop_Wind_Hail_Loss,
sum(step2.COL_Prop_Other_Count) as COL_Prop_Other_Count,
sum(step2.COL_Prop_Other_Loss) as COL_Prop_Other_Loss,

sum(step2.COL_AUTO_LIAB_AllOther_Count) as COL_AUTO_LIAB_AllOther_Count,
sum(step2.COL_AUTO_LIAB_AllOther_Loss) as COL_AUTO_LIAB_AllOther_Loss,
sum(step2.COL_AUTO_LIAB_PropDam_Count) as COL_AUTO_LIAB_PropDam_Count,
sum(step2.COL_AUTO_LIAB_PropDam_Loss) as COL_AUTO_LIAB_PropDam_Loss,

sum(step2.COL_AUTO_PHYS_Coll_Count) as COL_AUTO_PHYS_Coll_Count,
sum(step2.COL_AUTO_PHYS_Coll_Loss) as COL_AUTO_PHYS_Coll_Loss,
sum(step2.COL_AUTO_PHYS_Glass_Count) as COL_AUTO_PHYS_Glass_Count,
sum(step2.COL_AUTO_PHYS_Glass_Loss) as COL_AUTO_PHYS_Glass_Loss,
sum(step2.COL_AUTO_PHYS_Other_Count) as COL_AUTO_PHYS_Other_Count,
sum(step2.COL_AUTO_PHYS_Other_Loss) as COL_AUTO_PHYS_Other_Loss,
sum(step2.COL_AUTO_PHYS_Theft_Count) as COL_AUTO_PHYS_Theft_Count,
sum(step2.COL_AUTO_PHYS_Theft_Loss) as COL_AUTO_PHYS_Theft_Loss,

	sum(step2.Case_Loss) as Case_Loss,
	sum(step2.Case_ALAE) as Case_ALAE,
	sum(step2.Paid_Loss) as Paid_Loss,
	sum(step2.Paid_ALAE) as Paid_ALAE,
	sum(step2.Sal_Subro) as Sal_Subro,	
	sum(step2.Incurred_Loss_ALAE_with_SS_CatOnly) as Incurred_Loss_ALAE_with_SS_CatOnly,
	sum(step2.Incurred_Loss_ALAE_with_SS) as Incurred_Loss_ALAE_with_SS,
	sum(step2.Incurred_Loss_ALAE_with_SS_Noncat) as Incurred_Loss_ALAE_with_SS_Noncat,
	sum(step2.Incurred_Loss_ALAE_without_SS) as Incurred_Loss_ALAE_without_SS,
	sum(step2.Incurred_Loss_ALAE_without_SS_CatOnly) as Incurred_Loss_ALAE_without_SS_CatOnly,
	sum(step2.Incurred_Loss_ALAE_without_SS_NonCat) as Incurred_Loss_ALAE_without_SS_NonCat,
	@Loss_ALAE_Cap as Loss_ALAE_Cap,
	Capping_Factor * sum(step2.Incurred_Loss_ALAE_with_SS) as Capped_Incurred_Loss_ALAE_with_SS,
	Capping_Factor * sum(step2.Incurred_Loss_ALAE_with_SS - step2.Incurred_Loss_ALAE_with_SS_CatOnly) as Capped_Incurred_Loss_ALAE_with_SS_wo_Cat,
	Capping_Factor,

	step2.LDF_Group,

		isnull((select distinct LDF.Loss_Dev_Factor
				from Act_Detailed_Experience.dbo.LDF LDF
				where step2.Coverage_Group = LDF.Coverage_Group
					and step2.LDF_Group = LDF.LDF_Group
					and LDF.[Month] = 
						(@Loss_Evaluation_Year - Fiscal_AY_Year + 1)*12
						+ @Loss_Evaluation_Month - Fiscal_AY_Month_Ending)
		,1.0) as LDF,


		isnull((select distinct LDF.Capped_Loss_Dev_Factor
				from Act_Detailed_Experience.dbo.LDF LDF
				where step2.Coverage_Group = LDF.Coverage_Group
					and step2.LDF_Group = LDF.LDF_Group
					and LDF.[Month] = 
						(@Loss_Evaluation_Year - Fiscal_AY_Year + 1)*12
						+ @Loss_Evaluation_Month - Fiscal_AY_Month_Ending)
		,1.0) as Capped_LDF,

	1 as Reported_Claims,
	(Case when sum(Case_Loss + Case_ALAE) <> 0.0 then 1 else 0 end) as Open_Claims,
		(Case when sum(Case_Loss + Case_ALAE) = 0 and sum(Paid_Loss + Paid_ALAE) <> 0.0 
			then 1 else 0 end) as Closed_With_Pay_Claims,
		(Case when sum(Case_Loss + Case_ALAE) = 0 and sum(Paid_Loss + Paid_ALAE) = 0.0 
			then 1 else 0 end) as Closed_Without_Pay_Claims,
	(Case when sum(Case_Loss + Case_ALAE) = 0 and sum(Paid_Loss + Paid_ALAE) = 0.0 
			then 0 else 1 end) as Incurred_Claims,
	Cause_of_Loss_group
from (

Select
	step1a.company,
	step1a.accountnumber,
	step1a.Policy_number,
	step1a.Claim_number,
	Step1a.Cat_Non_cat,
	step1a.Exp_product,
	step1a.product,
	step1a.Premium_State,
	step1a.Territory,
	step1a.Subline,
	step1a.Coverage_id,
	step1a.Coverage_group,
	step1a.Coverage_Reporting_Group,
	Coverage_Form,
	step1a.Accident_Year,
	step1a.accident_month,
	step1a.Fiscal_AY_Month_Ending,
	step1a.Fiscal_AY_Year,
	step1a.report_year,
	step1a.report_month,
	step1a.policy_year,
	step1a.policy_month,
	step1a.type_of_loss,
	step1a.Type_of_Loss_desc,
	step1a.Claim_desc,
	
COL_Breach_of_Contract as COL_Breach_of_Contract_Count,
(Case When COL_Breach_of_Contract > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Breach_of_Contract_Loss,
COL_Discrimination as COL_Discrimination_Count,
(Case When COL_Discrimination > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Discrimination_Loss,
COL_Wrongful_Termination as COL_Wrongful_Termination_Count,
(Case When COL_Wrongful_Termination > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Wrongful_Termination_Loss,
COL_Harrassment as COL_Harrassment_Count,
(Case When COL_Harrassment > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Harrassment_Loss,
COL_DO_Other as COL_DO_Other_Count,
(Case When COL_DO_Other > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_DO_Other_Loss,
COL_EPL_Other as COL_EPL_Other_Count,
(Case When COL_EPL_Other > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_EPL_Other_Loss,
COL_Fiduciary_Other as COL_Fiduciary_Other_Count,
(Case When COL_Fiduciary_Other > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Fiduciary_Other_Loss,
COL_Worplace_Violence_Other as COL_Worplace_Violence_Other_Count,
(Case When COL_Worplace_Violence_Other > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Worplace_Violence_Other_Loss,
COL_Internet_Other as COL_Internet_Other_Count,
(Case When COL_Internet_Other > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Internet_Other_Loss,
COL_SLD_All_Other as COL_SLD_All_Other_Count,
(Case When COL_SLD_All_Other > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_SLD_All_Other_Loss,
COL_AE_Breach_of_Contract as COL_AE_Breach_of_Contract_Count,

	
		(Case When COL_AE_Breach_of_Contract > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_AE_Breach_of_Contract_Loss,

	
		(case when COL_AE_Breach_of_Fiduciary_Liability > 0 
		then COL_AE_Breach_of_Fiduciary_Liability else 0.0 end) as COL_AE_Breach_of_Fiduciary_Liability_Count, 
	 
		(Case When COL_AE_Breach_of_Contract = 0 
			AND COL_AE_Breach_of_Fiduciary_Liability > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_AE_Breach_of_Fiduciary_Liability_Loss,

	
		(case when COL_AE_Breach_of_Contract > 0 
			or COL_AE_Breach_of_Fiduciary_Liability > 0
		then 0.0 else COL_AE_Financial_Advisor end) as COL_AE_Financial_Advisor_Count,
	
		(Case When COL_AE_Breach_of_Contract = 0 
			and COL_AE_Breach_of_Fiduciary_Liability = 0
			and COL_AE_Financial_Advisor > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_AE_Financial_Advisor_Loss,

	
		(case when COL_AE_Breach_of_Contract > 0 
			or COL_AE_Breach_of_Fiduciary_Liability > 0
			or COL_AE_Financial_Advisor > 0
		then 0.0 else COL_AE_Misconduct end) as COL_AE_Misconduct_Count,
	
		(Case when COL_AE_Breach_of_Contract = 0 
			and COL_AE_Breach_of_Fiduciary_Liability = 0
			and COL_AE_Financial_Advisor = 0 
			and COL_AE_Misconduct > 0
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_AE_Misconduct_Loss,

	
		(case when COL_AE_Breach_of_Contract > 0 
			or COL_AE_Breach_of_Fiduciary_Liability > 0
			or COL_AE_Financial_Advisor > 0
			or COL_AE_Misconduct > 0 
		then 0.0 else COL_AE_Wills_Estate end) as COL_AE_Wills_Estate_Count, 
	
		(Case When COL_AE_Breach_of_Contract = 0 
			and COL_AE_Breach_of_Fiduciary_Liability = 0
			and COL_AE_Financial_Advisor = 0
			and COL_AE_Misconduct = 0 
			and COL_AE_Wills_Estate > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_AE_Wills_Estate_Loss,

	
		(case when COL_AE_Breach_of_Contract > 0 
			or COL_AE_Breach_of_Fiduciary_Liability > 0
			or COL_AE_Financial_Advisor > 0
			or COL_AE_Misconduct > 0
			or COL_AE_Wills_Estate > 0 
		then 0.0 else COL_AE_Corporate end) as COL_AE_Corporate_Count,
	
		(Case When COL_AE_Breach_of_Contract = 0 
			and COL_AE_Breach_of_Fiduciary_Liability = 0
			and COL_AE_Financial_Advisor = 0
			and COL_AE_Misconduct = 0
			and COL_AE_Wills_Estate = 0 
			and COL_AE_Corporate > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_AE_Corporate_Loss,

	
		(case when COL_AE_Breach_of_Contract > 0 
			or COL_AE_Breach_of_Fiduciary_Liability > 0
			or COL_AE_Financial_Advisor > 0
			or COL_AE_Misconduct > 0
			or COL_AE_Wills_Estate > 0 
			or COL_AE_Corporate > 0
		then 0.0 else COL_AE_Tax_Liability end) as COL_AE_Tax_Liability_Count,
	
		(Case When COL_AE_Breach_of_Contract = 0 
			and COL_AE_Breach_of_Fiduciary_Liability = 0
			and COL_AE_Financial_Advisor = 0
			and COL_AE_Misconduct = 0
			and COL_AE_Wills_Estate = 0 
			and COL_AE_Corporate = 0
			and COL_AE_Tax_Liability > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_AE_Tax_Liability_Loss,

	
		(case when COL_AE_Breach_of_Contract > 0 
			or COL_AE_Breach_of_Fiduciary_Liability > 0
			or COL_AE_Financial_Advisor > 0
			or COL_AE_Misconduct > 0
			or COL_AE_Wills_Estate > 0 
			or COL_AE_Corporate > 0
			or COL_AE_Tax_Liability > 0
		then 0.0 else COL_AE_Violation_GAAP end) as COL_AE_Violation_GAAP_Count,
	
		(Case When COL_AE_Breach_of_Contract = 0 
			and COL_AE_Breach_of_Fiduciary_Liability = 0
			and COL_AE_Financial_Advisor = 0
			and COL_AE_Misconduct = 0
			and COL_AE_Wills_Estate = 0 
			and COL_AE_Corporate = 0
			and COL_AE_Tax_Liability = 0
			and COL_AE_Violation_GAAP > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_AE_Violation_GAAP_Loss,
	
		(case when COL_AE_Breach_of_Contract = 0
			and COL_AE_Breach_of_Fiduciary_Liability = 0
			and COL_AE_Financial_Advisor = 0
			and COL_AE_Misconduct = 0
			and COL_AE_Wills_Estate = 0
			and COL_AE_Corporate = 0
			and COL_AE_Tax_Liability = 0
			and COL_AE_Violation_GAAP = 0
			and product = ''AE''
		then 1 else 0 end) as COL_AE_ALL_Other_Count,
	
		(Case When COL_AE_Breach_of_Contract = 0
			and COL_AE_Breach_of_Fiduciary_Liability = 0
			and COL_AE_Financial_Advisor = 0
			and COL_AE_Misconduct = 0
			and COL_AE_Wills_Estate = 0
			and COL_AE_Corporate = 0
			and COL_AE_Tax_Liability = 0
			and COL_AE_Violation_GAAP = 0
			and product = ''AE''
		 then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_AE_ALL_Other_Loss,

	 COL_CL_Breach_of_Contract as COL_CL_Breach_of_Contract_Count,
	
		(Case When COL_CL_Breach_of_Contract > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_Breach_of_Contract_Loss,

	
		(case when COL_CL_Breach_of_Fiduciary_Liability > 0 
		then COL_CL_Breach_of_Fiduciary_Liability else 0.0 end) as COL_CL_Breach_of_Fiduciary_Liability_Count, 
	
		(Case When COL_CL_Breach_of_Contract = 0 
			AND COL_CL_Breach_of_Fiduciary_Liability > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_Breach_of_Fiduciary_Liability_Loss,

	
		(case when COL_CL_Breach_of_Contract > 0 
			or COL_CL_Breach_of_Fiduciary_Liability > 0
		then 0.0 else COL_CL_Financial_Advisor end) as COL_CL_Financial_Advisor_Count,
	
		(Case When COL_CL_Breach_of_Contract = 0 
			and COL_CL_Breach_of_Fiduciary_Liability = 0
			and COL_CL_Financial_Advisor > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_Financial_Advisor_Loss,

	 
		(case when COL_CL_Breach_of_Contract > 0 
			or COL_CL_Breach_of_Fiduciary_Liability > 0
			or COL_CL_Financial_Advisor > 0
		then 0.0 else COL_CL_Misconduct end) as COL_CL_Misconduct_Count,
	
		(Case when COL_CL_Breach_of_Contract = 0 
			and COL_CL_Breach_of_Fiduciary_Liability = 0
			and COL_CL_Financial_Advisor = 0 
			and COL_CL_Misconduct > 0
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_Misconduct_Loss,

	 
		(case when COL_CL_Breach_of_Contract > 0 
			or COL_CL_Breach_of_Fiduciary_Liability > 0
			or COL_CL_Financial_Advisor > 0
			or COL_CL_Misconduct > 0 
		then 0.0 else COL_CL_Wills_Estate end) as COL_CL_Wills_Estate_Count,
	
		(Case When COL_CL_Breach_of_Contract = 0 
			and COL_CL_Breach_of_Fiduciary_Liability = 0
			and COL_CL_Financial_Advisor = 0
			and COL_CL_Misconduct = 0 
			and COL_CL_Wills_Estate > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_Wills_Estate_Loss,

	 	
		(case when COL_CL_Breach_of_Contract > 0 
			or COL_CL_Breach_of_Fiduciary_Liability > 0
			or COL_CL_Financial_Advisor > 0
			or COL_CL_Misconduct > 0
			or COL_CL_Wills_Estate > 0 
		then 0.0 else COL_CL_Corporate end) as COL_CL_Corporate_Count,
	
		(Case When COL_CL_Breach_of_Contract = 0 
			and COL_CL_Breach_of_Fiduciary_Liability = 0
			and COL_CL_Financial_Advisor = 0
			and COL_CL_Misconduct = 0
			and COL_CL_Wills_Estate = 0 
			and COL_CL_Corporate > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_Corporate_Loss,

	 
		(case when COL_CL_Breach_of_Contract > 0 
			or COL_CL_Breach_of_Fiduciary_Liability > 0
			or COL_CL_Financial_Advisor > 0
			or COL_CL_Misconduct > 0
			or COL_CL_Wills_Estate > 0 
			or COL_CL_Corporate > 0
		then 0.0 else COL_CL_Tax_Liability end) as COL_CL_Tax_Liability_Count,
	
		(Case When COL_CL_Breach_of_Contract = 0 
			and COL_CL_Breach_of_Fiduciary_Liability = 0
			and COL_CL_Financial_Advisor = 0
			and COL_CL_Misconduct = 0
			and COL_CL_Wills_Estate = 0 
			and COL_CL_Corporate = 0
			and COL_CL_Tax_Liability > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_Tax_Liability_Loss,

	
		(case when COL_CL_Breach_of_Contract > 0 
			or COL_CL_Breach_of_Fiduciary_Liability > 0
			or COL_CL_Financial_Advisor > 0
			or COL_CL_Misconduct > 0
			or COL_CL_Wills_Estate > 0 
			or COL_CL_Corporate > 0
			or COL_CL_Tax_Liability > 0
		then 0.0 else COL_CL_Violation_GAAP end) as COL_CL_Violation_GAAP_Count,
	 
		(Case When COL_CL_Breach_of_Contract = 0 
			and COL_CL_Breach_of_Fiduciary_Liability = 0
			and COL_CL_Financial_Advisor = 0
			and COL_CL_Misconduct = 0
			and COL_CL_Wills_Estate = 0 
			and COL_CL_Corporate = 0
			and COL_CL_Tax_Liability = 0
			and COL_CL_Violation_GAAP > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_Violation_GAAP_Loss,

	
		(case when COL_CL_Breach_of_Contract > 0 
			or COL_CL_Breach_of_Fiduciary_Liability > 0
			or COL_CL_Financial_Advisor > 0
			or COL_CL_Misconduct > 0
			or COL_CL_Wills_Estate > 0 
			or COL_CL_Corporate > 0
			or COL_CL_Tax_Liability > 0
			or COL_CL_Violation_GAAP > 0
		then 0.0 else COL_CL_Negligent_Training end) as COL_CL_Negligent_Training_Count,
	
		(Case When COL_CL_Breach_of_Contract = 0 
			and COL_CL_Breach_of_Fiduciary_Liability = 0
			and COL_CL_Financial_Advisor = 0
			and COL_CL_Misconduct = 0
			and COL_CL_Wills_Estate = 0 
			and COL_CL_Corporate = 0
			and COL_CL_Tax_Liability = 0
			and COL_CL_Violation_GAAP = 0
			and COL_CL_Negligent_Training > 0 
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_Negligent_Training_Loss,

	 
		(case when COL_CL_Breach_of_Contract > 0 
			or COL_CL_Breach_of_Fiduciary_Liability > 0
			or COL_CL_Financial_Advisor > 0
			or COL_CL_Misconduct > 0
			or COL_CL_Wills_Estate > 0 
			or COL_CL_Corporate > 0
			or COL_CL_Tax_Liability > 0
			or COL_CL_Violation_GAAP > 0
			or COL_CL_Negligent_Training > 0
		then 0.0 else COL_CL_Electronic_Data_Damage end) as COL_CL_Electronic_Data_Damage_Count,
	
		(Case When COL_CL_Breach_of_Contract = 0 
			and COL_CL_Breach_of_Fiduciary_Liability = 0
			and COL_CL_Financial_Advisor = 0
			and COL_CL_Misconduct = 0
			and COL_CL_Wills_Estate = 0 
			and COL_CL_Corporate = 0
			and COL_CL_Tax_Liability = 0
			and COL_CL_Violation_GAAP = 0
			and COL_CL_Negligent_Training = 0
			and COL_CL_Electronic_Data_Damage > 0
		then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_Electronic_Data_Damage_Loss,
	
	
		(case when COL_CL_Breach_of_Contract = 0
			and COL_CL_Breach_of_Fiduciary_Liability = 0
			and COL_CL_Financial_Advisor = 0
			and COL_CL_Misconduct = 0
			and COL_CL_Wills_Estate = 0
			and COL_CL_Corporate = 0
			and COL_CL_Tax_Liability = 0
			and COL_CL_Violation_GAAP = 0
			and COL_CL_Negligent_Training = 0
			and COL_CL_Electronic_Data_Damage = 0
			and product = ''CL''
		then 1 else 0 end) as COL_CL_ALL_Other_Count,
	
		(Case When COL_CL_Breach_of_Contract = 0
			and COL_CL_Breach_of_Fiduciary_Liability = 0
			and COL_CL_Financial_Advisor = 0
			and COL_CL_Misconduct = 0
			and COL_CL_Wills_Estate = 0
			and COL_CL_Corporate = 0
			and COL_CL_Tax_Liability = 0
			and COL_CL_Violation_GAAP = 0
			and COL_CL_Negligent_Training = 0
			and COL_CL_Electronic_Data_Damage = 0
			and product = ''CL''
		 then Incurred_Loss_ALAE_with_SS else 0.0 end) as COL_CL_ALL_Other_Loss,


COL_GLBI_Malpractice as COL_GLBI_Malpractice_Count,
(Case When COL_GLBI_Malpractice > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_GLBI_Malpractice_Loss,
COL_GLBI_Fraud_Breach_of_Contract as COL_GLBI_Fraud_Breach_of_Contract_Count,
(Case When COL_GLBI_Fraud_Breach_of_Contract > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_GLBI_Fraud_Breach_of_Contract_Loss,
COL_GLBI_Injury as COL_GLBI_Injury_Count,
(Case When COL_GLBI_Injury > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_GLBI_Injury_Loss,
COL_GLBI_Other as COL_GLBI_Other_Count,
(Case When COL_GLBI_Other > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_GLBI_Other_Loss,
COL_GLBI_Sexual_Assault_Molest_Abuse as COL_GLBI_Sexual_Assault_Molest_Abuse_Count,
(Case When COL_GLBI_Sexual_Assault_Molest_Abuse > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_GLBI_Sexual_Assault_Molest_Abuse_Loss,
(Case When COL_GLBI_Discrim_WrongfulTermination > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_GLBI_Discrim_WrongfulTermination_Loss,
COL_GLBI_Discrim_WrongfulTermination as COL_GLBI_Discrim_WrongfulTermination_Count,
(Case When COL_GLBI_SlanderDefamtion > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_GLBI_SlanderDefamtion_Loss,
COL_GLBI_SlanderDefamtion as COL_GLBI_SlanderDefamtion_Count,
(Case When COL_GLBI_Theft > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_GLBI_Theft_Loss,
COL_GLBI_Theft as COL_GLBI_Theft_Count,
(Case When COL_GLBI_PropertyDamage > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_GLBI_PropertyDamage_Loss,
COL_GLBI_PropertyDamage as COL_GLBI_PropertyDamage_Count,
COL_Prop_Fire_Lightning_Explosion as COL_Prop_Fire_Lightning_Explosion_Count,
(Case When COL_Prop_Fire_Lightning_Explosion > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Prop_Fire_Lightning_Explosion_Loss,
COL_Prop_Theft_Van as COL_Prop_Theft_Van_Count,
(Case When COL_Prop_Theft_Van > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Prop_Theft_Van_Loss,
COL_Prop_Water_Sprinkler as COL_Prop_Water_Sprinkler_Count,
(Case When COL_Prop_Water_Sprinkler > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Prop_Water_Sprinkler_Loss,
COL_Prop_Water_Other as COL_Prop_Water_Other_Count,
(Case When COL_Prop_Water_Other> 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Prop_Water_Other_Loss,
COL_Prop_Wind_Hail as COL_Prop_Wind_Hail_Count,
(Case When COL_Prop_Wind_Hail > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Prop_Wind_Hail_Loss,
COL_Prop_Other as COL_Prop_Other_Count,
(Case When COL_Prop_Other > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_Prop_Other_Loss,
COL_AUTO_LIAB_AllOther as COL_AUTO_LIAB_AllOther_Count,
(Case When COL_AUTO_LIAB_AllOther > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_AUTO_LIAB_AllOther_Loss,
COL_AUTO_LIAB_PropDam as COL_AUTO_LIAB_PropDam_Count,
(Case When COL_AUTO_LIAB_PropDam > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_AUTO_LIAB_PropDam_Loss,
COL_AUTO_PHYS_Coll as COL_AUTO_PHYS_Coll_Count,
(Case When COL_AUTO_PHYS_Coll > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_AUTO_PHYS_Coll_Loss,
COL_AUTO_PHYS_Glass as COL_AUTO_PHYS_Glass_Count,
(Case When COL_AUTO_PHYS_Glass > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_AUTO_PHYS_Glass_Loss,
COL_AUTO_PHYS_Other as COL_AUTO_PHYS_Other_Count,
(Case When COL_AUTO_PHYS_Other > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_AUTO_PHYS_Other_Loss,
COL_AUTO_PHYS_Theft as COL_AUTO_PHYS_Theft_Count,
(Case When COL_AUTO_PHYS_Theft > 0 then Incurred_Loss_ALAE_with_SS_Noncat else 0.0 end) as COL_AUTO_PHYS_Theft_Loss,



	(case
		when coverage_group in (''GL'',''Professional'',''Med Mal'') 
		then (select distinct PG.GL_LDF_Group from Act_Definitions.dbo.Product_Groups_MIPS PG where PG.Productcode = step1a.Product)
		when coverage_group in (''Fire & Allied'',''Inland Marine'',''Boiler & Machinery'',''Crime'',''Earthquake'',''Flood'',''Glass'',''Inland'',''Mine'',''Ult Cov'')
		then (select distinct PG.Property_LDF_Group	from Act_Definitions.dbo.Product_Groups_MIPS PG where PG.Productcode = step1a.Product)
		when coverage_group in (''D&O'', ''EPL'', ''Fiduciary'', ''Internet'', ''Workplace Violence'')
		then (select distinct PG.DO_LDF_Group from Act_Definitions.dbo.Product_Groups_MIPS PG where PG.Productcode = step1a.Product)
		when coverage_group = ''E&O''
		then (select distinct PG.EO_LDF_Group from Act_Definitions.dbo.Product_Groups_MIPS PG where PG.Productcode = step1a.Product)
		else ''ALL''
		end) as LDF_Group,

	Case_Loss,
	Case_ALAE,
	Paid_Loss,
	Paid_ALAE,
	Sal_Subro,	
	Capping_Factor,
	Incurred_Loss_ALAE_with_SS_CatOnly,
	Incurred_Loss_ALAE_with_SS_NonCat,
	Incurred_Loss_ALAE_without_SS_CatOnly,
	Incurred_Loss_ALAE_without_SS_NonCat,
	Incurred_Loss_ALAE_with_SS,
	Incurred_Loss_ALAE_without_SS,
	Cause_of_Loss_group

from (

select
	company,
	accountnumber,
	Policy_number,
	Claim_number,
	Cat_Non_cat,
	monoline_aslob,
	Exp_product,
	product,
	Premium_State,
	Territory,
	Subline,
	coverage_id,
	step1a1.Coverage_group,
    isnull(crg.Coverage_Reporting_Group,''Other'') as Coverage_Reporting_group,
	Coverage_Form,
	Accident_Year,
	accident_month,
	 @Fiscal_AY_Month_Ending as Fiscal_AY_Month_Ending,
	 	(case 
		when accident_month <= @Fiscal_AY_Month_Ending then Accident_Year
		else Accident_Year + 1
		end) as Fiscal_AY_Year,
	--(Case 
	--	when @Fiscal_AY_Month_Ending = 1 then 
	--		(Select distinct Fiscal_Year_end_month_1
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 2 then 
	--		(Select distinct Fiscal_Year_end_month_2
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 3 then 
	--		(Select distinct Fiscal_Year_end_month_3
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 4 then 
	--		(Select distinct Fiscal_Year_end_month_4
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 5 then
	--		(Select distinct Fiscal_Year_end_month_5
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 6 then 
	--		(Select distinct Fiscal_Year_end_month_6
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 7 then 
	--		(Select distinct Fiscal_Year_end_month_7
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 8 then 
	--		(Select distinct Fiscal_Year_end_month_8
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 9 then 
	--		(Select distinct Fiscal_Year_end_month_9
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 10 then 
	--		(Select distinct Fiscal_Year_end_month_10
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 11 then 
	--		(Select distinct Fiscal_Year_end_month_11
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	when @Fiscal_AY_Month_Ending = 12 then 
	--		(Select distinct Fiscal_Year_end_month_12
	--		from Act_definitions.dbo.Cal_yr_MM_QTR_Fiscal YR
	--		where convert(float,Accident_Year) = YR.Calendar_Year
	--			and Convert(float,accident_month) = YR.Calendar_Month)
	--	else 1900
	--	end) as Fiscal_AY_Year,
	report_year,
	report_month,
	policy_year,
	policy_month,
	type_of_loss,
	Type_of_Loss_desc,
	Claim_desc,

/* there may be an issue with NY GL COL codes (see yan''s code) */
(Case when Cause_of_Loss_group = ''Breach of Contract'' then 1 else 0 end) as COL_Breach_of_Contract,
(Case when Cause_of_Loss_group = ''Discrimination'' then 1 else 0 end) as COL_Discrimination,
(Case when Cause_of_Loss_group = ''Wrongful Termination'' then 1 else 0 end) as COL_Wrongful_Termination,
(Case when Cause_of_Loss_group = ''Harrassment'' then 1 else 0 end) as COL_Harrassment,
(Case when Cause_of_Loss_group = ''D&O Other'' then 1 else 0 end) as COL_DO_Other,
(Case when Cause_of_Loss_group = ''EPL Other'' then 1 else 0 end) as COL_EPL_Other,
(Case when Cause_of_Loss_group = ''Fiduciary Other'' then 1 else 0 end) as COL_Fiduciary_Other,
(Case when Cause_of_Loss_group = ''Worplace Violence Other'' then 1 else 0 end) as COL_Worplace_Violence_Other,
(Case when Cause_of_Loss_group = ''Internet Other'' then 1 else 0 end) as COL_Internet_Other,
(Case when Cause_of_Loss_group = ''SLD All Other'' then 1 else 0 end) as COL_SLD_All_Other,
(Case when Cause_of_Loss_group = ''AE Breach of Contract'' then 1 else 0 end) as COL_AE_Breach_of_Contract,
(Case when Cause_of_Loss_group = ''AE Breach of Fiduciary Liability'' then 1 else 0 end) as COL_AE_Breach_of_Fiduciary_Liability,
(Case when Cause_of_Loss_group = ''AE Financial Advisor'' then 1 else 0 end) as COL_AE_Financial_Advisor,
(Case when Cause_of_Loss_group = ''AE Misconduct'' then 1 else 0 end) as COL_AE_Misconduct,
(Case when Cause_of_Loss_group = ''AE Wills Estate'' then 1 else 0 end) as COL_AE_Wills_Estate,
(Case when Cause_of_Loss_group = ''AE Corporate'' then 1 else 0 end) as COL_AE_Corporate,
(Case when Cause_of_Loss_group = ''AE Tax Liability'' then 1 else 0 end) as COL_AE_Tax_Liability,
(Case when Cause_of_Loss_group = ''AE Violation GAAP'' then 1 else 0 end) as COL_AE_Violation_GAAP,
(Case when Cause_of_Loss_group = ''AE All Other'' then 1 else 0 end) as COL_AE_ALL_Other,
(Case when Cause_of_Loss_group = ''CL Breach of Contract'' then 1 else 0 end) as COL_CL_Breach_of_Contract,
(Case when Cause_of_Loss_group = ''CL Breach of Fiduciary Liability'' then 1 else 0 end) as COL_CL_Breach_of_Fiduciary_Liability,
(Case when Cause_of_Loss_group = ''CL Financial Advisor'' then 1 else 0 end) as COL_CL_Financial_Advisor,
(Case when Cause_of_Loss_group = ''CL Misconduct'' then 1 else 0 end) as COL_CL_Misconduct,
(Case when Cause_of_Loss_group = ''CL Wills Estate'' then 1 else 0 end) as COL_CL_Wills_Estate,
(Case when Cause_of_Loss_group = ''CL Corporate'' then 1 else 0 end) as COL_CL_Corporate,
(Case when Cause_of_Loss_group = ''CL Tax Liability'' then 1 else 0 end) as COL_CL_Tax_Liability,
(Case when Cause_of_Loss_group = ''CL Violation GAAP'' then 1 else 0 end) as COL_CL_Violation_GAAP,
(Case when Cause_of_Loss_group = ''CL Negligent Training'' then 1 else 0 end) as COL_CL_Negligent_Training,
(Case when Cause_of_Loss_group = ''CL Eletronic Data Damage'' then 1 else 0 end) as COL_CL_Electronic_Data_Damage,

(Case when Cause_of_Loss_group = ''CL All Other'' then 1 else 0 end) as COL_CL_ALL_Other,
 (Case when Cause_of_Loss_group = ''GLBI_Malpractice'' then 1 else 0 end) as COL_GLBI_Malpractice,
(Case when Cause_of_Loss_group = ''GLBI_Fraud_Breach_of_Contract'' then 1 else 0 end) as COL_GLBI_Fraud_Breach_of_Contract,
(Case when Cause_of_Loss_group = ''GLBI_Sexual_Assault_Molest_Abuse'' then 1 else 0 end) as COL_GLBI_Sexual_Assault_Molest_Abuse,
(Case when Cause_of_Loss_group = ''GLBI_Discrim_WrongfulTermination'' then 1 else 0 end) as COL_GLBI_Discrim_WrongfulTermination,
(Case when Cause_of_Loss_group = ''GLBI_SlanderDefamtion'' then 1 else 0 end) as COL_GLBI_SlanderDefamtion,
(Case when Cause_of_Loss_group = ''GLBI_Theft'' then 1 else 0 end) as COL_GLBI_Theft,
(Case when Cause_of_Loss_group = ''GLBI_PropertyDamage'' then 1 else 0 end) as COL_GLBI_PropertyDamage,
(Case when Cause_of_Loss_group = ''GLBI_Injury'' then 1 else 0 end) as COL_GLBI_Injury,
(Case when Cause_of_Loss_group = ''GLBI_Other'' then 1 else 0 end) as COL_GLBI_Other,
(Case when Cause_of_Loss_group = ''Prop_Water_Sprinkler'' then 1 else 0 end) as COL_Prop_Water_Sprinkler,
(Case when Cause_of_Loss_group = ''Prop_Water_Other'' then 1 else 0 end) as COL_Prop_Water_Other,

(Case when Cause_of_Loss_group = ''Prop_Wind_Hail'' then 1 else 0 end) as COL_Prop_Wind_Hail,
 (Case when Cause_of_Loss_group = ''Prop_Theft_Van'' then 1 else 0 end) as COL_Prop_Theft_Van,
(Case when Cause_of_Loss_group = ''Prop_Fire_Lightning_Explosion'' then 1 else 0 end) as COL_Prop_Fire_Lightning_Explosion,
(Case when Cause_of_Loss_group = ''Prop_Other'' then 1 else 0 end) as COL_Prop_Other,
(Case when Cause_of_Loss_group = ''AUTO_LIAB_AllOther'' then 1 else 0 end) as COL_AUTO_LIAB_AllOther,
(Case when Cause_of_Loss_group = ''AUTO_LIAB_PropDam'' then 1 else 0 end) as COL_AUTO_LIAB_PropDam,
(Case when Cause_of_Loss_group = ''AUTO_PHYS_Coll'' then 1 else 0 end) as COL_AUTO_PHYS_Coll,
(Case when Cause_of_Loss_group = ''AUTO_PHYS_Theft'' then 1 else 0 end) as COL_AUTO_PHYS_Theft,
(Case when Cause_of_Loss_group = ''AUTO_PHYS_Glass'' then 1 else 0 end) as COL_AUTO_PHYS_Glass,
(Case when Cause_of_Loss_group = ''AUTO_PHYS_Other'' then 1 else 0 end) as COL_AUTO_PHYS_Other,


	sum(Case_Loss) as Case_Loss,
	sum(Case_ALAE) as Case_ALAE,
	sum(Paid_Loss) as Paid_Loss,
	sum(Paid_ALAE) as Paid_ALAE,
	sum(Sal_Subro) as Sal_Subro,	
	Capping_Factor,
	sum(Incurred_Loss_ALAE_with_SS) as Incurred_Loss_ALAE_with_SS,
	sum(Incurred_Loss_ALAE_without_SS) as Incurred_Loss_ALAE_without_SS,
	(case 
		when Cat_Non_cat = ''Cat''
		then sum(Incurred_Loss_ALAE_with_SS)
		else 0 end)	Incurred_Loss_ALAE_with_SS_CatOnly ,
	(case 
		when Cat_Non_cat = ''Non_Cat''
		then sum(Incurred_Loss_ALAE_without_SS)
		else 0 end) as Incurred_Loss_ALAE_without_SS_NonCat,
	(case 
		when Cat_Non_cat = ''Cat''
		then sum(Incurred_Loss_ALAE_without_SS)
		else 0 end) Incurred_Loss_ALAE_without_SS_CatOnly,
	(case 
		when Cat_Non_cat = ''Non_Cat''
		then sum(Incurred_Loss_ALAE_with_SS)
		else 0 end) as Incurred_Loss_ALAE_with_SS_NonCat,
	


	Region_in_State = '''',

	Class_Group = '''',
	Cause_of_Loss_group
from (
select *,

	(case 
	when product in (''DF'', ''FF'', ''EP'', ''PV'')	--1st case (These Products Do Not Change)
	then 
/*Non-Profit D&O, Private Company D&O, Flexi */		
		(case when (type_of_Loss in (''FF1BC'',''FF2BEC'',''FLXBC'',''FLXBEC'',''DOBC'',''DOBEC'') 
				  or upper(claim_desc) like ''%BREACHED CONTRACT%''
  				  or upper(claim_desc) like ''%FRAUD%''
  				  or upper(claim_desc) like ''%BREACH OF%'')
		then ''Breach of Contract''
		when type_of_Loss in (''FLXSD'',''FF2SD'',''DOSD'',  -- Sex Discrimination
    			''FLXAD'',''FF2AD'',''DOAD'',  -- Age Discrimination
   				''FLXRD'',''FL2RD'',''DORD'',  -- Race Discrimination
    			''FLXNOD'',''FF2NOD'',''DONOD'', -- National Origin Discrimination
    			''FLXREL'',''FF2REL'',''DORLD'',  -- Religious Discrimination
   				''FLXDD'',''FF2DD'',''DODD'')  -- Disability Discrimination
  				or upper(claim_desc) like ''%EEOC%''
  				or upper(claim_desc) like ''%DISRIM%''
  				or upper(claim_desc) like ''%DISCRIM%''
		then ''Discrimination''
		when (type_of_Loss in (''FLXWT'',''FF2WT'',''DOWT'') 
  				or upper(claim_desc) like ''%LAID OFF%''
 				or upper(claim_desc) like ''%DISMISS%''
  				or upper(claim_desc) like ''%DISCHARG%''
  				or upper(claim_desc) like ''%FIRED%''
  				or upper(claim_desc) like ''%WRONGFUL%TERM%''
  				or upper(claim_desc) like ''%POOR WORK PERFORMANCE%''
  				or upper(claim_desc) like ''%TERMINAT%'')
		then ''Wrongful Termination''
		when (type_of_Loss in (''FLXSH'',''FF2SH'',''DOSH'') 
 			 or upper(claim_desc) like ''%HARRASSMENT%''
 			 or upper(claim_desc) like ''%HARASSMENT%''
			 or upper(claim_desc) like ''%WHISTLE BLOW%''
 			 or upper(claim_desc) like ''%RETALIAT%''
			 or upper(claim_desc) like ''%SLANDER%''
			 or upper(claim_desc) like ''%LIBEL%''
 			 or upper(claim_desc) like ''%DEFAMAT%''
 			 or upper(claim_desc) like ''%STALKING%''
			 or upper(claim_desc) like ''%INTIMIDAT%''
 			 or upper(claim_desc) like ''%MOLEST%''
 			 or upper(claim_desc) like ''%ABUSE%''
 			 or upper(claim_desc) like ''%STRIP SEARCH%''
			 or upper(claim_desc) like ''%SEXUAL%'')
		then ''Harrassment''
		when (type_of_Loss like ''FF1%'')
  			or upper(claim_desc) like ''%COPYRIGHT%''
  			or upper(claim_desc) like ''%ANTITRUST%''
 			or upper(claim_desc) like ''%SHERMAN ACT%''
  			or upper(claim_desc) like ''%CONFLICT OF INTEREST%''
 			or upper(claim_desc) like ''%BOARD OF DIRECTORS%''
  			or upper(claim_desc) like ''%BANKRUPT%''
		then ''D&O Other''
		when (type_of_Loss like ''FF2%'') then ''EPL Other''
		when (type_of_Loss like ''FF3%''
  			or upper(claim_desc) like ''%STOLE%''
  			or upper(claim_desc) like ''%FORGERY%''
  			or upper(claim_desc) like ''%EMBEZZLE%''
  			or upper(claim_desc) like ''%EMPLOYEE DISHONESTY%''
  			or upper(claim_desc) like ''%STEAL%'')
		then ''Fiduciary Other''
		when (type_of_Loss like ''FF4%'') then ''Worplace Violence Other''
		when (type_of_Loss like ''FF5%'') then ''Internet Other''
		else ''SLD All Other''
		end) 
/*Accountants E&O Cause of Loss*/
	when product = ''AE'' 
	then (case 
		when (type_of_Loss in (''ALBC'')) then ''AE Breach of Contract''
		when (type_of_Loss in (''ALBFD'')) then ''AE Breach of Fiduciary Liability''
		when (type_of_loss = ''ALFA'' or upper(claim_desc) like ''%CONSULTANT LIAB%'')
		then ''AE Financial Advisor''
		when type_of_Loss in (
					''ALMIS'', -- Misrepresentation
    				''ALCF'',  -- Consumer Fraud
    				''ALCI'',  -- Conflict of Interest
    				''ALAA'')  -- Aiding & Abetting
		then ''AE Misconduct''
		when type_of_loss in (
					''ALWET'', -- Wills Estates Trusts
    				''ALWEP'') -- Wills Estate Planning
		then ''AE Wills Estate''
		when type_of_Loss in (''LPCOR'') then ''AE Corporate''
		when type_of_loss = ''ALTL'' or upper(claim_desc) like ''%TAX LIAB%''
		then ''AE Tax Liability''
		when type_of_loss = ''ALVGP'' or upper(claim_desc) like ''%GAAP%''
		then ''AE Violation GAAP''
		else ''AE All Other''
		end)
/*Misc Professional Liability Cause of Loss*/
	when product in (''CL'')
	then (case 
		when (type_of_Loss in (''ALBC'')) then ''CL Breach of Contract''
		when (type_of_Loss in (''ALBFD'')) then ''CL Breach of Fiduciary Liability''
		when (type_of_loss = ''ALFA'' or upper(claim_desc) like ''%CONSULTANT LIAB%'')
		then ''CL Financial Advisor''
		when type_of_Loss in (
					''ALMIS'', -- Misrepresentation
    				''ALCF'',  -- Consumer Fraud
    				''ALCI'',  -- Conflict of Interest
    				''ALAA'',''CLCI'',''CLDEF'',''CLIP'',''LPBC'',''MHCFR'')
				or upper(claim_desc) like ''%MISREPRESENTATION%''
				or upper(claim_desc) like ''%BREACH OF%''
				or upper(claim_desc) like ''%INVASION OF PRIVACY%''
				or upper(claim_desc) like ''%COPY RIGHT%''
				or upper(claim_desc) like ''%COPYRIGHT%''
				or upper(claim_desc) like ''%DEFAMATION%''
		then ''CL Misconduct''
		when type_of_loss in (
					''ALWET'', -- Wills Estates Trusts
    				''ALWEP'') -- Wills Estate Planning
		then ''CL Wills Estate''
		when type_of_Loss in (''LPCOR'') then ''CL Corporate''
		when type_of_loss = ''ALTL'' or upper(claim_desc) like ''%TAX LIAB%''
		then ''CL Tax Liability''
		when type_of_loss = ''ALVGP'' or upper(claim_desc) like ''%GAAP%''
		then ''CL Violation GAAP''
		when type_of_Loss in (''CLNTE'',''ALAO'',''LPAO'') then ''CL Negligent Training''
		when type_of_loss = ''CLED'' then ''CL Electronic Data Damage''
		else ''CL All Other''
		end)
	else

/*GL Cause of Loss*/
	(case
		when ((Exp_product like ''%D'') or (Exp_product like ''%K''))
		then 

		(case
		when type_of_Loss = ''GLBI''
	  			and (upper(claim_desc) like ''% MALPRACT%'') 
		then ''GLBI_Malpractice''

		when type_of_Loss = ''GLBI''
	  			and (upper(claim_desc) like ''%BREACH OF %''
   				or upper(claim_desc) like ''% FRAUD%''
   				or upper(claim_desc) like ''% DECEPTI%''
   				or upper(claim_desc) like ''% MISREPRESENT%''
	   			or upper(claim_desc) like ''% TRADEMARK%''
   				or upper(claim_desc) like ''% MEMBERSHIP%''
   				or upper(claim_desc) like ''% EDUCATION MALPRACT%''
	   			or upper(claim_desc) like ''% TAKEN % TECHNICAL TRAINING METHODS%'' 
   				or upper(claim_desc) like ''% ADVERTIS%'') 
		then ''GLBI_Fraud_Breach_of_Contract''

		when type_of_Loss = ''GLBISA''
 				or (type_of_Loss in (''GLBI'', ''GLBIPA'')
		   			and ( upper(claim_desc) like ''% HARRASS%''
   					or upper(claim_desc) like ''% HARASS%''
		  			or upper(claim_desc) like ''%SEXUAL%''
  					or upper(claim_desc) like ''% IMPROPER TOUCH%''
		   			or upper(claim_desc) like ''% ABUSE %''
   					or upper(claim_desc) like ''% MOLEST%''))
		then ''GLBI_Sexual_Assault_Molest_Abuse''

		when type_of_Loss = ''GLBI''
	  			and (upper(claim_desc) like ''%DISCRIM%''
  				 or upper(claim_desc) like ''%UNFAIR EMPLOYMENT PRACTICE%''
  				 or upper(claim_desc) like ''%DISMISS%''
  				 or upper(claim_desc) like ''%WRONGFUL DISCHARGE%''
	  			 or upper(claim_desc) like ''%WRONGFUL TERMI%'')
		then ''GLBI_Discrim_WrongfulTermination''

		when  type_of_Loss = ''GLBI''
	 			and (upper(claim_desc) like ''%SLANDER%''
  				or upper(claim_desc) like ''%DEFAMAT%'') 
		then ''GLBI_SlanderDefamtion''

		when type_of_Loss in (''GLBIC'')
	 		 	and (upper(claim_desc) like ''% STOLE%''
  				or upper(claim_desc) like ''%THEFT %''
  				or upper(claim_desc) like ''% ROBBED%''
	  			or upper(claim_desc) like ''% MISSING%''
  				or upper(claim_desc) like ''% WAS TAKEN %'')	
		then ''GLBI_Theft''

		when type_of_Loss = ''GLBIC''
		  		or (type_of_Loss = ''GLBI''
    					and (upper(claim_desc) like ''%WATER DAMAGE%''
	      					or upper(claim_desc) like ''%LEAK%''))	
		then ''GLBI_PropertyDamage''

		when type_of_Loss = ''GLMP''
  			or (type_of_Loss in (''GLBI'', ''GLBIPA'')
				and (upper(claim_desc) like ''% FALL%''
   				or upper(claim_desc) like ''% ABRASION%''
				or upper(claim_desc) like ''% ABUSE %''
   				or upper(claim_desc) like ''% ACCIDENT %''
   				or upper(claim_desc) like ''% ALLERG%''
	 			or upper(claim_desc) like ''% AMPUTA%''
   				or upper(claim_desc) like ''% ANKLE %''
   				or upper(claim_desc) like ''% ARM %''
	   			or upper(claim_desc) like ''% ASSAULT%''
				or upper(claim_desc) like ''% ASSULT%''
   				or upper(claim_desc) like ''% ATTACKED %''
   				or upper(claim_desc) like ''% BANGED %''
	   			or upper(claim_desc) like ''% BIT BY %''
   				or upper(claim_desc) like ''% BITES %''
   				or upper(claim_desc) like ''% BITTEN %''
   				or upper(claim_desc) like ''% BLISTER%''
	   			or upper(claim_desc) like ''% BROKE%''
   				or upper(claim_desc) like ''% BUMPED %''
   				or upper(claim_desc) like ''% BURNED %''
	   			or upper(claim_desc) like ''% CABLE SNAP%''
   				or upper(claim_desc) like ''% CHOKED%''
   				or upper(claim_desc) like ''% CHEST %''
	   			or upper(claim_desc) like ''% COLLASPED%''
   				or upper(claim_desc) like ''% COLLIDED %''
   				or upper(claim_desc) like ''% CUT %''
				or upper(claim_desc) like ''% DEATH %''
				or upper(claim_desc) like ''% DEAD %''
	   			or upper(claim_desc) like ''% DIED %''
   				or upper(claim_desc) like ''% DISLOCATE%''
   				or upper(claim_desc) like ''% DROWN%''
				or upper(claim_desc) like ''% DROWNED %''
   				or upper(claim_desc) like ''% EAR %''
   				or upper(claim_desc) like ''% ECOLI %''
	   			or upper(claim_desc) like ''% ELBOW%''
   				or upper(claim_desc) like ''% ELECTROCUT%''
				or upper(claim_desc) like ''% FAINT%''
				or upper(claim_desc) like ''% FAINT%''
	   			or upper(claim_desc) like ''% FAINT%''
				or upper(claim_desc) like ''% FALL%''
				or upper(claim_desc) like ''% FELL%''
   				or upper(claim_desc) like ''% FIGHT%''
   				or upper(claim_desc) like ''% FINGER%''
				or upper(claim_desc) like ''% FOOT%''
   				or upper(claim_desc) like ''% FRACTURE%''
   				or upper(claim_desc) like ''% HAND%''
	   			or upper(claim_desc) like ''% HEAD %''
   				or upper(claim_desc) like ''% HEART RATE %''
   				or upper(claim_desc) like ''% HIT %''
	   			or upper(claim_desc) like ''% HUNG %''
   				or upper(claim_desc) like ''% HURT %''
   				or upper(claim_desc) like ''% ILL %''
	   			or upper(claim_desc) like ''% INHAL%''
   				or upper(claim_desc) like ''% INJUR%''
   				or upper(claim_desc) like ''% INGEST%''
	   			or upper(claim_desc) like ''% KICKED%''
   				or upper(claim_desc) like ''% KNEE%''
	   			or upper(claim_desc) like ''% LACERAT%''
   				or upper(claim_desc) like ''% LEG %''
   				or upper(claim_desc) like ''% LOST CONTROL %''
	   			or upper(claim_desc) like ''% MURDER%''
   				or upper(claim_desc) like ''% NAUSEA %''
   				or upper(claim_desc) like ''% NECK%''
	   			or upper(claim_desc) like ''% NEEDLE%''
   				or upper(claim_desc) like ''% PAIN IN %''
   				or upper(claim_desc) like ''% PASSED OUT%''
   				or upper(claim_desc) like ''% PASSED AWAY%''
	   			or upper(claim_desc) like ''% PNEUMONIA%''
   				or upper(claim_desc) like ''% POISON%''
   				or upper(claim_desc) like ''% PUNCHED%''
   				or upper(claim_desc) like ''% PUNCTURED%''
	   			or upper(claim_desc) like ''% RASH%''
   				or upper(claim_desc) like ''% RUPTURED%''
   				or upper(claim_desc) like ''% SCABIES %''
   				or upper(claim_desc) like ''% SCALDED %''
	   			or upper(claim_desc) like ''% SCAR%''
   				or upper(claim_desc) like ''% SCRATCHED%''
   				or upper(claim_desc) like ''% SEIZURE%''
   				or upper(claim_desc) like ''% SEVERED%''
	   			or upper(claim_desc) like ''% SHOT %''
   				or upper(claim_desc) like ''% SHOULDER%''
   				or upper(claim_desc) like ''% SICK %''
   				or upper(claim_desc) like ''% SLAPPED%''
	   			or upper(claim_desc) like ''% SLIP%''
   				or upper(claim_desc) like ''% STABBED%''
   				or upper(claim_desc) like ''% STAIRMASTER%''
   				or upper(claim_desc) like ''% STITCHES%''
	   			or upper(claim_desc) like ''% STROKE%''
   				or upper(claim_desc) like ''% STRUCK %''
   				or upper(claim_desc) like ''% STUNG %''
   				or upper(claim_desc) like ''% SUICID%''
	   			or upper(claim_desc) like ''% SYRINGE%''
   				or upper(claim_desc) like ''% TEETH %''
   				or upper(claim_desc) like ''% THUMB%''
   				or upper(claim_desc) like ''% TOE %''
	   			or upper(claim_desc) like ''% TOOTH %''
   				or upper(claim_desc) like ''% TRIPPED%''
   				or upper(claim_desc) like ''% TRIPPING%''
   				or upper(claim_desc) like ''% TWIST%''
	   			or upper(claim_desc) like ''% UNCONSCIOUS %''
   				or upper(claim_desc) like ''%WRONGFUL DEATH%''
   				or upper(claim_desc) like ''%BURN%''
   				or upper(claim_desc) like ''%FELL%''
	   			or upper(claim_desc) like ''%HEART ATTACK%''
   				or upper(claim_desc) like ''%MACHINE%''
   				or upper(claim_desc) like ''%SICK%''
 				or upper(claim_desc) like ''%SLIP%''
	   			or upper(claim_desc) like ''%SPRAINED%''
   				or upper(claim_desc) like ''%TREADMIL%''))
		then ''GLBI_Injury''
		else ''GLBI_Other''
		end)

		when (Exp_product like ''%A'' or Exp_product like ''%E'' or Exp_product like ''%F''
 			or Exp_product like ''%H'' or Exp_product like ''%L'' or Exp_product like ''%M'' 
			or Exp_product = ''45'')
 			and Exp_product not like ''44%'' 
		then (case 
			when (type_of_Loss like ''A%WD'' or type_of_Loss like ''UC%WD'' 
				or type_of_Loss like ''A%WDE'' or type_of_Loss like ''UC%WDE'')
	  			and (upper(claim_desc) like ''% SPRINKLER%'') 
			then ''Prop_Water_Sprinkler''

			when (type_of_Loss like ''A%WD'' or type_of_Loss like ''UC%WD'' 
				or type_of_Loss like ''A%WDE'' or type_of_Loss like ''UC%WDE'')
			then ''Prop_Water_Other''

			when (type_of_Loss like ''A%WH'' or type_of_loss like ''UC%WH'')
			then ''Prop_Wind_Hail''

			when (type_of_Loss like ''A%THE'' or type_of_Loss like ''A%VAN''
				or type_of_Loss like ''UC%THE'' or type_of_Loss like ''UC%VAN'')
			then ''Prop_Theft_Van''

			when (type_of_Loss like ''F%FL'' or type_of_loss like ''F%EX''
				or type_of_loss like ''UC%FL'' or type_of_loss like ''UC%EX'')
			then ''Prop_Fire_Lightning_Explosion''

			else ''Prop_OTHER'' 
			end)

		when Coverage_Group = ''Auto Liability'' 
		then (case
			when type_of_Loss =  ''CPD'' then ''AUTO_LIAB_PropDam''
			else ''AUTO_LIAB_AllOther''
			end)

		when Coverage_Group = ''Auto Phys Dam'' 
		then (case
			when type_of_Loss in (''COLL'',''GCOLL'') then ''AUTO_PHYS_Coll''
			when type_of_Loss =  ''CTHE'' then ''AUTO_PHYS_Theft''
			when type_of_Loss =  ''CGLA'' then ''AUTO_PHYS_Glass''
			else ''AUTO_PHYS_Other''
			end)
		end)
	end) 	Cause_of_Loss_group 
from (

Select 
	
	company,
	isnull(Dupe_fix.accountnumber,ML.account_number) as accountnumber,
	ML.Policy_number,
	Claim_number,
	(case 
		when isnull(ltrim(rtrim((
			select distinct m.compclaimnumber
			from accessphlyeom.dbo.claim m 
			where ML.claim_number = m.Claimnumber
				and	(select distinct CG.coverage_group2
					from Act_Definitions.dbo.coverage_groups CG
					where CG.coverage_id = ML.coverage_id)
					in (''Fire & Allied'', ''Inland Marine'',''Boiler & Machinery'',
						''Crime'',''Earthquake'',''Flood'',''Glass'',''Inland'',''Mine'')
					)
						)),'''')<>''''
			or 
				isnull(ltrim(rtrim((
					select distinct m.CAT_EventID
					from accessphlyeom.dbo.claim m 
					where ML.claim_number = m.Claimnumber)
				)),'''')<>''''
			then ''Cat''
			else ''Non_Cat''
			end) as Cat_Non_cat,
	aslob as monoline_aslob,
	Exp_product,
	product,
	Premium_State,
	Territory,
	Subline,
	Coverage_id,
	(case 
		when ML.coverage_id = ''GLBI'' 
			/*
			--update E&O Product list
			SELECT distinct char(39)+productcode+char(39)+'','' 
			FROM Accessphlyeom.dbo.ExperienceProducts
			WHERE UnderwritingLOB = ''EO''
			*/
			and product in (''AE'',
				''AI'',
				''CL'',
				''DM'',
				''EL'',
				''EO'',
				''EW'',
				''FT'',
				''HP'',
				''IE'',
				''LE'',
				''MC'',
				''PL'',
				''SB'')
		then ''E&O'' 
			/*
			--update E&O Product list
			SELECT distinct char(39)+productcode+char(39)+'','' 
			FROM Accessphlyeom.dbo.ExperienceProducts
			WHERE UnderwritingLOB = ''UMB''
			*/
		when ML.coverage_id = ''GLBI'' 
			and product in (''AC'',
				''AM'',
				''AU'',
				''BE'',
				''BU'',
				''CM'',
				''CR'',
				''CU'',
				''DU'',
				''EM'',
				''EU'',
				''FE'',
				''FM'',
				''FT'',
				''GM'',
				''GU'',
				''HU'',
				''IU'',
				''LU'',
				''ML'',
				''MM'',
				''MR'',
				''MU'',
				''NM'',
				''NU'',
				''OU'',
				''PD'',
				''PE'',
				''RM'',
				''RR'',
				''RU'',
				''SM'',
				''SU'',
				''TU'',
				''TV'',
				''UA'',
				''UB'',
				''UD'',
				''UE'',
				''UF'',
				''UG'',
				''UH'',
				''UI'',
				''UK'',
				''UL'',
				''UN'',
				''UP'',
				''UR'',
				''UT'',
				''UU'',
				''UV'',
				''UW'',
				''VM'',
				''VU'',
				''YU'')
		then ''Umbrella'' 
		else (
			select distinct CG.Coverage_Group2
			from Act_Definitions.dbo.Coverage_Groups CG
			where CG.Coveragecode = ML.Coverage_id) 
		end) as Coverage_group,
	(select distinct CG.Prop_Indication_key
			  from Act_Definitions.dbo.Coverage_Groups CG
			  where CG.Coveragecode = ML.Coverage_id) as Coverage_Form,
	Year(curr_date_of_loss) as Accident_Year,
	month(curr_date_of_loss) as Accident_month,
	year(date_reported) as report_year,
	month(date_reported) as report_month,
	year(effective_date) as policy_year,
	month(effective_date) as policy_month,

	type_of_loss,
	
		(select distinct LT.losstypedesc
			from AccessPHLYEOM.dbo.Losstype LT
			where LT.losstypecode = ML.Type_of_Loss
				and LT.Coveragecode = ML.Coverage_id
				and LT.policyTypecode = (Select distinct Pol.Policytypecode
								from AccessPHLYEOM.dbo.Policy Pol
								where ML.Policy_number = Pol.Policynumber)) as Type_of_Loss_desc,
	Claim_desc,
	(case
		when @Loss_ALAE_Cap < (select 	sum(total_case + (total_pdloss + total_salvage + total_subro) + total_clae + total_pdlae)
					from LossHistory.dbo.apps_losses ML2
					where ML.Claim_number = ML2.claim_number)
		then @Loss_ALAE_Cap / (select 	sum(total_case + (total_pdloss + total_salvage + total_subro) + total_clae + total_pdlae)
					from LossHistory.dbo.apps_losses ML2
					where ML.Claim_number = ML2.claim_number)
		else 1.0
		end) as Capping_Factor,
	sum(total_case) as Case_Loss,
	sum(total_clae) as Case_ALAE,
	sum(total_pdloss + total_salvage + total_subro) as Paid_Loss,
	sum(total_pdlae) as Paid_ALAE,
	sum(total_salvage + total_subro) as Sal_Subro,
	sum(total_case + (total_pdloss + total_salvage + total_subro) + total_clae + total_pdlae) 
		as Incurred_Loss_ALAE_with_SS,
	sum(total_case + (total_pdloss + total_salvage + total_subro) + total_clae + total_pdlae)
		- sum(total_salvage + total_subro)
			as Incurred_Loss_ALAE_without_SS

from LossHistory.dbo.apps_losses ML

--added for March 2012 run to fix indistinct policy/accounts in apps_losses
left outer join
(
select PolicyNumber, 
       AccountNumber 
from AccessPHLYEOM..policy p 
join
    (
     select policy_number 
            from (
                  select distinct 
                         policy_number, 
                         account_number
                  From LossHistory.dbo.apps_losses) a 
                  group by policy_number 
                  having COUNT(*)>1
    ) dupes
on p.policynumber=dupes.policy_number
) dupe_fix

on ML.Policy_Number=dupe_fix.policynumber
where Year(curr_date_of_loss) >= 2004
	and (acct_year*100 + acct_mm) <= (@Loss_Evaluation_Year*100 + @Loss_Evaluation_Month)

group by
	company,
    isnull(Dupe_fix.accountnumber,ML.account_number),
	Policy_number,
	Claim_number,
	aslob,
	Exp_product,
	product,
	Premium_State,
	Territory,
	Subline,
	Coverage_id,
	curr_date_of_loss,
	Date_reported,
	Effective_Date,
	type_of_loss,
	Claim_desc
)as step1
)as step1a1
left outer join Act_Definitions.dbo.Coverage_Reporting_Groups crg
on step1a1.Coverage_Group=crg.Coverage_Group
group by 
	company,
	accountnumber,
	Policy_number,
	Claim_number,
	Cat_Non_cat,
	monoline_aslob,
	Exp_product,
	product,
	Premium_State,
	Territory,
	Subline,
	coverage_id,
	step1a1.Coverage_group,
	Coverage_Reporting_Group,
	Coverage_Form,
	Cause_of_loss_group,
	Accident_Year,
	accident_month,
	report_year,
	report_month,
	policy_year,
	policy_month,
	type_of_loss,
	Type_of_Loss_desc,
	Capping_Factor,
	Claim_desc
)as Step1a
)as Step2
group by 
	step2.company,
	step2.accountnumber,
	step2.Policy_number,
	step2.Claim_number,
	step2.Exp_product,
	step2.product,
	step2.Premium_State,
	step2.Territory,
	step2.Cause_of_Loss_group,
	step2.Coverage_id,
	step2.Coverage_group,
	step2.Coverage_Reporting_Group,
	Coverage_Form,
	LDF_Group,
	step2.Accident_Year,
	step2.accident_month,
	step2.Fiscal_AY_Month_Ending,
	step2.Fiscal_AY_Year,
	step2.report_year,
	step2.report_month,
	step2.policy_year,
	step2.policy_month,
	step2.type_of_loss,
	step2.Type_of_Loss_desc,
	step2.Capping_Factor,
	step2.Claim_desc
) as Step3;


with #Latest_Claim_Trans_Yr_Mm (
	claim_number,
	Latest_Claim_Trans_Yr_Mm) as (
select 
	claim_number,
	Latest_Claim_Trans_Yr_Mm = MAX (acct_year * 100 + acct_mm)
from LossHistory.dbo.apps_losses 
group by claim_number)
update Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work
set 
Latest_Claim_Trans_Yr_Mm = LCT.Latest_Claim_Trans_Yr_Mm
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work LD
left join #Latest_Claim_Trans_Yr_Mm LCT
on LCT.claim_number = LD.claim_number;


with #Accident_State (
	claim_number,
	Latest_Claim_Trans_Yr_Mm,
	accident_state
) as (
select distinct 
	LCT.claim_number,
	LCT.Latest_Claim_Trans_Yr_Mm,
	accident_state = AL.Accident_State
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work LCT
left join  LossHistory.dbo.apps_losses AL
on LCT.Claim_Number = AL.Claim_number
	and LCT.Latest_Claim_Trans_Yr_Mm = AL.acct_year * 100 + AL.acct_mm
 )
update Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work 
set 
Accident_State = AcS.Accident_State
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work LD
left join #Accident_State AcS
on AcS.Latest_Claim_Trans_Yr_Mm = LD.Latest_Claim_Trans_Yr_Mm 
and AcS.claim_number = LD.claim_number;

with #Policy_Premium_by_Cov_state (
	policynumber,
	statecode,
	experienceproduct,
	Coverage_group,
	coverage_form,
	acctngyear,
	Fiscal_AY_Month_Ending,
	Fiscal_AY_Year,
	Currentwrittenpremium
) as (
select 
	policynumber = PS.policynumber,
	statecode = PS.statecode,
	experienceproduct = PS.experienceproduct,
	Coverage_group = PS.Coverage_Group,
	coverage_form = PS.Coverage_Form,
	acctngyear = PS.acctngyear,
	Fiscal_AY_Month_Ending = PS.Fiscal_AY_Month_Ending,
	Fiscal_AY_Year = PS.Fiscal_AY_Year,
	Currentwrittenpremium = SUM(currentwrittenpremium)
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work PS
group by 
	policynumber,
	statecode,
	experienceproduct,
	Coverage_group,
	coverage_form,
	acctngyear,
	Fiscal_AY_Month_Ending,
	Fiscal_AY_Year
)
update Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work 
set 
Accident_State_has_premium = (case 
	when Pol_St.currentwrittenpremium is not null
	then ''Y''
	else ''N''
	end)
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work LD
left join #Policy_Premium_by_Cov_state Pol_St
on Pol_st.policynumber = LD.policy_number
	and Pol_st.experienceproduct = LD.Exp_Product
	and Pol_st.Coverage_Group = LD.Coverage_group 
	and Pol_st.Coverage_Form =LD.coverage_form
	and Pol_st.acctngyear = LD.Accident_Year
	and Pol_st.Fiscal_AY_Month_Ending = LD.Fiscal_AY_Month_Ending
	and Pol_st.Fiscal_AY_Year = LD.Fiscal_AY_Year
	and Pol_st.Statecode = LD.Accident_State
where LD.Accident_State <> LD.Premium_State;


update Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work
set 
Accident_State_for_join = (Case
	when Accident_State = Premium_State then Accident_State
	when Accident_State <> Premium_State 
		and Accident_State_has_premium = ''Y''
	then Accident_State
	else Premium_State
	end)
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work LD;

with #Riskcode (
	Claimnumber,
	riskcode
) as (
	select 
		claimnumber,
		ltrim(rtrim(riskcode)) as riskcode
	from AccessPhlyEom.dbo.claimloss CL
	where riskcode is not null
		and ltrim(rtrim(riskcode)) <> ''''
		and riskcode!=''99999999999999999''
	group by 
		claimnumber,
		riskcode)
update Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work 
set 
Riskcode = CL.riskcode
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work LD
left join #Riskcode CL
on CL.Claimnumber = LD.Claim_Number;


update Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work 
set 
Risk_Location = (case
	when Coverage_Reporting_Group in (''Fire & Allied'',''Other Prop'',''GL'')
	then convert(int,Replace(Left (riskcode,(charindex('','',riskcode))),'','',''''))
	else null
	end), 
Risk_Building = (case
	when Coverage_Reporting_Group in (''Fire & Allied'',''Other Prop'',''GL'')
		and (charindex('' '',riskcode+'' '')-charindex('','',riskcode)-1) > 0
		and isnumeric(substring(riskcode, charindex('','',riskcode)+1, 
				(charindex('' '',riskcode+'' '')-charindex('','',riskcode)-1))) = 1
--	then (charindex('' '',riskcode+'' '')-charindex('','',riskcode)-1)
	then convert(int, substring(riskcode, 
		charindex('','',riskcode)+1, 
		(charindex('' '',riskcode+'' '')-charindex('','',riskcode)-1)))
	else null
	end), 
Risk_Vehicle = (case
	when Coverage_Group in (''Auto Phys Dam'',''Auto Liability'')
	then riskcode
	else null
	end)
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work LD
where riskcode is not null;





/* STEP 2 */
/* Bring Loss data to the same key fields as premium */
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[ALL_POLICIES_12_Detail_Information_2_work]'') AND type in (N''U''))
Drop Table Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_2_work

CREATE TABLE [Act_Detailed_Experience].[dbo].[ALL_POLICIES_12_Detail_Information_2_work](
	[Accountnumber] [int],
	[PolicyNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Experienceproduct] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Productcode] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Accident_State_for_join] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Coverage_Group] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Coverage_Form] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Accident_Year] [int],
	[Fiscal_AY_Month_Ending] [float],
	[Fiscal_AY_Year] [float],
	[Loss_Evaluation_Month] [int],
	[Loss_Evaluation_Year] [int],
	[Loss_ALAE_Cap] [float],
	[COL_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_Discrimination_Count] [decimal](15, 2),
	[COL_Discrimination_Count_rptd] [decimal](15, 2),
	[COL_Discrimination_Loss] [decimal](15, 2),

	[COL_Wrongful_Termination_Count] [decimal](15, 2),
	[COL_Wrongful_Termination_Count_rptd] [decimal](15, 2),
	[COL_Wrongful_Termination_Loss] [decimal](15, 2),

	[COL_Harrassment_Count] [decimal](15, 2),
	[COL_Harrassment_Count_rptd] [decimal](15, 2),
	[COL_Harrassment_Loss] [decimal](15, 2),

	[COL_DO_Other_Count] [decimal](15, 2),
	[COL_DO_Other_Count_rptd] [decimal](15, 2),
	[COL_DO_Other_Loss] [decimal](15, 2),

	[COL_EPL_Other_Count] [decimal](15, 2),
	[COL_EPL_Other_Count_rptd] [decimal](15, 2),
	[COL_EPL_Other_Loss] [decimal](15, 2),

	[COL_Fiduciary_Other_Count] [decimal](15, 2),
	[COL_Fiduciary_Other_Count_rptd] [decimal](15, 2),
	[COL_Fiduciary_Other_Loss] [decimal](15, 2),

	[COL_Worplace_Violence_Other_Count] [decimal](15, 2),
	[COL_Worplace_Violence_Other_Count_rptd] [decimal](15, 2),
	[COL_Worplace_Violence_Other_Loss] [decimal](15, 2),

	[COL_Internet_Other_Count] [decimal](15, 2),
	[COL_Internet_Other_Count_rptd] [decimal](15, 2),
	[COL_Internet_Other_Loss] [decimal] (15, 2),

	[COL_SLD_All_Other_Count] [decimal](15, 2),
	[COL_SLD_All_Other_Count_rptd] [decimal](15, 2),
	[COL_SLD_All_Other_Loss] [decimal] (15, 2),

	[COL_AE_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_AE_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_AE_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_AE_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2),
	[COL_AE_Breach_of_Fiduciary_Liability_Count_rptd] [decimal](15, 2),
	[COL_AE_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2),

	[COL_AE_Financial_Advisor_Count] [decimal](15, 2),
	[COL_AE_Financial_Advisor_Count_rptd] [decimal](15, 2),
	[COL_AE_Financial_Advisor_Loss] [decimal](15, 2),

	[COL_AE_Misconduct_Count] [decimal](15, 2),
	[COL_AE_Misconduct_Count_rptd] [decimal](15, 2),
	[COL_AE_Misconduct_Loss] [decimal](15, 2),

	[COL_AE_Wills_Estate_Count] [decimal](15, 2),
	[COL_AE_Wills_Estate_Count_rptd] [decimal](15, 2),
	[COL_AE_Wills_Estate_Loss] [decimal](15, 2),

	[COL_AE_Corporate_Count] [decimal](15, 2),
	[COL_AE_Corporate_Count_rptd] [decimal](15, 2),
	[COL_AE_Corporate_Loss] [decimal](15, 2),

	[COL_AE_Tax_Liability_Count] [decimal](15, 2),
	[COL_AE_Tax_Liability_Count_rptd] [decimal](15, 2),
	[COL_AE_Tax_Liability_Loss] [decimal](15, 2),

	[COL_AE_Violation_GAAP_Count] [decimal](15, 2),
	[COL_AE_Violation_GAAP_Count_rptd] [decimal](15, 2),
	[COL_AE_Violation_GAAP_Loss] [decimal](15, 2),

	[COL_AE_All_Other_Count] [decimal](15, 2),
	[COL_AE_All_Other_Count_rptd] [decimal](15, 2),
	[COL_AE_All_Other_Loss] [decimal](15, 2),

	[COL_CL_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_CL_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_CL_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_CL_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2),
	[COL_CL_Breach_of_Fiduciary_Liability_Count_rptd] [decimal](15, 2),
	[COL_CL_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2),

	[COL_CL_Financial_Advisor_Count] [decimal](15, 2),
	[COL_CL_Financial_Advisor_Count_rptd] [decimal](15, 2),
	[COL_CL_Financial_Advisor_Loss] [decimal](15, 2),

	[COL_CL_Misconduct_Count] [decimal](15, 2),
	[COL_CL_Misconduct_Count_rptd] [decimal](15, 2),
	[COL_CL_Misconduct_Loss] [decimal](15, 2),

	[COL_CL_Wills_Estate_Count] [decimal](15, 2),
	[COL_CL_Wills_Estate_Count_rptd] [decimal](15, 2),
	[COL_CL_Wills_Estate_Loss] [decimal](15, 2),

	[COL_CL_Corporate_Count] [decimal](15, 2),
	[COL_CL_Corporate_Count_rptd] [decimal](15, 2),
	[COL_CL_Corporate_Loss] [decimal](15, 2),

	[COL_CL_Tax_Liability_Count] [decimal](15, 2),
	[COL_CL_Tax_Liability_Count_rptd] [decimal](15, 2),
	[COL_CL_Tax_Liability_Loss] [decimal](15, 2),

	[COL_CL_Violation_GAAP_Count] [decimal](15, 2),
	[COL_CL_Violation_GAAP_Count_rptd] [decimal](15, 2),
	[COL_CL_Violation_GAAP_Loss] [decimal](15, 2),

	[COL_CL_Negligent_Training_Count] [decimal](15, 2),
	[COL_CL_Negligent_Training_Count_rptd] [decimal](15, 2),
	[COL_CL_Negligent_Training_Loss] [decimal](15, 2),

	[COL_CL_Electronic_Data_Damage_Count] [decimal](15, 2),
	[COL_CL_Electronic_Data_Damage_Count_rptd] [decimal](15, 2),
	[COL_CL_Electronic_Data_Damage_Loss] [decimal](15, 2),

	[COL_CL_All_Other_Count] [decimal](15, 2),
	[COL_CL_All_Other_Count_rptd] [decimal](15, 2),
	[COL_CL_All_Other_Loss] [decimal](15, 2),

	[COL_GLBI_Malpractice_Count] [decimal](15, 2),
	[COL_GLBI_Malpractice_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Malpractice_Loss] [decimal](15, 2),

	[COL_GLBI_Fraud_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_GLBI_Fraud_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Fraud_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_GLBI_Injury_Count] [decimal](15, 2),
	[COL_GLBI_Injury_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Injury_Loss] [decimal](15, 2),

	[COL_GLBI_Other_Count] [decimal](15, 2),
	[COL_GLBI_Other_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Other_Loss] [decimal](15, 2),

	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count] [decimal](15, 2),
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Loss] [decimal](15, 2),

	[COL_GLBI_PropertyDamage_Count] [decimal](15, 2),
	[COL_GLBI_PropertyDamage_Count_rptd] [decimal](15, 2),
	[COL_GLBI_PropertyDamage_Loss] [decimal](15, 2),

	[COL_GLBI_Theft_Count] [decimal](15, 2),
	[COL_GLBI_Theft_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Theft_Loss] [decimal](15, 2),

	[COL_GLBI_SlanderDefamtion_Count] [decimal](15, 2),
	[COL_GLBI_SlanderDefamtion_Count_rptd] [decimal](15, 2),
	[COL_GLBI_SlanderDefamtion_Loss] [decimal](15, 2),

	[COL_GLBI_Discrim_WrongfulTermination_Count] [decimal](15, 2), 
	[COL_GLBI_Discrim_WrongfulTermination_Count_rptd] [decimal](15, 2), 
	[COL_GLBI_Discrim_WrongfulTermination_Loss] [decimal](15, 2),

	[COL_Prop_Fire_Lightning_Explosion_Count] [decimal](15, 2),
	[COL_Prop_Fire_Lightning_Explosion_Count_rptd] [decimal](15, 2),
	[COL_Prop_Fire_Lightning_Explosion_Loss] [decimal](15, 2),

	[COL_Prop_Theft_Van_Count] [decimal](15, 2), 
	[COL_Prop_Theft_Van_Count_rptd] [decimal](15, 2), 
	[COL_Prop_Theft_Van_Loss] [decimal](15, 2),

	[COL_Prop_Water_Sprinkler_Count] [decimal](15, 2),
	[COL_Prop_Water_Sprinkler_Count_rptd] [decimal](15, 2),
	[COL_Prop_Water_Sprinkler_Loss] [decimal](15, 2),

	[COL_Prop_Water_Other_Count] [decimal](15, 2),
	[COL_Prop_Water_Other_Count_rptd] [decimal](15, 2),
	[COL_Prop_Water_Other_Loss] [decimal](15, 2),

	[COL_Prop_Wind_Hail_Count] [decimal](15, 2),
	[COL_Prop_Wind_Hail_Count_rptd] [decimal](15, 2),
	[COL_Prop_Wind_Hail_Loss] [decimal](15, 2),

	[COL_Prop_Other_Count] [decimal](15, 2),
	[COL_Prop_Other_Count_rptd] [decimal](15, 2),
	[COL_Prop_Other_Loss] [decimal](15, 2),

	[COL_AUTO_LIAB_AllOther_Count] [decimal](15, 2),
	[COL_AUTO_LIAB_AllOther_Count_rptd] [decimal](15, 2),
	[COL_AUTO_LIAB_AllOther_Loss] [decimal](15, 2),

	[COL_AUTO_LIAB_PropDam_Count] [decimal](15, 2),
	[COL_AUTO_LIAB_PropDam_Count_rptd] [decimal](15, 2),
	[COL_AUTO_LIAB_PropDam_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Coll_Count] [decimal](15, 2), 
	[COL_AUTO_PHYS_Coll_Count_rptd] [decimal](15, 2), 
	[COL_AUTO_PHYS_Coll_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Glass_Count] [decimal](15, 2),
	[COL_AUTO_PHYS_Glass_Count_rptd] [decimal](15, 2),
	[COL_AUTO_PHYS_Glass_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Other_Count] [decimal](15, 2),
	[COL_AUTO_PHYS_Other_Count_rptd] [decimal](15, 2),
	[COL_AUTO_PHYS_Other_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Theft_Count] [decimal](15, 2),
	[COL_AUTO_PHYS_Theft_Count_rptd] [decimal](15, 2),
	[COL_AUTO_PHYS_Theft_Loss] [decimal](15, 2),
	[Case_Loss] [decimal](15, 2),
	[Case_ALAE] [decimal](15, 2),
	[Paid_Loss] [decimal](15, 2),
	[Paid_ALAE] [decimal](15, 2),
	[Sal_Subro] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS_NonCat] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS_CatOnly] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS] [decimal](15, 2),
	[Capped_Incurred_Loss_ALAE_with_SS] [decimal](15, 2),
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_with_SS [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_without_SS [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat [decimal](15, 2),
	Ult_LDF_Capped_Inc_Loss_ALAE_with_SS [decimal](15, 2),
	Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat [decimal](15, 2),
	[Reported_Claims] [decimal](15, 2),
	[Open_Claims] [decimal](15, 2),
	[Closed_With_Pay_Claims] [decimal](15, 2),
	[Closed_Without_Pay_Claims] [decimal](15, 2),
	[Incurred_Claims] [decimal](15, 2),
	[Matching_Record_in_PS_table] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS
) ON [PRIMARY]

-------------------------------------------------------------------------------------
--truncate table Act_Detailed_Experience.dbo.ALL_POLICIES_15_Detail_Information_2
--select * from Act_Detailed_Experience.dbo.ALL_POLICIES_15_Detail_Information_2

insert into Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_2_work
(	Accountnumber ,
	PolicyNumber ,
	Experienceproduct  ,
	Productcode  ,
	Accident_State_for_join,

	Coverage_Group ,
	Coverage_Form ,
	Accident_Year,
	Fiscal_AY_Month_Ending,
	Fiscal_AY_Year,
	Loss_Evaluation_Month,
	Loss_Evaluation_Year,
	Loss_ALAE_Cap,
	COL_Breach_of_Contract_Count ,
	COL_Breach_of_Contract_Count_rptd ,
	COL_Breach_of_Contract_Loss ,

	COL_Discrimination_Count ,
	COL_Discrimination_Count_rptd ,
	COL_Discrimination_Loss ,

	COL_Wrongful_Termination_Count ,
	COL_Wrongful_Termination_Count_rptd ,
	COL_Wrongful_Termination_Loss ,

	COL_Harrassment_Count ,
	COL_Harrassment_Count_rptd ,
	COL_Harrassment_Loss ,

	COL_DO_Other_Count ,
	COL_DO_Other_Count_rptd ,
	COL_DO_Other_Loss ,

	COL_EPL_Other_Count ,
	COL_EPL_Other_Count_rptd ,
	COL_EPL_Other_Loss ,

	COL_Fiduciary_Other_Count ,
	COL_Fiduciary_Other_Count_rptd ,
	COL_Fiduciary_Other_Loss ,

	COL_Worplace_Violence_Other_Count ,
	COL_Worplace_Violence_Other_Count_rptd ,
	COL_Worplace_Violence_Other_Loss ,

	COL_Internet_Other_Count ,
	COL_Internet_Other_Count_rptd ,
	COL_Internet_Other_Loss,

	COL_SLD_All_Other_Count ,
	COL_SLD_All_Other_Count_rptd ,
	COL_SLD_All_Other_Loss,

	COL_AE_Breach_of_Contract_Count ,
	COL_AE_Breach_of_Contract_Count_rptd ,
	COL_AE_Breach_of_Contract_Loss ,

	COL_AE_Breach_of_Fiduciary_Liability_Count ,
	COL_AE_Breach_of_Fiduciary_Liability_Count_rptd ,
	COL_AE_Breach_of_Fiduciary_Liability_Loss ,

	COL_AE_Financial_Advisor_Count ,
	COL_AE_Financial_Advisor_Count_rptd ,
	COL_AE_Financial_Advisor_Loss ,

	COL_AE_Misconduct_Count ,
	COL_AE_Misconduct_Count_rptd ,
	COL_AE_Misconduct_Loss ,

	COL_AE_Wills_Estate_Count ,
	COL_AE_Wills_Estate_Count_rptd ,
	COL_AE_Wills_Estate_Loss ,

	COL_AE_Corporate_Count ,
	COL_AE_Corporate_Count_rptd ,
	COL_AE_Corporate_Loss ,

	COL_AE_Tax_Liability_Count ,
	COL_AE_Tax_Liability_Count_rptd ,
	COL_AE_Tax_Liability_Loss ,

	COL_AE_Violation_GAAP_Count ,
	COL_AE_Violation_GAAP_Count_rptd ,
	COL_AE_Violation_GAAP_Loss ,

	COL_AE_All_Other_Count ,
	COL_AE_All_Other_Count_rptd ,
	COL_AE_All_Other_Loss ,

	COL_CL_Breach_of_Contract_Count ,
	COL_CL_Breach_of_Contract_Count_rptd ,
	COL_CL_Breach_of_Contract_Loss ,

	COL_CL_Breach_of_Fiduciary_Liability_Count ,
	COL_CL_Breach_of_Fiduciary_Liability_Count_rptd ,
	COL_CL_Breach_of_Fiduciary_Liability_Loss ,

	COL_CL_Financial_Advisor_Count ,
	COL_CL_Financial_Advisor_Count_rptd ,
	COL_CL_Financial_Advisor_Loss ,

	COL_CL_Misconduct_Count ,
	COL_CL_Misconduct_Count_rptd ,
	COL_CL_Misconduct_Loss ,

	COL_CL_Wills_Estate_Count ,
	COL_CL_Wills_Estate_Count_rptd ,
	COL_CL_Wills_Estate_Loss ,

	COL_CL_Corporate_Count ,
	COL_CL_Corporate_Count_rptd ,
	COL_CL_Corporate_Loss ,

	COL_CL_Tax_Liability_Count ,
	COL_CL_Tax_Liability_Count_rptd ,
	COL_CL_Tax_Liability_Loss ,

	COL_CL_Violation_GAAP_Count ,
	COL_CL_Violation_GAAP_Count_rptd ,
	COL_CL_Violation_GAAP_Loss ,

	COL_CL_Negligent_Training_Count ,
	COL_CL_Negligent_Training_Count_rptd ,
	COL_CL_Negligent_Training_Loss ,

	COL_CL_Electronic_Data_Damage_Count ,
	COL_CL_Electronic_Data_Damage_Count_rptd ,
	COL_CL_Electronic_Data_Damage_Loss ,

	COL_CL_All_Other_Count ,
	COL_CL_All_Other_Count_rptd ,
	COL_CL_All_Other_Loss ,

	COL_GLBI_Malpractice_Count ,
	COL_GLBI_Malpractice_Count_rptd ,
	COL_GLBI_Malpractice_Loss ,

	COL_GLBI_Fraud_Breach_of_Contract_Count ,
	COL_GLBI_Fraud_Breach_of_Contract_Count_rptd ,
	COL_GLBI_Fraud_Breach_of_Contract_Loss ,

	COL_GLBI_Injury_Count ,
	COL_GLBI_Injury_Count_rptd ,
	COL_GLBI_Injury_Loss ,

	COL_GLBI_Other_Count ,
	COL_GLBI_Other_Count_rptd ,
	COL_GLBI_Other_Loss ,

	COL_GLBI_Sexual_Assault_Molest_Abuse_Count ,
	COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd ,
	COL_GLBI_Sexual_Assault_Molest_Abuse_Loss ,

	COL_GLBI_PropertyDamage_Count ,
	COL_GLBI_PropertyDamage_Count_rptd ,
	COL_GLBI_PropertyDamage_Loss ,

	COL_GLBI_Theft_Count ,
	COL_GLBI_Theft_Count_rptd ,
	COL_GLBI_Theft_Loss ,

	COL_GLBI_SlanderDefamtion_Count ,
	COL_GLBI_SlanderDefamtion_Count_rptd ,
	COL_GLBI_SlanderDefamtion_Loss ,

	COL_GLBI_Discrim_WrongfulTermination_Count , 
	COL_GLBI_Discrim_WrongfulTermination_Count_rptd , 
	COL_GLBI_Discrim_WrongfulTermination_Loss ,

	COL_Prop_Fire_Lightning_Explosion_Count ,
	COL_Prop_Fire_Lightning_Explosion_Count_rptd ,
	COL_Prop_Fire_Lightning_Explosion_Loss ,

	COL_Prop_Theft_Van_Count , 
	COL_Prop_Theft_Van_Count_rptd , 
	COL_Prop_Theft_Van_Loss ,

	COL_Prop_Water_Sprinkler_Count ,
	COL_Prop_Water_Sprinkler_Count_rptd ,
	COL_Prop_Water_Sprinkler_Loss ,

	COL_Prop_Water_Other_Count ,
	COL_Prop_Water_Other_Count_rptd ,
	COL_Prop_Water_Other_Loss ,

	COL_Prop_Wind_Hail_Count ,
	COL_Prop_Wind_Hail_Count_rptd ,
	COL_Prop_Wind_Hail_Loss ,

	COL_Prop_Other_Count ,
	COL_Prop_Other_Count_rptd ,
	COL_Prop_Other_Loss ,

	COL_AUTO_LIAB_AllOther_Count ,
	COL_AUTO_LIAB_AllOther_Count_rptd ,
	COL_AUTO_LIAB_AllOther_Loss ,

	COL_AUTO_LIAB_PropDam_Count ,
	COL_AUTO_LIAB_PropDam_Count_rptd ,
	COL_AUTO_LIAB_PropDam_Loss ,

	COL_AUTO_PHYS_Coll_Count , 
	COL_AUTO_PHYS_Coll_Count_rptd , 
	COL_AUTO_PHYS_Coll_Loss ,

	COL_AUTO_PHYS_Glass_Count ,
	COL_AUTO_PHYS_Glass_Count_rptd ,
	COL_AUTO_PHYS_Glass_Loss ,

	COL_AUTO_PHYS_Other_Count ,
	COL_AUTO_PHYS_Other_Count_rptd ,
	COL_AUTO_PHYS_Other_Loss ,

	COL_AUTO_PHYS_Theft_Count ,
	COL_AUTO_PHYS_Theft_Count_rptd ,
	COL_AUTO_PHYS_Theft_Loss ,
	Case_Loss ,
	Case_ALAE ,
	Paid_Loss ,
	Paid_ALAE ,
	Sal_Subro ,
	Incurred_Loss_ALAE_with_SS_CatOnly ,
	Incurred_Loss_ALAE_without_SS_NonCat ,
	Incurred_Loss_ALAE_without_SS_CatOnly ,
	Incurred_Loss_ALAE_with_SS_NonCat ,
	Incurred_Loss_ALAE_without_SS ,
	Incurred_Loss_ALAE_with_SS ,
	Capped_Incurred_Loss_ALAE_with_SS ,
	Capped_Incurred_Loss_ALAE_with_SS_wo_cat ,
	Ult_LDF_Incurred_Loss_ALAE_with_SS ,
	Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly ,
	Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat ,
	Ult_LDF_Incurred_Loss_ALAE_without_SS ,
	Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly ,
	Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat ,
	Ult_LDF_Capped_Inc_Loss_ALAE_with_SS ,
	Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat ,
	Reported_Claims ,
	Open_Claims ,
	Closed_With_Pay_Claims ,
	Closed_Without_Pay_Claims ,
	Incurred_Claims )
Select

	accountnumber,
	 ltrim(rtrim(Policy_number)) as Policynumber,
	Experienceproduct = Exp_product,
	 product as productcode,
	Accident_State_for_join as statecode,
--	coverage_id,
	Coverage_group,
	Coverage_Form,
	Accident_Year,
	Fiscal_AY_Month_Ending,
	Fiscal_AY_Year,
	Loss_Evaluation_Month,
	Loss_Evaluation_Year,
	Loss_ALAE_Cap,

	sum(COL_Breach_of_Contract_Count) as COL_Breach_of_Contract_Count,
sum(COL_Breach_of_Contract_Count_rptd) as COL_Breach_of_Contract_Count_rptd,
sum(COL_Breach_of_Contract_Loss) as COL_Breach_of_Contract_Loss,
sum(COL_Discrimination_Count) as COL_Discrimination_Count,
sum(COL_Discrimination_Count_rptd) as COL_Discrimination_Count_rptd,
sum(COL_Discrimination_Loss) as COL_Discrimination_Loss,
sum(COL_Wrongful_Termination_Count) as COL_Wrongful_Termination_Count,
sum(COL_Wrongful_Termination_Count_rptd) as COL_Wrongful_Termination_Count_rptd,
sum(COL_Wrongful_Termination_Loss) as COL_Wrongful_Termination_Loss,
sum(COL_Harrassment_Count) as COL_Harrassment_Count,
sum(COL_Harrassment_Count_rptd) as COL_Harrassment_Count_rptd,
sum(COL_Harrassment_Loss) as COL_Harrassment_Loss,
sum(COL_DO_Other_Count) as COL_DO_Other_Count,
sum(COL_DO_Other_Count_rptd) as COL_DO_Other_Count_rptd,
sum(COL_DO_Other_Loss) as COL_DO_Other_Loss,
sum(COL_EPL_Other_Count) as COL_EPL_Other_Count,
sum(COL_EPL_Other_Count_rptd) as COL_EPL_Other_Count_rptd,
sum(COL_EPL_Other_Loss) as COL_EPL_Other_Loss,
sum(COL_Fiduciary_Other_Count) as COL_Fiduciary_Other_Count,
sum(COL_Fiduciary_Other_Count_rptd) as COL_Fiduciary_Other_Count_rptd,
sum(COL_Fiduciary_Other_Loss) as COL_Fiduciary_Other_Loss,
sum(COL_Worplace_Violence_Other_Count) as COL_Worplace_Violence_Other_Count,
sum(COL_Worplace_Violence_Other_Count_rptd) as COL_Worplace_Violence_Other_Count_rptd,
sum(COL_Worplace_Violence_Other_Loss) as COL_Worplace_Violence_Other_Loss,
sum(COL_Internet_Other_Count) as COL_Internet_Other_Count,
sum(COL_Internet_Other_Count_rptd) as COL_Internet_Other_Count_rptd,
sum(COL_Internet_Other_Loss) as COL_Internet_Other_Loss,
sum(COL_SLD_All_Other_Count) as COL_SLD_All_Other_Count,
sum(COL_SLD_All_Other_Count_rptd) as COL_SLD_All_Other_Count_rptd,
sum(COL_SLD_All_Other_Loss) as COL_SLD_All_Other_Loss,
sum(COL_AE_Breach_of_Contract_Count) as COL_AE_Breach_of_Contract_Count,
sum(COL_AE_Breach_of_Contract_Count_rptd) as COL_AE_Breach_of_Contract_Count_rptd,
sum(COL_AE_Breach_of_Contract_Loss) as COL_AE_Breach_of_Contract_Loss,
sum(COL_AE_Breach_of_Fiduciary_Liability_Count) as COL_AE_Breach_of_Fiduciary_Liability_Count,
sum(COL_AE_Breach_of_Fiduciary_Liability_Count_rptd) as COL_AE_Breach_of_Fiduciary_Liability_Count_rptd,
sum(COL_AE_Breach_of_Fiduciary_Liability_Loss) as COL_AE_Breach_of_Fiduciary_Liability_Loss,
sum(COL_AE_Financial_Advisor_Count) as COL_AE_Financial_Advisor_Count,
sum(COL_AE_Financial_Advisor_Count_rptd) as COL_AE_Financial_Advisor_Count_rptd,
sum(COL_AE_Financial_Advisor_Loss) as COL_AE_Financial_Advisor_Loss,
sum(COL_AE_Misconduct_Count) as COL_AE_Misconduct_Count,
sum(COL_AE_Misconduct_Count_rptd) as COL_AE_Misconduct_Count_rptd,
sum(COL_AE_Misconduct_Loss) as COL_AE_Misconduct_Loss,
sum(COL_AE_Wills_Estate_Count) as COL_AE_Wills_Estate_Count,
sum(COL_AE_Wills_Estate_Count_rptd) as COL_AE_Wills_Estate_Count_rptd,
sum(COL_AE_Wills_Estate_Loss) as COL_AE_Wills_Estate_Loss,
sum(COL_AE_Corporate_Count) as COL_AE_Corporate_Count,
sum(COL_AE_Corporate_Count_rptd) as COL_AE_Corporate_Count_rptd,
sum(COL_AE_Corporate_Loss) as COL_AE_Corporate_Loss,
sum(COL_AE_Tax_Liability_Count) as COL_AE_Tax_Liability_Count,
sum(COL_AE_Tax_Liability_Count_rptd) as COL_AE_Tax_Liability_Count_rptd,
sum(COL_AE_Tax_Liability_Loss) as COL_AE_Tax_Liability_Loss,
sum(COL_AE_Violation_GAAP_Count) as COL_AE_Violation_GAAP_Count,
sum(COL_AE_Violation_GAAP_Count_rptd) as COL_AE_Violation_GAAP_Count_rptd,
sum(COL_AE_Violation_GAAP_Loss) as COL_AE_Violation_GAAP_Loss,
sum(COL_AE_ALL_Other_Count) as COL_AE_ALL_Other_Count,
sum(COL_AE_ALL_Other_Count_rptd) as COL_AE_ALL_Other_Count_rptd,
sum(COL_AE_ALL_Other_Loss) as COL_AE_ALL_Other_Loss,
sum(COL_CL_Breach_of_Contract_Count) as COL_CL_Breach_of_Contract_Count,
sum(COL_CL_Breach_of_Contract_Count_rptd) as COL_CL_Breach_of_Contract_Count_rptd,
sum(COL_CL_Breach_of_Contract_Loss) as COL_CL_Breach_of_Contract_Loss,
sum(COL_CL_Breach_of_Fiduciary_Liability_Count) as COL_CL_Breach_of_Fiduciary_Liability_Count,
sum(COL_CL_Breach_of_Fiduciary_Liability_Count_rptd) as COL_CL_Breach_of_Fiduciary_Liability_Count_rptd,
sum(COL_CL_Breach_of_Fiduciary_Liability_Loss) as COL_CL_Breach_of_Fiduciary_Liability_Loss,
sum(COL_CL_Financial_Advisor_Count) as COL_CL_Financial_Advisor_Count,
sum(COL_CL_Financial_Advisor_Count_rptd) as COL_CL_Financial_Advisor_Count_rptd,
sum(COL_CL_Financial_Advisor_Loss) as COL_CL_Financial_Advisor_Loss,
sum(COL_CL_Misconduct_Count) as COL_CL_Misconduct_Count,
sum(COL_CL_Misconduct_Count_rptd) as COL_CL_Misconduct_Count_rptd,
sum(COL_CL_Misconduct_Loss) as COL_CL_Misconduct_Loss,
sum(COL_CL_Wills_Estate_Count) as COL_CL_Wills_Estate_Count,
sum(COL_CL_Wills_Estate_Count_rptd) as COL_CL_Wills_Estate_Count_rptd,
sum(COL_CL_Wills_Estate_Loss) as COL_CL_Wills_Estate_Loss,
sum(COL_CL_Corporate_Count) as COL_CL_Corporate_Count,
sum(COL_CL_Corporate_Count_rptd) as COL_CL_Corporate_Count_rptd,
sum(COL_CL_Corporate_Loss) as COL_CL_Corporate_Loss,
sum(COL_CL_Tax_Liability_Count) as COL_CL_Tax_Liability_Count,
sum(COL_CL_Tax_Liability_Count_rptd) as COL_CL_Tax_Liability_Count_rptd,
sum(COL_CL_Tax_Liability_Loss) as COL_CL_Tax_Liability_Loss,
sum(COL_CL_Violation_GAAP_Count) as COL_CL_Violation_GAAP_Count,
sum(COL_CL_Violation_GAAP_Count_rptd) as COL_CL_Violation_GAAP_Count_rptd,
sum(COL_CL_Violation_GAAP_Loss) as COL_CL_Violation_GAAP_Loss,
sum(COL_CL_Negligent_Training_Count) as COL_CL_Negligent_Training_Count,
sum(COL_CL_Negligent_Training_Count_rptd) as COL_CL_Negligent_Training_Count_rptd,
sum(COL_CL_Negligent_Training_Loss) as COL_CL_Negligent_Training_Loss,
sum(COL_CL_Electronic_Data_Damage_Count) as COL_CL_Electronic_Data_Damage_Count,
sum(COL_CL_Electronic_Data_Damage_Count_rptd) as COL_CL_Electronic_Data_Damage_Count_rptd,
sum(COL_CL_Electronic_Data_Damage_Loss) as COL_CL_Electronic_Data_Damage_Loss,
sum(COL_CL_ALL_Other_Count) as COL_CL_ALL_Other_Count,
sum(COL_CL_ALL_Other_Count_rptd) as COL_CL_ALL_Other_Count_rptd,
sum(COL_CL_ALL_Other_Loss) as COL_CL_ALL_Other_Loss,
sum(COL_GLBI_Malpractice_Count) as COL_GLBI_Malpractice_Count,
sum(COL_GLBI_Malpractice_Count_rptd) as COL_GLBI_Malpractice_Count_rptd,
sum(COL_GLBI_Malpractice_Loss) as COL_GLBI_Malpractice_Loss,
sum(COL_GLBI_Fraud_Breach_of_Contract_Count) as COL_GLBI_Fraud_Breach_of_Contract_Count,
sum(COL_GLBI_Fraud_Breach_of_Contract_Count_rptd) as COL_GLBI_Fraud_Breach_of_Contract_Count_rptd,
sum(COL_GLBI_Fraud_Breach_of_Contract_Loss) as COL_GLBI_Fraud_Breach_of_Contract_Loss,
sum(COL_GLBI_Injury_Count) as COL_GLBI_Injury_Count,
sum(COL_GLBI_Injury_Count_rptd) as COL_GLBI_Injury_Count_rptd,
sum(COL_GLBI_Injury_Loss) as COL_GLBI_Injury_Loss,
sum(COL_GLBI_Other_Count) as COL_GLBI_Other_Count,
sum(COL_GLBI_Other_Count_rptd) as COL_GLBI_Other_Count_rptd,
sum(COL_GLBI_Other_Loss) as COL_GLBI_Other_Loss,
sum(COL_GLBI_Sexual_Assault_Molest_Abuse_Count) as COL_GLBI_Sexual_Assault_Molest_Abuse_Count,
sum(COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd) as COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd,
sum(COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) as COL_GLBI_Sexual_Assault_Molest_Abuse_Loss,
sum(COL_GLBI_Theft_Count) as COL_GLBI_Theft_Count,
sum(COL_GLBI_Theft_Count_rptd) as COL_GLBI_Theft_Count_rptd,
sum(COL_GLBI_Theft_Loss) as COL_GLBI_Theft_Loss,
sum(COL_GLBI_PropertyDamage_Count) as COL_GLBI_PropertyDamage_Count,
sum(COL_GLBI_PropertyDamage_Count_rptd) as COL_GLBI_PropertyDamage_Count_rptd,
sum(COL_GLBI_PropertyDamage_Loss) as COL_GLBI_PropertyDamage_Loss,
sum(COL_GLBI_SlanderDefamtion_count) as COL_GLBI_SlanderDefamtion_Count,
sum(COL_GLBI_SlanderDefamtion_count_rptd) as COL_GLBI_SlanderDefamtion_Count_rptd,
sum(COL_GLBI_SlanderDefamtion_loss) as COL_GLBI_SlanderDefamtion_Loss,
sum(COL_GLBI_Discrim_WrongfulTermination_Count) as COL_GLBI_Discrim_WrongfulTermination_Count,
sum(COL_GLBI_Discrim_WrongfulTermination_Count_rptd) as COL_GLBI_Discrim_WrongfulTermination_Count_rptd,
sum(COL_GLBI_Discrim_WrongfulTermination_Loss) as COL_GLBI_Discrim_WrongfulTermination_Loss,
sum(COL_Prop_Fire_Lightning_Explosion_Count) as COL_Prop_Fire_Lightning_Explosion_Count,
sum(COL_Prop_Fire_Lightning_Explosion_Count_rptd) as COL_Prop_Fire_Lightning_Explosion_Count_rptd,
sum(COL_Prop_Fire_Lightning_Explosion_Loss) as COL_Prop_Fire_Lightning_Explosion_Loss,
sum(COL_Prop_Theft_Van_Count) as COL_Prop_Theft_Van_Count,
sum(COL_Prop_Theft_Van_Count_rptd) as COL_Prop_Theft_Van_Count_rptd,
sum(COL_Prop_Theft_Van_Loss) as COL_Prop_Theft_Van_Loss,
sum(COL_Prop_Water_Sprinkler_Count) as COL_Prop_Water_Sprinkler_Count,
sum(COL_Prop_Water_Sprinkler_Count_rptd) as COL_Prop_Water_Sprinkler_Count_rptd,
sum(COL_Prop_Water_Sprinkler_Loss) as COL_Prop_Water_Sprinkler_Loss,
sum(COL_Prop_Water_Other_Count) as COL_Prop_Water_Other_Count,
sum(COL_Prop_Water_Other_Count_rptd) as COL_Prop_Water_Other_Count_rptd,
sum(COL_Prop_Water_Other_Loss) as COL_Prop_Water_Other_Loss,
sum(COL_Prop_Wind_Hail_Count) as COL_Prop_Wind_Hail_Count,
sum(COL_Prop_Wind_Hail_Count_rptd) as COL_Prop_Wind_Hail_Count_rptd,
sum(COL_Prop_Wind_Hail_Loss) as COL_Prop_Wind_Hail_Loss,
sum(COL_Prop_Other_Count) as COL_Prop_Other_Count,
sum(COL_Prop_Other_Count_rptd) as COL_Prop_Other_Count_rptd,
sum(COL_Prop_Other_Loss) as COL_Prop_Other_Loss,
sum(COL_AUTO_LIAB_AllOther_Count) as COL_AUTO_LIAB_AllOther_Count,
sum(COL_AUTO_LIAB_AllOther_Count_rptd) as COL_AUTO_LIAB_AllOther_Count_rptd,
sum(COL_AUTO_LIAB_AllOther_Loss) as COL_AUTO_LIAB_AllOther_Loss,
sum(COL_AUTO_LIAB_PropDam_Count) as COL_AUTO_LIAB_PropDam_Count,
sum(COL_AUTO_LIAB_PropDam_Count_rptd) as COL_AUTO_LIAB_PropDam_Count_rptd,
sum(COL_AUTO_LIAB_PropDam_Loss) as COL_AUTO_LIAB_PropDam_Loss,
sum(COL_AUTO_PHYS_Coll_Count) as COL_AUTO_PHYS_Coll_Count,
sum(COL_AUTO_PHYS_Coll_Count_rptd) as COL_AUTO_PHYS_Coll_Count_rptd,
sum(COL_AUTO_PHYS_Coll_Loss) as COL_AUTO_PHYS_Coll_Loss,
sum(COL_AUTO_PHYS_Glass_Count) as COL_AUTO_PHYS_Glass_Count,
sum(COL_AUTO_PHYS_Glass_Count_rptd) as COL_AUTO_PHYS_Glass_Count_rptd,
sum(COL_AUTO_PHYS_Glass_Loss) as COL_AUTO_PHYS_Glass_Loss,
sum(COL_AUTO_PHYS_Other_Count) as COL_AUTO_PHYS_Other_Count,
sum(COL_AUTO_PHYS_Other_Count_rptd) as COL_AUTO_PHYS_Other_Count_rptd,
sum(COL_AUTO_PHYS_Other_Loss) as COL_AUTO_PHYS_Other_Loss,
sum(COL_AUTO_PHYS_Theft_Count) as COL_AUTO_PHYS_Theft_Count,
sum(COL_AUTO_PHYS_Theft_Count_rptd) as COL_AUTO_PHYS_Theft_Count_rptd,
sum(COL_AUTO_PHYS_Theft_Loss) as COL_AUTO_PHYS_Theft_Loss,



	sum(Case_Loss) as Case_Loss,
	sum(Case_ALAE) as Case_ALAE,
	sum(Paid_Loss) as Paid_Loss,
	sum(Paid_ALAE) as Paid_ALAE,
	sum(Sal_Subro) as Sal_Subro,	
	sum(Incurred_Loss_ALAE_with_SS_CatOnly) as Incurred_Loss_ALAE_with_SS_CatOnly,
	sum(Incurred_Loss_ALAE_without_SS_NonCat) as Incurred_Loss_ALAE_without_SS_NonCat,
	sum(Incurred_Loss_ALAE_without_SS_CatOnly) as Incurred_Loss_ALAE_without_SS_CatOnly,
	sum(Incurred_Loss_ALAE_with_SS_NonCat) as Incurred_Loss_ALAE_with_SS_NonCat,
	sum(Incurred_Loss_ALAE_without_SS) as Incurred_Loss_ALAE_without_SS,
	sum(Incurred_Loss_ALAE_with_SS) as Incurred_Loss_ALAE_with_SS,
	sum(Capped_Incurred_Loss_ALAE_with_SS) as Capped_Incurred_Loss_ALAE_with_SS,
sum(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) as Capped_Incurred_Loss_ALAE_with_SS_wo_cat,
sum(Ult_LDF_Incurred_Loss_ALAE_with_SS) as Ult_LDF_Incurred_Loss_ALAE_with_SS,
sum(Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly) as Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly,
sum(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) as Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat,
sum(Ult_LDF_Incurred_Loss_ALAE_without_SS) as Ult_LDF_Incurred_Loss_ALAE_without_SS,
sum(Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly) as Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly,
sum(Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat) as Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat,
sum(Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) as Ult_LDF_Capped_Inc_Loss_ALAE_with_SS,
sum(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) as Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat,

	sum(Reported_Claims) as Reported_Claims,
	sum(Open_Claims) as Open_Claims,
	sum(Closed_With_Pay_Claims) as Closed_With_Pay_Claims,
	sum(Closed_Without_Pay_Claims) as Closed_Without_Pay_Claims,
	sum(Incurred_Claims) as Incurred_Claims

from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work LD
group by 	
	accountnumber,
	Policy_number,
	Exp_product,
	product,
	Accident_State_for_join,
--	coverage_id,
	Coverage_group,
	Coverage_Form,
	Accident_Year,
	Fiscal_AY_Month_Ending,
	Fiscal_AY_Year,
	Loss_Evaluation_Month,
	Loss_Evaluation_Year,
	Loss_ALAE_Cap

update Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_2_work
set 
Matching_Record_in_PS_table = (case 
	when PS.policynumber is null then ''N'' 
	else ''Y'' 
	end)
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_2_work AL1
left join Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work PS
on PS.policynumber = AL1.policynumber
	and PS.experienceproduct = AL1.ExperienceProduct
	and PS.statecode = AL1.Accident_State_for_join
	and PS.Coverage_Group = AL1.Coverage_group 
	and PS.Coverage_Form = AL1.coverage_form
	and PS.acctngyear = AL1.Accident_Year
	and PS.Fiscal_AY_Month_Ending = AL1.Fiscal_AY_Month_Ending
	and PS.Fiscal_AY_Year = AL1.Fiscal_AY_Year
	
	
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[ALL_POLICIES_12_Detail_Information_3_work]'') AND type in (N''U''))
Drop Table Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_3_work
	
CREATE TABLE [Act_Detailed_Experience].[dbo].[ALL_POLICIES_12_Detail_Information_3_work](
	[Accountnumber] [int],
	[PolicyNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Experienceproduct] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Productcode] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS,
--	[Accident_State_for_join] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS,
--	[Coverage_id] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Coverage_Group] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Coverage_Form] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[Accident_Year] [int],
	[Fiscal_AY_Month_Ending] [float],
	[Fiscal_AY_Year] [float],
	[Loss_Evaluation_Month] [int],
	[Loss_Evaluation_Year] [int],
	[Loss_ALAE_Cap] [float],
	[COL_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_Discrimination_Count] [decimal](15, 2),
	[COL_Discrimination_Count_rptd] [decimal](15, 2),
	[COL_Discrimination_Loss] [decimal](15, 2),

	[COL_Wrongful_Termination_Count] [decimal](15, 2),
	[COL_Wrongful_Termination_Count_rptd] [decimal](15, 2),
	[COL_Wrongful_Termination_Loss] [decimal](15, 2),

	[COL_Harrassment_Count] [decimal](15, 2),
	[COL_Harrassment_Count_rptd] [decimal](15, 2),
	[COL_Harrassment_Loss] [decimal](15, 2),

	[COL_DO_Other_Count] [decimal](15, 2),
	[COL_DO_Other_Count_rptd] [decimal](15, 2),
	[COL_DO_Other_Loss] [decimal](15, 2),

	[COL_EPL_Other_Count] [decimal](15, 2),
	[COL_EPL_Other_Count_rptd] [decimal](15, 2),
	[COL_EPL_Other_Loss] [decimal](15, 2),

	[COL_Fiduciary_Other_Count] [decimal](15, 2),
	[COL_Fiduciary_Other_Count_rptd] [decimal](15, 2),
	[COL_Fiduciary_Other_Loss] [decimal](15, 2),

	[COL_Worplace_Violence_Other_Count] [decimal](15, 2),
	[COL_Worplace_Violence_Other_Count_rptd] [decimal](15, 2),
	[COL_Worplace_Violence_Other_Loss] [decimal](15, 2),

	[COL_Internet_Other_Count] [decimal](15, 2),
	[COL_Internet_Other_Count_rptd] [decimal](15, 2),
	[COL_Internet_Other_Loss] [decimal] (15, 2),

	[COL_SLD_All_Other_Count] [decimal](15, 2),
	[COL_SLD_All_Other_Count_rptd] [decimal](15, 2),
	[COL_SLD_All_Other_Loss] [decimal] (15, 2),

	[COL_AE_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_AE_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_AE_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_AE_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2),
	[COL_AE_Breach_of_Fiduciary_Liability_Count_rptd] [decimal](15, 2),
	[COL_AE_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2),

	[COL_AE_Financial_Advisor_Count] [decimal](15, 2),
	[COL_AE_Financial_Advisor_Count_rptd] [decimal](15, 2),
	[COL_AE_Financial_Advisor_Loss] [decimal](15, 2),

	[COL_AE_Misconduct_Count] [decimal](15, 2),
	[COL_AE_Misconduct_Count_rptd] [decimal](15, 2),
	[COL_AE_Misconduct_Loss] [decimal](15, 2),

	[COL_AE_Wills_Estate_Count] [decimal](15, 2),
	[COL_AE_Wills_Estate_Count_rptd] [decimal](15, 2),
	[COL_AE_Wills_Estate_Loss] [decimal](15, 2),

	[COL_AE_Corporate_Count] [decimal](15, 2),
	[COL_AE_Corporate_Count_rptd] [decimal](15, 2),
	[COL_AE_Corporate_Loss] [decimal](15, 2),

	[COL_AE_Tax_Liability_Count] [decimal](15, 2),
	[COL_AE_Tax_Liability_Count_rptd] [decimal](15, 2),
	[COL_AE_Tax_Liability_Loss] [decimal](15, 2),

	[COL_AE_Violation_GAAP_Count] [decimal](15, 2),
	[COL_AE_Violation_GAAP_Count_rptd] [decimal](15, 2),
	[COL_AE_Violation_GAAP_Loss] [decimal](15, 2),

	[COL_AE_All_Other_Count] [decimal](15, 2),
	[COL_AE_All_Other_Count_rptd] [decimal](15, 2),
	[COL_AE_All_Other_Loss] [decimal](15, 2),

	[COL_CL_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_CL_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_CL_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_CL_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2),
	[COL_CL_Breach_of_Fiduciary_Liability_Count_rptd] [decimal](15, 2),
	[COL_CL_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2),

	[COL_CL_Financial_Advisor_Count] [decimal](15, 2),
	[COL_CL_Financial_Advisor_Count_rptd] [decimal](15, 2),
	[COL_CL_Financial_Advisor_Loss] [decimal](15, 2),

	[COL_CL_Misconduct_Count] [decimal](15, 2),
	[COL_CL_Misconduct_Count_rptd] [decimal](15, 2),
	[COL_CL_Misconduct_Loss] [decimal](15, 2),

	[COL_CL_Wills_Estate_Count] [decimal](15, 2),
	[COL_CL_Wills_Estate_Count_rptd] [decimal](15, 2),
	[COL_CL_Wills_Estate_Loss] [decimal](15, 2),

	[COL_CL_Corporate_Count] [decimal](15, 2),
	[COL_CL_Corporate_Count_rptd] [decimal](15, 2),
	[COL_CL_Corporate_Loss] [decimal](15, 2),

	[COL_CL_Tax_Liability_Count] [decimal](15, 2),
	[COL_CL_Tax_Liability_Count_rptd] [decimal](15, 2),
	[COL_CL_Tax_Liability_Loss] [decimal](15, 2),

	[COL_CL_Violation_GAAP_Count] [decimal](15, 2),
	[COL_CL_Violation_GAAP_Count_rptd] [decimal](15, 2),
	[COL_CL_Violation_GAAP_Loss] [decimal](15, 2),

	[COL_CL_Negligent_Training_Count] [decimal](15, 2),
	[COL_CL_Negligent_Training_Count_rptd] [decimal](15, 2),
	[COL_CL_Negligent_Training_Loss] [decimal](15, 2),

	[COL_CL_Electronic_Data_Damage_Count] [decimal](15, 2),
	[COL_CL_Electronic_Data_Damage_Count_rptd] [decimal](15, 2),
	[COL_CL_Electronic_Data_Damage_Loss] [decimal](15, 2),

	[COL_CL_All_Other_Count] [decimal](15, 2),
	[COL_CL_All_Other_Count_rptd] [decimal](15, 2),
	[COL_CL_All_Other_Loss] [decimal](15, 2),

	[COL_GLBI_Malpractice_Count] [decimal](15, 2),
	[COL_GLBI_Malpractice_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Malpractice_Loss] [decimal](15, 2),

	[COL_GLBI_Fraud_Breach_of_Contract_Count] [decimal](15, 2),
	[COL_GLBI_Fraud_Breach_of_Contract_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Fraud_Breach_of_Contract_Loss] [decimal](15, 2),

	[COL_GLBI_Injury_Count] [decimal](15, 2),
	[COL_GLBI_Injury_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Injury_Loss] [decimal](15, 2),

	[COL_GLBI_Other_Count] [decimal](15, 2),
	[COL_GLBI_Other_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Other_Loss] [decimal](15, 2),

	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count] [decimal](15, 2),
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Loss] [decimal](15, 2),

	[COL_GLBI_PropertyDamage_Count] [decimal](15, 2),
	[COL_GLBI_PropertyDamage_Count_rptd] [decimal](15, 2),
	[COL_GLBI_PropertyDamage_Loss] [decimal](15, 2),

	[COL_GLBI_Theft_Count] [decimal](15, 2),
	[COL_GLBI_Theft_Count_rptd] [decimal](15, 2),
	[COL_GLBI_Theft_Loss] [decimal](15, 2),

	[COL_GLBI_SlanderDefamtion_Count] [decimal](15, 2),
	[COL_GLBI_SlanderDefamtion_Count_rptd] [decimal](15, 2),
	[COL_GLBI_SlanderDefamtion_Loss] [decimal](15, 2),

	[COL_GLBI_Discrim_WrongfulTermination_Count] [decimal](15, 2), 
	[COL_GLBI_Discrim_WrongfulTermination_Count_rptd] [decimal](15, 2), 
	[COL_GLBI_Discrim_WrongfulTermination_Loss] [decimal](15, 2),

	[COL_Prop_Fire_Lightning_Explosion_Count] [decimal](15, 2),
	[COL_Prop_Fire_Lightning_Explosion_Count_rptd] [decimal](15, 2),
	[COL_Prop_Fire_Lightning_Explosion_Loss] [decimal](15, 2),

	[COL_Prop_Theft_Van_Count] [decimal](15, 2), 
	[COL_Prop_Theft_Van_Count_rptd] [decimal](15, 2), 
	[COL_Prop_Theft_Van_Loss] [decimal](15, 2),

	[COL_Prop_Water_Sprinkler_Count] [decimal](15, 2),
	[COL_Prop_Water_Sprinkler_Count_rptd] [decimal](15, 2),
	[COL_Prop_Water_Sprinkler_Loss] [decimal](15, 2),

	[COL_Prop_Water_Other_Count] [decimal](15, 2),
	[COL_Prop_Water_Other_Count_rptd] [decimal](15, 2),
	[COL_Prop_Water_Other_Loss] [decimal](15, 2),

	[COL_Prop_Wind_Hail_Count] [decimal](15, 2),
	[COL_Prop_Wind_Hail_Count_rptd] [decimal](15, 2),
	[COL_Prop_Wind_Hail_Loss] [decimal](15, 2),

	[COL_Prop_Other_Count] [decimal](15, 2),
	[COL_Prop_Other_Count_rptd] [decimal](15, 2),
	[COL_Prop_Other_Loss] [decimal](15, 2),

	[COL_AUTO_LIAB_AllOther_Count] [decimal](15, 2),
	[COL_AUTO_LIAB_AllOther_Count_rptd] [decimal](15, 2),
	[COL_AUTO_LIAB_AllOther_Loss] [decimal](15, 2),

	[COL_AUTO_LIAB_PropDam_Count] [decimal](15, 2),
	[COL_AUTO_LIAB_PropDam_Count_rptd] [decimal](15, 2),
	[COL_AUTO_LIAB_PropDam_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Coll_Count] [decimal](15, 2), 
	[COL_AUTO_PHYS_Coll_Count_rptd] [decimal](15, 2), 
	[COL_AUTO_PHYS_Coll_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Glass_Count] [decimal](15, 2),
	[COL_AUTO_PHYS_Glass_Count_rptd] [decimal](15, 2),
	[COL_AUTO_PHYS_Glass_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Other_Count] [decimal](15, 2),
	[COL_AUTO_PHYS_Other_Count_rptd] [decimal](15, 2),
	[COL_AUTO_PHYS_Other_Loss] [decimal](15, 2),

	[COL_AUTO_PHYS_Theft_Count] [decimal](15, 2),
	[COL_AUTO_PHYS_Theft_Count_rptd] [decimal](15, 2),
	[COL_AUTO_PHYS_Theft_Loss] [decimal](15, 2),
	[Case_Loss] [decimal](15, 2),
	[Case_ALAE] [decimal](15, 2),
	[Paid_Loss] [decimal](15, 2),
	[Paid_ALAE] [decimal](15, 2),
	[Sal_Subro] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS_NonCat] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS_CatOnly] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS] [decimal](15, 2),
	[Capped_Incurred_Loss_ALAE_with_SS] [decimal](15, 2),
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_with_SS [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_without_SS [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly [decimal](15, 2),
	Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat [decimal](15, 2),
	Ult_LDF_Capped_Inc_Loss_ALAE_with_SS [decimal](15, 2),
	Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat [decimal](15, 2),
	[Reported_Claims] [decimal](15, 2),
	[Open_Claims] [decimal](15, 2),
	[Closed_With_Pay_Claims] [decimal](15, 2),
	[Closed_Without_Pay_Claims] [decimal](15, 2),
	[Incurred_Claims] [decimal](15, 2),
) ON [PRIMARY]	
	
insert into Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_3_work
Select

	accountnumber,
	ltrim(rtrim(Policy_number)) as Policynumber,
	Experienceproduct = Exp_product,
	productcode = product,
	statecode = Premium_State,
--	Accident_State_for_join,
--	coverage_id,
	Coverage_group,
	Coverage_Form,
	Accident_Year,
	Fiscal_AY_Month_Ending,
	Fiscal_AY_Year,
	Loss_Evaluation_Month,
	Loss_Evaluation_Year,
	Loss_ALAE_Cap,

	sum(COL_Breach_of_Contract_Count) as COL_Breach_of_Contract_Count,
sum(COL_Breach_of_Contract_Count_rptd) as COL_Breach_of_Contract_Count_rptd,
sum(COL_Breach_of_Contract_Loss) as COL_Breach_of_Contract_Loss,
sum(COL_Discrimination_Count) as COL_Discrimination_Count,
sum(COL_Discrimination_Count_rptd) as COL_Discrimination_Count_rptd,
sum(COL_Discrimination_Loss) as COL_Discrimination_Loss,
sum(COL_Wrongful_Termination_Count) as COL_Wrongful_Termination_Count,
sum(COL_Wrongful_Termination_Count_rptd) as COL_Wrongful_Termination_Count_rptd,
sum(COL_Wrongful_Termination_Loss) as COL_Wrongful_Termination_Loss,
sum(COL_Harrassment_Count) as COL_Harrassment_Count,
sum(COL_Harrassment_Count_rptd) as COL_Harrassment_Count_rptd,
sum(COL_Harrassment_Loss) as COL_Harrassment_Loss,
sum(COL_DO_Other_Count) as COL_DO_Other_Count,
sum(COL_DO_Other_Count_rptd) as COL_DO_Other_Count_rptd,
sum(COL_DO_Other_Loss) as COL_DO_Other_Loss,
sum(COL_EPL_Other_Count) as COL_EPL_Other_Count,
sum(COL_EPL_Other_Count_rptd) as COL_EPL_Other_Count_rptd,
sum(COL_EPL_Other_Loss) as COL_EPL_Other_Loss,
sum(COL_Fiduciary_Other_Count) as COL_Fiduciary_Other_Count,
sum(COL_Fiduciary_Other_Count_rptd) as COL_Fiduciary_Other_Count_rptd,
sum(COL_Fiduciary_Other_Loss) as COL_Fiduciary_Other_Loss,
sum(COL_Worplace_Violence_Other_Count) as COL_Worplace_Violence_Other_Count,
sum(COL_Worplace_Violence_Other_Count_rptd) as COL_Worplace_Violence_Other_Count_rptd,
sum(COL_Worplace_Violence_Other_Loss) as COL_Worplace_Violence_Other_Loss,
sum(COL_Internet_Other_Count) as COL_Internet_Other_Count,
sum(COL_Internet_Other_Count_rptd) as COL_Internet_Other_Count_rptd,
sum(COL_Internet_Other_Loss) as COL_Internet_Other_Loss,
sum(COL_SLD_All_Other_Count) as COL_SLD_All_Other_Count,
sum(COL_SLD_All_Other_Count_rptd) as COL_SLD_All_Other_Count_rptd,
sum(COL_SLD_All_Other_Loss) as COL_SLD_All_Other_Loss,
sum(COL_AE_Breach_of_Contract_Count) as COL_AE_Breach_of_Contract_Count,
sum(COL_AE_Breach_of_Contract_Count_rptd) as COL_AE_Breach_of_Contract_Count_rptd,
sum(COL_AE_Breach_of_Contract_Loss) as COL_AE_Breach_of_Contract_Loss,
sum(COL_AE_Breach_of_Fiduciary_Liability_Count) as COL_AE_Breach_of_Fiduciary_Liability_Count,
sum(COL_AE_Breach_of_Fiduciary_Liability_Count_rptd) as COL_AE_Breach_of_Fiduciary_Liability_Count_rptd,
sum(COL_AE_Breach_of_Fiduciary_Liability_Loss) as COL_AE_Breach_of_Fiduciary_Liability_Loss,
sum(COL_AE_Financial_Advisor_Count) as COL_AE_Financial_Advisor_Count,
sum(COL_AE_Financial_Advisor_Count_rptd) as COL_AE_Financial_Advisor_Count_rptd,
sum(COL_AE_Financial_Advisor_Loss) as COL_AE_Financial_Advisor_Loss,
sum(COL_AE_Misconduct_Count) as COL_AE_Misconduct_Count,
sum(COL_AE_Misconduct_Count_rptd) as COL_AE_Misconduct_Count_rptd,
sum(COL_AE_Misconduct_Loss) as COL_AE_Misconduct_Loss,
sum(COL_AE_Wills_Estate_Count) as COL_AE_Wills_Estate_Count,
sum(COL_AE_Wills_Estate_Count_rptd) as COL_AE_Wills_Estate_Count_rptd,
sum(COL_AE_Wills_Estate_Loss) as COL_AE_Wills_Estate_Loss,
sum(COL_AE_Corporate_Count) as COL_AE_Corporate_Count,
sum(COL_AE_Corporate_Count_rptd) as COL_AE_Corporate_Count_rptd,
sum(COL_AE_Corporate_Loss) as COL_AE_Corporate_Loss,
sum(COL_AE_Tax_Liability_Count) as COL_AE_Tax_Liability_Count,
sum(COL_AE_Tax_Liability_Count_rptd) as COL_AE_Tax_Liability_Count_rptd,
sum(COL_AE_Tax_Liability_Loss) as COL_AE_Tax_Liability_Loss,
sum(COL_AE_Violation_GAAP_Count) as COL_AE_Violation_GAAP_Count,
sum(COL_AE_Violation_GAAP_Count_rptd) as COL_AE_Violation_GAAP_Count_rptd,
sum(COL_AE_Violation_GAAP_Loss) as COL_AE_Violation_GAAP_Loss,
sum(COL_AE_ALL_Other_Count) as COL_AE_ALL_Other_Count,
sum(COL_AE_ALL_Other_Count_rptd) as COL_AE_ALL_Other_Count_rptd,
sum(COL_AE_ALL_Other_Loss) as COL_AE_ALL_Other_Loss,
sum(COL_CL_Breach_of_Contract_Count) as COL_CL_Breach_of_Contract_Count,
sum(COL_CL_Breach_of_Contract_Count_rptd) as COL_CL_Breach_of_Contract_Count_rptd,
sum(COL_CL_Breach_of_Contract_Loss) as COL_CL_Breach_of_Contract_Loss,
sum(COL_CL_Breach_of_Fiduciary_Liability_Count) as COL_CL_Breach_of_Fiduciary_Liability_Count,
sum(COL_CL_Breach_of_Fiduciary_Liability_Count_rptd) as COL_CL_Breach_of_Fiduciary_Liability_Count_rptd,
sum(COL_CL_Breach_of_Fiduciary_Liability_Loss) as COL_CL_Breach_of_Fiduciary_Liability_Loss,
sum(COL_CL_Financial_Advisor_Count) as COL_CL_Financial_Advisor_Count,
sum(COL_CL_Financial_Advisor_Count_rptd) as COL_CL_Financial_Advisor_Count_rptd,
sum(COL_CL_Financial_Advisor_Loss) as COL_CL_Financial_Advisor_Loss,
sum(COL_CL_Misconduct_Count) as COL_CL_Misconduct_Count,
sum(COL_CL_Misconduct_Count_rptd) as COL_CL_Misconduct_Count_rptd,
sum(COL_CL_Misconduct_Loss) as COL_CL_Misconduct_Loss,
sum(COL_CL_Wills_Estate_Count) as COL_CL_Wills_Estate_Count,
sum(COL_CL_Wills_Estate_Count_rptd) as COL_CL_Wills_Estate_Count_rptd,
sum(COL_CL_Wills_Estate_Loss) as COL_CL_Wills_Estate_Loss,
sum(COL_CL_Corporate_Count) as COL_CL_Corporate_Count,
sum(COL_CL_Corporate_Count_rptd) as COL_CL_Corporate_Count_rptd,
sum(COL_CL_Corporate_Loss) as COL_CL_Corporate_Loss,
sum(COL_CL_Tax_Liability_Count) as COL_CL_Tax_Liability_Count,
sum(COL_CL_Tax_Liability_Count_rptd) as COL_CL_Tax_Liability_Count_rptd,
sum(COL_CL_Tax_Liability_Loss) as COL_CL_Tax_Liability_Loss,
sum(COL_CL_Violation_GAAP_Count) as COL_CL_Violation_GAAP_Count,
sum(COL_CL_Violation_GAAP_Count_rptd) as COL_CL_Violation_GAAP_Count_rptd,
sum(COL_CL_Violation_GAAP_Loss) as COL_CL_Violation_GAAP_Loss,
sum(COL_CL_Negligent_Training_Count) as COL_CL_Negligent_Training_Count,
sum(COL_CL_Negligent_Training_Count_rptd) as COL_CL_Negligent_Training_Count_rptd,
sum(COL_CL_Negligent_Training_Loss) as COL_CL_Negligent_Training_Loss,
sum(COL_CL_Electronic_Data_Damage_Count) as COL_CL_Electronic_Data_Damage_Count,
sum(COL_CL_Electronic_Data_Damage_Count_rptd) as COL_CL_Electronic_Data_Damage_Count_rptd,
sum(COL_CL_Electronic_Data_Damage_Loss) as COL_CL_Electronic_Data_Damage_Loss,
sum(COL_CL_ALL_Other_Count) as COL_CL_ALL_Other_Count,
sum(COL_CL_ALL_Other_Count_rptd) as COL_CL_ALL_Other_Count_rptd,
sum(COL_CL_ALL_Other_Loss) as COL_CL_ALL_Other_Loss,
sum(COL_GLBI_Malpractice_Count) as COL_GLBI_Malpractice_Count,
sum(COL_GLBI_Malpractice_Count_rptd) as COL_GLBI_Malpractice_Count_rptd,
sum(COL_GLBI_Malpractice_Loss) as COL_GLBI_Malpractice_Loss,
sum(COL_GLBI_Fraud_Breach_of_Contract_Count) as COL_GLBI_Fraud_Breach_of_Contract_Count,
sum(COL_GLBI_Fraud_Breach_of_Contract_Count_rptd) as COL_GLBI_Fraud_Breach_of_Contract_Count_rptd,
sum(COL_GLBI_Fraud_Breach_of_Contract_Loss) as COL_GLBI_Fraud_Breach_of_Contract_Loss,
sum(COL_GLBI_Injury_Count) as COL_GLBI_Injury_Count,
sum(COL_GLBI_Injury_Count_rptd) as COL_GLBI_Injury_Count_rptd,
sum(COL_GLBI_Injury_Loss) as COL_GLBI_Injury_Loss,
sum(COL_GLBI_Other_Count) as COL_GLBI_Other_Count,
sum(COL_GLBI_Other_Count_rptd) as COL_GLBI_Other_Count_rptd,
sum(COL_GLBI_Other_Loss) as COL_GLBI_Other_Loss,
sum(COL_GLBI_Sexual_Assault_Molest_Abuse_Count) as COL_GLBI_Sexual_Assault_Molest_Abuse_Count,
sum(COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd) as COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd,
sum(COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) as COL_GLBI_Sexual_Assault_Molest_Abuse_Loss,
sum(COL_GLBI_Theft_Count) as COL_GLBI_Theft_Count,
sum(COL_GLBI_Theft_Count_rptd) as COL_GLBI_Theft_Count_rptd,
sum(COL_GLBI_Theft_Loss) as COL_GLBI_Theft_Loss,
sum(COL_GLBI_PropertyDamage_Count) as COL_GLBI_PropertyDamage_Count,
sum(COL_GLBI_PropertyDamage_Count_rptd) as COL_GLBI_PropertyDamage_Count_rptd,
sum(COL_GLBI_PropertyDamage_Loss) as COL_GLBI_PropertyDamage_Loss,
sum(COL_GLBI_SlanderDefamtion_count) as COL_GLBI_SlanderDefamtion_Count,
sum(COL_GLBI_SlanderDefamtion_count_rptd) as COL_GLBI_SlanderDefamtion_Count_rptd,
sum(COL_GLBI_SlanderDefamtion_loss) as COL_GLBI_SlanderDefamtion_Loss,
sum(COL_GLBI_Discrim_WrongfulTermination_Count) as COL_GLBI_Discrim_WrongfulTermination_Count,
sum(COL_GLBI_Discrim_WrongfulTermination_Count_rptd) as COL_GLBI_Discrim_WrongfulTermination_Count_rptd,
sum(COL_GLBI_Discrim_WrongfulTermination_Loss) as COL_GLBI_Discrim_WrongfulTermination_Loss,
sum(COL_Prop_Fire_Lightning_Explosion_Count) as COL_Prop_Fire_Lightning_Explosion_Count,
sum(COL_Prop_Fire_Lightning_Explosion_Count_rptd) as COL_Prop_Fire_Lightning_Explosion_Count_rptd,
sum(COL_Prop_Fire_Lightning_Explosion_Loss) as COL_Prop_Fire_Lightning_Explosion_Loss,
sum(COL_Prop_Theft_Van_Count) as COL_Prop_Theft_Van_Count,
sum(COL_Prop_Theft_Van_Count_rptd) as COL_Prop_Theft_Van_Count_rptd,
sum(COL_Prop_Theft_Van_Loss) as COL_Prop_Theft_Van_Loss,
sum(COL_Prop_Water_Sprinkler_Count) as COL_Prop_Water_Sprinkler_Count,
sum(COL_Prop_Water_Sprinkler_Count_rptd) as COL_Prop_Water_Sprinkler_Count_rptd,
sum(COL_Prop_Water_Sprinkler_Loss) as COL_Prop_Water_Sprinkler_Loss,
sum(COL_Prop_Water_Other_Count) as COL_Prop_Water_Other_Count,
sum(COL_Prop_Water_Other_Count_rptd) as COL_Prop_Water_Other_Count_rptd,
sum(COL_Prop_Water_Other_Loss) as COL_Prop_Water_Other_Loss,
sum(COL_Prop_Wind_Hail_Count) as COL_Prop_Wind_Hail_Count,
sum(COL_Prop_Wind_Hail_Count_rptd) as COL_Prop_Wind_Hail_Count_rptd,
sum(COL_Prop_Wind_Hail_Loss) as COL_Prop_Wind_Hail_Loss,
sum(COL_Prop_Other_Count) as COL_Prop_Other_Count,
sum(COL_Prop_Other_Count_rptd) as COL_Prop_Other_Count_rptd,
sum(COL_Prop_Other_Loss) as COL_Prop_Other_Loss,
sum(COL_AUTO_LIAB_AllOther_Count) as COL_AUTO_LIAB_AllOther_Count,
sum(COL_AUTO_LIAB_AllOther_Count_rptd) as COL_AUTO_LIAB_AllOther_Count_rptd,
sum(COL_AUTO_LIAB_AllOther_Loss) as COL_AUTO_LIAB_AllOther_Loss,
sum(COL_AUTO_LIAB_PropDam_Count) as COL_AUTO_LIAB_PropDam_Count,
sum(COL_AUTO_LIAB_PropDam_Count_rptd) as COL_AUTO_LIAB_PropDam_Count_rptd,
sum(COL_AUTO_LIAB_PropDam_Loss) as COL_AUTO_LIAB_PropDam_Loss,
sum(COL_AUTO_PHYS_Coll_Count) as COL_AUTO_PHYS_Coll_Count,
sum(COL_AUTO_PHYS_Coll_Count_rptd) as COL_AUTO_PHYS_Coll_Count_rptd,
sum(COL_AUTO_PHYS_Coll_Loss) as COL_AUTO_PHYS_Coll_Loss,
sum(COL_AUTO_PHYS_Glass_Count) as COL_AUTO_PHYS_Glass_Count,
sum(COL_AUTO_PHYS_Glass_Count_rptd) as COL_AUTO_PHYS_Glass_Count_rptd,
sum(COL_AUTO_PHYS_Glass_Loss) as COL_AUTO_PHYS_Glass_Loss,
sum(COL_AUTO_PHYS_Other_Count) as COL_AUTO_PHYS_Other_Count,
sum(COL_AUTO_PHYS_Other_Count_rptd) as COL_AUTO_PHYS_Other_Count_rptd,
sum(COL_AUTO_PHYS_Other_Loss) as COL_AUTO_PHYS_Other_Loss,
sum(COL_AUTO_PHYS_Theft_Count) as COL_AUTO_PHYS_Theft_Count,
sum(COL_AUTO_PHYS_Theft_Count_rptd) as COL_AUTO_PHYS_Theft_Count_rptd,
sum(COL_AUTO_PHYS_Theft_Loss) as COL_AUTO_PHYS_Theft_Loss,

	sum(Case_Loss) as Case_Loss,
	sum(Case_ALAE) as Case_ALAE,
	sum(Paid_Loss) as Paid_Loss,
	sum(Paid_ALAE) as Paid_ALAE,
	sum(Sal_Subro) as Sal_Subro,	
	sum(Incurred_Loss_ALAE_with_SS_CatOnly) as Incurred_Loss_ALAE_with_SS_CatOnly,
	sum(Incurred_Loss_ALAE_without_SS_NonCat) as Incurred_Loss_ALAE_without_SS_NonCat,
	sum(Incurred_Loss_ALAE_without_SS_CatOnly) as Incurred_Loss_ALAE_without_SS_CatOnly,
	sum(Incurred_Loss_ALAE_with_SS_NonCat) as Incurred_Loss_ALAE_with_SS_NonCat,
	sum(Incurred_Loss_ALAE_without_SS) as Incurred_Loss_ALAE_without_SS,
	sum(Incurred_Loss_ALAE_with_SS) as Incurred_Loss_ALAE_with_SS,
	sum(Capped_Incurred_Loss_ALAE_with_SS) as Capped_Incurred_Loss_ALAE_with_SS,
	Capped_Incurred_Loss_ALAE_with_SS_wo_cat = sum(Capped_Incurred_Loss_ALAE_with_SS_wo_cat),

	sum(Ult_LDF_Incurred_Loss_ALAE_with_SS) as Ult_LDF_Incurred_Loss_ALAE_with_SS,
	sum(Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly) as Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly,
	sum(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) as Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat,
	sum(Ult_LDF_Incurred_Loss_ALAE_without_SS) as Ult_LDF_Incurred_Loss_ALAE_without_SS,
	sum(Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly) as Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly,
	sum(Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat) as Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat,
	sum(Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) as Ult_LDF_Capped_Inc_Loss_ALAE_with_SS,
	sum(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) as Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat,

	sum(Reported_Claims) as Reported_Claims,
	sum(Open_Claims) as Open_Claims,
	sum(Closed_With_Pay_Claims) as Closed_With_Pay_Claims,
	sum(Closed_Without_Pay_Claims) as Closed_Without_Pay_Claims,
	sum(Incurred_Claims) as Incurred_Claims

from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work LD
group by 	
	accountnumber,
	Policy_number,
	Exp_product,
	product,
	premium_state,
--	Accident_State_for_join,
--	coverage_id,
	Coverage_group,
	Coverage_Form,
	Accident_Year,
	Fiscal_AY_Month_Ending,
	Fiscal_AY_Year,
	Loss_Evaluation_Month,
	Loss_Evaluation_Year,
	Loss_ALAE_Cap	
	

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)














' 
END
GO
