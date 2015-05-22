IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_All_Lines_View_1_State_IL]'))
DROP VIEW [dbo].[NPDO_All_Lines_View_1_State_IL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_All_Lines_View_1_State_IL]'))
EXEC dbo.sp_executesql @statement = N'Create View dbo.NPDO_All_Lines_View_1_State_IL
AS
SELECT 
	dbo.ALL_POLICIES_12_premium_summary_December.statecode, 
	dbo.ALL_POLICIES_12_premium_summary_December.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_December.productcode, dbo.ALL_POLICIES_12_premium_summary_December.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_December.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_December.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Information_ALL_POLICIES_December.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_December.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_December.Branch_Region, dbo.Policy_Information_ALL_POLICIES_December.program, 
                      dbo.Policy_Information_ALL_POLICIES_December.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_December.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_December.product_group, dbo.Policy_Information_ALL_POLICIES_December.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_December.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_December.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_December.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_December.accountnumber, dbo.Policy_Information_ALL_POLICIES_December.Primary_Producer_type, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_December.policynumber, dbo.ALL_POLICIES_12_premium_summary_December.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_December.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_December.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_December.County_Pop_Density_Range, dbo.Policy_Information_ALL_POLICIES_December.Branch_Office, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Breach_of_Contract_Loss) AS COL_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Discrimination_Loss) AS COL_Discrimination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Wrongful_Termination_Loss) AS COL_Wrongful_Termination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Harrassment_Loss) AS COL_Harrassment_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_SLD_All_Other_Loss) AS COL_SLD_All_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_SLD_All_Other_Count) AS COL_SLD_All_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Harrassment_Count) AS COL_Harassment_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Wrongful_Termination_Count) AS COL_WrongfulTermination_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Discrimination_Count) AS COL_Discrimination_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Breach_of_Contract_Count) AS COL_Breach_of_Contract_Count, 
                      dbo.Policy_Information_ALL_POLICIES_December.First_Policy_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_DO_Other_Count) AS COL_DO_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_DO_Other_Loss) AS COL_DO_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_EPL_Other_Count) AS COL_EPL_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_EPL_Other_Loss) AS COL_EPL_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Fiduciary_Other_Count) AS COL_Fiduciary_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Fiduciary_Other_Loss) AS COL_Fiduciary_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Worplace_Violence_Other_Count) AS COL_Worplace_Violence_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Worplace_Violence_Other_Loss) AS COL_Worplace_Violence_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Internet_Other_Count) AS COL_Internet_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_December.COL_Internet_Other_Loss) AS COL_Internet_Other_Loss, 
                      dbo.Policy_Information_FF_December.FF_DO_Limit, dbo.Policy_Information_FF_December.FF_EPL_Limit, 
                      dbo.Policy_Information_FF_December.FF_DO_Alt_Retention, dbo.Policy_Information_FF_December.FF_EPL_Num_of_Employees_Range, 
                      dbo.Policy_Information_FF_December.TrimBusiness_Type, dbo.Policy_Information_FF_December.FF_DO_RatingClass, 
                      dbo.Policy_Information_FF_December.FF_EPL_RatingClass, dbo.Policy_Information_Underwriting_Check_List_December.Financials_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Supplemental_Claim_Form_Loss_Run_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Bylaws_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Employment_Handbook_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Form_5500_YN, dbo.Policy_Information_FF_December.FF_EPL_Alt_Retention, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Number_of_Years_in_Operation, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Plan_Assets, dbo.Policy_Information_Underwriting_Check_List_December.Turnover_Rate,
                       dbo.Policy_Information_Underwriting_Check_List_December.Plan_Assets_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Turnover_Rate_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Subsidiaries_Affiliates_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.No_Loss_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.No_Prior_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Clean_Warranty_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Supp_Claim_Form_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Website_Transactional_E_Commerce_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Website_Information_Only_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Transaction_E_Commerce_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Tax_Exempt_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Standard_Setting_or_Member_Certification_Services_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Security_Precautions_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Magazines_Periodicals_or_Newsletters_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Proper_Employment_Procedures_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Product_Research_or_Development_Testing_Certif_Services_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Positive_Fund_Balance_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Peer_Review_or_Disciplinary_Action_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Merger_Acquisition_or_Consolidation_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.List_of_D_and_Os_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Information_Only_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Employment_Application_Handbook_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Employment_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Disciplinary_Action_from_Peer_Review_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Disciplinary_Administrative_or_Criminal_Actions_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Insurance_Programs_For_Members_YN, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Last_Reporting_Month, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Fiscal_AY_Month_Ending, dbo.Policy_Information_ALL_POLICIES_December.ProductType, 
                      dbo.Policy_Information_ALL_POLICIES_December.DivisionName, dbo.Policy_Information_ALL_POLICIES_December.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_December.Source_Detail_Name, dbo.Policy_Information_ALL_POLICIES_December.PIC_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_December.underwriter, dbo.Policy_Information_FF_December.FF_EPL_Limit AS EPL_Limit_var, 
                      dbo.Policy_Information_FF_December.FF_DO_Alt_Retention_int, dbo.Policy_Information_FF_December.FF_EPL_Alt_Retention_int, 
                      dbo.Policy_Information_FF_December.FF_EPL_Limit_int, dbo.Policy_Information_ALL_POLICIES_December.Written_Premium_Range_for_Product, 
                      dbo.Policy_Information_ALL_POLICIES_December.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_December.policyexpirationdate, 
                      dbo.Policy_Information_ALL_POLICIES_December.Latest_PY, dbo.Policy_Information_ALL_POLICIES_December.policy_effective_month, 
                      dbo.Policy_Information_ALL_POLICIES_December.policy_effective_year, dbo.Policy_PATHID_Information.Insd_County AS County, 
                      LEFT(dbo.Policy_PATHID_Information.Insd_Zip, 5) AS Zip, LEFT(dbo.Policy_PATHID_Information.Insd_Zip, 3) AS Zip3, 
                      dbo.ALL_POLICIES_12_premium_summary_December.acctngyear, dbo.Policy_PATHID_Information.FF_Cov_ALL
