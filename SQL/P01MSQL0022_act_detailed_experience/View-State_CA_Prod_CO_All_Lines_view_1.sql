IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_CA_Prod_CO_All_Lines_view_1]'))
DROP VIEW [dbo].[State_CA_Prod_CO_All_Lines_view_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_CA_Prod_CO_All_Lines_view_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_CA_Prod_CO_All_Lines_view_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_July.statecode, dbo.ALL_POLICIES_12_premium_summary_July.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_July.productcode, dbo.ALL_POLICIES_12_premium_summary_July.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_July.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_July.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_July.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_July.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_July.Branch_Region, dbo.Policy_Information_ALL_POLICIES_July.program, 
                      dbo.Policy_Information_ALL_POLICIES_July.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_July.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_July.product_group, dbo.Policy_Information_ALL_POLICIES_July.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_July.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_July.accountnumber, dbo.Policy_Information_ALL_POLICIES_July.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_July.Playground_YN, dbo.Policy_Information_Underwriting_Check_List_July.Playground_Equip_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_July.Pool_YN, dbo.Policy_Information_Underwriting_Check_List_July.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_July.Tennis_Bubble_YN, dbo.Policy_Information_Underwriting_Check_List_July.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_July.Number_of_Swimming_Pools_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.Policy_Information_ALL_POLICIES_GL_July.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_July.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_July.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_July.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_July.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_July.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_July.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_July.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_July.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_July.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.Property_Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_July.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.FA_Avg_Bld_Rate_rd2, dbo.Policy_Information_ALL_POLICIES_FireAllied_July.FA_Deductible, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      dbo.Policy_Information_ALL_POLICIES_July.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_July.Account_Name, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_July.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Hired_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_July.Non_Owned_Auto, 
                      dbo.Policy_Information_GL_AVG_RATES_July.Churches_Avg_Rate_Range, dbo.Policy_Information_GL_AVG_RATES_July.Day_Care_Avg_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Primary_Producer_code, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_July.DivisionName, dbo.Policy_Information_ALL_POLICIES_July.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_July.ProductType, dbo.Policy_Information_GL_AVG_RATES_July.Condo_Association_Avg_Rate_Range
FROM         dbo.ALL_POLICIES_12_premium_summary_July LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July ON 
                      dbo.ALL_POLICIES_12_premium_summary_July.policynumber = dbo.Policy_Information_ALL_POLICIES_AUTO_July.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_July ON 
                      dbo.ALL_POLICIES_12_premium_summary_July.policynumber = dbo.Policy_Information_Underwriting_Check_List_July.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_GL_AVG_RATES_July ON 
                      dbo.ALL_POLICIES_12_premium_summary_July.policynumber = dbo.Policy_Information_GL_AVG_RATES_July.Policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_July ON 
                      dbo.ALL_POLICIES_12_premium_summary_July.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_July.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July ON 
                      dbo.ALL_POLICIES_12_premium_summary_July.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_July.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_July ON 
                      dbo.ALL_POLICIES_12_premium_summary_July.policynumber = dbo.Policy_Information_ALL_POLICIES_July.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July ON 
                      dbo.ALL_POLICIES_12_premium_summary_July.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.policynumber AND 
                      dbo.ALL_POLICIES_12_premium_summary_July.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_July.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_July.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_July.statecode, dbo.ALL_POLICIES_12_premium_summary_July.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_July.productcode, dbo.ALL_POLICIES_12_premium_summary_July.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_July.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_July.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_July.Branch_Region, dbo.Policy_Information_ALL_POLICIES_July.program, 
                      dbo.Policy_Information_ALL_POLICIES_July.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_July.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_July.product_group, dbo.Policy_Information_ALL_POLICIES_July.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_July.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.accountnumber, dbo.Policy_Information_ALL_POLICIES_July.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_July.Playground_YN, dbo.Policy_Information_Underwriting_Check_List_July.Playground_Equip_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_July.Pool_YN, dbo.Policy_Information_Underwriting_Check_List_July.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_July.Tennis_Bubble_YN, dbo.Policy_Information_Underwriting_Check_List_July.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_July.Number_of_Swimming_Pools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_July.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_July.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_July.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_July.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_July.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_July.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_July.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_July.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_July.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_July.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.Property_Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_July.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_July.FA_Avg_Bld_Rate_rd2, dbo.Policy_Information_ALL_POLICIES_FireAllied_July.FA_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_July.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_July.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_July.Hired_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_July.Non_Owned_Auto, 
                      dbo.Policy_Information_GL_AVG_RATES_July.Churches_Avg_Rate_Range, dbo.Policy_Information_GL_AVG_RATES_July.Day_Care_Avg_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Primary_Producer_code, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_July.Account_RepLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_July.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_July.DivisionName, dbo.Policy_Information_ALL_POLICIES_July.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_July.ProductType, dbo.Policy_Information_GL_AVG_RATES_July.Condo_Association_Avg_Rate_Range
HAVING      (dbo.ALL_POLICIES_12_premium_summary_July.statecode = ''CA'') AND (dbo.ALL_POLICIES_12_premium_summary_July.productcode = ''CO'')
' 
GO
