IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AH_Prop_View_1_month]'))
DROP VIEW [dbo].[AH_Prop_View_1_month]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AH_Prop_View_1_month]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.AH_Prop_View_1_month
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, Coverage_Form, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, SUM(COL_Prop_Fire_Lightning_Explosion_Loss) 
                      AS COL_Prop_Fire_Lightning_Explosion_Loss, SUM(COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, SUM(COL_Prop_Theft_Van_Loss) 
                      AS COL_Prop_Theft_Van_Loss, SUM(COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, SUM(COL_Prop_Water_Sprinkler_Loss)
                       AS COL_Prop_Water_Sprinkler_Loss, SUM(COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, SUM(COL_Prop_Water_Other_Loss) 
                      AS COL_Prop_Water_Other_Loss, SUM(COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, SUM(COL_Prop_Wind_Hail_Loss) 
                      AS COL_Prop_Wind_Hail_Loss, SUM(COL_Prop_Other_Count) AS COL_Prop_Other_Count, SUM(COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, Written_Premium_Range, FA_Deductible, 
                      FA_Constr_Code_Dominant_NAME, FA_Avg_Bld_Rate_Range, FA_Avg_Bld_Rate_rd2, Renew_New_Auto, New_Renew_Tail, statecode, acctngyear, 
                      Companycode, SUM(Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS, policynumber, Earned_TIV
FROM         dbo.AH_premium_summary_month
GROUP BY Coverage_Reporting_group, Fiscal_AY_Year, Coverage_Form, Written_Premium_Range, FA_Deductible, FA_Constr_Code_Dominant_NAME, 
                      FA_Avg_Bld_Rate_Range, FA_Avg_Bld_Rate_rd2, Renew_New_Auto, New_Renew_Tail, statecode, acctngyear, Companycode, policynumber, 
                      Earned_TIV
' 
GO
