IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_ALL_POLICIES_View_1]'))
DROP VIEW [dbo].[Latest_Policy_Information_ALL_POLICIES_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_ALL_POLICIES_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_Policy_Information_ALL_POLICIES_View_1
AS
SELECT     accountnumber, Productcode, policynumber, policyEffectivedate, maxeffdate, policyid, Account_Name, Insured_Name, Property_Coverage_Form, Primary_Umbrella, 
                      underwriterPID, Companycode, billplancode, product_group, package_monoline, policy_effective_year, policy_effective_month, policyexpirationdate, canceldate, 
                      reinstatementdate, Prior_Policy_number, New_Renew_Tail, Branchcode, Renew_New_Auto, FAY_For_Review, underwriter, BillplanshortDesc, zipcode, Branch_Office, 
                      Branch_Region, East_MidWest_West_Region, program, NAICS, Program_Code, First_Policy_Year_Temp, Last_Reporting_Year, Last_Reporting_Month, 
                      Inforce_as_of_Cat_Model_Date, First_Policy_Year, written_premium_policy, County, County_Pop_Density, Term_factor, Latest_PY, Business_Name, Business_Desc, 
                      Written_Premium_Range_for_Product, Written_Premium_Range, County_Pop_Density_Range, Number_of_Renewals, Renewals_Range, prior_policynumber_2, 
                      prior_policynumber_3, prior_policynumber_4, prior_policynumber_5, prior_policynumber_6, prior_policynumber_7, prior_policynumber_8, 
                      New_Renew_Automatic_Prior_Policy, New_Renew_Automatic_Prior_Policy_2, New_Renew_Automatic_Prior_Policy_3, New_Renew_Automatic_Prior_Policy_4, 
                      New_Renew_Automatic_Prior_Policy_5, PIC_Producer_code, PIC_Commission_pct, Primary_Producer_code, Primary_Commission_pct, PIC_Producer, 
                      PIC_Producer_type, Primary_Producer, Primary_Producer_type, Commission_pct, Count_of_Account_Numbers, Count_of_Account_Numbers_Range, Account_UltLoss, 
                      Account_UltLoss_NonCat, Account_RepLoss, Account_RepLoss_NonCat, Account_EarnedPremium, Account_UltLoss_priorpolperiods, 
                      Account_UltLoss_NonCat_priorpolperiods, Account_RepLoss_priorpolperiods, Account_RepLoss_NonCat_priorpolperiods, Account_EarnedPremium_priorpolperiods, 
                      Account_UltLoss_Working_Cover, Account_UltLoss_NonCat_Working_Cover, Account_RepLoss_Working_Cover, Account_RepLoss_NonCat_Working_Cover, 
                      Account_EarnedPremium_Working_Cover, Account_UltLoss_Working_Cover_priorpolperiods, Account_UltLoss_NonCat_Working_Cover_priorpolperiods, 
                      Account_RepLoss_Working_Cover_priorpolperiods, Account_RepLoss_NonCat_Working_Cover_priorpolperiods, 
                      Account_EarnedPremium_Working_Cover_priorpolperiods, Account_Premium_latest_year, Account_Premium_range, Account_written_premium_for_product, 
                      Account_written_premium_for_product_max, Account_Dominant_Product, Account_Dominant_Product_Group, Account_Dominant_Product_policy_premium_max, 
                      Account_Dominant_Policy, Dominant_Policy_max_effdate, Review_quarter, Account_UltLoss_Ratio, Account_UltLoss_Ratio_NonCat, Account_RepLoss_Ratio, 
                      Account_RepLoss_Ratio_NonCat, Account_UltLoss_Ratio_Working_Cover, Account_UltLoss_Ratio_nonCat_Working_Cover, Account_RepLoss_Ratio_Working_Cover, 
                      Account_RepLoss_Ratio_nonCat_Working_Cover, Account_UltLoss_Ratio_priorpolperiods, Account_UltLoss_Ratio_NonCat_priorpolperiods, 
                      Account_RepLoss_Ratio_priorpolperiods, Account_RepLoss_Ratio_NonCat_priorpolperiods, Account_UltLoss_Ratio_Working_Cover_priorpolperiods, 
                      Account_UltLoss_Ratio_nonCat_Working_Cover_priorpolperiods, Account_RepLoss_Ratio_Working_Cover_priorpolperiods, 
                      Account_RepLoss_Ratio_nonCat_Working_Cover_priorpolperiods, Account_UltLoss_Ratio_Range, Account_UltLoss_Ratio_NonCat_Range, 
                      Account_RepLoss_Ratio_Range, Account_RepLoss_Ratio_NonCat_Range, Account_UltLoss_Ratio_priorpolperiods_Range, 
                      Account_UltLoss_Ratio_NonCat_priorpolperiods_Range, Account_RepLoss_Ratio_priorpolperiods_Range, Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      Account_UltLoss_Ratio_Working_Cover_Range, Account_UltLoss_Ratio_NonCat_Working_Cover_Range, Account_RepLoss_Ratio_Working_Cover_Range, 
                      Account_RepLoss_Ratio_NonCat_Working_Cover_Range, Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, Endorsement_VS_001, PVCD_Amendment_End_Y_N, PVCD_Partnership_End_Y_N, 
                      PVCD_ProPak_Elite72_End_Y_N, PVCD_ProPak_Elite73_End_Y_N, PVCD_ProPak_Elite_Vermont7273_End_Y_N, PVCD_Circumstance_Exclusion_End_Y_N, 
                      PVCD_Professional_Services_End_Y_N, PVCD_BullsEye_ProPak_End_Y_N, PVCD_Sexual_Abuse_Exclusion_End_Y_N, 
                      PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N, PVCD_Amend_of_ExclusionK_End_Y_N, PVCD_Amend_of_Severability_Provision_End_Y_N, 
                      PVCD_Third_Party_Exclusion_End_Y_N, PVCD_Punitive_Exclusion_End_Y_N, PVCD_Medical_Malpractice_Exclusion_End_Y_N, 
                      PVCD_Insurance_EO_Exclusion_End_Y_N, PVCD_Full_Securities_Exclusion_End_Y_N, PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N, 
                      PVCD_Bankruptcy_Exclusion_End_Y_N, PVCD_Shareholder_End_Y_N, PVCD_Past_Acts_End_Y_N, PVCD_No_Liab_Retent_Waiver_End_Y_N, 
                      PVCD_Manuscript_Endorsement_End_Y_N, PVCD_Election_ERP_End_Y_N, PVCD_Delete_Consent_End_Y_N, PVCD_Damages_Only_Retention_End_Y_N, 
                      PVCD_Class_Action_Sublimit_SubRetention_End_Y_N, Endorsement_MOLL, Endorsement_MOLL_YN, Endorsement_HS_009, Endorsement_HS_013, 
                      Endorsement_HS_004, Endorsement_GLDX, Endorsement_GLDX_YN, Endorsement_DY_CG2504, Endorsement_FA_Elite, Endorsement_Elite_YN, 
                      Source_Detail_Name, BusinessClassDesc, ProductType, DivisionName, PolicyEntityState
FROM         dbo.Policy_Information_ALL_POLICIES_June
' 
GO
