IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Account_View_2_Foresters]'))
DROP VIEW [dbo].[Individual_Account_View_2_Foresters]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Account_View_2_Foresters]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Account_View_2_Foresters
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_November.statecode, dbo.ALL_POLICIES_12_premium_summary_November.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_November.productcode, dbo.ALL_POLICIES_12_premium_summary_November.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_November.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Fraud_Breach_of_Contract_Loss) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Injury_Count) 
                      AS COL_GLBI_Injury_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_November.Incurred_Claims) AS Incurred_Claims,
                       SUM(dbo.ALL_POLICIES_12_premium_summary_November.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_November.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_November.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_November.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_November.Branch_Region, dbo.Policy_Information_ALL_POLICIES_November.program, 
                      dbo.Policy_Information_ALL_POLICIES_November.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_November.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_November.product_group, dbo.Policy_Information_ALL_POLICIES_November.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_November.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_November.BillplanshortDesc, dbo.Policy_Information_ALL_POLICIES_November.Account_Premium_range, 
                      dbo.Policy_Information_ALL_POLICIES_November.policynumber, dbo.Policy_Information_ALL_POLICIES_November.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_November.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_November.underwriter, 
                      dbo.Policy_Information_ALL_POLICIES_November.Business_Name, dbo.Policy_Information_ALL_POLICIES_November.Commission_pct, 
                      dbo.Policy_Information_ALL_POLICIES_November.Review_quarter, dbo.Policy_Information_ALL_POLICIES_November.Account_Dominant_Product, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_Name, dbo.ALL_POLICIES_12_premium_summary_November.accountnumber AS Expr1, 
                      dbo.ALL_POLICIES_12_premium_summary_November.policynumber AS Expr2, 
                      dbo.Policy_Information_ALL_POLICIES_November.policy_effective_year, SUM(dbo.ALL_POLICIES_12_premium_summary_November.Open_Claims) 
                      AS Open_Claims, dbo.Policy_Information_ALL_POLICIES_November.Account_Dominant_Product_Group, 
                      dbo.Policy_Information_ALL_POLICIES_November.Count_of_Account_Numbers_Range, 
                      dbo.Policy_Information_ALL_POLICIES_November.Primary_Producer, dbo.Policy_Information_ALL_POLICIES_November.Primary_Producer_type, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.policynumber AS Expr3, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.GL_Occurrence_Limit AS Expr4, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.GL_Aggregate_Limit AS Expr5, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.GL_Deductible AS Expr6, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.GLDX_Indicator AS Expr7, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_November.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_November.TIV, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_RepLoss_Ratio_Working_Cover, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Case_Loss, dbo.ALL_POLICIES_12_premium_summary_November.Case_ALAE, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Paid_Loss, dbo.ALL_POLICIES_12_premium_summary_November.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Sal_Subro, dbo.Policy_Information_GL_AVG_RATES_November.Churches_Avg_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_November.Prior_Policy_number, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_November.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Fiscal_AY_Month_Ending, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Last_Reporting_Month, dbo.Policy_Information_ALL_POLICIES_November.DivisionName, 
                      dbo.Policy_Information_ALL_POLICIES_November.ProductType, dbo.Policy_Information_ALL_POLICIES_November.Source_Detail_Name, 
                      dbo.Policy_Information_ALL_POLICIES_November.BusinessClassDesc, dbo.Individual_Accounts_for_Reports_View_1_Foresters.Companycode, 
                      dbo.Individual_Accounts_for_Reports_View_1_Foresters.Source_Detail_Name AS Expr8
FROM         dbo.ALL_POLICIES_12_premium_summary_November RIGHT OUTER JOIN
                      dbo.Individual_Accounts_for_Reports_View_1_Foresters ON 
                      dbo.ALL_POLICIES_12_premium_summary_November.policynumber = dbo.Individual_Accounts_for_Reports_View_1_Foresters.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_GL_AVG_RATES_November ON 
                      dbo.ALL_POLICIES_12_premium_summary_November.policynumber = dbo.Policy_Information_GL_AVG_RATES_November.Policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_November ON 
                      dbo.ALL_POLICIES_12_premium_summary_November.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_November.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_November ON 
                      dbo.ALL_POLICIES_12_premium_summary_November.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_November.policynumber LEFT
                       OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_November ON 
                      dbo.ALL_POLICIES_12_premium_summary_November.policynumber = dbo.Policy_Information_ALL_POLICIES_November.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_November ON 
                      dbo.ALL_POLICIES_12_premium_summary_November.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_November.policynumber
                       AND 
                      dbo.ALL_POLICIES_12_premium_summary_November.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_November.Productcode
                       AND 
                      dbo.ALL_POLICIES_12_premium_summary_November.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_November.statecode AND
                       dbo.ALL_POLICIES_12_premium_summary_November.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_November.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_November.statecode, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_November.productcode, dbo.ALL_POLICIES_12_premium_summary_November.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_November.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_November.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_November.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_November.Branch_Region, dbo.Policy_Information_ALL_POLICIES_November.program, 
                      dbo.Policy_Information_ALL_POLICIES_November.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_November.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_November.product_group, dbo.Policy_Information_ALL_POLICIES_November.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_November.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_November.BillplanshortDesc, dbo.Policy_Information_ALL_POLICIES_November.Account_Premium_range, 
                      dbo.Policy_Information_ALL_POLICIES_November.policynumber, dbo.Policy_Information_ALL_POLICIES_November.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_November.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_November.underwriter, 
                      dbo.Policy_Information_ALL_POLICIES_November.Business_Name, dbo.Policy_Information_ALL_POLICIES_November.Commission_pct, 
                      dbo.Policy_Information_ALL_POLICIES_November.Review_quarter, dbo.Policy_Information_ALL_POLICIES_November.Account_Dominant_Product, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_Name, dbo.ALL_POLICIES_12_premium_summary_November.accountnumber, 
                      dbo.ALL_POLICIES_12_premium_summary_November.policynumber, dbo.Policy_Information_ALL_POLICIES_November.policy_effective_year, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_Dominant_Product_Group, 
                      dbo.Policy_Information_ALL_POLICIES_November.Count_of_Account_Numbers_Range, 
                      dbo.Policy_Information_ALL_POLICIES_November.Primary_Producer, dbo.Policy_Information_ALL_POLICIES_November.Primary_Producer_type, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.policynumber, dbo.Policy_Information_ALL_POLICIES_GL_November.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_November.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_November.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.SAM_Form, dbo.Policy_Information_ALL_POLICIES_FireAllied_November.TIV, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_RepLoss_Ratio_Working_Cover, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Case_Loss, dbo.ALL_POLICIES_12_premium_summary_November.Case_ALAE, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Paid_Loss, dbo.ALL_POLICIES_12_premium_summary_November.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Sal_Subro, dbo.Policy_Information_GL_AVG_RATES_November.Churches_Avg_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_November.Prior_Policy_number, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Fiscal_AY_Month_Ending, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_November.Last_Reporting_Month, dbo.Policy_Information_ALL_POLICIES_November.DivisionName, 
                      dbo.Policy_Information_ALL_POLICIES_November.ProductType, dbo.Policy_Information_ALL_POLICIES_November.Source_Detail_Name, 
                      dbo.Policy_Information_ALL_POLICIES_November.BusinessClassDesc, dbo.Individual_Accounts_for_Reports_View_1_Foresters.Companycode, 
                      dbo.Individual_Accounts_for_Reports_View_1_Foresters.Source_Detail_Name
' 
GO
