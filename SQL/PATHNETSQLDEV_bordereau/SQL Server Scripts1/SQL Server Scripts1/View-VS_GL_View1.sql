IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_GL_View1]'))
DROP VIEW [dbo].[VS_GL_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_GL_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.VS_GL_View1
AS
SELECT     dbo.ALL_POLICIES_15_premium_summary_B.statecode, dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_15_premium_summary_B.productcode, dbo.ALL_POLICIES_15_premium_summary_B.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_15_premium_summary_B.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_15_premium_summary_B.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, dbo.Policy_Information_ALL_POLICIES_B.program, 
                      dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, dbo.Policy_Information_ALL_POLICIES_GL_B.GLDX_Indicator, 
                      dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Group, dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Form, dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Earned_TIV) AS Earned_TIV, dbo.Policy_Information_ALL_POLICIES_B.Endorsement_GLDX_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_B.Account_Premium_range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Region_in_State, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer, 
                      dbo.ALL_POLICIES_15_premium_summary_B.accountnumber, dbo.ALL_POLICIES_15_premium_summary_B.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_Name, dbo.Policy_Information_ALL_POLICIES_B.Companycode, 
                      dbo.Policy_Information_ALL_POLICIES_B.policyexpirationdate, dbo.Policy_Information_ALL_POLICIES_B.canceldate, 
                      dbo.Policy_Information_ALL_POLICIES_B.First_Policy_Year, dbo.Policy_Information_ALL_POLICIES_B.Business_Desc, 
                      dbo.Policy_Information_ALL_POLICIES_B.Renewals_Range, dbo.Policy_Information_ALL_POLICIES_B.Endorsement_VS_001
FROM         dbo.ALL_POLICIES_15_premium_summary_B INNER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_B ON 
                      dbo.ALL_POLICIES_15_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_15_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_15_premium_summary_B.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.policynumber AND 
                      dbo.ALL_POLICIES_15_premium_summary_B.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Productcode AND 
                      dbo.ALL_POLICIES_15_premium_summary_B.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.statecode AND 
                      dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.coverage_group
GROUP BY dbo.ALL_POLICIES_15_premium_summary_B.statecode, dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_15_premium_summary_B.productcode, dbo.ALL_POLICIES_15_premium_summary_B.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, dbo.Policy_Information_ALL_POLICIES_B.program, 
                      dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, dbo.Policy_Information_ALL_POLICIES_GL_B.GLDX_Indicator, 
                      dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Group, dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Form, dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, 
                      dbo.Policy_Information_ALL_POLICIES_B.Endorsement_GLDX_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_B.Account_Premium_range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Region_in_State, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer, 
                      dbo.ALL_POLICIES_15_premium_summary_B.accountnumber, dbo.ALL_POLICIES_15_premium_summary_B.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_Name, dbo.Policy_Information_ALL_POLICIES_B.Companycode, 
                      dbo.Policy_Information_ALL_POLICIES_B.policyexpirationdate, dbo.Policy_Information_ALL_POLICIES_B.canceldate, 
                      dbo.Policy_Information_ALL_POLICIES_B.First_Policy_Year, dbo.Policy_Information_ALL_POLICIES_B.Business_Desc, 
                      dbo.Policy_Information_ALL_POLICIES_B.Renewals_Range, dbo.Policy_Information_ALL_POLICIES_B.Endorsement_VS_001
HAVING      (dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Reporting_group = ''GL'') AND 
                      (dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella = ''Primary'') AND (dbo.ALL_POLICIES_15_premium_summary_B.productcode = ''VS'')
' 
GO
