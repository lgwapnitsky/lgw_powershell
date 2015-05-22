IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HF_All_View1]'))
DROP VIEW [dbo].[HF_All_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HF_All_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.HF_All_View1
AS
SELECT     statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, SUM(currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(currentearnedpremium) AS currentearnedpremium, Fiscal_AY_Year, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, Renewals_Range, New_Renew_Tail, 
                      Renew_New_Auto, Branch_Region, Business_Desc, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, 
                      Primary_Producer_type, FA_Constr_Code_Dominant_NAME, GL_Class_Health_Exercise_Club_AvgRate_Range, 
                      GL_Class_Swimming_Pools_AvgRate_Range, program, First_Policy_Year, FA_Avg_Bld_Rate_Range, FA_Avg_Bld_Rate, GL_Dom_Terr_description, 
                      Number_of_Swimming_Pools, Abuse_Molestation, Waiver, Athletic_Participants, Daycare, Independent_Contractors, Life_Safety_Requirements, 
                      Liquor_Liability, Martial_Arts, Tanning, Rental_Properties, Limits_ITV, Umbrella, Tennis_Courts, Tennis_Bubble, Number_of_Pools_Range, 
                      GL_Dom_Region_in_State, Underwriting_Planned_RateChange
FROM         dbo.HF_premium_summary
GROUP BY statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, 
                      Branch_Region, Business_Desc, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, 
                      FA_Constr_Code_Dominant_NAME, GL_Class_Health_Exercise_Club_AvgRate_Range, GL_Class_Swimming_Pools_AvgRate_Range, program, 
                      First_Policy_Year, FA_Avg_Bld_Rate_Range, FA_Avg_Bld_Rate, GL_Dom_Terr_description, Number_of_Swimming_Pools, Abuse_Molestation, 
                      Waiver, Athletic_Participants, Daycare, Independent_Contractors, Life_Safety_Requirements, Liquor_Liability, Martial_Arts, Tanning, 
                      Rental_Properties, Limits_ITV, Umbrella, Tennis_Courts, Tennis_Bubble, Number_of_Pools_Range, GL_Dom_Region_in_State, 
                      Underwriting_Planned_RateChange
' 
GO
