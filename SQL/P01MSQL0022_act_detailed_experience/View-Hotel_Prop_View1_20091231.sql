IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hotel_Prop_View1_20091231]'))
DROP VIEW [dbo].[Hotel_Prop_View1_20091231]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hotel_Prop_View1_20091231]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Hotel_Prop_View1_20091231
AS
SELECT     Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, Policy_count_Reporting_Coverage, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(COL_Prop_Fire_Lightning_Explosion_Count) 
                      AS COL_Prop_Fire_Lightning_Explosion_Count, SUM(COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, SUM(COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, SUM(COL_Prop_Water_Sprinkler_Loss) 
                      AS COL_Prop_Water_Sprinkler_Loss, SUM(COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, SUM(COL_Prop_Water_Other_Loss) 
                      AS COL_Prop_Water_Other_Loss, SUM(COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, SUM(COL_Prop_Wind_Hail_Loss) 
                      AS COL_Prop_Wind_Hail_Loss, SUM(COL_Prop_Other_Count) AS COL_Prop_Other_Count, SUM(COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, Renewals_Range, New_Renew_Tail, 
                      Renew_New_Auto, Branch_Region, First_Policy_Year, Written_Premium_Range, County_Pop_Density_Range, FA_Deductible, FA_Avg_Bld_Rate_rd2, 
                      FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, Number_of_Rooms_Range, SUM(Earned_TIV) AS Earned_TIV, 
                      SUM(Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly, statecode
FROM         dbo.Hotel_Premium_Summary_20091231
GROUP BY Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, Policy_count_Reporting_Coverage, Renewals_Range, New_Renew_Tail, 
                      Renew_New_Auto, Branch_Region, First_Policy_Year, Written_Premium_Range, County_Pop_Density_Range, FA_Deductible, FA_Avg_Bld_Rate_rd2, 
                      FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, Number_of_Rooms_Range, statecode
' 
GO
