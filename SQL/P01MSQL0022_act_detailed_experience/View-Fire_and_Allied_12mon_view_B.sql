IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Fire_and_Allied_12mon_view_B]'))
DROP VIEW [dbo].[Fire_and_Allied_12mon_view_B]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Fire_and_Allied_12mon_view_B]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Fire_and_Allied_12mon_view_B
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_B.statecode, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_B.productcode, SUM(dbo.ALL_POLICIES_12_premium_summary_B.currentwrittenpremium) 
                      AS currentwrittenpremium, SUM(dbo.ALL_POLICIES_12_premium_summary_B.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Commission_Premiums) AS Commission_Premiums, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_TIV) AS Earned_TIV, dbo.ALL_POLICIES_12_premium_summary_B.experienceproduct, 
                      dbo.ALL_POLICIES_12_premium_summary_B.acctngyear, dbo.ALL_POLICIES_12_premium_summary_B.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_B.Last_Reporting_Month, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Open_Claims) AS Open_Claims, dbo.ALL_POLICIES_12_premium_summary_B.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.product_group, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, 
                      dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_without_SS_CatOnly) AS Incurred_Loss_ALAE_without_SS_CatOnly, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly, dbo.Policy_Information_ALL_POLICIES_B.Property_Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_B.program, dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer_type, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.TIV_Range, dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_protect_class_Dominant, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.ZIP_Pop_Density_Dominant
FROM         dbo.ALL_POLICIES_12_premium_summary_B LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.coverage_group AND 
                      dbo.ALL_POLICIES_12_premium_summary_B.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_B.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_B.policynumber
GROUP BY dbo.ALL_POLICIES_12_premium_summary_B.statecode, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_B.productcode, dbo.ALL_POLICIES_12_premium_summary_B.experienceproduct, 
                      dbo.ALL_POLICIES_12_premium_summary_B.acctngyear, dbo.ALL_POLICIES_12_premium_summary_B.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_B.Last_Reporting_Month, dbo.ALL_POLICIES_12_premium_summary_B.Fiscal_AY_Year, 
                      dbo.Policy_Information_ALL_POLICIES_B.product_group, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, 
                      dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.Property_Coverage_Form, dbo.Policy_Information_ALL_POLICIES_B.program, 
                      dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer_type, dbo.Policy_Information_ALL_POLICIES_FireAllied_B.TIV_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_protect_class_Dominant, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_B.ZIP_Pop_Density_Dominant
HAVING      (dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group = ''Fire & Allied'')
' 
GO
