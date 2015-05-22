IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_WV_All_Lines_View_1]'))
DROP VIEW [dbo].[State_WV_All_Lines_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_WV_All_Lines_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_WV_All_Lines_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_October.statecode, dbo.ALL_POLICIES_12_premium_summary_October.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_October.productcode, dbo.ALL_POLICIES_12_premium_summary_October.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_October.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Fraud_Breach_of_Contract_Loss) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Injury_Count) 
                      AS COL_GLBI_Injury_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_October.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_October.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_October.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_October.Branch_Region, dbo.Policy_Information_ALL_POLICIES_October.program, 
                      dbo.Policy_Information_ALL_POLICIES_October.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_October.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_October.product_group, dbo.Policy_Information_ALL_POLICIES_October.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_October.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_October.accountnumber, dbo.Policy_Information_ALL_POLICIES_October.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Playground_Equip_YN, dbo.Policy_Information_Underwriting_Check_List_October.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Number_of_Swimming_Pools_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_October.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_October.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_October.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_October.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.Property_Coverage_Form, 
                      dbo.ALL_POLICIES_12_premium_summary_October.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.FA_Deductible, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      dbo.Policy_Information_ALL_POLICIES_October.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_October.Account_Name, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_October.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Hired_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_October.Non_Owned_Auto, 
                      dbo.Policy_Information_GL_AVG_RATES_October.Churches_Avg_Rate_Range, 
                      dbo.Policy_Information_GL_AVG_RATES_October.Day_Care_Avg_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Primary_Producer_code, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      AccessPhlyEom.dbo.Division.DivisionName, AccessPhlyEom.dbo.product.producttype, 
                      dbo.ALL_POLICIES_12_premium_summary_October.Fiscal_AY_Month_Ending, 
                      dbo.ALL_POLICIES_12_premium_summary_October.Last_Reporting_Year, dbo.ALL_POLICIES_12_premium_summary_October.Last_Reporting_Month,
                       dbo.Policy_Information_ALL_POLICIES_October.PIC_Producer, dbo.Policy_Information_ALL_POLICIES_October.First_Policy_Year, 
                      dbo.Policy_Information_ALL_POLICIES_October.underwriter, dbo.Policy_Information_ALL_POLICIES_October.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_October.Source_Detail_Name
FROM         dbo.ALL_POLICIES_12_premium_summary_October LEFT OUTER JOIN
                      AccessPhlyEom.dbo.product ON 
                      dbo.ALL_POLICIES_12_premium_summary_October.productcode = AccessPhlyEom.dbo.product.productcode LEFT OUTER JOIN
                      AccessPhlyEom.dbo.Division ON AccessPhlyEom.dbo.product.DivisionID = AccessPhlyEom.dbo.Division.DivisionID LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October ON 
                      dbo.ALL_POLICIES_12_premium_summary_October.policynumber = dbo.Policy_Information_ALL_POLICIES_AUTO_October.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_October ON 
                      dbo.ALL_POLICIES_12_premium_summary_October.policynumber = dbo.Policy_Information_Underwriting_Check_List_October.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_GL_AVG_RATES_October ON 
                      dbo.ALL_POLICIES_12_premium_summary_October.policynumber = dbo.Policy_Information_GL_AVG_RATES_October.Policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_October ON 
                      dbo.ALL_POLICIES_12_premium_summary_October.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_October.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October ON 
                      dbo.ALL_POLICIES_12_premium_summary_October.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_October.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_October ON 
                      dbo.ALL_POLICIES_12_premium_summary_October.policynumber = dbo.Policy_Information_ALL_POLICIES_October.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October ON 
                      dbo.ALL_POLICIES_12_premium_summary_October.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.policynumber AND
                       dbo.ALL_POLICIES_12_premium_summary_October.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.Productcode AND
                       dbo.ALL_POLICIES_12_premium_summary_October.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_October.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_October.statecode, dbo.ALL_POLICIES_12_premium_summary_October.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_October.productcode, dbo.ALL_POLICIES_12_premium_summary_October.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_October.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_October.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_October.Branch_Region, dbo.Policy_Information_ALL_POLICIES_October.program, 
                      dbo.Policy_Information_ALL_POLICIES_October.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_October.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_October.product_group, dbo.Policy_Information_ALL_POLICIES_October.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_October.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.accountnumber, dbo.Policy_Information_ALL_POLICIES_October.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Playground_Equip_YN, dbo.Policy_Information_Underwriting_Check_List_October.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_October.Number_of_Swimming_Pools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_October.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_October.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_October.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_October.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.Property_Coverage_Form, 
                      dbo.ALL_POLICIES_12_premium_summary_October.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_October.FA_Deductible, dbo.Policy_Information_ALL_POLICIES_October.Endorsement_Elite_YN, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_October.Hired_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_October.Non_Owned_Auto, 
                      dbo.Policy_Information_GL_AVG_RATES_October.Churches_Avg_Rate_Range, 
                      dbo.Policy_Information_GL_AVG_RATES_October.Day_Care_Avg_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Primary_Producer_code, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_NonCat_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_October.Account_RepLoss_Ratio_NonCat_Working_Cover_Range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_October.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      AccessPhlyEom.dbo.Division.DivisionName, AccessPhlyEom.dbo.product.producttype, 
                      dbo.ALL_POLICIES_12_premium_summary_October.Fiscal_AY_Month_Ending, 
                      dbo.ALL_POLICIES_12_premium_summary_October.Last_Reporting_Year, dbo.ALL_POLICIES_12_premium_summary_October.Last_Reporting_Month,
                       dbo.Policy_Information_ALL_POLICIES_October.PIC_Producer, dbo.Policy_Information_ALL_POLICIES_October.First_Policy_Year, 
                      dbo.Policy_Information_ALL_POLICIES_October.underwriter, dbo.Policy_Information_ALL_POLICIES_October.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_October.Source_Detail_Name
HAVING      (dbo.ALL_POLICIES_12_premium_summary_October.statecode = ''WV'')
' 
GO
