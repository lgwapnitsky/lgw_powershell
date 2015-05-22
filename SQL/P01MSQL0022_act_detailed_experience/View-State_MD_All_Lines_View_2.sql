IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MD_All_Lines_View_2]'))
DROP VIEW [dbo].[State_MD_All_Lines_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MD_All_Lines_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_MD_All_Lines_View_2
AS
SELECT     TOP (100) PERCENT dbo.ALL_POLICIES_12_premium_summary_B.statecode, 
                      dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Reporting_group, dbo.ALL_POLICIES_12_premium_summary_B.productcode, 
                      dbo.ALL_POLICIES_12_premium_summary_B.Fiscal_AY_Year, SUM(dbo.ALL_POLICIES_12_premium_summary_B.currentwrittenpremium) 
                      AS currentwrittenpremium, SUM(dbo.ALL_POLICIES_12_premium_summary_B.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, dbo.Policy_Information_ALL_POLICIES_B.program, 
                      dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.product_group, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Region_in_State, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.accountnumber, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Playground_YN, dbo.Policy_Information_Underwriting_Check_List_B.Playground_Equip_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Pool_YN, dbo.Policy_Information_Underwriting_Check_List_B.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Tennis_Bubble_YN, dbo.Policy_Information_Underwriting_Check_List_B.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Number_of_Swimming_Pools_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_B.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_B.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.Property_Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Avg_Bld_Rate_rd2, dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Deductible, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      dbo.Policy_Information_ALL_POLICIES_B.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_B.Account_Name, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Dual_Control_Percent_Range
FROM         dbo.ALL_POLICIES_12_premium_summary_B LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_AUTO_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_Underwriting_Check_List_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_GL_AVG_RATES_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_GL_AVG_RATES_B.Policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.policynumber AND 
                      dbo.ALL_POLICIES_12_premium_summary_B.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_B.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_B.statecode, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_B.productcode, dbo.ALL_POLICIES_12_premium_summary_B.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, dbo.Policy_Information_ALL_POLICIES_B.program, 
                      dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.product_group, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Region_in_State, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_RepLoss_Ratio_Working_Cover_Range, dbo.Policy_Information_ALL_POLICIES_B.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer_type, dbo.Policy_Information_Underwriting_Check_List_B.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Playground_Equip_YN, dbo.Policy_Information_Underwriting_Check_List_B.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Sports_Activities_YN, dbo.Policy_Information_Underwriting_Check_List_B.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_B.Number_of_Swimming_Pools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_B.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_B.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.Property_Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Avg_Bld_Rate_rd2, dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_B.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_B.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Dual_Control_Percent_Range
HAVING      (dbo.ALL_POLICIES_12_premium_summary_B.statecode = ''MD'') AND (dbo.Policy_Information_ALL_POLICIES_B.accountnumber <> ''55877'') AND 
                      (dbo.ALL_POLICIES_12_premium_summary_B.productcode = ''CO'')
' 
GO
