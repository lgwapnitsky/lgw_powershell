IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NP_All_View1]'))
DROP VIEW [dbo].[NP_All_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NP_All_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.NP_All_View1
AS
SELECT     Fiscal_AY_Year, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(currentearnedpremium) AS currentearnedpremium, 
                      SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Renewals_Range, New_Renew_Tail, Renew_New_Auto, 
                      Branch_Region, Business_Desc, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, 
                      First_Policy_Year, program, statecode, GL_Dom_Terr_description, GL_Dom_Region_in_State, Latest_Product, Camps_YN, Workshops_YN, 
                      Homeless_Shelters_YN, Independent_Contractors_YN, Drug_Alcohol_Centers_YN, Abuse_Molestation_YN, Foster_Care_YN, Group_Homes_YN, 
                      Volunteers_YN, DayCare_Ops_YN, Women_Shelters_YN, Headstart_YN, Dorms_YN, Adoption_YN, Life_Safety_Requirements_YN, 
                      Mentally_Ill_Impaired_Clients_YN, Pool_YN, Physicians_On_Staff_YN, Companycode, Account_Name, Account_Loss_Ratio, Poor_Account_Indicator, 
                      Latest_PY, GL_Class_NP_HCFac_AvgRate_Range, GL_Class_NP_Outpatient_AvgRate_Range, GL_Class_NP_Office_AvgRate_Range, 
                      Endorsement_FA_Elite, Account_Latest_PY, SAM_Form, SAM_OCC_Limit, SAM_Agg_Limit, Endorsement_FA_Elite_YN, accountnumber, 
                      GL_Class_NP_YMCA_YWCA_AvgRate_Range, GL_Class_NP_Boarding_Rooming_Houses_AvgRate_Range, 
                      GL_Class_NP_Shelter_Mission_HalfwayHouse_AvgRate_Range
FROM         dbo.Non_Profit_premium_summary
GROUP BY Fiscal_AY_Year, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Renewals_Range, New_Renew_Tail, Renew_New_Auto, 
                      Branch_Region, Business_Desc, Written_Premium_Range, County_Pop_Density_Range, Primary_Producer, Primary_Producer_type, 
                      First_Policy_Year, program, statecode, GL_Dom_Terr_description, GL_Dom_Region_in_State, Latest_Product, Camps_YN, Workshops_YN, 
                      Homeless_Shelters_YN, Independent_Contractors_YN, Drug_Alcohol_Centers_YN, Abuse_Molestation_YN, Foster_Care_YN, Group_Homes_YN, 
                      Volunteers_YN, DayCare_Ops_YN, Women_Shelters_YN, Headstart_YN, Dorms_YN, Adoption_YN, Life_Safety_Requirements_YN, 
                      Mentally_Ill_Impaired_Clients_YN, Pool_YN, Physicians_On_Staff_YN, Companycode, Account_Name, Account_Loss_Ratio, Poor_Account_Indicator, 
                      Latest_PY, GL_Class_NP_HCFac_AvgRate_Range, GL_Class_NP_Outpatient_AvgRate_Range, GL_Class_NP_Office_AvgRate_Range, 
                      Endorsement_FA_Elite, Account_Latest_PY, SAM_Form, SAM_OCC_Limit, SAM_Agg_Limit, Endorsement_FA_Elite_YN, accountnumber, 
                      GL_Class_NP_YMCA_YWCA_AvgRate_Range, GL_Class_NP_Boarding_Rooming_Houses_AvgRate_Range, 
                      GL_Class_NP_Shelter_Mission_HalfwayHouse_AvgRate_Range
' 
GO
