IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_EO_View_1_ClaimAdj]'))
DROP VIEW [dbo].[CL_EO_View_1_ClaimAdj]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_EO_View_1_ClaimAdj]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.CL_EO_View_1_ClaimAdj
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_B.statecode, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_B.productcode, dbo.ALL_POLICIES_12_premium_summary_B.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, dbo.Policy_Information_ALL_POLICIES_B.program, 
                      dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.product_group, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_TIV) AS Earned_TIV, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.accountnumber, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer_type, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_Name, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS_CatOnly) 
                      AS Incurred_Loss_ALAE_with_SS_CatOnly, dbo.Policy_Information_Underwriting_Check_List_B.Independent_Contractors_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Licensed_Professional_Designations_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.CGL_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Clean_Warranty_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Complete_Signed_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Engagement_Letters_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Prior_Coverage_YN, dbo.Policy_Information_Underwriting_Check_List_B.Resumes_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Standard_Contract_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Business_Desc, dbo.Policy_Information_ALL_POLICIES_B.Business_Name, 
                      dbo.Policy_Information_ALL_POLICIES_B.Latest_PY, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Breach_of_Contract_Count) 
                      AS COL_CL_Breach_of_Contract_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Breach_of_Contract_Loss) 
                      AS COL_CL_Breach_of_Contract_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Breach_of_Fiduciary_Liability_Count) 
                      AS COL_CL_Breach_of_Fiduciary_Liability_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Breach_of_Fiduciary_Liability_Loss) 
                      AS COL_CL_Breach_of_Fiduciary_Liability_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Financial_Advisor_Count) 
                      AS COL_CL_Financial_Advisor_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Financial_Advisor_Loss) 
                      AS COL_CL_Financial_Advisor_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Misconduct_Count) AS COL_CL_Misconduct_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Misconduct_Loss) AS COL_CL_Misconduct_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Wills_Estate_Count) AS COL_CL_Wills_Estate_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Wills_Estate_Loss) AS COL_CL_Wills_Estate_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Corporate_Count) AS COL_CL_Corporate_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Corporate_Loss) AS COL_CL_Corporate_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Tax_Liability_Count) AS COL_CL_Tax_Liability_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Tax_Liability_Loss) AS COL_CL_Tax_Liability_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Violation_GAAP_Count) AS COL_CL_Violation_GAAP_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Violation_GAAP_Loss) AS COL_CL_Violation_GAAP_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Negligent_Training_Count) AS COL_CL_Negligent_Training_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Negligent_Training_Loss) AS COL_CL_Negligent_Training_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Electronic_Data_Damage_Count) AS COL_CL_Electronic_Data_Damage_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_Electronic_Data_Damage_Loss) AS COL_CL_Electronic_Data_Damage_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_All_Other_Count) AS COL_CL_All_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_CL_All_Other_Loss) AS COL_CL_All_Other_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_B.policy_effective_year
FROM         dbo.ALL_POLICIES_12_premium_summary_B LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_Underwriting_Check_List_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.policynumber AND 
                      dbo.ALL_POLICIES_12_premium_summary_B.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_B.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_B.statecode, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_B.productcode, dbo.ALL_POLICIES_12_premium_summary_B.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, dbo.Policy_Information_ALL_POLICIES_B.program, 
                      dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.product_group, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, 
                      dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_RepLoss_Ratio_Working_Cover_Range, dbo.Policy_Information_ALL_POLICIES_B.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer_type, dbo.ALL_POLICIES_12_premium_summary_B.policynumber, 
                      dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Form, dbo.Policy_Information_ALL_POLICIES_B.Account_Name, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Independent_Contractors_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Licensed_Professional_Designations_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.CGL_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Clean_Warranty_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Complete_Signed_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Engagement_Letters_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Prior_Coverage_YN, dbo.Policy_Information_Underwriting_Check_List_B.Resumes_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Standard_Contract_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Business_Desc, dbo.Policy_Information_ALL_POLICIES_B.Business_Name, 
                      dbo.Policy_Information_ALL_POLICIES_B.Latest_PY, dbo.Policy_Information_ALL_POLICIES_B.policy_effective_year
HAVING      (dbo.ALL_POLICIES_12_premium_summary_B.productcode = ''CL'') AND (dbo.Policy_Information_ALL_POLICIES_B.Business_Desc LIKE ''%CLAIM%'')
' 
GO
