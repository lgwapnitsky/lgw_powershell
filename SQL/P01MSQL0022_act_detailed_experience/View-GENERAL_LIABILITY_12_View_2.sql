IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GENERAL_LIABILITY_12_View_2]'))
DROP VIEW [dbo].[GENERAL_LIABILITY_12_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GENERAL_LIABILITY_12_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.GENERAL_LIABILITY_12_View_2
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_March.statecode, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_March.productcode, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Fraud_Breach_of_Contract_Loss) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Injury_Count) 
                      AS COL_GLBI_Injury_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_March.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_March.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_March.Branch_Region, dbo.Policy_Information_ALL_POLICIES_March.program, 
                      dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_March.product_group, dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_March.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Information_ALL_POLICIES_March.Endorsement_GLDX_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_March.Account_Premium_range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_March.Primary_Producer, dbo.Policy_Information_ALL_POLICIES_GL_March.GLDX_Indicator, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_PI_SS_2, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_PI_SO_008, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_PI_SO_007, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_PI_HF_11, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_PI_CAM_003, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SS_2_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SS_2_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_008_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_008_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_007_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_007_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_HF_11_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_HF_11_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_CAM_003_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_CAM_003_Agg_Limit, 
                      dbo.Business_Desc_and_Business_Grp_DY_RL_VS.Business_Description_Group, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_Class, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_Rate, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_RateGroup
FROM         dbo.Business_Desc_and_Business_Grp_DY_RL_VS RIGHT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_March ON 
                      dbo.Business_Desc_and_Business_Grp_DY_RL_VS.Business_Description = dbo.Policy_Information_ALL_POLICIES_March.Business_Desc LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_March ON 
                      dbo.Policy_Information_ALL_POLICIES_March.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_March.policynumber RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_March ON 
                      dbo.Policy_Information_ALL_POLICIES_March.policynumber = dbo.ALL_POLICIES_12_premium_summary_March.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.policynumber AND
                       dbo.ALL_POLICIES_12_premium_summary_March.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_March.statecode, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_March.productcode, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_March.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_March.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_March.Branch_Region, dbo.Policy_Information_ALL_POLICIES_March.program, 
                      dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_March.product_group, dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_March.Primary_Umbrella, 
                      dbo.Policy_Information_ALL_POLICIES_March.Endorsement_GLDX_YN, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_March.Account_Premium_range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_March.Primary_Producer, dbo.Policy_Information_ALL_POLICIES_GL_March.GLDX_Indicator, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_PI_SS_2, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_PI_SO_008, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_PI_SO_007, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_PI_HF_11, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_PI_CAM_003, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SS_2_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SS_2_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_008_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_008_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_007_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_007_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_HF_11_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_HF_11_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_CAM_003_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_CAM_003_Agg_Limit, 
                      dbo.Business_Desc_and_Business_Grp_DY_RL_VS.Business_Description_Group, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_Class, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_Rate, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_PI_SO_RateGroup
HAVING      (dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Reporting_group = ''GL'') AND 
                      (dbo.Policy_Information_ALL_POLICIES_March.Primary_Umbrella = ''Primary'')
' 
GO
