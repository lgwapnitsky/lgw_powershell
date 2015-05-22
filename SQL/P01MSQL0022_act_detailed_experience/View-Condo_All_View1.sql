IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Condo_All_View1]'))
DROP VIEW [dbo].[Condo_All_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Condo_All_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Condo_All_View1
AS
SELECT     statecode, Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Reported_Claims) AS Reported_Claims,
                       SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Renewals_Range, 
                      New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, Business_Desc, Written_Premium_Range, County_Pop_Density_Range, 
                      Primary_Producer, Primary_Producer_type, GL_Class_ResidentialCondos_AvgRate_Range, GL_Class_Swimming_Pools_AvgRate_Range, 
                      GL_Class_Clubs_AvgRate_Range, program, GL_Class_Clubs_AvgRate_rd0, GL_Class_ResidentialCondos_AvgRate_rd0, FA_Avg_Bld_Rate_Range, 
                      FA_Constr_Code_Dominant_NAME, Coverage_Form, Coverage_Group, policynumber, Latest_PY, acctngyear, 
                      Number_of_Buildings_Greater_than_3_Stories_Range, Year_Roof_Updated_Range, Year_Built_Range, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly, 
                      SUM(Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly
FROM         dbo.Condo_premium_summary
GROUP BY statecode, Coverage_Reporting_group, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, 
                      Business_Desc, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, 
                      GL_Class_ResidentialCondos_AvgRate_Range, GL_Class_Swimming_Pools_AvgRate_Range, GL_Class_Clubs_AvgRate_Range, program, 
                      GL_Class_Clubs_AvgRate_rd0, GL_Class_ResidentialCondos_AvgRate_rd0, FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, 
                      Coverage_Form, Coverage_Group, policynumber, Latest_PY, acctngyear, Number_of_Buildings_Greater_than_3_Stories_Range, 
                      Year_Roof_Updated_Range, Year_Built_Range
' 
GO
