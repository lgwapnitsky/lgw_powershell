IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RL_All_View1]'))
DROP VIEW [dbo].[RL_All_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RL_All_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.RL_All_View1
AS
SELECT     statecode, Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, Business_Desc, 
                      Written_Premium_Range, Primary_Producer_type, Primary_Producer, program, Account_Name, GL_Territory_Dominant, 
                      GL_Territory_Dominant_percent, GL_Dom_Terr_description, GL_Dom_Region_in_State, Business_Grp, GL_Class_Churches_AvgRate_Range, 
                      GL_Class_Daycare_AvgRate_Range, GL_Class_School_AvgRate_Range, GL_Class_Dwellings_AvgRate_Range, GL_Class_Camp_AvgRate_Range, 
                      GL_Class_Offices_AvgRate_Range, Count_of_Account_Numbers_Range, Account_Active, Poor_Account_Indicator, accountnumber, Latest_PY, 
                      Account_Name_Display, ZIP_Pop_Density_Dominant
FROM         dbo.RL_premium_summary
GROUP BY statecode, Coverage_Reporting_group, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, 
                      Business_Desc, Written_Premium_Range, Primary_Producer_type, Primary_Producer, program, Account_Name, GL_Territory_Dominant, 
                      GL_Territory_Dominant_percent, GL_Dom_Terr_description, GL_Dom_Region_in_State, Business_Grp, GL_Class_Churches_AvgRate_Range, 
                      GL_Class_Daycare_AvgRate_Range, GL_Class_School_AvgRate_Range, GL_Class_Dwellings_AvgRate_Range, GL_Class_Camp_AvgRate_Range, 
                      GL_Class_Offices_AvgRate_Range, Count_of_Account_Numbers_Range, Account_Active, Poor_Account_Indicator, accountnumber, Latest_PY, 
                      Account_Name_Display, ZIP_Pop_Density_Dominant
' 
GO
