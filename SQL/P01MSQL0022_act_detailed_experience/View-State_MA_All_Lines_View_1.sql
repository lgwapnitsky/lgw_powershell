IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MA_All_Lines_View_1]'))
DROP VIEW [dbo].[State_MA_All_Lines_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MA_All_Lines_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_MA_All_Lines_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_September.statecode, dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_September.productcode, dbo.ALL_POLICIES_12_premium_summary_September.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_September.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Fraud_Breach_of_Contract_Loss) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Injury_Count) 
                      AS COL_GLBI_Injury_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss,
                       SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_September.Incurred_Claims) 
                      AS Incurred_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_September.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_September.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_September.Branch_Region, dbo.Policy_Information_ALL_POLICIES_September.program, 
                      dbo.Policy_Information_ALL_POLICIES_September.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_September.product_group, dbo.Policy_Information_ALL_POLICIES_September.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_September.accountnumber, dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Playground_Equip_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Number_of_Swimming_Pools_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) 
                      AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Aggregate_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Deductible, dbo.Policy_Information_ALL_POLICIES_GL_September.GLDX_Indicator, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_Group, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_September.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_September.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.Property_Coverage_Form, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.FA_Deductible, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Fire_Lightning_Explosion_Loss) 
                      AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Fire_Lightning_Explosion_Count) 
                      AS COL_Prop_Fire_Lightning_Explosion_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Other_Loss) 
                      AS COL_Prop_Other_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_September.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      dbo.Policy_Information_ALL_POLICIES_September.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_September.Account_Name, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_September.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Hired_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_September.Non_Owned_Auto, 
                      dbo.Policy_Information_GL_AVG_RATES_September.Churches_Avg_Rate_Range, 
                      dbo.Policy_Information_GL_AVG_RATES_September.Day_Care_Avg_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer_code, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      AccessPhlyEom.dbo.Division.DivisionName, AccessPhlyEom.dbo.product.producttype, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Fiscal_AY_Month_Ending, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Last_Reporting_Month, dbo.Policy_Information_ALL_POLICIES_September.PIC_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_September.First_Policy_Year, dbo.Policy_Information_ALL_POLICIES_September.underwriter, 
                      dbo.Policy_Information_ALL_POLICIES_September.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_September.Source_Detail_Name
FROM         dbo.ALL_POLICIES_12_premium_summary_September LEFT OUTER JOIN
                      AccessPhlyEom.dbo.product ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.productcode = AccessPhlyEom.dbo.product.productcode LEFT OUTER JOIN
                      AccessPhlyEom.dbo.Division ON AccessPhlyEom.dbo.product.DivisionID = AccessPhlyEom.dbo.Division.DivisionID LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Information_ALL_POLICIES_AUTO_September.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_Underwriting_Check_List_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Information_Underwriting_Check_List_September.policynumber LEFT
                       OUTER JOIN
                      dbo.Policy_Information_GL_AVG_RATES_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Information_GL_AVG_RATES_September.Policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_September.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_September.policynumber LEFT
                       OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Information_ALL_POLICIES_September.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September ON 
                      dbo.ALL_POLICIES_12_premium_summary_September.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.policynumber
                       AND 
                      dbo.ALL_POLICIES_12_premium_summary_September.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Productcode
                       AND 
                      dbo.ALL_POLICIES_12_premium_summary_September.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.statecode AND
                       dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_September.statecode, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_September.productcode, dbo.ALL_POLICIES_12_premium_summary_September.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_September.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_September.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_September.Branch_Region, dbo.Policy_Information_ALL_POLICIES_September.program, 
                      dbo.Policy_Information_ALL_POLICIES_September.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_September.product_group, dbo.Policy_Information_ALL_POLICIES_September.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.accountnumber, dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Playground_Equip_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_September.Number_of_Swimming_Pools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.SAM_Form_Group, 
                      dbo.Policy_Information_ALL_POLICIES_GL_September.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_September.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_September.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.Property_Coverage_Form, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_September.FA_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_September.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_September.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_September.Hired_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_September.Non_Owned_Auto, 
                      dbo.Policy_Information_GL_AVG_RATES_September.Churches_Avg_Rate_Range, 
                      dbo.Policy_Information_GL_AVG_RATES_September.Day_Care_Avg_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Primary_Producer_code, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_September.Account_RepLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      AccessPhlyEom.dbo.Division.DivisionName, AccessPhlyEom.dbo.product.producttype, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Fiscal_AY_Month_Ending, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_September.Last_Reporting_Month, dbo.Policy_Information_ALL_POLICIES_September.PIC_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_September.First_Policy_Year, dbo.Policy_Information_ALL_POLICIES_September.underwriter, 
                      dbo.Policy_Information_ALL_POLICIES_September.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_September.Source_Detail_Name
HAVING      (dbo.ALL_POLICIES_12_premium_summary_September.statecode = ''MA'') AND 
                      (dbo.ALL_POLICIES_12_premium_summary_September.productcode = ''VS'')
' 
GO
