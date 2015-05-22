IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FP_All_View1]'))
DROP VIEW [dbo].[FP_All_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FP_All_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.FP_All_View1
AS
SELECT     accountnumber, statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, SUM(currentwrittenpremium) 
                      AS currentwrittenpremium, SUM(currentearnedpremium) AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) 
                      AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renewals_Range, Companycode, New_Renew_Tail, Renew_New_Auto, Latest_PY, First_Policy_Year, Branch_Region, program, 
                      Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, Count_of_Account_Numbers_Range, 
                      Business_Desc, SAM_Form, SAM_OCC_Limit, SAM_Agg_Limit, FA_Avg_Bld_Rate, FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, 
                      GL_Class_FP_Boarding_Rooming_House_AvgRate_Range, GL_Class_FP_Health_Care_Facility_AvgRate_Range, 
                      GL_Class_FP_Office_AvgRate_Range, GL_Class_FP_Sales_Service_Orgs_AvgRate_Range, GL_Class_FP_Schools_AvgRate_Range, Account_Name, 
                      Poor_Account_Indicator, GL_Dom_Terr_description, GL_Dom_Region_in_State, Hired_Exposure_YN, Life_Safety_Requirements_YN, 
                      Non_Owned_Exposure_YN, Foster_Care_YN, Limits_ITV_YN, Fleet_Size, Umbrella_YN, Tall_Buildings_Num, Num_of_Locations, 
                      Tall_Buildings_Range, Locations_Range, Fleet_Size_Range, Business_Grp
FROM         dbo.FP_premium_summary
GROUP BY accountnumber, statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, Renewals_Range, Companycode, 
                      New_Renew_Tail, Renew_New_Auto, Latest_PY, First_Policy_Year, Branch_Region, program, Written_Premium_Range, County_Pop_Density_Range, 
                      Primary_Producer, Primary_Producer_type, Count_of_Account_Numbers_Range, Business_Desc, SAM_Form, SAM_OCC_Limit, SAM_Agg_Limit, 
                      FA_Avg_Bld_Rate, FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, GL_Class_FP_Boarding_Rooming_House_AvgRate_Range, 
                      GL_Class_FP_Health_Care_Facility_AvgRate_Range, GL_Class_FP_Office_AvgRate_Range, GL_Class_FP_Sales_Service_Orgs_AvgRate_Range, 
                      GL_Class_FP_Schools_AvgRate_Range, Account_Name, Poor_Account_Indicator, GL_Dom_Terr_description, GL_Dom_Region_in_State, 
                      Hired_Exposure_YN, Life_Safety_Requirements_YN, Non_Owned_Exposure_YN, Foster_Care_YN, Limits_ITV_YN, Fleet_Size, Umbrella_YN, 
                      Tall_Buildings_Num, Num_of_Locations, Tall_Buildings_Range, Locations_Range, Fleet_Size_Range, Business_Grp
' 
GO
