IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DY_All_View1]'))
DROP VIEW [dbo].[DY_All_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DY_All_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.DY_All_View1
AS
SELECT     statecode, Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, Business_Desc, 
                      Written_Premium_Range, Primary_Producer_type, Primary_Producer, program, Account_Name, GL_Class_DC_For_Profit_AvgRate_Range, 
                      GL_Class_DC_NonProfit_AvgRate_Range, GL_Class_Parks_Playgrounds_AvgRate_Range, GL_Class_Swimming_Pools_AvgRate_Range, 
                      GL_Class_Corp_Punishment_AvgRate_Range, GL_Territory_Dominant, GL_Territory_Dominant_percent, GL_Dom_Terr_description, 
                      GL_Dom_Region_in_State, GL_Class_Camps_For_Profit_AvgRate_Range, GL_Class_Camps_NonProfit_AvgRate_Range, 
                      GL_Class_Private_Schools_For_Profit_AvgRate_Range, GL_Class_Private_Schools_NonProfit_AvgRate_Range, Business_Grp, 
                      Account_Name_Display, Account_Active, accountnumber, Commission_pct, Commission_dollars, Commission_Premiums, 
                      Count_of_Account_Numbers_Range, Poor_Account_Indicator, Dominant_Population_Density_Policywide
FROM         dbo.DY_premium_summary
GROUP BY statecode, Coverage_Reporting_group, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, 
                      Business_Desc, Written_Premium_Range, Primary_Producer_type, Primary_Producer, program, Account_Name, 
                      GL_Class_DC_For_Profit_AvgRate_Range, GL_Class_DC_NonProfit_AvgRate_Range, GL_Class_Parks_Playgrounds_AvgRate_Range, 
                      GL_Class_Swimming_Pools_AvgRate_Range, GL_Class_Corp_Punishment_AvgRate_Range, GL_Territory_Dominant, GL_Territory_Dominant_percent, 
                      GL_Dom_Terr_description, GL_Dom_Region_in_State, GL_Class_Camps_For_Profit_AvgRate_Range, GL_Class_Camps_NonProfit_AvgRate_Range, 
                      GL_Class_Private_Schools_For_Profit_AvgRate_Range, GL_Class_Private_Schools_NonProfit_AvgRate_Range, Business_Grp, 
                      Account_Name_Display, Account_Active, accountnumber, Commission_pct, Commission_dollars, Commission_Premiums, 
                      Count_of_Account_Numbers_Range, Poor_Account_Indicator, Dominant_Population_Density_Policywide
' 
GO
