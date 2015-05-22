IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AH_ALL_View_1]'))
DROP VIEW [dbo].[AH_ALL_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AH_ALL_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.AH_ALL_View_1
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renewals_Range, New_Renew_Tail, Renew_New_Auto, Coverage_Group, Written_Premium_Range, First_Policy_Year, 
                      FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, statecode, Coverage_Form, program, Branch_Region, Primary_Producer_type, 
                      Primary_Producer, acctngyear, GL_Class_Apartments_Garden_AvgRate_Range, GL_Class_Apartments_AvgRate_Range, 
                      SUM(Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, Companycode
FROM         dbo.AH_premium_summary
GROUP BY Coverage_Reporting_group, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, Coverage_Group, Written_Premium_Range, 
                      First_Policy_Year, FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, statecode, Coverage_Form, program, Branch_Region, 
                      Primary_Producer_type, Primary_Producer, acctngyear, GL_Class_Apartments_Garden_AvgRate_Range, GL_Class_Apartments_AvgRate_Range, 
                      Companycode
' 
GO
