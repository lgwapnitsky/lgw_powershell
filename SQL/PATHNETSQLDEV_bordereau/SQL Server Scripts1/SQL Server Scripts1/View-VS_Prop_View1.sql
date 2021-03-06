IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_Prop_View1]'))
DROP VIEW [dbo].[VS_Prop_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_Prop_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.VS_Prop_View1
AS
SELECT     Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
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
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, Renewals_Range, New_Renew_Tail, 
                      Renew_New_Auto, First_Policy_Year, Branch_Region, Written_Premium_Range, FA_Deductible, FA_Avg_Bld_Rate_Range, 
                      FA_Constr_Code_Dominant_NAME, FA_Avg_Bld_Rate_rd2, SUM(Earned_TIV) AS Earned_TIV, FA_Number_of_Locations, FA_Number_of_Buildings, 
                      FA_Building_Exposure, FA_Contents_Exposure, FA_Business_Interuption_Exposure, FA_Extra_Expense_Exposure, FA_Building_Prem, 
                      FA_Contents_Prem, FA_Frost_State, Earned_Buildings, Earned_Locations, Earned_TIV AS Expr1, TIV_Range, FA_Deductible_to_TIV, 
                      FA_Deductible_to_TIV_Range, FA_Avg_Bld_Rate, TIV, FA_Avg_Cts_Rate, FA_Avg_Cts_Rate_Range, FA_Constr_code_Tot_Exposure, 
                      FA_Constr_Code_Max_Exposure, FA_Constr_Code_Dominant, FA_Constr_Code_Dominant_Percent, FA_protect_class_Tot_Exposure, 
                      FA_protect_class_Max_Exposure, FA_protect_class_Dominant, FA_protect_class_Dominant_Percent, Business_Grp, Business_Desc, 
                      SUM(Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly, Account_Name_Display, Account_Active, ZIP_Pop_Density_Dominant, FA_Hail_Dominant, 
                      FA_Avg_to_Benchmark_Rate_Range
FROM         dbo.VS_premium_summary
WHERE     (Companycode = ''ph'')
GROUP BY Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, 
                      Branch_Region, Written_Premium_Range, FA_Deductible, FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, FA_Avg_Bld_Rate_rd2, 
                      FA_Number_of_Locations, FA_Number_of_Buildings, FA_Building_Exposure, FA_Contents_Exposure, FA_Business_Interuption_Exposure, 
                      FA_Extra_Expense_Exposure, FA_Building_Prem, FA_Contents_Prem, FA_Frost_State, Earned_Buildings, Earned_Locations, Earned_TIV, TIV_Range, 
                      FA_Deductible_to_TIV, FA_Deductible_to_TIV_Range, FA_Avg_Bld_Rate, TIV, FA_Avg_Cts_Rate, FA_Avg_Cts_Rate_Range, 
                      FA_Constr_code_Tot_Exposure, FA_Constr_Code_Max_Exposure, FA_Constr_Code_Dominant, FA_Constr_Code_Dominant_Percent, 
                      FA_protect_class_Tot_Exposure, FA_protect_class_Max_Exposure, FA_protect_class_Dominant, FA_protect_class_Dominant_Percent, Business_Grp, 
                      Business_Desc, Account_Name_Display, Account_Active, ZIP_Pop_Density_Dominant, FA_Hail_Dominant, FA_Avg_to_Benchmark_Rate_Range
' 
GO
