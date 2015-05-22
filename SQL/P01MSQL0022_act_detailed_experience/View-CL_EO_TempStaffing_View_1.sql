IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_EO_TempStaffing_View_1]'))
DROP VIEW [dbo].[CL_EO_TempStaffing_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_EO_TempStaffing_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.CL_EO_TempStaffing_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_September.statecode, dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_September.productcode, dbo.ALL_POLICIES_12_premium_summary_September.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_September.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_September.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_September.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_September.Branch_Region, dbo.Policy_Information_ALL_POLICIES_September.program, 
                      dbo.Policy_Information_ALL_POLICIES_September.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_September.product_group, dbo.Policy_Information_ALL_POLICIES_September.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_September.accountnumber, dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer_type, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) 
                      AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, dbo.ALL_POLICIES_12_premium_summary_September.policynumber, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Form, dbo.Policy_Information_ALL_POLICIES_September.Account_Name, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Independent_Contractors_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Licensed_Professional_Designations_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.CGL_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Clean_Warranty_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Complete_Signed_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Engagement_Letters_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Prior_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Resumes_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Standard_Contract_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Business_Desc, dbo.Policy_Information_ALL_POLICIES_September.Business_Name, 
                      dbo.Policy_Information_ALL_POLICIES_September.Latest_PY, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Breach_of_Contract_Count) AS COL_CL_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Breach_of_Contract_Loss) AS COL_CL_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Breach_of_Fiduciary_Liability_Count) 
                      AS COL_CL_Breach_of_Fiduciary_Liability_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Breach_of_Fiduciary_Liability_Loss) 
                      AS COL_CL_Breach_of_Fiduciary_Liability_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Financial_Advisor_Count) 
                      AS COL_CL_Financial_Advisor_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Financial_Advisor_Loss) 
                      AS COL_CL_Financial_Advisor_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Misconduct_Count) 
                      AS COL_CL_Misconduct_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Misconduct_Loss) 
                      AS COL_CL_Misconduct_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Wills_Estate_Count) 
                      AS COL_CL_Wills_Estate_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Wills_Estate_Loss) 
                      AS COL_CL_Wills_Estate_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Corporate_Count) AS COL_CL_Corporate_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Corporate_Loss) AS COL_CL_Corporate_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Tax_Liability_Count) AS COL_CL_Tax_Liability_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Tax_Liability_Loss) AS COL_CL_Tax_Liability_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Violation_GAAP_Count) AS COL_CL_Violation_GAAP_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Violation_GAAP_Loss) AS COL_CL_Violation_GAAP_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Negligent_Training_Count) AS COL_CL_Negligent_Training_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Negligent_Training_Loss) AS COL_CL_Negligent_Training_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Electronic_Data_Damage_Count) AS COL_CL_Electronic_Data_Damage_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_Electronic_Data_Damage_Loss) AS COL_CL_Electronic_Data_Damage_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_All_Other_Count) AS COL_CL_All_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_CL_All_Other_Loss) AS COL_CL_All_Other_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_September.policy_effective_year, dbo.Policy_Information_ALL_POLICIES_September.DivisionName, 
                      dbo.Policy_Information_ALL_POLICIES_September.ProductType, dbo.Policy_Information_ALL_POLICIES_September.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_September.Source_Detail_Name, dbo.Policy_Information_ALL_POLICIES_September.PIC_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_September.First_Policy_Year, dbo.Policy_Information_ALL_POLICIES_September.Last_Reporting_Year, 
                      dbo.Policy_Information_ALL_POLICIES_September.Last_Reporting_Month, dbo.Policy_Information_ALL_POLICIES_September.underwriter, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Fiscal_AY_Month_Ending, dbo.Policy_Information_CL_September.CL_Occ_Limit, 
                      dbo.Policy_Information_CL_September.CL_Agg_Limit, dbo.Policy_Information_CL_September.CL_Deductible, 
                      dbo.Policy_Information_CL_September.CL_Revenues, dbo.Policy_Information_CL_September.CL_RetroactiveYears, 
                      dbo.Policy_Information_CL_September.CL_ContractsUsage, dbo.Policy_Information_CL_September.CL_HazardGroup, 
                      dbo.Policy_Information_CL_September.CL_ProgramMod_Factor, dbo.Policy_Information_CL_September.CL_BusinessType, 
                      dbo.Policy_Information_CL_September.CL_Revenue_Per_Employee, dbo.Policy_Information_CL_September.CL_Mortgage_Broker_Ind, 
                      dbo.Policy_Information_CL_September.CL_Revenues_range, dbo.Policy_Information_CL_September.CL_Prior_Years_Range, 
                      dbo.Policy_Information_CL_September.CL_Occ_Limit_int, dbo.Policy_Information_CL_September.CL_Agg_Limit_int, 
                      dbo.Policy_Information_CL_September.CL_Deductible_int, dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Automatic_Prior_Policy, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Automatic_Prior_Policy_2, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Automatic_Prior_Policy_3, 
                      dbo.Policy_Information_ALL_POLICIES_September.Written_Premium_Range_for_Product, 
                      dbo.Policy_Information_CL_September.Staffing_Pro_Pak_Endorsement, dbo.Policy_Information_ALL_POLICIES_September.policyEffectivedate, 
                      dbo.Policy_Information_ALL_POLICIES_September.policyexpirationdate, dbo.Policy_Information_ALL_POLICIES_September.canceldate, 
                      dbo.Policy_Information_ALL_POLICIES_September.reinstatementdate, dbo.ALL_POLICIES_12_premium_summary_September.acctngyear
