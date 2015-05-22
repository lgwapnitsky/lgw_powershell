IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NP_GL_View_for_Modeling_1]'))
DROP VIEW [dbo].[NP_GL_View_for_Modeling_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NP_GL_View_for_Modeling_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.NP_GL_View_for_Modeling_1
AS
SELECT     SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, SUM(currentearnedpremium) AS currentearnedpremium, 
                      SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, New_Renew_Tail, Renewals_Range, Renew_New_Auto, GL_Deductible, GL_Occurrence_Limit, Written_Premium_Range, 
                      Coverage_Reporting_group, GLDX_Indicator, GL_Class_NP_HCFac_AvgRate_Range, GL_Class_NP_Outpatient_AvgRate_Range, 
                      GL_Class_NP_Office_AvgRate_Range, SAM_Form, SAM_OCC_Limit, GL_Aggregate_Limit, Latest_Product, GL_Dom_Region_in_State, 
                      GL_Class_NP_YMCA_YWCA_AvgRate_Range, GL_Class_NP_Boarding_Rooming_Houses_AvgRate_Range, 
                      GL_Class_NP_Shelter_Mission_HalfwayHouse_AvgRate_Range, Price_Monitor_Standard_CovGrp_GL_Monitored_range, Number_of_Renewals, 
                      Companycode, billplancode, BillplanshortDesc, Primary_Producer_type, Count_of_Account_Numbers_Range, Pool_YN, 
                      Mentally_Ill_Impaired_Clients_YN, Life_Safety_Requirements_YN, Adoption_YN, Dorms_YN, Headstart_YN, Women_Shelters_YN, DayCare_Ops_YN, 
                      Volunteers_YN, Group_Homes_YN, Foster_Care_YN, Locations_Num, Workshops_YN, Camps_YN, Homeless_Shelters_YN, 
                      Independent_Contractors_YN, Physicians_On_Staff_YN, Drug_Alcohol_Centers_YN
FROM         dbo.Non_Profit_premium_summary
GROUP BY New_Renew_Tail, Renewals_Range, Renew_New_Auto, GL_Deductible, GL_Occurrence_Limit, Written_Premium_Range, Coverage_Reporting_group, 
                      GLDX_Indicator, GL_Class_NP_HCFac_AvgRate_Range, GL_Class_NP_Outpatient_AvgRate_Range, GL_Class_NP_Office_AvgRate_Range, 
                      SAM_Form, SAM_OCC_Limit, GL_Aggregate_Limit, Latest_Product, GL_Dom_Region_in_State, GL_Class_NP_YMCA_YWCA_AvgRate_Range, 
                      GL_Class_NP_Boarding_Rooming_Houses_AvgRate_Range, GL_Class_NP_Shelter_Mission_HalfwayHouse_AvgRate_Range, 
                      Price_Monitor_Standard_CovGrp_GL_Monitored_range, Number_of_Renewals, Companycode, billplancode, BillplanshortDesc, 
                      Primary_Producer_type, Count_of_Account_Numbers_Range, Pool_YN, Mentally_Ill_Impaired_Clients_YN, Life_Safety_Requirements_YN, 
                      Adoption_YN, Dorms_YN, Headstart_YN, Women_Shelters_YN, DayCare_Ops_YN, Volunteers_YN, Group_Homes_YN, Foster_Care_YN, 
                      Locations_Num, Workshops_YN, Camps_YN, Homeless_Shelters_YN, Independent_Contractors_YN, Physicians_On_Staff_YN, 
                      Drug_Alcohol_Centers_YN
' 
GO
