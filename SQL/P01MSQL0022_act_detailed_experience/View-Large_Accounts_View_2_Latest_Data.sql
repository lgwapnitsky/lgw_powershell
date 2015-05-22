IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Accounts_View_2_Latest_Data]'))
DROP VIEW [dbo].[Large_Accounts_View_2_Latest_Data]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Accounts_View_2_Latest_Data]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Large_Accounts_View_2_Latest_Data
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_June.statecode, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_June.productcode, dbo.ALL_POLICIES_12_premium_summary_June.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_June.Reported_Claims) AS Reported_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_PropertyDamage_Loss) AS COL_GLBI_PropertyDamage_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_PropertyDamage_Count) AS COL_GLBI_PropertyDamage_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Discrim_WrongfulTermination_Loss) AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Discrim_WrongfulTermination_Count) AS COL_GLBI_Discrim_WrongfulTermination_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_June.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_June.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_June.Branch_Region, dbo.Policy_Information_ALL_POLICIES_June.program, 
                      dbo.Policy_Information_ALL_POLICIES_June.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_June.product_group, dbo.Policy_Information_ALL_POLICIES_June.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Earned_Locations) AS Earned_Locations, SUM(dbo.ALL_POLICIES_12_premium_summary_June.Earned_TIV) 
                      AS Earned_TIV, dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_June.BillplanshortDesc, dbo.Policy_Information_ALL_POLICIES_June.Account_Premium_range, 
                      dbo.Policy_Information_ALL_POLICIES_June.policynumber, dbo.Policy_Information_ALL_POLICIES_June.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_June.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_June.underwriter, 
                      dbo.Policy_Information_ALL_POLICIES_June.Business_Name, dbo.Policy_Information_ALL_POLICIES_June.Commission_pct, 
                      dbo.Policy_Information_ALL_POLICIES_June.Review_quarter, dbo.Policy_Information_ALL_POLICIES_June.Account_Dominant_Product, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_Name, dbo.ALL_POLICIES_12_premium_summary_June.accountnumber AS Expr1, 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber AS Expr2, dbo.Policy_Information_ALL_POLICIES_June.policy_effective_year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Open_Claims) AS Open_Claims, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_Dominant_Product_Group, dbo.Policy_Information_ALL_POLICIES_June.Count_of_Account_Numbers_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer, dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer_type, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.policynumber AS Expr3, dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Occurrence_Limit AS Expr4, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Aggregate_Limit AS Expr5, dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Deductible AS Expr6, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.GLDX_Indicator AS Expr7, dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_Form, dbo.Policy_Information_ALL_POLICIES_FireAllied_June.TIV, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_Working_Cover, dbo.ALL_POLICIES_12_premium_summary_June.Case_Loss, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Case_ALAE, dbo.ALL_POLICIES_12_premium_summary_June.Paid_Loss, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Paid_ALAE, dbo.ALL_POLICIES_12_premium_summary_June.Sal_Subro, 
                      dbo.Policy_Information_ALL_POLICIES_June.DivisionName, dbo.Policy_Information_ALL_POLICIES_June.ProductType, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Fiscal_AY_Month_Ending, dbo.ALL_POLICIES_12_premium_summary_June.Last_Reporting_Month, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Last_Reporting_Year, dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_NonCat, dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_NonCat, dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_nonCat_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_nonCat_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_Range, dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_Range, dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_NonCat_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined
FROM         dbo.ALL_POLICIES_12_premium_summary_June LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_June.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_June.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_ALL_POLICIES_June.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.policynumber AND 
                      dbo.ALL_POLICIES_12_premium_summary_June.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_June.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_June.statecode, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_June.productcode, dbo.ALL_POLICIES_12_premium_summary_June.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_June.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_June.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_June.Branch_Region, dbo.Policy_Information_ALL_POLICIES_June.program, 
                      dbo.Policy_Information_ALL_POLICIES_June.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_June.product_group, dbo.Policy_Information_ALL_POLICIES_June.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.GL_Dom_Terr_Description, dbo.Policy_Information_ALL_POLICIES_June.BillplanshortDesc, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_Premium_range, dbo.Policy_Information_ALL_POLICIES_June.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_June.accountnumber, dbo.Policy_Information_ALL_POLICIES_June.policyEffectivedate, 
                      dbo.Policy_Information_ALL_POLICIES_June.underwriter, dbo.Policy_Information_ALL_POLICIES_June.Business_Name, 
                      dbo.Policy_Information_ALL_POLICIES_June.Commission_pct, dbo.Policy_Information_ALL_POLICIES_June.Review_quarter, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_Dominant_Product, dbo.Policy_Information_ALL_POLICIES_June.Account_Name, 
                      dbo.ALL_POLICIES_12_premium_summary_June.accountnumber, dbo.ALL_POLICIES_12_premium_summary_June.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_June.policy_effective_year, dbo.Policy_Information_ALL_POLICIES_June.Account_Dominant_Product_Group, 
                      dbo.Policy_Information_ALL_POLICIES_June.Count_of_Account_Numbers_Range, dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer_type, dbo.Policy_Information_ALL_POLICIES_GL_June.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Occurrence_Limit, dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Aggregate_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Deductible, dbo.Policy_Information_ALL_POLICIES_GL_June.GLDX_Indicator, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.TIV, dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_Working_Cover, dbo.ALL_POLICIES_12_premium_summary_June.Case_Loss, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Case_ALAE, dbo.ALL_POLICIES_12_premium_summary_June.Paid_Loss, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Paid_ALAE, dbo.ALL_POLICIES_12_premium_summary_June.Sal_Subro, 
                      dbo.Policy_Information_ALL_POLICIES_June.DivisionName, dbo.Policy_Information_ALL_POLICIES_June.ProductType, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Fiscal_AY_Month_Ending, dbo.ALL_POLICIES_12_premium_summary_June.Last_Reporting_Month, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Last_Reporting_Year, dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_NonCat, dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_NonCat, dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_nonCat_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_nonCat_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_Range, dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_Range, dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_NonCat_Working_Cover_Range
HAVING      (dbo.Policy_Information_ALL_POLICIES_June.Account_Premium_range IN (''d: $250k to $500k'', ''e: over $500k''))
' 
GO
