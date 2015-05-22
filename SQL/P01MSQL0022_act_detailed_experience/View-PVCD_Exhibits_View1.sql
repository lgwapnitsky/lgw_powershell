IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_Exhibits_View1]'))
DROP VIEW [dbo].[PVCD_Exhibits_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_Exhibits_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PVCD_Exhibits_View1
AS
SELECT     dbo.ALL_POLICIES_15_premium_summary.statecode, dbo.ALL_POLICIES_15_premium_summary.productcode, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, dbo.ALL_POLICIES_15_premium_summary.Coverage_Group, 
                      dbo.ALL_POLICIES_15_premium_summary.Last_Reporting_Year, SUM(dbo.ALL_POLICIES_15_premium_summary.Incurred_Loss_ALAE_with_SS) 
                      AS Incurred_Loss_ALAE_with_SS, dbo.ALL_POLICIES_15_premium_summary.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Reported_Claims) AS Reported_Claims, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_Breach_of_Contract_Loss) AS COL_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_Discrimination_Loss) AS COL_Discrimination_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_Wrongful_Termination_Loss) AS COL_Wrongful_Termination_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_Harrassment_Loss) AS COL_Harrassment_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_SLD_All_Other_Count_rptd) AS COL_SLD_All_Other_Count_rptd, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_Breach_of_Contract_Count_rptd) AS COL_Breach_of_Contract_Count_rptd, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_Discrimination_Count_rptd) AS COL_Discrimination_Count_rptd, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_Wrongful_Termination_Count_rptd) AS COL_Wrongful_Termination_Count_rptd, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_SLD_All_Other_Loss) AS COL_SLD_All_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_Harrassment_Count_rptd) AS COL_Harrassment_Count_rptd, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Employment_Handbook, dbo.PVCD_Underwriting_Checklist.PVCD_Form_5500, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Retro_Date_Applies, dbo.PVCD_Underwriting_Checklist.PVCD_EEO1_Report_Received, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Subsidiaries_Affiliates, dbo.PVCD_Underwriting_Checklist.PVCD_Board_Experience, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Employment_Policies, dbo.PVCD_Underwriting_Checklist.PVCD_Clean_Warranty_Letter_Received, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Number_of_Full_Time_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Number_of_Part_Time_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Number_of_Temporary_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Number_of_Total_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Claims_Past_5yrs_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Insider_Shareholder_Percent_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Employee_Salary_GT100k_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_100k_Salary_to_Total_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Percent_of_Part_Time_and_Temp_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Employees_SUM_Range, dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Plan_Assets_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Total_Participants_Range, dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Total_Claims_Range, 
                      dbo.ALL_POLICIES_15_premium_summary.Loss_Evaluation_Month, dbo.ALL_POLICIES_15_premium_summary.Loss_Evaluation_Year, 
                      dbo.Policy_Information_PVCD_C.PVCD_PVDO_Limit, dbo.Policy_Information_PVCD_C.PVCD_PVDO_Alt_Retention, 
                      dbo.Policy_Information_PVCD_C.PVCD_PVDO_RatingClass, dbo.Policy_Information_PVCD_C.PVCD_PVEPL_Limit, 
                      dbo.Policy_Information_PVCD_C.PVCD_PVEPL_Alt_Retention, dbo.Policy_Information_PVCD_C.PVCD_PVEPL_RatingClass, 
                      dbo.Policy_Information_PVCD_C.PVCD_PVEPL_Num_of_Employees, dbo.Policy_Information_PVCD_C.PVCD_Business_Type, 
                      dbo.Policy_Information_PVCD_C.PVCD_PVEPL_Num_of_Employees_Range, dbo.Policy_Information_PVCD_C.companycode, 
                      dbo.Policy_Information_PVCD_C.Renew_New_Auto, dbo.Policy_Information_PVCD_C.First_Policy_Year, 
                      dbo.Policy_Information_PVCD_C.Branch_Region, dbo.Policy_Information_PVCD_C.Written_Premium_Range, 
                      dbo.Policy_Information_PVCD_C.Primary_Producer, dbo.Policy_Information_PVCD_C.Primary_Producer_type, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Information_PVCD_C.New_Renew_Tail, dbo.Policy_Information_PVCD_C.PVCD_Amendment_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Partnership_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_ProPak_Elite72_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_ProPak_Elite73_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_Circumstance_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Professional_Services_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_BullsEye_ProPak_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Sexual_Abuse_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Amend_of_ExclusionK_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Amend_of_Severability_Provision_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Third_Party_Exclusion_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_Punitive_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Medical_Malpractice_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Insurance_EO_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Full_Securities_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Bankruptcy_Exclusion_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_Shareholder_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Past_Acts_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_No_Liab_Retent_Waiver_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Election_ERP_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_Delete_Consent_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Damages_Only_Retention_End_Y_N, dbo.Policy_Information_PVCD_C.EPL_Id, 
                      dbo.ALL_POLICIES_15_premium_summary.COL_AUTO_PHYS_Glass_Loss, dbo.ALL_POLICIES_15_premium_summary.Incurred_Claims
