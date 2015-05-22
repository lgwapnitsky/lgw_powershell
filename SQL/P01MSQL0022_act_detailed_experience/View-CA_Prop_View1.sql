IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CA_Prop_View1]'))
DROP VIEW [dbo].[CA_Prop_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CA_Prop_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.CA_Prop_View1
AS
SELECT     Fiscal_AY_Year, New_Renew_Tail, SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renew_New_Auto, Written_Premium_Range, FA_Deductible, Coverage_Form, FA_Constr_Code_Dominant_NAME, 
                      FA_Avg_Bld_Rate_Range, FA_Avg_Bld_Rate_rd2, SUM(COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, SUM(COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, SUM(COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(COL_Prop_Other_Count) AS COL_Prop_Other_Count, SUM(COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, SUM(Earned_TIV) AS Earned_TIV, 
                      Coverage_Reporting_group, SUM(COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, SUM(COL_Prop_Theft_Van_Count) 
                      AS COL_Prop_Theft_Van_Count, SUM(COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, SUM(COL_Prop_Water_Sprinkler_Loss) 
                      AS COL_Prop_Water_Sprinkler_Loss
FROM         dbo.CA_premium_summary
GROUP BY Fiscal_AY_Year, New_Renew_Tail, Renew_New_Auto, Written_Premium_Range, FA_Deductible, Coverage_Form, FA_Constr_Code_Dominant_NAME, 
                      FA_Avg_Bld_Rate_Range, FA_Avg_Bld_Rate_rd2, Coverage_Reporting_group
' 
GO
