IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Builders_Risk_View_2]'))
DROP VIEW [dbo].[Builders_Risk_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Builders_Risk_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Builders_Risk_View_2
AS
SELECT     statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, 
                      First_Policy_Year, Business_Desc, program, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, 
                      BR_Number_of_Locations, BR_Deductible, BR_TIV_Exposure_Range, BR_Avg_Annual_TIV_Rate, BR_Avg_Term_BR_Rate, BR_Avg_Annual_TIV_Rate_Range, 
                      BR_Avg_Term_TIV_Rate_Range, Poor_Account_Indicator, Account_Loss_Ratio, Account_Name, Class_Dwelling_Other_Than_Apts_AvgTermRate_Range, 
                      Class_Apartments_AvgTermRate_Range, currentwrittenpremium, currentearnedpremium, Incurred_Loss_ALAE_with_SS_NonCat, Policy_count_All_Cov_Combined, 
                      Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      Reported_Claims, Branch_Region, Open_Claims, Closed_With_Pay_Claims, BR_TIV_Exposure, BR_TIV_Prem, Class_Code_370_Exposure, 
                      Class_Code_371_Exposure, Class_Code_372_Exposure, Class_Code_373_Exposure, Class_Code_374_Exposure, Class_Code_375_Exposure, 
                      Class_Code_379_Exposure, Constr_Code_1_Exposure, Constr_Code_2_Exposure, Constr_Code_3_Exposure, Constr_Code_4_Exposure, Constr_Code_5_Exposure, 
                      Constr_Code_6_Exposure, BR_Class_Code_Dominant_NAME
FROM         dbo.Builders_Risk_premium_summary
' 
GO
