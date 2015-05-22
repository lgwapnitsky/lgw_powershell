IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Builders_Risk_View_1]'))
DROP VIEW [dbo].[Builders_Risk_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Builders_Risk_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Builders_Risk_View_1
AS
SELECT     statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, SUM(currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(currentearnedpremium) AS currentearnedpremium, Fiscal_AY_Year, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, Renewals_Range, New_Renew_Tail, 
                      Renew_New_Auto, Branch_Region, Business_Desc, Written_Premium_Range, Primary_Producer, Primary_Producer_type, 
                      BR_Constr_Code_Dominant_NAME, Class_Apartments_AvgTermRate_Range, Class_Dwelling_Other_Than_Apts_AvgTermRate_Range, program, 
                      First_Policy_Year, BR_Avg_Annual_TIV_Rate, BR_Avg_Annual_TIV_Rate_Range, BR_Avg_Term_BR_Rate, BR_Avg_Term_TIV_Rate_Range, 
                      BR_Number_of_Locations, SUM(BR_Builders_Risk_Exposure) AS BR_Builders_Risk_Exposure, SUM(BR_Extra_Exp_Rental_Income_Exposure) 
                      AS BR_Extra_Exp_Rental_Income_Exposure, BR_Deductible, SUM(BR_TIV_Exposure) AS BR_TIV_Exposure, SUM(BR_TIV_Prem) AS BR_TIV_Prem, 
                      SUM(Term_Factor) AS Term_Factor, BR_TIV_Exposure_Range, Account_Name, Poor_Account_Indicator, Account_Loss_Ratio, 
                      BR_Class_Code_Dominant_NAME, County_Pop_Density_Range
FROM         dbo.Builders_Risk_premium_summary
GROUP BY statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, 
                      Branch_Region, Business_Desc, Written_Premium_Range, Primary_Producer, Primary_Producer_type, program, First_Policy_Year, 
                      Class_Dwelling_Other_Than_Apts_AvgTermRate_Range, Class_Apartments_AvgTermRate_Range, BR_Constr_Code_Dominant_NAME, 
                      BR_Avg_Annual_TIV_Rate, BR_Avg_Annual_TIV_Rate_Range, BR_Avg_Term_BR_Rate, BR_Avg_Term_TIV_Rate_Range, BR_Number_of_Locations, 
                      BR_Deductible, BR_TIV_Exposure_Range, Account_Name, Poor_Account_Indicator, Account_Loss_Ratio, BR_Class_Code_Dominant_NAME, 
                      County_Pop_Density_Range
' 
GO
