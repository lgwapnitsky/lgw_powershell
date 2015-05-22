IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PR_All_View_1]'))
DROP VIEW [dbo].[PR_All_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PR_All_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PR_All_View_1
AS
SELECT     statecode, Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Reported_Claims) AS Reported_Claims,
                       SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Renewals_Range, 
                      New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, Business_Desc, Written_Premium_Range, County_Pop_Density_Range, 
                      Primary_Producer, Primary_Producer_type, GL_Class_Health_Exercise_Clubs_AvgRate_Range, 
                      GL_Class_Childrens_Playcenter_Indoor_AvgRate_Range, GL_Class_Gas_Stations_Self_Service_AvgRate_Range, program, FA_Avg_Bld_Rate_Range, 
                      FA_Constr_Code_Dominant_NAME, Coverage_Form, Coverage_Group, policynumber, Latest_PY, acctngyear, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly, 
                      SUM(Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly
FROM         dbo.PR_premium_summary
GROUP BY statecode, Coverage_Reporting_group, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, 
                      Business_Desc, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, 
                      GL_Class_Health_Exercise_Clubs_AvgRate_Range, GL_Class_Childrens_Playcenter_Indoor_AvgRate_Range, 
                      GL_Class_Gas_Stations_Self_Service_AvgRate_Range, program, FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, Coverage_Form, 
                      Coverage_Group, policynumber, Latest_PY, acctngyear
' 
GO
