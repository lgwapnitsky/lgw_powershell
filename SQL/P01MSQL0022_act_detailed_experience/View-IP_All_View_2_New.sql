IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[IP_All_View_2_New]'))
DROP VIEW [dbo].[IP_All_View_2_New]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[IP_All_View_2_New]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.IP_All_View_2_New
AS
SELECT     dbo.ALL_POLICIES_15_premium_summary_August.statecode, dbo.ALL_POLICIES_15_premium_summary_August.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_15_premium_summary_August.productcode, dbo.ALL_POLICIES_15_premium_summary_August.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_15_premium_summary_August.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_15_premium_summary_August.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_August.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_August.Branch_Region, dbo.Policy_Information_ALL_POLICIES_August.program, 
                      dbo.ALL_POLICIES_15_premium_summary_August.Coverage_Group, dbo.Policy_Information_ALL_POLICIES_August.product_group, 
                      dbo.Policy_Information_ALL_POLICIES_August.Primary_Umbrella, SUM(dbo.ALL_POLICIES_15_premium_summary_August.Earned_Buildings) 
                      AS Earned_Buildings, SUM(dbo.ALL_POLICIES_15_premium_summary_August.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_August.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_August.accountnumber, dbo.Policy_Information_ALL_POLICIES_August.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_August.Primary_Producer_type, 
                      dbo.Policy_Information_GL_AVG_RATES_August.Condo_Association_Avg_Rate_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_August.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_August.Number_of_Swimming_Pools_Range, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_August.Endorsement_GLDX_YN, dbo.ALL_POLICIES_15_premium_summary_August.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.Property_Coverage_Form, 
                      dbo.ALL_POLICIES_15_premium_summary_August.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.FA_Deductible, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_August.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      dbo.Policy_Information_ALL_POLICIES_August.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_August.Prior_Policy_number, 
                      dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_2, dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_3, 
                      dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_4, dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_5, 
                      dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_6, dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_7, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Automatic_Prior_Policy, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Automatic_Prior_Policy_2, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Automatic_Prior_Policy_3, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Automatic_Prior_Policy_4, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Automatic_Prior_Policy_5, 
                      dbo.Policy_Information_ALL_POLICIES_August.Written_Premium_Range_for_Product, 
                      dbo.Policy_Information_ALL_POLICIES_August.First_Policy_Year
FROM         dbo.ALL_POLICIES_15_premium_summary_August LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_August ON 
                      dbo.ALL_POLICIES_15_premium_summary_August.policynumber = dbo.Policy_Information_Underwriting_Check_List_August.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_GL_AVG_RATES_August ON 
                      dbo.ALL_POLICIES_15_premium_summary_August.policynumber = dbo.Policy_Information_GL_AVG_RATES_August.Policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_August ON 
                      dbo.ALL_POLICIES_15_premium_summary_August.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_August.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August ON 
                      dbo.ALL_POLICIES_15_premium_summary_August.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_August.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_August ON 
                      dbo.ALL_POLICIES_15_premium_summary_August.policynumber = dbo.Policy_Information_ALL_POLICIES_August.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August ON 
                      dbo.ALL_POLICIES_15_premium_summary_August.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.policynumber AND
                       dbo.ALL_POLICIES_15_premium_summary_August.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.Productcode AND 
                      dbo.ALL_POLICIES_15_premium_summary_August.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.statecode AND 
                      dbo.ALL_POLICIES_15_premium_summary_August.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.coverage_group
GROUP BY dbo.ALL_POLICIES_15_premium_summary_August.statecode, dbo.ALL_POLICIES_15_premium_summary_August.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_15_premium_summary_August.productcode, dbo.ALL_POLICIES_15_premium_summary_August.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_August.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_August.Branch_Region, dbo.Policy_Information_ALL_POLICIES_August.program, 
                      dbo.ALL_POLICIES_15_premium_summary_August.Coverage_Group, dbo.Policy_Information_ALL_POLICIES_August.product_group, 
                      dbo.Policy_Information_ALL_POLICIES_August.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_August.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_August.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_August.accountnumber, dbo.Policy_Information_ALL_POLICIES_August.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_August.Primary_Producer_type, 
                      dbo.Policy_Information_GL_AVG_RATES_August.Condo_Association_Avg_Rate_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_August.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_August.Number_of_Swimming_Pools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_August.Endorsement_GLDX_YN, dbo.ALL_POLICIES_15_premium_summary_August.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.Property_Coverage_Form, 
                      dbo.ALL_POLICIES_15_premium_summary_August.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_August.FA_Deductible, dbo.Policy_Information_ALL_POLICIES_August.Endorsement_Elite_YN, 
                      dbo.Policy_Information_ALL_POLICIES_August.Prior_Policy_number, dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_2, 
                      dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_3, dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_4, 
                      dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_5, dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_6, 
                      dbo.Policy_Information_ALL_POLICIES_August.prior_policynumber_7, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Automatic_Prior_Policy, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Automatic_Prior_Policy_2, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Automatic_Prior_Policy_3, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Automatic_Prior_Policy_4, 
                      dbo.Policy_Information_ALL_POLICIES_August.New_Renew_Automatic_Prior_Policy_5, 
                      dbo.Policy_Information_ALL_POLICIES_August.Written_Premium_Range_for_Product, 
                      dbo.Policy_Information_ALL_POLICIES_August.First_Policy_Year
HAVING      (dbo.Policy_Information_ALL_POLICIES_August.Primary_Umbrella = ''Primary'') AND 
                      (dbo.ALL_POLICIES_15_premium_summary_August.productcode = ''IP'')
' 
GO
