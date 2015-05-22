IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CA_All_View1]'))
DROP VIEW [dbo].[CA_All_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CA_All_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.CA_All_View1
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      SUM(currentearnedpremium) AS currentearnedpremium, SUM(currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, New_Renew_Tail, Renew_New_Auto, Written_Premium_Range, First_Policy_Year, Renewals_Range, 
                      GL_Class_CampsNonProfit_AvgRate_Range, GL_Class_CampsForProfit_AvgRate_Range, GL_Class_ParksPlaygrounds_AvgRate_Range, 
                      GL_Class_CampgroundsNonProfit_AvgRate_Range, statecode, program, Branch_Region, Primary_Producer_type, Primary_Producer, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat
FROM         dbo.CA_premium_summary
GROUP BY Coverage_Reporting_group, Fiscal_AY_Year, New_Renew_Tail, Renew_New_Auto, Written_Premium_Range, First_Policy_Year, Renewals_Range, 
                      GL_Class_CampsNonProfit_AvgRate_Range, GL_Class_CampsForProfit_AvgRate_Range, GL_Class_ParksPlaygrounds_AvgRate_Range, 
                      GL_Class_CampgroundsNonProfit_AvgRate_Range, statecode, program, Branch_Region, Primary_Producer_type, Primary_Producer
' 
GO
