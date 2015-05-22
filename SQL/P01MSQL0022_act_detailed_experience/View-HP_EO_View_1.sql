IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HP_EO_View_1]'))
DROP VIEW [dbo].[HP_EO_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HP_EO_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.HP_EO_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_May.statecode, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_May.productcode, dbo.ALL_POLICIES_12_premium_summary_May.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_May.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_May.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_May.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_May.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_May.Branch_Region, dbo.Policy_Information_ALL_POLICIES_May.program, 
                      dbo.Policy_Information_ALL_POLICIES_May.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_May.product_group, dbo.Policy_Information_ALL_POLICIES_May.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Earned_TIV) AS Earned_TIV, dbo.Policy_Information_ALL_POLICIES_May.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_May.accountnumber, dbo.Policy_Information_ALL_POLICIES_May.Primary_Producer_type, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_Name, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Independent_Contractors_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Licensed_Professional_Designations_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.CGL_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Clean_Warranty_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Complete_Signed_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Engagement_Letters_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Prior_Coverage_YN, dbo.Policy_Information_Underwriting_Check_List_May.Resumes_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Standard_Contract_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_May.Business_Desc, dbo.Policy_Information_ALL_POLICIES_May.Business_Name, 
                      dbo.Policy_Information_ALL_POLICIES_May.Latest_PY, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Breach_of_Contract_Count) 
                      AS COL_CL_Breach_of_Contract_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Breach_of_Contract_Loss) 
                      AS COL_CL_Breach_of_Contract_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Breach_of_Fiduciary_Liability_Count) 
                      AS COL_CL_Breach_of_Fiduciary_Liability_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Breach_of_Fiduciary_Liability_Loss)
                       AS COL_CL_Breach_of_Fiduciary_Liability_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Financial_Advisor_Count) 
                      AS COL_CL_Financial_Advisor_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Financial_Advisor_Loss) 
                      AS COL_CL_Financial_Advisor_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Misconduct_Count) 
                      AS COL_CL_Misconduct_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Misconduct_Loss) AS COL_CL_Misconduct_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Wills_Estate_Count) AS COL_CL_Wills_Estate_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Wills_Estate_Loss) AS COL_CL_Wills_Estate_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Corporate_Count) AS COL_CL_Corporate_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Corporate_Loss) AS COL_CL_Corporate_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Tax_Liability_Count) AS COL_CL_Tax_Liability_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Tax_Liability_Loss) AS COL_CL_Tax_Liability_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Violation_GAAP_Count) AS COL_CL_Violation_GAAP_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Violation_GAAP_Loss) AS COL_CL_Violation_GAAP_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Negligent_Training_Count) AS COL_CL_Negligent_Training_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Negligent_Training_Loss) AS COL_CL_Negligent_Training_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Electronic_Data_Damage_Count) AS COL_CL_Electronic_Data_Damage_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_Electronic_Data_Damage_Loss) AS COL_CL_Electronic_Data_Damage_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_All_Other_Count) AS COL_CL_All_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_CL_All_Other_Loss) AS COL_CL_All_Other_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_May.policy_effective_year, dbo.Policy_Information_ALL_POLICIES_May.DivisionName, 
                      dbo.Policy_Information_ALL_POLICIES_May.ProductType, dbo.Policy_Information_ALL_POLICIES_May.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_May.Source_Detail_Name, dbo.Policy_Information_ALL_POLICIES_May.PIC_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_May.First_Policy_Year, dbo.Policy_Information_ALL_POLICIES_May.Last_Reporting_Year, 
                      dbo.Policy_Information_ALL_POLICIES_May.Last_Reporting_Month, dbo.Policy_Information_ALL_POLICIES_May.underwriter, 
                      dbo.ALL_POLICIES_12_premium_summary_May.Fiscal_AY_Month_Ending, 
                      dbo.Policy_Information_ALL_POLICIES_May.New_Renew_Automatic_Prior_Policy, 
                      dbo.Policy_Information_ALL_POLICIES_May.New_Renew_Automatic_Prior_Policy_2, 
                      dbo.Policy_Information_ALL_POLICIES_May.New_Renew_Automatic_Prior_Policy_3, 
                      dbo.Policy_Information_ALL_POLICIES_May.Written_Premium_Range_for_Product
FROM         dbo.ALL_POLICIES_12_premium_summary_May LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Information_Underwriting_Check_List_May.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Information_ALL_POLICIES_May.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.policynumber AND 
                      dbo.ALL_POLICIES_12_premium_summary_May.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_May.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_May.statecode, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_May.productcode, dbo.ALL_POLICIES_12_premium_summary_May.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_May.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_May.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_May.Branch_Region, dbo.Policy_Information_ALL_POLICIES_May.program, 
                      dbo.Policy_Information_ALL_POLICIES_May.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_May.product_group, dbo.Policy_Information_ALL_POLICIES_May.Primary_Umbrella, 
                      dbo.Policy_Information_ALL_POLICIES_May.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_May.accountnumber, dbo.Policy_Information_ALL_POLICIES_May.Primary_Producer_type, 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_Name, dbo.Policy_Information_Underwriting_Check_List_May.Independent_Contractors_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Licensed_Professional_Designations_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.CGL_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Clean_Warranty_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Complete_Signed_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Engagement_Letters_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Prior_Coverage_YN, dbo.Policy_Information_Underwriting_Check_List_May.Resumes_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Standard_Contract_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_May.Business_Desc, dbo.Policy_Information_ALL_POLICIES_May.Business_Name, 
                      dbo.Policy_Information_ALL_POLICIES_May.Latest_PY, dbo.Policy_Information_ALL_POLICIES_May.policy_effective_year, 
                      dbo.Policy_Information_ALL_POLICIES_May.DivisionName, dbo.Policy_Information_ALL_POLICIES_May.ProductType, 
                      dbo.Policy_Information_ALL_POLICIES_May.BusinessClassDesc, dbo.Policy_Information_ALL_POLICIES_May.Source_Detail_Name, 
                      dbo.Policy_Information_ALL_POLICIES_May.PIC_Producer, dbo.Policy_Information_ALL_POLICIES_May.First_Policy_Year, 
                      dbo.Policy_Information_ALL_POLICIES_May.Last_Reporting_Year, dbo.Policy_Information_ALL_POLICIES_May.Last_Reporting_Month, 
                      dbo.Policy_Information_ALL_POLICIES_May.underwriter, dbo.ALL_POLICIES_12_premium_summary_May.Fiscal_AY_Month_Ending, 
                      dbo.Policy_Information_ALL_POLICIES_May.New_Renew_Automatic_Prior_Policy, 
                      dbo.Policy_Information_ALL_POLICIES_May.New_Renew_Automatic_Prior_Policy_2, 
                      dbo.Policy_Information_ALL_POLICIES_May.New_Renew_Automatic_Prior_Policy_3, 
                      dbo.Policy_Information_ALL_POLICIES_May.Written_Premium_Range_for_Product
HAVING      (dbo.ALL_POLICIES_12_premium_summary_May.productcode = ''HP'') AND (dbo.ALL_POLICIES_12_premium_summary_May.Fiscal_AY_Year > ''2006'')
' 
GO
