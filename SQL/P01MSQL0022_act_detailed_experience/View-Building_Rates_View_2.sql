IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Building_Rates_View_2]'))
DROP VIEW [dbo].[Building_Rates_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Building_Rates_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Building_Rates_View_2
AS
SELECT     statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, productcode, Fiscal_AY_Month_Ending, Fiscal_AY_Year, acctngyear, 
                      Last_Reporting_Year, Last_Reporting_Month, Loss_Evaluation_Month, Loss_Evaluation_Year, Loss_ALAE_Cap, product_group, policy_effective_year, 
                      New_Renew_Tail, Branch_Region, Renew_New_Auto, Program_Code, Latest_PY, First_Policy_Year, SIC_Desc, SIC_Industry_group, 
                      Written_Premium_Range, County_Pop_Density_Range, FA_Number_of_Locations, FA_Number_of_Buildings, FA_Deductible, 
                      FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant, FA_Constr_Code_Dominant_NAME, FA_protect_class_Dominant, FA_Avg_Bld_Rate_rd2, 
                      Experience_Product_Group, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) AS currentearnedpremium, 
                      SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, SUM(COL_Prop_Fire_Lightning_Explosion_Count) 
                      AS COL_Prop_Fire_Lightning_Explosion_Count, SUM(COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Countr, SUM(COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, SUM(COL_Prop_Water_Sprinkler_Loss) 
                      AS COL_Prop_Water_Sprinkler_Loss, SUM(COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, SUM(COL_Prop_Water_Other_Loss) 
                      AS COL_Prop_Water_Other_Loss, SUM(COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, SUM(COL_Prop_Wind_Hail_Loss) 
                      AS COL_Prop_Wind_Hail_Loss, SUM(COL_Prop_Other_Count) AS COL_Prop_Other_Count, SUM(COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, SUM(Open_Claims) AS Open_Claims, 
                      SUM(Closed_With_Pay_Claims) AS Closed_With_Pay_Claims, SUM(Closed_Without_Pay_Claims) AS Closed_Without_Pay_Claims, SUM(Earned_TIV) 
                      AS Earned_TIV
FROM         dbo.BuildingRates_premium_summary
GROUP BY statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, productcode, Fiscal_AY_Month_Ending, Fiscal_AY_Year, acctngyear, 
                      Last_Reporting_Year, Last_Reporting_Month, Loss_Evaluation_Month, Loss_Evaluation_Year, Loss_ALAE_Cap, product_group, policy_effective_year, 
                      New_Renew_Tail, Branch_Region, Renew_New_Auto, Program_Code, Latest_PY, First_Policy_Year, SIC_Desc, SIC_Industry_group, 
                      Written_Premium_Range, County_Pop_Density_Range, FA_Number_of_Locations, FA_Number_of_Buildings, FA_Deductible, 
                      FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant, FA_Constr_Code_Dominant_NAME, FA_protect_class_Dominant, FA_Avg_Bld_Rate_rd2, 
                      Experience_Product_Group
' 
GO
