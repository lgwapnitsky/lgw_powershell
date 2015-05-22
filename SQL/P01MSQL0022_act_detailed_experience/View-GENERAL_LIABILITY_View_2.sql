IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GENERAL_LIABILITY_View_2]'))
DROP VIEW [dbo].[GENERAL_LIABILITY_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GENERAL_LIABILITY_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.GENERAL_LIABILITY_View_2
AS
SELECT     dbo.ALL_POLICIES_15_premium_summary_September.statecode, dbo.ALL_POLICIES_15_premium_summary_September.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_15_premium_summary_September.productcode, dbo.ALL_POLICIES_15_premium_summary_September.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_15_premium_summary_September.Reported_Claims) AS Reported_Claims, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_PropertyDamage_Loss) AS COL_GLBI_PropertyDamage_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_PropertyDamage_Count) AS COL_GLBI_PropertyDamage_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Discrim_WrongfulTermination_Loss) AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.COL_GLBI_Discrim_WrongfulTermination_Count) AS COL_GLBI_Discrim_WrongfulTermination_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_September.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_September.Branch_Region, dbo.Policy_Information_ALL_POLICIES_September.program, 
                      dbo.Policy_Information_ALL_POLICIES_September.Written_Premium_Range, dbo.ALL_POLICIES_15_premium_summary_September.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_September.product_group, dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_September.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_September.Earned_TIV) AS Earned_TIV, dbo.Policy_Information_ALL_POLICIES_September.Endorsement_GLDX_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_September.Account_Premium_range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer, dbo.Policy_Information_ALL_POLICIES_GL_September.GLDX_Indicator, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_PI_SS_2, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_PI_SO_008, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_PI_SO_007, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_PI_HF_11, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_PI_CAM_003, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SS_2_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SS_2_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SO_008_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SO_008_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SO_007_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SO_007_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_HF_11_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_HF_11_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_CAM_003_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_CAM_003_Agg_Limit, 
                      dbo.Business_Desc_and_Business_Grp_DY_RL_VS.Business_Description_Group
FROM         dbo.Business_Desc_and_Business_Grp_DY_RL_VS RIGHT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_September ON 
                      dbo.Business_Desc_and_Business_Grp_DY_RL_VS.Business_Description = dbo.Policy_Information_ALL_POLICIES_September.Business_Desc LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_September ON 
                      dbo.Policy_Information_ALL_POLICIES_September.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_September.policynumber RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_15_premium_summary_September ON 
                      dbo.Policy_Information_ALL_POLICIES_September.policynumber = dbo.ALL_POLICIES_15_premium_summary_September.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September ON 
                      dbo.ALL_POLICIES_15_premium_summary_September.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.policynumber AND 
                      dbo.ALL_POLICIES_15_premium_summary_September.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Productcode AND 
                      dbo.ALL_POLICIES_15_premium_summary_September.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.statecode AND 
                      dbo.ALL_POLICIES_15_premium_summary_September.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.coverage_group
GROUP BY dbo.ALL_POLICIES_15_premium_summary_September.statecode, dbo.ALL_POLICIES_15_premium_summary_September.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_15_premium_summary_September.productcode, dbo.ALL_POLICIES_15_premium_summary_September.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_September.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_September.Branch_Region, dbo.Policy_Information_ALL_POLICIES_September.program, 
                      dbo.Policy_Information_ALL_POLICIES_September.Written_Premium_Range, dbo.ALL_POLICIES_15_premium_summary_September.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_September.product_group, dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_September.Primary_Umbrella, 
                      dbo.Policy_Information_ALL_POLICIES_September.Endorsement_GLDX_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_September.Account_Premium_range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer, dbo.Policy_Information_ALL_POLICIES_GL_September.GLDX_Indicator, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_PI_SS_2, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_PI_SO_008, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_PI_SO_007, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_PI_HF_11, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_PI_CAM_003, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SS_2_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SS_2_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SO_008_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SO_008_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SO_007_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_SO_007_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_HF_11_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_HF_11_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_CAM_003_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_PI_CAM_003_Agg_Limit, 
                      dbo.Business_Desc_and_Business_Grp_DY_RL_VS.Business_Description_Group
HAVING      (dbo.ALL_POLICIES_15_premium_summary_September.statecode = ''KY'')
' 
GO