FROM         dbo.PVCD_Underwriting_Checklist RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_15_premium_summary ON 
                      dbo.PVCD_Underwriting_Checklist.PolicyNumber = dbo.ALL_POLICIES_15_premium_summary.policynumber RIGHT OUTER JOIN
                      dbo.Policy_Information_PVCD_C ON 
                      dbo.ALL_POLICIES_15_premium_summary.policynumber = dbo.Policy_Information_PVCD_C.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES ON 
                      dbo.ALL_POLICIES_15_premium_summary.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.policynumber AND 
                      dbo.ALL_POLICIES_15_premium_summary.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.Productcode AND 
                      dbo.ALL_POLICIES_15_premium_summary.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.statecode AND 
                      dbo.ALL_POLICIES_15_premium_summary.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.coverage_group
GROUP BY dbo.ALL_POLICIES_15_premium_summary.productcode, dbo.ALL_POLICIES_15_premium_summary.statecode, 
                      dbo.ALL_POLICIES_15_premium_summary.Coverage_Group, dbo.ALL_POLICIES_15_premium_summary.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_15_premium_summary.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Employment_Handbook, dbo.PVCD_Underwriting_Checklist.PVCD_Form_5500, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Retro_Date_Applies, dbo.PVCD_Underwriting_Checklist.PVCD_EEO1_Report_Received, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Subsidiaries_Affiliates, dbo.PVCD_Underwriting_Checklist.PVCD_Board_Experience, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Employment_Policies, dbo.PVCD_Underwriting_Checklist.PVCD_Clean_Warranty_Letter_Received, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Number_of_Full_Time_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Number_of_Part_Time_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Number_of_Temporary_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_Number_of_Total_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Claims_Past_5yrs_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Insider_Shareholder_Percent_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Employee_Salary_GT100k_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_100k_Salary_to_Total_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Percent_of_Part_Time_and_Temp_Employees_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Employees_SUM_Range, dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Plan_Assets_Range, 
                      dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Total_Participants_Range, dbo.PVCD_Underwriting_Checklist.PVCD_UWCL_Total_Claims_Range, 
                      dbo.ALL_POLICIES_15_premium_summary.Loss_Evaluation_Month, dbo.ALL_POLICIES_15_premium_summary.Loss_Evaluation_Year, 
                      dbo.Policy_Information_PVCD_C.PVCD_PVDO_Limit, dbo.Policy_Information_PVCD_C.PVCD_PVDO_Alt_Retention, 
                      dbo.Policy_Information_PVCD_C.PVCD_PVDO_RatingClass, dbo.Policy_Information_PVCD_C.PVCD_PVEPL_Limit, 
                      dbo.Policy_Information_PVCD_C.PVCD_PVEPL_Alt_Retention, dbo.Policy_Information_PVCD_C.PVCD_PVEPL_RatingClass, 
                      dbo.Policy_Information_PVCD_C.PVCD_PVEPL_Num_of_Employees, dbo.Policy_Information_PVCD_C.PVCD_Business_Type, 
                      dbo.Policy_Information_PVCD_C.PVCD_PVEPL_Num_of_Employees_Range, dbo.Policy_Information_PVCD_C.companycode, 
                      dbo.Policy_Information_PVCD_C.Renew_New_Auto, dbo.Policy_Information_PVCD_C.First_Policy_Year, 
                      dbo.Policy_Information_PVCD_C.Branch_Region, dbo.Policy_Information_PVCD_C.Written_Premium_Range, 
                      dbo.Policy_Information_PVCD_C.Primary_Producer, dbo.Policy_Information_PVCD_C.Primary_Producer_type, 
                      dbo.Policy_Information_PVCD_C.New_Renew_Tail, dbo.Policy_Information_PVCD_C.PVCD_Amendment_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Partnership_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_ProPak_Elite72_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_ProPak_Elite73_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_Circumstance_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Professional_Services_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_BullsEye_ProPak_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Sexual_Abuse_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Amend_of_ExclusionK_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Amend_of_Severability_Provision_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Third_Party_Exclusion_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_Punitive_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Medical_Malpractice_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Insurance_EO_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Full_Securities_Exclusion_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Bankruptcy_Exclusion_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_Shareholder_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Past_Acts_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_No_Liab_Retent_Waiver_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Election_ERP_End_Y_N, dbo.Policy_Information_PVCD_C.PVCD_Delete_Consent_End_Y_N, 
                      dbo.Policy_Information_PVCD_C.PVCD_Damages_Only_Retention_End_Y_N, dbo.Policy_Information_PVCD_C.EPL_Id, 
                      dbo.ALL_POLICIES_15_premium_summary.COL_AUTO_PHYS_Glass_Loss, dbo.ALL_POLICIES_15_premium_summary.Incurred_Claims
HAVING      (dbo.ALL_POLICIES_15_premium_summary.productcode IN (''PV'', ''CD''))
' 
GO