FROM         dbo.ALL_POLICIES_12_premium_summary_September LEFT OUTER JOIN
                      dbo.Policy_Information_CL_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Information_CL_September.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Information_Underwriting_Check_List_September.policynumber LEFT
                       OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Information_ALL_POLICIES_September.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.policynumber
                       AND 
                      dbo.ALL_POLICIES_12_premium_summary_September.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Productcode
                       AND 
                      dbo.ALL_POLICIES_12_premium_summary_September.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.statecode AND
                       dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_September.statecode, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_September.productcode, dbo.ALL_POLICIES_12_premium_summary_September.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_September.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_September.Branch_Region, dbo.Policy_Information_ALL_POLICIES_September.program, 
                      dbo.Policy_Information_ALL_POLICIES_September.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_September.product_group, dbo.Policy_Information_ALL_POLICIES_September.Primary_Umbrella, 
                      dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.accountnumber, dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer_type, 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber, dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_Name, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Independent_Contractors_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Licensed_Professional_Designations_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.CGL_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Clean_Warranty_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Complete_Signed_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Engagement_Letters_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Prior_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Resumes_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Standard_Contract_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Business_Desc, dbo.Policy_Information_ALL_POLICIES_September.Business_Name, 
                      dbo.Policy_Information_ALL_POLICIES_September.Latest_PY, dbo.Policy_Information_ALL_POLICIES_September.policy_effective_year, 
                      dbo.Policy_Information_ALL_POLICIES_September.DivisionName, dbo.Policy_Information_ALL_POLICIES_September.ProductType, 
                      dbo.Policy_Information_ALL_POLICIES_September.BusinessClassDesc, dbo.Policy_Information_ALL_POLICIES_September.Source_Detail_Name, 
                      dbo.Policy_Information_ALL_POLICIES_September.PIC_Producer, dbo.Policy_Information_ALL_POLICIES_September.First_Policy_Year, 
                      dbo.Policy_Information_ALL_POLICIES_September.Last_Reporting_Year, dbo.Policy_Information_ALL_POLICIES_September.Last_Reporting_Month, 
                      dbo.Policy_Information_ALL_POLICIES_September.underwriter, dbo.ALL_POLICIES_12_premium_summary_September.Fiscal_AY_Month_Ending, 
                      dbo.Policy_Information_CL_September.CL_Occ_Limit, dbo.Policy_Information_CL_September.CL_Agg_Limit, 
                      dbo.Policy_Information_CL_September.CL_Deductible, dbo.Policy_Information_CL_September.CL_Revenues, 
                      dbo.Policy_Information_CL_September.CL_RetroactiveYears, dbo.Policy_Information_CL_September.CL_ContractsUsage, 
                      dbo.Policy_Information_CL_September.CL_HazardGroup, dbo.Policy_Information_CL_September.CL_ProgramMod_Factor, 
                      dbo.Policy_Information_CL_September.CL_BusinessType, dbo.Policy_Information_CL_September.CL_Revenue_Per_Employee, 
                      dbo.Policy_Information_CL_September.CL_Mortgage_Broker_Ind, dbo.Policy_Information_CL_September.CL_Revenues_range, 
                      dbo.Policy_Information_CL_September.CL_Prior_Years_Range, dbo.Policy_Information_CL_September.CL_Occ_Limit_int, 
                      dbo.Policy_Information_CL_September.CL_Agg_Limit_int, dbo.Policy_Information_CL_September.CL_Deductible_int, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Automatic_Prior_Policy, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Automatic_Prior_Policy_2, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Automatic_Prior_Policy_3, 
                      dbo.Policy_Information_ALL_POLICIES_September.Written_Premium_Range_for_Product, 
                      dbo.Policy_Information_CL_September.Staffing_Pro_Pak_Endorsement, dbo.Policy_Information_ALL_POLICIES_September.policyEffectivedate, 
                      dbo.Policy_Information_ALL_POLICIES_September.policyexpirationdate, dbo.Policy_Information_ALL_POLICIES_September.canceldate, 
                      dbo.Policy_Information_ALL_POLICIES_September.reinstatementdate, dbo.ALL_POLICIES_12_premium_summary_September.acctngyear
HAVING      (dbo.ALL_POLICIES_12_premium_summary_September.productcode = ''CL'') AND 
                      (dbo.Policy_Information_CL_September.Staffing_Pro_Pak_Endorsement IS NOT NULL OR
                      dbo.Policy_Information_CL_September.CL_BusinessType IN (''Employment Agents'', ''Employee Leasing''))
' 
GO
