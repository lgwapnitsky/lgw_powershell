IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Condo_View_2_TEST]'))
DROP VIEW [dbo].[Condo_View_2_TEST]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Condo_View_2_TEST]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Condo_View_2_TEST
AS
SELECT     dbo.ALL_POLICIES_15_premium_summary.statecode, dbo.ALL_POLICIES_15_premium_summary.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_15_premium_summary.productcode, dbo.ALL_POLICIES_15_premium_summary.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_15_premium_summary.Reported_Claims) AS Reported_Claims, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Discrim_WrongfulTermination_Loss) AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.COL_GLBI_Discrim_WrongfulTermination_Count) AS COL_GLBI_Discrim_WrongfulTermination_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES.Branch_Region, dbo.Policy_Information_ALL_POLICIES.program, 
                      dbo.Policy_Information_ALL_POLICIES.Written_Premium_Range, dbo.Policy_Information_ALL_POLICIES.GLDX_Indicator, 
                      dbo.ALL_POLICIES_15_premium_summary.Coverage_Group, dbo.Policy_Information_ALL_POLICIES.product_group, 
                      dbo.Policy_Information_ALL_POLICIES.GL_Occurrence_Limit, dbo.Policy_Information_ALL_POLICIES.GL_Aggregate_Limit, 
                      dbo.Policy_Information_ALL_POLICIES.GL_Deductible, dbo.Policy_Information_ALL_POLICIES.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES.Primary_Umbrella, SUM(dbo.ALL_POLICIES_15_premium_summary.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Earned_TIV) AS Earned_TIV, dbo.Policy_Information_ALL_POLICIES.Endorsement_GLDX_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.GL_Dom_Terr_description, dbo.Policy_Information_ALL_POLICIES.SAM_Form_Group, 
                      dbo.Policy_Information_ALL_POLICIES.Account_Premium_range, dbo.Policy_Information_ALL_POLICIES.Account_Loss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES.Account_Loss_Ratio_Range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES.GL_Dom_Region_in_State AS Expr1
FROM         dbo.ALL_POLICIES_15_premium_summary LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES ON 
                      dbo.ALL_POLICIES_15_premium_summary.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.policynumber AND 
                      dbo.ALL_POLICIES_15_premium_summary.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.Productcode AND 
                      dbo.ALL_POLICIES_15_premium_summary.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.statecode AND 
                      dbo.ALL_POLICIES_15_premium_summary.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.coverage_group LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES ON 
                      dbo.ALL_POLICIES_15_premium_summary.policynumber = dbo.Policy_Information_ALL_POLICIES.policynumber
GROUP BY dbo.ALL_POLICIES_15_premium_summary.statecode, dbo.ALL_POLICIES_15_premium_summary.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_15_premium_summary.productcode, dbo.ALL_POLICIES_15_premium_summary.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES.Branch_Region, dbo.Policy_Information_ALL_POLICIES.program, 
                      dbo.Policy_Information_ALL_POLICIES.Written_Premium_Range, dbo.Policy_Information_ALL_POLICIES.GLDX_Indicator, 
                      dbo.ALL_POLICIES_15_premium_summary.Coverage_Group, dbo.Policy_Information_ALL_POLICIES.product_group, 
                      dbo.Policy_Information_ALL_POLICIES.GL_Occurrence_Limit, dbo.Policy_Information_ALL_POLICIES.GL_Aggregate_Limit, 
                      dbo.Policy_Information_ALL_POLICIES.GL_Deductible, dbo.Policy_Information_ALL_POLICIES.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES.Primary_Umbrella, dbo.Policy_Information_ALL_POLICIES.Endorsement_GLDX_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.GL_Dom_Terr_description, dbo.Policy_Information_ALL_POLICIES.SAM_Form_Group, 
                      dbo.Policy_Information_ALL_POLICIES.Account_Premium_range, dbo.Policy_Information_ALL_POLICIES.Account_Loss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES.Account_Loss_Ratio_Range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES.GL_Dom_Region_in_State
HAVING      (dbo.ALL_POLICIES_15_premium_summary.Coverage_Reporting_group = ''GL'') AND (dbo.ALL_POLICIES_15_premium_summary.productcode = ''CO'')
' 
GO
