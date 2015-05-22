IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ME_All_View1]'))
DROP VIEW [dbo].[ME_All_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ME_All_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.ME_All_View1
AS
SELECT     GL_Class_OutpatientClinics_AvgRate_Range, Fiscal_AY_Year, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      SUM(currentearnedpremium) AS currentearnedpremium, SUM(currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, Coverage_Group, 
                      Coverage_Reporting_group, Coverage_Form, Renewals_Range, New_Renew_Tail, Renew_New_Auto, Branch_Region, Business_Desc, 
                      Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, FA_Constr_Code_Dominant_NAME, 
                      First_Policy_Year, FA_Avg_Bld_Rate_Range, FA_Avg_Bld_Rate, GL_Class_BoardingHalfwayHouses_AvgRate_Range, 
                      GL_Class_Offices_AvgRate_Range, GL_Class_AlcoholDrug_AvgRate_Range, GL_Class_HomesForHandicapped_AvgRate_Range, 
                      GL_Class_PsychopathicInstitutions_AvgRate_Range, program, statecode, GL_Dom_Terr_description, GL_Dom_Region_in_State, SAM_Form, 
                      SAM_OCC_Limit, SAM_Agg_Limit, Endorsement_HS_009, accountnumber, Poor_Account_Indicator, Account_Name
FROM         dbo.mental_health_premium_summary
GROUP BY GL_Class_OutpatientClinics_AvgRate_Range, Fiscal_AY_Year, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Renewals_Range, 
                      New_Renew_Tail, Renew_New_Auto, Branch_Region, Business_Desc, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, 
                      Primary_Producer_type, FA_Constr_Code_Dominant_NAME, First_Policy_Year, FA_Avg_Bld_Rate_Range, FA_Avg_Bld_Rate, 
                      GL_Class_BoardingHalfwayHouses_AvgRate_Range, GL_Class_Offices_AvgRate_Range, GL_Class_AlcoholDrug_AvgRate_Range, 
                      GL_Class_HomesForHandicapped_AvgRate_Range, GL_Class_PsychopathicInstitutions_AvgRate_Range, program, statecode, 
                      GL_Dom_Terr_description, GL_Dom_Region_in_State, SAM_Form, SAM_OCC_Limit, SAM_Agg_Limit, Endorsement_HS_009, accountnumber, 
                      Poor_Account_Indicator, Account_Name
' 
GO
