IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_SC_All_Lines_View_1]'))
DROP VIEW [dbo].[State_SC_All_Lines_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_SC_All_Lines_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_SC_All_Lines_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_May.statecode, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_May.productcode, dbo.ALL_POLICIES_12_premium_summary_May.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_May.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_May.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_May.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_May.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_May.Branch_Region, dbo.Policy_Information_ALL_POLICIES_May.program, 
                      dbo.Policy_Information_ALL_POLICIES_May.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_May.product_group, dbo.Policy_Information_ALL_POLICIES_May.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_May.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_May.accountnumber, dbo.Policy_Information_ALL_POLICIES_May.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Playground_YN, dbo.Policy_Information_Underwriting_Check_List_May.Playground_Equip_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Pool_YN, dbo.Policy_Information_Underwriting_Check_List_May.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Tennis_Bubble_YN, dbo.Policy_Information_Underwriting_Check_List_May.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Number_of_Swimming_Pools_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.Policy_Information_ALL_POLICIES_GL_May.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_May.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_May.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_May.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_May.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_May.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_May.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_May.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_May.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_May.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.Property_Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.FA_Avg_Bld_Rate_rd2, dbo.Policy_Information_ALL_POLICIES_FireAllied_May.FA_Deductible, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      dbo.Policy_Information_ALL_POLICIES_May.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_May.Account_Name, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_May.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Non_Owned_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_May.Hired_Auto, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.Price_Monitor_Standard_Cov_Grp_Monitored_range
FROM         dbo.ALL_POLICIES_12_premium_summary_May LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Information_ALL_POLICIES_AUTO_May.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Information_Underwriting_Check_List_May.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_GL_AVG_RATES_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Information_GL_AVG_RATES_May.Policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_May.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_May.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Information_ALL_POLICIES_May.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.policynumber AND 
                      dbo.ALL_POLICIES_12_premium_summary_May.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_May.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_May.statecode, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_May.productcode, dbo.ALL_POLICIES_12_premium_summary_May.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_May.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_May.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_May.Branch_Region, dbo.Policy_Information_ALL_POLICIES_May.program, 
                      dbo.Policy_Information_ALL_POLICIES_May.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_May.product_group, dbo.Policy_Information_ALL_POLICIES_May.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_May.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_May.accountnumber, dbo.Policy_Information_ALL_POLICIES_May.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Playground_YN, dbo.Policy_Information_Underwriting_Check_List_May.Playground_Equip_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Pool_YN, dbo.Policy_Information_Underwriting_Check_List_May.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Tennis_Bubble_YN, dbo.Policy_Information_Underwriting_Check_List_May.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Number_of_Swimming_Pools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_May.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_May.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_May.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_May.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_May.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_May.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_May.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_May.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_May.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_May.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.Property_Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_May.FA_Avg_Bld_Rate_rd2, dbo.Policy_Information_ALL_POLICIES_FireAllied_May.FA_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_May.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_May.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_May.Non_Owned_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_May.Hired_Auto, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_May.Price_Monitor_Standard_Cov_Grp_Monitored_range
HAVING      (dbo.ALL_POLICIES_12_premium_summary_May.statecode = ''SC'') AND (NOT (dbo.ALL_POLICIES_12_premium_summary_May.productcode IN (''ME'', 
                      ''NP'', ''FP'', ''RL'', ''VS'', ''DY'', ''CO'')))
' 
GO
