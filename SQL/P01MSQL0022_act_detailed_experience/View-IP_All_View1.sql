IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[IP_All_View1]'))
DROP VIEW [dbo].[IP_All_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[IP_All_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.IP_All_View1
AS
SELECT     accountnumber, statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, SUM(currentwrittenpremium) 
                      AS currentwrittenpremium, SUM(currentearnedpremium) AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) 
                      AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renewals_Range, Companycode, New_Renew_Tail, Renew_New_Auto, Latest_PY, First_Policy_Year, Branch_Region, 
                      Business_Desc, program, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, 
                      Count_of_Account_Numbers_Range, FA_Avg_Bld_Rate, FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, 
                      GL_Class_Athletic_Programs_AvgRate_Range, GL_Class_Exhibitions_AvgRate_Range, GL_Class_Skating_Rinks_AvgRate_Range, 
                      GL_Class_Stadiums_AvgRate_Range, GL_Class_Camps_AvgRate_Range, GL_Dom_Terr_description, Athletic_Participants_YN, Pool_YN, Pool_Num, 
                      Camps_YN, Special_Events_YN, Hired_Exposure_YN, Non_Owned_Exposure_YN, Life_Safety_Requirements_YN, Umbrella_YN, Limits_ITV_YN, 
                      Liquor_Liability_YN, Ice_Arenas_YN, Stadiums_YN, Tennis_Courts_YN, Pool_Num_Range, GL_Dom_Region_in_State
FROM         dbo.IP_premium_summary
GROUP BY accountnumber, statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, Renewals_Range, Companycode, 
                      New_Renew_Tail, Renew_New_Auto, Latest_PY, First_Policy_Year, Branch_Region, Business_Desc, program, Written_Premium_Range, 
                      County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, Count_of_Account_Numbers_Range, FA_Avg_Bld_Rate, 
                      FA_Avg_Bld_Rate_Range, FA_Constr_Code_Dominant_NAME, GL_Class_Athletic_Programs_AvgRate_Range, GL_Class_Exhibitions_AvgRate_Range, 
                      GL_Class_Skating_Rinks_AvgRate_Range, GL_Class_Stadiums_AvgRate_Range, GL_Class_Camps_AvgRate_Range, GL_Dom_Terr_description, 
                      Athletic_Participants_YN, Pool_YN, Pool_Num, Camps_YN, Special_Events_YN, Hired_Exposure_YN, Non_Owned_Exposure_YN, 
                      Life_Safety_Requirements_YN, Umbrella_YN, Limits_ITV_YN, Liquor_Liability_YN, Ice_Arenas_YN, Stadiums_YN, Tennis_Courts_YN, 
                      Pool_Num_Range, GL_Dom_Region_in_State
' 
GO