FROM         dbo.ALL_POLICIES_12_premium_summary_December LEFT OUTER JOIN
                      dbo.Policy_PATHID_Information ON 
                      dbo.ALL_POLICIES_12_premium_summary_December.policynumber = dbo.Policy_PATHID_Information.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_FF_December ON 
                      dbo.ALL_POLICIES_12_premium_summary_December.policynumber = dbo.Policy_Information_FF_December.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_December ON 
                      dbo.ALL_POLICIES_12_premium_summary_December.policynumber = dbo.Policy_Information_Underwriting_Check_List_December.policynumber LEFT
                       OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_December ON 
                      dbo.ALL_POLICIES_12_premium_summary_December.policynumber = dbo.Policy_Information_ALL_POLICIES_December.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December ON 
                      dbo.ALL_POLICIES_12_premium_summary_December.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December.policynumber
                       AND 
                      dbo.ALL_POLICIES_12_premium_summary_December.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December.Productcode
                       AND 
                      dbo.ALL_POLICIES_12_premium_summary_December.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December.statecode AND
                       dbo.ALL_POLICIES_12_premium_summary_December.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_December.statecode, dbo.ALL_POLICIES_12_premium_summary_December.policynumber, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_December.productcode, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Fiscal_AY_Year, dbo.Policy_Information_ALL_POLICIES_December.New_Renew_Tail, 
                      dbo.Policy_Information_ALL_POLICIES_December.Renew_New_Auto, dbo.Policy_Information_ALL_POLICIES_December.Branch_Region, 
                      dbo.Policy_Information_ALL_POLICIES_December.program, dbo.Policy_Information_ALL_POLICIES_December.Written_Premium_Range, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Coverage_Group, dbo.Policy_Information_ALL_POLICIES_December.product_group, 
                      dbo.Policy_Information_ALL_POLICIES_December.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_December.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_December.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_December.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_December.accountnumber, dbo.Policy_Information_ALL_POLICIES_December.Primary_Producer_type, 
                      dbo.Policy_Information_ALL_POLICIES_December.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_December.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_December.County_Pop_Density_Range, dbo.Policy_Information_ALL_POLICIES_December.Branch_Office, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_December.First_Policy_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Capped_Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Incurred_Claims, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_FF_December.FF_DO_Limit, dbo.Policy_Information_FF_December.FF_EPL_Limit, 
                      dbo.Policy_Information_FF_December.FF_DO_Alt_Retention, dbo.Policy_Information_FF_December.FF_EPL_Num_of_Employees_Range, 
                      dbo.Policy_Information_FF_December.TrimBusiness_Type, dbo.Policy_Information_FF_December.FF_DO_RatingClass, 
                      dbo.Policy_Information_FF_December.FF_EPL_RatingClass, dbo.Policy_Information_Underwriting_Check_List_December.Financials_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Supplemental_Claim_Form_Loss_Run_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Bylaws_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Employment_Handbook_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Form_5500_YN, dbo.Policy_Information_FF_December.FF_EPL_Alt_Retention, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Number_of_Years_in_Operation, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Plan_Assets, dbo.Policy_Information_Underwriting_Check_List_December.Turnover_Rate,
                       dbo.Policy_Information_Underwriting_Check_List_December.Plan_Assets_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Turnover_Rate_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Subsidiaries_Affiliates_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.No_Loss_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.No_Prior_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Clean_Warranty_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Supp_Claim_Form_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Website_Transactional_E_Commerce_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Website_Information_Only_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Transaction_E_Commerce_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Tax_Exempt_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Standard_Setting_or_Member_Certification_Services_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Security_Precautions_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Magazines_Periodicals_or_Newsletters_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Proper_Employment_Procedures_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Product_Research_or_Development_Testing_Certif_Services_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Positive_Fund_Balance_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Peer_Review_or_Disciplinary_Action_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Merger_Acquisition_or_Consolidation_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.List_of_D_and_Os_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Information_Only_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Employment_Application_Handbook_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Employment_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Disciplinary_Action_from_Peer_Review_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Disciplinary_Administrative_or_Criminal_Actions_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_December.Insurance_Programs_For_Members_YN, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Last_Reporting_Month, 
                      dbo.ALL_POLICIES_12_premium_summary_December.Fiscal_AY_Month_Ending, dbo.Policy_Information_ALL_POLICIES_December.ProductType, 
                      dbo.Policy_Information_ALL_POLICIES_December.DivisionName, dbo.Policy_Information_ALL_POLICIES_December.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_December.Source_Detail_Name, dbo.Policy_Information_ALL_POLICIES_December.PIC_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_December.underwriter, dbo.Policy_Information_FF_December.FF_DO_Alt_Retention_int, 
                      dbo.Policy_Information_FF_December.FF_EPL_Alt_Retention_int, dbo.Policy_Information_FF_December.FF_EPL_Limit_int, 
                      dbo.Policy_Information_ALL_POLICIES_December.Written_Premium_Range_for_Product, 
                      dbo.Policy_Information_ALL_POLICIES_December.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_December.policyexpirationdate, 
                      dbo.Policy_Information_ALL_POLICIES_December.Latest_PY, dbo.Policy_Information_ALL_POLICIES_December.policy_effective_month, 
                      dbo.Policy_Information_ALL_POLICIES_December.policy_effective_year, dbo.Policy_PATHID_Information.Insd_County, 
                      LEFT(dbo.Policy_PATHID_Information.Insd_Zip, 3), LEFT(dbo.Policy_PATHID_Information.Insd_Zip, 5), 
                      dbo.ALL_POLICIES_12_premium_summary_December.acctngyear, dbo.Policy_PATHID_Information.FF_Cov_ALL
HAVING      (dbo.ALL_POLICIES_12_premium_summary_December.productcode = ''FF'') AND 
                      (dbo.ALL_POLICIES_12_premium_summary_December.Fiscal_AY_Year > 2006) AND 
                      (dbo.ALL_POLICIES_12_premium_summary_December.statecode = ''IL'')' 
GO
