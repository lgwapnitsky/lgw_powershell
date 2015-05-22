IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MD_All_Lines_View_1]'))
DROP VIEW [dbo].[State_MD_All_Lines_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MD_All_Lines_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_MD_All_Lines_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_June.statecode, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_June.productcode, dbo.ALL_POLICIES_12_premium_summary_June.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_June.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_June.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_June.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_June.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_June.Branch_Region, dbo.Policy_Information_ALL_POLICIES_June.program, 
                      dbo.Policy_Information_ALL_POLICIES_June.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_June.product_group, dbo.Policy_Information_ALL_POLICIES_June.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_June.accountnumber, dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Playground_Equip_YN, dbo.Policy_Information_Underwriting_Check_List_June.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Number_of_Swimming_Pools_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_June.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_June.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.Property_Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.FA_Avg_Bld_Rate_rd2, dbo.Policy_Information_ALL_POLICIES_FireAllied_June.FA_Deductible, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      dbo.Policy_Information_ALL_POLICIES_June.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_June.Account_Name, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Hired_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_June.Non_Owned_Auto, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      AccessPhlyEom.dbo.product.producttype, AccessPhlyEom.dbo.Division.DivisionName
FROM         AccessPhlyEom.dbo.Division RIGHT OUTER JOIN
                      AccessPhlyEom.dbo.product ON AccessPhlyEom.dbo.Division.DivisionID = AccessPhlyEom.dbo.product.DivisionID RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_June ON 
                      AccessPhlyEom.dbo.product.productcode = dbo.ALL_POLICIES_12_premium_summary_June.productcode LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_ALL_POLICIES_AUTO_June.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_June.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_Underwriting_Check_List_June.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_GL_AVG_RATES_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_GL_AVG_RATES_June.Policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_June.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_ALL_POLICIES_June.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.policynumber AND 
                      dbo.ALL_POLICIES_12_premium_summary_June.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_June.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_June.statecode, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_June.productcode, dbo.ALL_POLICIES_12_premium_summary_June.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_June.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_June.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_June.Branch_Region, dbo.Policy_Information_ALL_POLICIES_June.program, 
                      dbo.Policy_Information_ALL_POLICIES_June.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_June.product_group, dbo.Policy_Information_ALL_POLICIES_June.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.accountnumber, dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Playground_Equip_YN, dbo.Policy_Information_Underwriting_Check_List_June.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_June.Number_of_Swimming_Pools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_June.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_June.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.Property_Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_June.FA_Avg_Bld_Rate_rd2, dbo.Policy_Information_ALL_POLICIES_FireAllied_June.FA_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_June.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_June.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_June.Hired_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_June.Non_Owned_Auto, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      AccessPhlyEom.dbo.product.producttype, AccessPhlyEom.dbo.Division.DivisionName
HAVING      (dbo.ALL_POLICIES_12_premium_summary_June.statecode = ''MD'')
' 
GO
