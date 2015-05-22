IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_ALL_POLICIES_12_Detail_Information_1_View_1]'))
DROP VIEW [dbo].[Latest_ALL_POLICIES_12_Detail_Information_1_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_ALL_POLICIES_12_Detail_Information_1_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_ALL_POLICIES_12_Detail_Information_1_View_1
AS
SELECT     company, Accountnumber, Policy_Number, Claim_Number, Exp_product, Product, Premium_State, Territory, Coverage_id, Coverage_Group, 
                      Coverage_Reporting_group, Coverage_Form, Accident_Year, Accident_Month, Fiscal_AY_Month_Ending, Fiscal_AY_Year, report_year, report_month, policy_year, 
                      policy_month, Loss_Evaluation_Month, Loss_Evaluation_Year, Type_of_Loss, Type_of_Loss_Desc, Claim_Desc, COL_Breach_of_Contract_Count, 
                      COL_Breach_of_Contract_Count_rptd, COL_Breach_of_Contract_Loss, COL_Discrimination_Count, COL_Discrimination_Count_rptd, COL_Discrimination_Loss, 
                      COL_Wrongful_Termination_Count, COL_Wrongful_Termination_Count_rptd, COL_Wrongful_Termination_Loss, COL_Harrassment_Count, 
                      COL_Harrassment_Count_rptd, COL_Harrassment_Loss, COL_DO_Other_Count, COL_DO_Other_Count_rptd, COL_DO_Other_Loss, COL_EPL_Other_Count, 
                      COL_EPL_Other_Count_rptd, COL_EPL_Other_Loss, COL_Fiduciary_Other_Count, COL_Fiduciary_Other_Count_rptd, COL_Fiduciary_Other_Loss, 
                      COL_Worplace_Violence_Other_Count, COL_Worplace_Violence_Other_Count_rptd, COL_Worplace_Violence_Other_Loss, COL_Internet_Other_Count, 
                      COL_Internet_Other_Count_rptd, COL_Internet_Other_Loss, COL_SLD_All_Other_Count, COL_SLD_All_Other_Count_rptd, COL_SLD_All_Other_Loss, 
                      COL_AE_Breach_of_Contract_Count, COL_AE_Breach_of_Contract_Count_rptd, COL_AE_Breach_of_Contract_Loss, COL_AE_Breach_of_Fiduciary_Liability_Count, 
                      COL_AE_Breach_of_Fiduciary_Liability_Count_rptd, COL_AE_Breach_of_Fiduciary_Liability_Loss, COL_AE_Financial_Advisor_Count, 
                      COL_AE_Financial_Advisor_Count_rptd, COL_AE_Financial_Advisor_Loss, COL_AE_Misconduct_Count, COL_AE_Misconduct_Count_rptd, COL_AE_Misconduct_Loss, 
                      COL_AE_Wills_Estate_Count, COL_AE_Wills_Estate_Count_rptd, COL_AE_Wills_Estate_Loss, COL_AE_Corporate_Count, COL_AE_Corporate_Count_rptd, 
                      COL_AE_Corporate_Loss, COL_AE_Tax_Liability_Count, COL_AE_Tax_Liability_Count_rptd, COL_AE_Tax_Liability_Loss, COL_AE_Violation_GAAP_Count, 
                      COL_AE_Violation_GAAP_Count_rptd, COL_AE_Violation_GAAP_Loss, COL_AE_All_Other_Count, COL_AE_All_Other_Count_rptd, COL_AE_All_Other_Loss, 
                      COL_CL_Breach_of_Contract_Count, COL_CL_Breach_of_Contract_Count_rptd, COL_CL_Breach_of_Contract_Loss, COL_CL_Breach_of_Fiduciary_Liability_Count, 
                      COL_CL_Breach_of_Fiduciary_Liability_Count_rptd, COL_CL_Breach_of_Fiduciary_Liability_Loss, COL_CL_Financial_Advisor_Count, 
                      COL_CL_Financial_Advisor_Count_rptd, COL_CL_Financial_Advisor_Loss, COL_CL_Misconduct_Count, COL_CL_Misconduct_Count_rptd, COL_CL_Misconduct_Loss, 
                      COL_CL_Wills_Estate_Count, COL_CL_Wills_Estate_Count_rptd, COL_CL_Wills_Estate_Loss, COL_CL_Corporate_Count, COL_CL_Corporate_Count_rptd, 
                      COL_CL_Corporate_Loss, COL_CL_Tax_Liability_Count, COL_CL_Tax_Liability_Count_rptd, COL_CL_Tax_Liability_Loss, COL_CL_Violation_GAAP_Count, 
                      COL_CL_Violation_GAAP_Count_rptd, COL_CL_Violation_GAAP_Loss, COL_CL_Negligent_Training_Count, COL_CL_Negligent_Training_Count_rptd, 
                      COL_CL_Negligent_Training_Loss, COL_CL_Electronic_Data_Damage_Count, COL_CL_Electronic_Data_Damage_Count_rptd, 
                      COL_CL_Electronic_Data_Damage_Loss, COL_CL_All_Other_Count, COL_CL_All_Other_Count_rptd, COL_CL_All_Other_Loss, COL_GLBI_Malpractice_Count, 
                      COL_GLBI_Malpractice_Count_rptd, COL_GLBI_Malpractice_Loss, COL_GLBI_Fraud_Breach_of_Contract_Count, COL_GLBI_Fraud_Breach_of_Contract_Count_rptd, 
                      COL_GLBI_Fraud_Breach_of_Contract_Loss, COL_GLBI_Injury_Count, COL_GLBI_Injury_Count_rptd, COL_GLBI_Injury_Loss, COL_GLBI_Other_Count, 
                      COL_GLBI_Other_Count_rptd, COL_GLBI_Other_Loss, COL_GLBI_Sexual_Assault_Molest_Abuse_Count, COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd, 
                      COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, COL_GLBI_PropertyDamage_Count, COL_GLBI_PropertyDamage_Count_rptd, COL_GLBI_PropertyDamage_Loss, 
                      COL_GLBI_Theft_Count, COL_GLBI_Theft_Count_rptd, COL_GLBI_Theft_Loss, COL_GLBI_SlanderDefamtion_Count, COL_GLBI_SlanderDefamtion_Count_rptd, 
                      COL_GLBI_SlanderDefamtion_Loss, COL_GLBI_Discrim_WrongfulTermination_Count, COL_GLBI_Discrim_WrongfulTermination_Count_rptd, 
                      COL_GLBI_Discrim_WrongfulTermination_Loss, COL_Prop_Fire_Lightning_Explosion_Count, COL_Prop_Fire_Lightning_Explosion_Count_rptd, 
                      COL_Prop_Fire_Lightning_Explosion_Loss, COL_Prop_Theft_Van_Count, COL_Prop_Theft_Van_Count_rptd, COL_Prop_Theft_Van_Loss, 
                      COL_Prop_Water_Sprinkler_Count, COL_Prop_Water_Sprinkler_Count_rptd, COL_Prop_Water_Sprinkler_Loss, COL_Prop_Water_Other_Count, 
                      COL_Prop_Water_Other_Count_rptd, COL_Prop_Water_Other_Loss, COL_Prop_Wind_Hail_Count, COL_Prop_Wind_Hail_Count_rptd, COL_Prop_Wind_Hail_Loss, 
                      COL_Prop_Other_Count, COL_Prop_Other_Count_rptd, COL_Prop_Other_Loss, COL_AUTO_LIAB_AllOther_Count, COL_AUTO_LIAB_AllOther_Count_rptd, 
                      COL_AUTO_LIAB_AllOther_Loss, COL_AUTO_LIAB_PropDam_Count, COL_AUTO_LIAB_PropDam_Count_rptd, COL_AUTO_LIAB_PropDam_Loss, 
                      COL_AUTO_PHYS_Coll_Count, COL_AUTO_PHYS_Coll_Count_rptd, COL_AUTO_PHYS_Coll_Loss, COL_AUTO_PHYS_Glass_Count, 
                      COL_AUTO_PHYS_Glass_Count_rptd, COL_AUTO_PHYS_Glass_Loss, COL_AUTO_PHYS_Other_Count, COL_AUTO_PHYS_Other_Count_rptd, 
                      COL_AUTO_PHYS_Other_Loss, COL_AUTO_PHYS_Theft_Count, COL_AUTO_PHYS_Theft_Count_rptd, COL_AUTO_PHYS_Theft_Loss, Case_Loss, Case_ALAE, 
                      Paid_Loss, Paid_ALAE, Sal_Subro, Incurred_Loss_ALAE_with_SS, Incurred_Loss_ALAE_without_SS, Incurred_Loss_ALAE_with_SS_NonCat, 
                      Incurred_Loss_ALAE_without_SS_NonCat, Loss_ALAE_Cap, Incurred_Loss_ALAE_with_SS_CatOnly, Incurred_Loss_ALAE_without_SS_CatOnly, Capping_Factor, 
                      Capped_Incurred_Loss_ALAE_with_SS, Capped_Incurred_Loss_ALAE_with_SS_wo_cat, LDF, Capped_LDF, Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly, Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, Ult_LDF_Incurred_Loss_ALAE_without_SS, 
                      Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly, Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat, Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Reported_Claims, Open_Claims, Closed_With_Pay_Claims, Closed_Without_Pay_Claims, Incurred_Claims, 
                      Accident_State, Latest_Claim_Trans_Yr_Mm, Accident_State_has_premium, Accident_State_for_join, Riskcode, Risk_Location, Risk_Building, Risk_Vehicle
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_June
' 
GO
