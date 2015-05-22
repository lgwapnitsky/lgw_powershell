IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NP_Prop_View_1]'))
DROP VIEW [dbo].[NP_Prop_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NP_Prop_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.NP_Prop_View_1
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Month_Ending, Fiscal_AY_Year, SUM(currentearnedpremium) AS currentearnedpremium, 
                      SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, SUM(COL_Prop_Fire_Lightning_Explosion_Loss) 
                      AS COL_Prop_Fire_Lightning_Explosion_Loss, SUM(COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, SUM(COL_Prop_Theft_Van_Loss) 
                      AS COL_Prop_Theft_Van_Loss, SUM(COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, SUM(COL_Prop_Water_Sprinkler_Loss)
                       AS COL_Prop_Water_Sprinkler_Loss, SUM(COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, SUM(COL_Prop_Water_Other_Loss) 
                      AS COL_Prop_Water_Other_Loss, SUM(COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, SUM(COL_Prop_Wind_Hail_Loss) 
                      AS COL_Prop_Wind_Hail_Loss, SUM(COL_Prop_Other_Count) AS COL_Prop_Other_Count, SUM(COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, New_Renew_Tail, Renew_New_Auto, 
                      Written_Premium_Range, FA_Deductible, FA_Avg_Bld_Rate_Range, Renewals_Range, First_Policy_Year, Branch_Region, 
                      County_Pop_Density_Range, FA_Avg_Bld_Rate_rd2, FA_Constr_Code_Dominant_NAME, Coverage_Form, statecode, Companycode, Latest_Product, 
                      GL_Dom_Region_in_State, Endorsement_FA_Elite, SUM(Earned_TIV) AS Earned_TIV, FA_protect_class_Dominant
FROM         dbo.Non_Profit_premium_summary
GROUP BY Coverage_Reporting_group, Fiscal_AY_Month_Ending, Fiscal_AY_Year, New_Renew_Tail, Renew_New_Auto, Written_Premium_Range, 
                      FA_Deductible, FA_Avg_Bld_Rate_Range, Renewals_Range, First_Policy_Year, Branch_Region, County_Pop_Density_Range, FA_Avg_Bld_Rate_rd2, 
                      FA_Constr_Code_Dominant_NAME, Coverage_Form, statecode, Companycode, Latest_Product, GL_Dom_Region_in_State, Endorsement_FA_Elite, 
                      FA_protect_class_Dominant
' 
GO
