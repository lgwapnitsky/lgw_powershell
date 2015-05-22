IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RL_Prop_View1]'))
DROP VIEW [dbo].[RL_Prop_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RL_Prop_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.RL_Prop_View1
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, currentwrittenpremium, currentearnedpremium, Policy_count_Reporting_Coverage, 
                      COL_Prop_Fire_Lightning_Explosion_Count, COL_Prop_Fire_Lightning_Explosion_Loss, COL_Prop_Theft_Van_Count, COL_Prop_Theft_Van_Loss, 
                      COL_Prop_Water_Sprinkler_Count, COL_Prop_Water_Sprinkler_Loss, COL_Prop_Water_Other_Count, COL_Prop_Water_Other_Loss, 
                      COL_Prop_Wind_Hail_Count, COL_Prop_Other_Count, COL_Prop_Wind_Hail_Loss, COL_Prop_Other_Loss, Incurred_Loss_ALAE_with_SS_NonCat, 
                      Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Reported_Claims, New_Renew_Tail, Renew_New_Auto, Business_Grp, 
                      Written_Premium_Range, FA_Deductible, Earned_TIV, FA_Constr_Code_Dominant_NAME, Coverage_Form, ZIP_Pop_Density_Dominant, 
                      FA_Hail_Dominant, MinUCPrem, MaxUCPrem, Term_factor, FA_Avg_Min_Benchmark_Rate, FA_Avg_Max_Benchmark_Rate, FA_Avg_Rate, 
                      FA_Avg_Bld_Rate_rd2, FA_Avg_Bld_Rate_Range, FA_Avg_Cts_Rate_Range, FA_Avg_to_Benchmark_Rate_Range, FA_Avg_Bld_Rate, 
                      FA_Avg_Cts_Rate
FROM         dbo.RL_premium_summary
' 
GO
