IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[IP_Prop_View1]'))
DROP VIEW [dbo].[IP_Prop_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[IP_Prop_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.IP_Prop_View1
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Written_Premium_Range, 
                      County_Pop_Density_Range, Policy_count_Reporting_Coverage, Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, GL_Dom_Region_in_State, statecode, Coverage_Form, Fiscal_AY_Month_Ending, 
                      SUM(COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, SUM(COL_Prop_Fire_Lightning_Explosion_Loss) 
                      AS COL_Prop_Fire_Lightning_Explosion_Loss, SUM(COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, SUM(COL_Prop_Theft_Van_Loss) 
                      AS COL_Prop_Theft_Van_Loss, SUM(COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, SUM(COL_Prop_Water_Sprinkler_Loss)
                       AS COL_Prop_Water_Sprinkler_Loss, SUM(COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, SUM(COL_Prop_Other_Loss) 
                      AS COL_Prop_Other_Loss, SUM(COL_Prop_Other_Count) AS COL_Prop_Other_Count, SUM(COL_Prop_Wind_Hail_Loss) 
                      AS COL_Prop_Wind_Hail_Loss, SUM(COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, SUM(COL_Prop_Water_Other_Loss) 
                      AS COL_Prop_Water_Other_Loss, Branch_Region, FA_Deductible, SUM(Earned_TIV) AS Earned_TIV, FA_Avg_Bld_Rate_rd2, FA_Avg_Bld_Rate_Range, 
                      FA_Constr_Code_Dominant_NAME, FA_protect_class_Dominant, GL_Dom_Terr_description
FROM         dbo.IP_premium_summary
GROUP BY Coverage_Reporting_group, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Written_Premium_Range, 
                      County_Pop_Density_Range, Policy_count_Reporting_Coverage, Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, GL_Dom_Region_in_State, statecode, Coverage_Form, Fiscal_AY_Month_Ending, 
                      Branch_Region, FA_Deductible, FA_Avg_Bld_Rate_rd2, FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, FA_protect_class_Dominant, 
                      GL_Dom_Terr_description
' 
GO
