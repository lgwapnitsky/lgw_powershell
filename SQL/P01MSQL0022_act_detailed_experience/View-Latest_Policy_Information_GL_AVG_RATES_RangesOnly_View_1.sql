IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1]'))
DROP VIEW [dbo].[Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1
AS
SELECT     Policynumber, Amusement_Centers_Class_Group, Amusement_Centers_Avg_Rate_Range, Amusement_Parks_Class_Group, Amusement_Parks_Avg_Rate_Range, 
                      Apartments_Class_Group, Apartments_Avg_Rate_Range, Apartments_Garden_Class_Group, Apartments_Garden_Avg_Rate_Range, Apt_Outside_NY_Class_Group, 
                      Apt_Outside_NY_Avg_Rate_Range, Athletic_Programs_Class_Group, Athletic_Programs_Avg_Rate_Range, Bank_Office_FP_Class_Group, 
                      Bank_Office_FP_Avg_Rate_Range, Bank_Office_SelfMtd_FP_Class_Group, Bank_Office_SelfMtd_FP_Avg_Rate_Range, Boarding_Rooming_House_Class_Group, 
                      Boarding_Rooming_House_Avg_Rate_Range, Camps_Class_Group, Camps_Avg_Rate_Range, Camps_FP_Class_Group, Camps_FP_Avg_Rate_Range, 
                      Camps_NP_Class_Group, Camps_NP_Avg_Rate_Range, Churches_Class_Group, Churches_Avg_Rate_Range, Clubs_Class_Group, Clubs_Avg_Rate_Range, 
                      College_Class_Group, College_Avg_Rate_Range, College_FP_Class_Group, College_FP_Avg_Rate_Range, College_NP_Class_Group, College_NP_Avg_Rate_Range, 
                      Concessionaires_Class_Group, Concessionaires_Avg_Rate_Range, Condo_Association_Class_Group, Condo_Association_Avg_Rate_Range, 
                      Corp_Punishment_Class_Group, Corp_Punishment_Avg_Rate_Range, Day_Care_Class_Group, Day_Care_Avg_Rate_Range, Day_Care_FP_Class_Group, 
                      Day_Care_FP_Avg_Rate_Range, Day_Care_NP_Class_Group, Day_Care_NP_Avg_Rate_Range, Dormitories_Class_Group, Dormitories_Avg_Rate_Range, 
                      Dormitories_FP_Class_Group, Dormitories_FP_Avg_Rate_Range, Dormitories_NP_Class_Group, Dormitories_NP_Avg_Rate_Range, Driving_Range_Class_Group, 
                      Driving_Range_Avg_Rate_Range, Dwellings_Single_Fam_Class_Group, Dwellings_Single_Fam_Avg_Rate_Range, Exhibition_Bldgs_Class_Group, 
                      Exhibition_Bldgs_Avg_Rate_Range, Exhibitions_Class_Group, Exhibitions_Avg_Rate_Range, Golf_Municipal_Public_Class_Group, 
                      Golf_Municipal_Public_Avg_Rate_Range, Golf_Club_Country_Club_Class_Group, Golf_Club_Country_Club_Avg_Rate_Range, Guides_Outfitters_Class_Group, 
                      Guides_Outfitters_Avg_Rate_Range, HCF_AlcoholDrug_NP_Class_Group, HCF_AlcoholDrug_NP_Avg_Rate_Range, HCF_Homes_For_Aged_FP_Class_Group, 
                      HCF_Homes_For_Aged_FP_Avg_Rate_Range, HCF_Homes_For_Aged_NP_Class_Group, HCF_Homes_For_Aged_NP_Avg_Rate_Range, 
                      HCF_Phys_Handicap_FP_Class_Group, HCF_Phys_Handicap_FP_Avg_Rate_Range, HCF_Phys_Handicap_NP_Class_Group, 
                      HCF_Phys_Handicap_NP_Avg_Rate_Range, HCF_Psycopathic_NP_Class_Group, HCF_Psycopathic_NP_Avg_Rate_Range, Health_Exercise_Club_Class_Group, 
                      Health_Exercise_Club_Avg_Rate_Range, HomeHealthCare_Class_Group, HomeHealthCare_Avg_Rate_Range, HomeHealthCareNonSales_Class_Group, 
                      HomeHealthCareNonSales_Avg_Rate_Range, HomeHealthCareSales_Class_Group, HomeHealthCareSales_Avg_Rate_Range, Homeowner_Assoc_Class_Group, 
                      Homeowner_Assoc_Avg_Rate_Range, HT_w_PB_GE4_Class_Group, HT_w_PB_GE4_Avg_Rate_Range, HT_w_PB_LT4_Class_Group, 
                      HT_w_PB_LT4_Avg_Rate_Range, HT_wo_PB_GE4_Class_Group, HT_wo_PB_GE4_Avg_Rate_Range, HT_wo_PB_LT4_Class_Group, 
                      HT_wo_PB_LT4_Avg_Rate_Range, Hotels_Class_Group, Hotels_Avg_Rate_Range, Indoor_play_centers_Class_Group, Indoor_play_centers_Avg_Rate_Range, 
                      Janitorial_Services_Class_Group, Janitorial_Services_Avg_Rate_Range, Lakes_Resevoirs_Class_Group, Lakes_Resevoirs_Avg_Rate_Range, 
                      Miniature_Golf_Class_Group, Miniature_Golf_Avg_Rate_Range, Mobile_Home_Parks_Class_Group, Mobile_Home_Parks_Avg_Rate_Range, 
                      Offices_FP_Class_Group, Offices_FP_Avg_Rate_Range, Offices_NP_Class_Group, Offices_NP_Avg_Rate_Range, Outpatient_NP_Class_Group, 
                      Outpatient_NP_Avg_Rate_Range, Parks_Playgrounds_Class_Group, Parks_Playgrounds_Avg_Rate_Range, Private_HS_NP_Class_Group, 
                      Private_HS_NP_Avg_Rate_Range, Private_Parking_Class_Group, Private_Parking_Avg_Rate_Range, Private_Pre_HS_FP_Class_Group, 
                      Private_Pre_HS_FP_Avg_Rate_Range, Private_Pre_HS_NP_Class_Group, Private_Pre_HS_NP_Avg_Rate_Range, Private_Schools_Class_Group, 
                      Private_Schools_Avg_Rate_Range, Private_Schools_FP_Class_Group, Private_Schools_FP_Avg_Rate_Range, Public_Schools_Class_Group, 
                      Public_Schools_Avg_Rate_Range, Public_Schools_HS_Class_Group, Public_Schools_HS_Avg_Rate_Range, Public_Schools_Pre_HS_Class_Group, 
                      Public_Schools_Pre_HS_Avg_Rate_Range, Race_Tracks_Class_Group, Race_Tracks_Avg_Rate_Range, Sales_Service_Orgs_Class_Group, 
                      Sales_Service_Orgs_Avg_Rate_Range, Schools_FP_Class_Group, Schools_FP_Avg_Rate_Range, Schools_NP_Class_Group, Schools_NP_Avg_Rate_Range, 
                      Shelter_Mission_HlfwHouse_Class_Group, Shelter_Mission_HlfwHouse_Avg_Rate_Range, Skating_Rinks_Class_Group, Skating_Rinks_Avg_Rate_Range, 
                      Stadiums_Class_Group, Stadiums_Avg_Rate_Range, Swimming_Pools_Class_Group, Swimming_Pools_Avg_Rate_Range, Vocational_Schools_Class_Group, 
                      Vocational_Schools_Avg_Rate_Range, YMCA_YWCA_Class_Group, YMCA_YWCA_Avg_Rate_Range, Dormitories_NP_Avg_Rate_Range AS Expr1
FROM         dbo.Policy_Information_GL_AVG_RATES_June
' 
GO
