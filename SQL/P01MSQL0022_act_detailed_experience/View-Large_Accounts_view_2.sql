IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Accounts_view_2]'))
DROP VIEW [dbo].[Large_Accounts_view_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Accounts_view_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Large_Accounts_view_2
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_August.statecode, dbo.ALL_POLICIES_12_premium_summary_August.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_August.productcode, dbo.ALL_POLICIES_12_premium_summary_August.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_August.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_August.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_August.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_August.Branch_Region, dbo.Policy_Information_ALL_POLICIES_August.program, 
                      dbo.Policy_Information_ALL_POLICIES_August.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_August.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_August.product_group, dbo.Policy_Information_ALL_POLICIES_August.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_August.BillplanshortDesc, dbo.Policy_Information_ALL_POLICIES_August.Account_Premium_range, 
                      dbo.Policy_Information_ALL_POLICIES_August.policynumber, dbo.Policy_Information_ALL_POLICIES_August.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_August.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_August.underwriter, 
                      dbo.Policy_Information_ALL_POLICIES_August.Business_Name, dbo.Policy_Information_ALL_POLICIES_August.Commission_pct, 
                      dbo.Policy_Information_ALL_POLICIES_August.Review_quarter, dbo.Policy_Information_ALL_POLICIES_August.Account_Dominant_Product, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_Name, dbo.ALL_POLICIES_12_premium_summary_August.accountnumber AS Expr1, 
                      dbo.ALL_POLICIES_12_premium_summary_August.policynumber AS Expr2, dbo.Policy_Information_ALL_POLICIES_August.policy_effective_year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_August.Open_Claims) AS Open_Claims, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_Dominant_Product_Group, 
                      dbo.Policy_Information_ALL_POLICIES_August.Count_of_Account_Numbers_Range, dbo.Policy_Information_ALL_POLICIES_August.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_August.Primary_Producer_type, dbo.Policy_Information_ALL_POLICIES_GL_August.policynumber AS Expr3, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Occurrence_Limit AS Expr4, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Aggregate_Limit AS Expr5, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Deductible AS Expr6, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GLDX_Indicator AS Expr7, dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_Form, dbo.Policy_Information_ALL_POLICIES_FireAllied_August.TIV, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio, dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_NonCat,
                       dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_nonCat_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_nonCat_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.DivisionName, dbo.Policy_Information_ALL_POLICIES_August.ProductType, 
                      dbo.Policy_Information_ALL_POLICIES_August.PIC_Producer
FROM         dbo.ALL_POLICIES_12_premium_summary_August LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_August ON 
                      dbo.ALL_POLICIES_12_premium_summary_August.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_August.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August ON 
                      dbo.ALL_POLICIES_12_premium_summary_August.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_August.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_August ON 
                      dbo.ALL_POLICIES_12_premium_summary_August.policynumber = dbo.Policy_Information_ALL_POLICIES_August.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August ON 
                      dbo.ALL_POLICIES_12_premium_summary_August.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.policynumber AND
                       dbo.ALL_POLICIES_12_premium_summary_August.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_August.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_August.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_August.statecode, dbo.ALL_POLICIES_12_premium_summary_August.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_August.productcode, dbo.ALL_POLICIES_12_premium_summary_August.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_August.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_August.Branch_Region, dbo.Policy_Information_ALL_POLICIES_August.program, 
                      dbo.Policy_Information_ALL_POLICIES_August.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_August.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_August.product_group, dbo.Policy_Information_ALL_POLICIES_August.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_August.BillplanshortDesc, dbo.Policy_Information_ALL_POLICIES_August.Account_Premium_range, 
                      dbo.Policy_Information_ALL_POLICIES_August.policynumber, dbo.Policy_Information_ALL_POLICIES_August.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_August.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_August.underwriter, 
                      dbo.Policy_Information_ALL_POLICIES_August.Business_Name, dbo.Policy_Information_ALL_POLICIES_August.Commission_pct, 
                      dbo.Policy_Information_ALL_POLICIES_August.Review_quarter, dbo.Policy_Information_ALL_POLICIES_August.Account_Dominant_Product, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_Name, dbo.ALL_POLICIES_12_premium_summary_August.accountnumber, 
                      dbo.ALL_POLICIES_12_premium_summary_August.policynumber, dbo.Policy_Information_ALL_POLICIES_August.policy_effective_year, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_Dominant_Product_Group, 
                      dbo.Policy_Information_ALL_POLICIES_August.Count_of_Account_Numbers_Range, dbo.Policy_Information_ALL_POLICIES_August.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_August.Primary_Producer_type, dbo.Policy_Information_ALL_POLICIES_GL_August.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Occurrence_Limit, dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Aggregate_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Deductible, dbo.Policy_Information_ALL_POLICIES_GL_August.GLDX_Indicator, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.TIV, dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_nonCat_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_nonCat_Working_Cover, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.DivisionName, dbo.Policy_Information_ALL_POLICIES_August.ProductType, 
                      dbo.Policy_Information_ALL_POLICIES_August.PIC_Producer
HAVING      (dbo.Policy_Information_ALL_POLICIES_August.Account_Premium_range IN (''d: $250k to $500k'', ''e: over $500k''))
' 
GO
