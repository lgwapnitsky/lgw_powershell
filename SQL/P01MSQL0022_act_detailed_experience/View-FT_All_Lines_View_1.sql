IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FT_All_Lines_View_1]'))
DROP VIEW [dbo].[FT_All_Lines_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FT_All_Lines_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.FT_All_Lines_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_February.statecode, dbo.ALL_POLICIES_12_premium_summary_February.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_February.productcode, dbo.ALL_POLICIES_12_premium_summary_February.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_February.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Fraud_Breach_of_Contract_Loss) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Injury_Count) 
                      AS COL_GLBI_Injury_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_February.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_February.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_February.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_February.Branch_Region, dbo.Policy_Information_ALL_POLICIES_February.program, 
                      dbo.Policy_Information_ALL_POLICIES_February.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_February.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_February.product_group, dbo.Policy_Information_ALL_POLICIES_February.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_February.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_February.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_February.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_February.accountnumber, dbo.Policy_Information_ALL_POLICIES_February.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Playground_Equip_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Number_of_Swimming_Pools_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_February.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_February.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_February.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_February.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_February.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_February.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.Property_Coverage_Form, 
                      dbo.ALL_POLICIES_12_premium_summary_February.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.FA_Deductible, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Fire_Lightning_Explosion_Count) 
                      AS COL_Prop_Fire_Lightning_Explosion_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Other_Loss) 
                      AS COL_Prop_Other_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_February.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      dbo.Policy_Information_ALL_POLICIES_February.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_February.Account_Name, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Case_Loss) AS Case_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Case_ALAE) AS Case_ALAE, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Paid_Loss) AS Paid_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_February.Paid_ALAE) AS Paid_ALAE, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.ALL_POLICIES_12_premium_summary_February.policyeffectivedate, dbo.FT_Organization_RapidSure.Organization, 
                      dbo.FT_Organization_RapidSure.IDEAMemberInd, dbo.FT_Organization_RapidSure.CertificationType
FROM         dbo.ALL_POLICIES_12_premium_summary_February LEFT OUTER JOIN
                      dbo.FT_Organization_RapidSure ON 
                      dbo.ALL_POLICIES_12_premium_summary_February.policynumber = dbo.FT_Organization_RapidSure.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February ON 
                      dbo.ALL_POLICIES_12_premium_summary_February.policynumber = dbo.Policy_Information_ALL_POLICIES_AUTO_February.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_Underwriting_Check_List_February ON 
                      dbo.ALL_POLICIES_12_premium_summary_February.policynumber = dbo.Policy_Information_Underwriting_Check_List_February.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_GL_AVG_RATES_February ON 
                      dbo.ALL_POLICIES_12_premium_summary_February.policynumber = dbo.Policy_Information_GL_AVG_RATES_February.Policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_February ON 
                      dbo.ALL_POLICIES_12_premium_summary_February.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_February.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February ON 
                      dbo.ALL_POLICIES_12_premium_summary_February.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_February.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_February ON 
                      dbo.ALL_POLICIES_12_premium_summary_February.policynumber = dbo.Policy_Information_ALL_POLICIES_February.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February ON 
                      dbo.ALL_POLICIES_12_premium_summary_February.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February.policynumber
                       AND 
                      dbo.ALL_POLICIES_12_premium_summary_February.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February.Productcode AND
                       dbo.ALL_POLICIES_12_premium_summary_February.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_February.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_February.statecode, dbo.ALL_POLICIES_12_premium_summary_February.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_February.productcode, dbo.ALL_POLICIES_12_premium_summary_February.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_February.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_February.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_February.Branch_Region, dbo.Policy_Information_ALL_POLICIES_February.program, 
                      dbo.Policy_Information_ALL_POLICIES_February.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_February.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_February.product_group, dbo.Policy_Information_ALL_POLICIES_February.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_February.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_February.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_February.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_February.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_February.accountnumber, dbo.Policy_Information_ALL_POLICIES_February.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Playground_Equip_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_February.Number_of_Swimming_Pools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_February.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_February.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_February.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_February.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_February.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_February.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.Property_Coverage_Form, 
                      dbo.ALL_POLICIES_12_premium_summary_February.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_February.FA_Deductible, dbo.Policy_Information_ALL_POLICIES_February.Endorsement_Elite_YN, 
                      dbo.Policy_Information_ALL_POLICIES_February.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.ALL_POLICIES_12_premium_summary_February.policyeffectivedate, dbo.FT_Organization_RapidSure.Organization, 
                      dbo.FT_Organization_RapidSure.CertificationType, dbo.FT_Organization_RapidSure.IDEAMemberInd
HAVING      (dbo.Policy_Information_ALL_POLICIES_February.Primary_Umbrella = ''Primary'') AND 
                      (dbo.ALL_POLICIES_12_premium_summary_February.productcode = ''FT'')
' 
GO
