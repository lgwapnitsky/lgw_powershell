IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NH_ALL_View_1]'))
DROP VIEW [dbo].[NH_ALL_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NH_ALL_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.NH_ALL_View_1
AS
SELECT     accountnumber, statecode, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(currentearnedpremium) AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, Renewals_Range, New_Renew_Tail, 
                      Renew_New_Auto, First_Policy_Year, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, 
                      Branch_Region, program, Poor_Account_Indicator, Count_of_Account_Numbers_Range
FROM         dbo.NH_premium_summary
GROUP BY accountnumber, statecode, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, 
                      First_Policy_Year, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, Branch_Region, program, 
                      Poor_Account_Indicator, Count_of_Account_Numbers_Range
' 
GO
