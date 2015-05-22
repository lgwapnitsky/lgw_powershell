IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AH_ALL_Account_View_1]'))
DROP VIEW [dbo].[AH_ALL_Account_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AH_ALL_Account_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.AH_ALL_Account_View_1
AS
SELECT     accountnumber, Poor_Account_Indicator, Fiscal_AY_Year, Coverage_Reporting_group, Count_of_Account_Numbers_Range, Primary_Producer, 
                      SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) 
                      AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Reported_Claims) AS Reported_Claims,
                       Account_Name, FA_Avg_Bld_Rate, policyeffectivedate, policyexpirationdate, policynumber, FA_Constr_Code_Dominant_NAME, Companycode
FROM         dbo.AH_premium_summary
GROUP BY accountnumber, Poor_Account_Indicator, Fiscal_AY_Year, Coverage_Reporting_group, Count_of_Account_Numbers_Range, Primary_Producer, 
                      Account_Name, FA_Avg_Bld_Rate, policyeffectivedate, policyexpirationdate, policynumber, FA_Constr_Code_Dominant_NAME, Companycode
' 
GO
