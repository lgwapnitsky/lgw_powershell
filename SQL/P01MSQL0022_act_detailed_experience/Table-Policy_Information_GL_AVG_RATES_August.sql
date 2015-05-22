IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_GL_AVG_RATES_August]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_GL_AVG_RATES_August]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_GL_AVG_RATES_August]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_GL_AVG_RATES_August](
	[Policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Amusement_Centers_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Amusement_Centers_Premium] [float] NULL,
	[Amusement_Centers_Exposure] [float] NULL,
	[Amusement_Centers_Exposure_Adj] [float] NULL,
	[Amusement_Centers_Avg_Rate] [float] NULL,
	[Amusement_Centers_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Amusement_Parks_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Amusement_Parks_Premium] [float] NULL,
	[Amusement_Parks_Exposure] [float] NULL,
	[Amusement_Parks_Exposure_Adj] [float] NULL,
	[Amusement_Parks_Avg_Rate] [float] NULL,
	[Amusement_Parks_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Apartments_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Apartments_Premium] [float] NULL,
	[Apartments_Exposure] [float] NULL,
	[Apartments_Exposure_Adj] [float] NULL,
	[Apartments_Avg_Rate] [float] NULL,
	[Apartments_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Apartments_Garden_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Apartments_Garden_Premium] [float] NULL,
	[Apartments_Garden_Exposure] [float] NULL,
	[Apartments_Garden_Exposure_Adj] [float] NULL,
	[Apartments_Garden_Avg_Rate] [float] NULL,
	[Apartments_Garden_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Apt_Outside_NY_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Apt_Outside_NY_Premium] [float] NULL,
	[Apt_Outside_NY_Exposure] [float] NULL,
	[Apt_Outside_NY_Exposure_Adj] [float] NULL,
	[Apt_Outside_NY_Avg_Rate] [float] NULL,
	[Apt_Outside_NY_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Athletic_Programs_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Athletic_Programs_Premium] [float] NULL,
	[Athletic_Programs_Exposure] [float] NULL,
	[Athletic_Programs_Exposure_Adj] [float] NULL,
	[Athletic_Programs_Avg_Rate] [float] NULL,
	[Athletic_Programs_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bank_Office_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bank_Office_FP_Premium] [float] NULL,
	[Bank_Office_FP_Exposure] [float] NULL,
	[Bank_Office_FP_Exposure_Adj] [float] NULL,
	[Bank_Office_FP_Avg_Rate] [float] NULL,
	[Bank_Office_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bank_Office_SelfMtd_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bank_Office_SelfMtd_FP_Premium] [float] NULL,
	[Bank_Office_SelfMtd_FP_Exposure] [float] NULL,
	[Bank_Office_SelfMtd_FP_Exposure_Adj] [float] NULL,
	[Bank_Office_SelfMtd_FP_Avg_Rate] [float] NULL,
	[Bank_Office_SelfMtd_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Boarding_Rooming_House_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Boarding_Rooming_House_Premium] [float] NULL,
	[Boarding_Rooming_House_Exposure] [float] NULL,
	[Boarding_Rooming_House_Exposure_Adj] [float] NULL,
	[Boarding_Rooming_House_Avg_Rate] [float] NULL,
	[Boarding_Rooming_House_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Camps_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Camps_Premium] [float] NULL,
	[Camps_Exposure] [float] NULL,
	[Camps_Exposure_Adj] [float] NULL,
	[Camps_Avg_Rate] [float] NULL,
	[Camps_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Camps_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Camps_FP_Premium] [float] NULL,
	[Camps_FP_Exposure] [float] NULL,
	[Camps_FP_Exposure_Adj] [float] NULL,
	[Camps_FP_Avg_Rate] [float] NULL,
	[Camps_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Camps_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Camps_NP_Premium] [float] NULL,
	[Camps_NP_Exposure] [float] NULL,
	[Camps_NP_Exposure_Adj] [float] NULL,
	[Camps_NP_Avg_Rate] [float] NULL,
	[Camps_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Churches_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Churches_Premium] [float] NULL,
	[Churches_Exposure] [float] NULL,
	[Churches_Exposure_Adj] [float] NULL,
	[Churches_Avg_Rate] [float] NULL,
	[Churches_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Clubs_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Clubs_Premium] [float] NULL,
	[Clubs_Exposure] [float] NULL,
	[Clubs_Exposure_Adj] [float] NULL,
	[Clubs_Avg_Rate] [float] NULL,
	[Clubs_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[College_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[College_Premium] [float] NULL,
	[College_Exposure] [float] NULL,
	[College_Exposure_Adj] [float] NULL,
	[College_Avg_Rate] [float] NULL,
	[College_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[College_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[College_FP_Premium] [float] NULL,
	[College_FP_Exposure] [float] NULL,
	[College_FP_Exposure_Adj] [float] NULL,
	[College_FP_Avg_Rate] [float] NULL,
	[College_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[College_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[College_NP_Premium] [float] NULL,
	[College_NP_Exposure] [float] NULL,
	[College_NP_Exposure_Adj] [float] NULL,
	[College_NP_Avg_Rate] [float] NULL,
	[College_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Concessionaires_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Concessionaires_Premium] [float] NULL,
	[Concessionaires_Exposure] [float] NULL,
	[Concessionaires_Exposure_Adj] [float] NULL,
	[Concessionaires_Avg_Rate] [float] NULL,
	[Concessionaires_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Condo_Association_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Condo_Association_Premium] [float] NULL,
	[Condo_Association_Exposure] [float] NULL,
	[Condo_Association_Exposure_Adj] [float] NULL,
	[Condo_Association_Avg_Rate] [float] NULL,
	[Condo_Association_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Corp_Punishment_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Corp_Punishment_Premium] [float] NULL,
	[Corp_Punishment_Exposure] [float] NULL,
	[Corp_Punishment_Exposure_Adj] [float] NULL,
	[Corp_Punishment_Avg_Rate] [float] NULL,
	[Corp_Punishment_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_Care_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_Care_Premium] [float] NULL,
	[Day_Care_Exposure] [float] NULL,
	[Day_Care_Exposure_Adj] [float] NULL,
	[Day_Care_Avg_Rate] [float] NULL,
	[Day_Care_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_Care_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_Care_FP_Premium] [float] NULL,
	[Day_Care_FP_Exposure] [float] NULL,
	[Day_Care_FP_Exposure_Adj] [float] NULL,
	[Day_Care_FP_Avg_Rate] [float] NULL,
	[Day_Care_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_Care_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_Care_NP_Premium] [float] NULL,
	[Day_Care_NP_Exposure] [float] NULL,
	[Day_Care_NP_Exposure_Adj] [float] NULL,
	[Day_Care_NP_Avg_Rate] [float] NULL,
	[Day_Care_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dormitories_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dormitories_Premium] [float] NULL,
	[Dormitories_Exposure] [float] NULL,
	[Dormitories_Exposure_Adj] [float] NULL,
	[Dormitories_Avg_Rate] [float] NULL,
	[Dormitories_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dormitories_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dormitories_FP_Premium] [float] NULL,
	[Dormitories_FP_Exposure] [float] NULL,
	[Dormitories_FP_Exposure_Adj] [float] NULL,
	[Dormitories_FP_Avg_Rate] [float] NULL,
	[Dormitories_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dormitories_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dormitories_NP_Premium] [float] NULL,
	[Dormitories_NP_Exposure] [float] NULL,
	[Dormitories_NP_Exposure_Adj] [float] NULL,
	[Dormitories_NP_Avg_Rate] [float] NULL,
	[Dormitories_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Driving_Range_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Driving_Range_Premium] [float] NULL,
	[Driving_Range_Exposure] [float] NULL,
	[Driving_Range_Exposure_Adj] [float] NULL,
	[Driving_Range_Avg_Rate] [float] NULL,
	[Driving_Range_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dwellings_Single_Fam_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dwellings_Single_Fam_Premium] [float] NULL,
	[Dwellings_Single_Fam_Exposure] [float] NULL,
	[Dwellings_Single_Fam_Exposure_Adj] [float] NULL,
	[Dwellings_Single_Fam_Avg_Rate] [float] NULL,
	[Dwellings_Single_Fam_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exhibition_Bldgs_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exhibition_Bldgs_Premium] [float] NULL,
	[Exhibition_Bldgs_Exposure] [float] NULL,
	[Exhibition_Bldgs_Exposure_Adj] [float] NULL,
	[Exhibition_Bldgs_Avg_Rate] [float] NULL,
	[Exhibition_Bldgs_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exhibitions_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exhibitions_Premium] [float] NULL,
	[Exhibitions_Exposure] [float] NULL,
	[Exhibitions_Exposure_Adj] [float] NULL,
	[Exhibitions_Avg_Rate] [float] NULL,
	[Exhibitions_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Golf_Municipal_Public_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Golf_Municipal_Public_Premium] [float] NULL,
	[Golf_Municipal_Public_Exposure] [float] NULL,
	[Golf_Municipal_Public_Exposure_Adj] [float] NULL,
	[Golf_Municipal_Public_Avg_Rate] [float] NULL,
	[Golf_Municipal_Public_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Golf_Club_Country_Club_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Golf_Club_Country_Club_Premium] [float] NULL,
	[Golf_Club_Country_Club_Exposure] [float] NULL,
	[Golf_Club_Country_Club_Exposure_Adj] [float] NULL,
	[Golf_Club_Country_Club_Avg_Rate] [float] NULL,
	[Golf_Club_Country_Club_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Guides_Outfitters_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Guides_Outfitters_Premium] [float] NULL,
	[Guides_Outfitters_Exposure] [float] NULL,
	[Guides_Outfitters_Exposure_Adj] [float] NULL,
	[Guides_Outfitters_Avg_Rate] [float] NULL,
	[Guides_Outfitters_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_AlcoholDrug_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_AlcoholDrug_NP_Premium] [float] NULL,
	[HCF_AlcoholDrug_NP_Exposure] [float] NULL,
	[HCF_AlcoholDrug_NP_Exposure_Adj] [float] NULL,
	[HCF_AlcoholDrug_NP_Avg_Rate] [float] NULL,
	[HCF_AlcoholDrug_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_Homes_For_Aged_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_Homes_For_Aged_FP_Premium] [float] NULL,
	[HCF_Homes_For_Aged_FP_Exposure] [float] NULL,
	[HCF_Homes_For_Aged_FP_Exposure_Adj] [float] NULL,
	[HCF_Homes_For_Aged_FP_Avg_Rate] [float] NULL,
	[HCF_Homes_For_Aged_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_Homes_For_Aged_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_Homes_For_Aged_NP_Premium] [float] NULL,
	[HCF_Homes_For_Aged_NP_Exposure] [float] NULL,
	[HCF_Homes_For_Aged_NP_Exposure_Adj] [float] NULL,
	[HCF_Homes_For_Aged_NP_Avg_Rate] [float] NULL,
	[HCF_Homes_For_Aged_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_Phys_Handicap_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_Phys_Handicap_FP_Premium] [float] NULL,
	[HCF_Phys_Handicap_FP_Exposure] [float] NULL,
	[HCF_Phys_Handicap_FP_Exposure_Adj] [float] NULL,
	[HCF_Phys_Handicap_FP_Avg_Rate] [float] NULL,
	[HCF_Phys_Handicap_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_Phys_Handicap_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_Phys_Handicap_NP_Premium] [float] NULL,
	[HCF_Phys_Handicap_NP_Exposure] [float] NULL,
	[HCF_Phys_Handicap_NP_Exposure_Adj] [float] NULL,
	[HCF_Phys_Handicap_NP_Avg_Rate] [float] NULL,
	[HCF_Phys_Handicap_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_Psycopathic_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HCF_Psycopathic_NP_Premium] [float] NULL,
	[HCF_Psycopathic_NP_Exposure] [float] NULL,
	[HCF_Psycopathic_NP_Exposure_Adj] [float] NULL,
	[HCF_Psycopathic_NP_Avg_Rate] [float] NULL,
	[HCF_Psycopathic_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Health_Exercise_Club_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Health_Exercise_Club_Premium] [float] NULL,
	[Health_Exercise_Club_Exposure] [float] NULL,
	[Health_Exercise_Club_Exposure_Adj] [float] NULL,
	[Health_Exercise_Club_Avg_Rate] [float] NULL,
	[Health_Exercise_Club_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HomeHealthCare_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HomeHealthCare_Premium] [float] NULL,
	[HomeHealthCare_Exposure] [float] NULL,
	[HomeHealthCare_Exposure_Adj] [float] NULL,
	[HomeHealthCare_Avg_Rate] [float] NULL,
	[HomeHealthCare_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HomeHealthCareNonSales_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HomeHealthCareNonSales_Premium] [float] NULL,
	[HomeHealthCareNonSales_Exposure] [float] NULL,
	[HomeHealthCareNonSales_Exposure_Adj] [float] NULL,
	[HomeHealthCareNonSales_Avg_Rate] [float] NULL,
	[HomeHealthCareNonSales_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HomeHealthCareSales_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HomeHealthCareSales_Premium] [float] NULL,
	[HomeHealthCareSales_Exposure] [float] NULL,
	[HomeHealthCareSales_Exposure_Adj] [float] NULL,
	[HomeHealthCareSales_Avg_Rate] [float] NULL,
	[HomeHealthCareSales_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Homeowner_Assoc_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Homeowner_Assoc_Premium] [float] NULL,
	[Homeowner_Assoc_Exposure] [float] NULL,
	[Homeowner_Assoc_Exposure_Adj] [float] NULL,
	[Homeowner_Assoc_Avg_Rate] [float] NULL,
	[Homeowner_Assoc_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HT_w_PB_GE4_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HT_w_PB_GE4_Premium] [float] NULL,
	[HT_w_PB_GE4_Exposure] [float] NULL,
	[HT_w_PB_GE4_Exposure_Adj] [float] NULL,
	[HT_w_PB_GE4_Avg_Rate] [float] NULL,
	[HT_w_PB_GE4_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HT_w_PB_LT4_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HT_w_PB_LT4_Premium] [float] NULL,
	[HT_w_PB_LT4_Exposure] [float] NULL,
	[HT_w_PB_LT4_Exposure_Adj] [float] NULL,
	[HT_w_PB_LT4_Avg_Rate] [float] NULL,
	[HT_w_PB_LT4_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HT_wo_PB_GE4_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HT_wo_PB_GE4_Premium] [float] NULL,
	[HT_wo_PB_GE4_Exposure] [float] NULL,
	[HT_wo_PB_GE4_Exposure_Adj] [float] NULL,
	[HT_wo_PB_GE4_Avg_Rate] [float] NULL,
	[HT_wo_PB_GE4_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HT_wo_PB_LT4_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HT_wo_PB_LT4_Premium] [float] NULL,
	[HT_wo_PB_LT4_Exposure] [float] NULL,
	[HT_wo_PB_LT4_Exposure_Adj] [float] NULL,
	[HT_wo_PB_LT4_Avg_Rate] [float] NULL,
	[HT_wo_PB_LT4_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Hotels_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Hotels_Premium] [float] NULL,
	[Hotels_Exposure] [float] NULL,
	[Hotels_Exposure_Adj] [float] NULL,
	[Hotels_Avg_Rate] [float] NULL,
	[Hotels_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Indoor_play_centers_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Indoor_play_centers_Premium] [float] NULL,
	[Indoor_play_centers_Exposure] [float] NULL,
	[Indoor_play_centers_Exposure_Adj] [float] NULL,
	[Indoor_play_centers_Avg_Rate] [float] NULL,
	[Indoor_play_centers_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Janitorial_Services_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Janitorial_Services_Premium] [float] NULL,
	[Janitorial_Services_Exposure] [float] NULL,
	[Janitorial_Services_Exposure_Adj] [float] NULL,
	[Janitorial_Services_Avg_Rate] [float] NULL,
	[Janitorial_Services_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lakes_Resevoirs_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lakes_Resevoirs_Premium] [float] NULL,
	[Lakes_Resevoirs_Exposure] [float] NULL,
	[Lakes_Resevoirs_Exposure_Adj] [float] NULL,
	[Lakes_Resevoirs_Avg_Rate] [float] NULL,
	[Lakes_Resevoirs_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Miniature_Golf_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Miniature_Golf_Premium] [float] NULL,
	[Miniature_Golf_Exposure] [float] NULL,
	[Miniature_Golf_Exposure_Adj] [float] NULL,
	[Miniature_Golf_Avg_Rate] [float] NULL,
	[Miniature_Golf_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mobile_Home_Parks_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mobile_Home_Parks_Premium] [float] NULL,
	[Mobile_Home_Parks_Exposure] [float] NULL,
	[Mobile_Home_Parks_Exposure_Adj] [float] NULL,
	[Mobile_Home_Parks_Avg_Rate] [float] NULL,
	[Mobile_Home_Parks_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Offices_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Offices_FP_Premium] [float] NULL,
	[Offices_FP_Exposure] [float] NULL,
	[Offices_FP_Exposure_Adj] [float] NULL,
	[Offices_FP_Avg_Rate] [float] NULL,
	[Offices_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Offices_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Offices_NP_Premium] [float] NULL,
	[Offices_NP_Exposure] [float] NULL,
	[Offices_NP_Exposure_Adj] [float] NULL,
	[Offices_NP_Avg_Rate] [float] NULL,
	[Offices_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Outpatient_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Outpatient_NP_Premium] [float] NULL,
	[Outpatient_NP_Exposure] [float] NULL,
	[Outpatient_NP_Exposure_Adj] [float] NULL,
	[Outpatient_NP_Avg_Rate] [float] NULL,
	[Outpatient_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Parks_Playgrounds_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Parks_Playgrounds_Premium] [float] NULL,
	[Parks_Playgrounds_Exposure] [float] NULL,
	[Parks_Playgrounds_Exposure_Adj] [float] NULL,
	[Parks_Playgrounds_Avg_Rate] [float] NULL,
	[Parks_Playgrounds_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_HS_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_HS_NP_Premium] [float] NULL,
	[Private_HS_NP_Exposure] [float] NULL,
	[Private_HS_NP_Exposure_Adj] [float] NULL,
	[Private_HS_NP_Avg_Rate] [float] NULL,
	[Private_HS_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_Parking_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_Parking_Premium] [float] NULL,
	[Private_Parking_Exposure] [float] NULL,
	[Private_Parking_Exposure_Adj] [float] NULL,
	[Private_Parking_Avg_Rate] [float] NULL,
	[Private_Parking_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_Pre_HS_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_Pre_HS_FP_Premium] [float] NULL,
	[Private_Pre_HS_FP_Exposure] [float] NULL,
	[Private_Pre_HS_FP_Exposure_Adj] [float] NULL,
	[Private_Pre_HS_FP_Avg_Rate] [float] NULL,
	[Private_Pre_HS_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_Pre_HS_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_Pre_HS_NP_Premium] [float] NULL,
	[Private_Pre_HS_NP_Exposure] [float] NULL,
	[Private_Pre_HS_NP_Exposure_Adj] [float] NULL,
	[Private_Pre_HS_NP_Avg_Rate] [float] NULL,
	[Private_Pre_HS_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_Schools_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_Schools_Premium] [float] NULL,
	[Private_Schools_Exposure] [float] NULL,
	[Private_Schools_Exposure_Adj] [float] NULL,
	[Private_Schools_Avg_Rate] [float] NULL,
	[Private_Schools_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_Schools_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Private_Schools_FP_Premium] [float] NULL,
	[Private_Schools_FP_Exposure] [float] NULL,
	[Private_Schools_FP_Exposure_Adj] [float] NULL,
	[Private_Schools_FP_Avg_Rate] [float] NULL,
	[Private_Schools_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Public_Schools_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Public_Schools_Premium] [float] NULL,
	[Public_Schools_Exposure] [float] NULL,
	[Public_Schools_Exposure_Adj] [float] NULL,
	[Public_Schools_Avg_Rate] [float] NULL,
	[Public_Schools_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Public_Schools_HS_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Public_Schools_HS_Premium] [float] NULL,
	[Public_Schools_HS_Exposure] [float] NULL,
	[Public_Schools_HS_Exposure_Adj] [float] NULL,
	[Public_Schools_HS_Avg_Rate] [float] NULL,
	[Public_Schools_HS_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Public_Schools_Pre_HS_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Public_Schools_Pre_HS_Premium] [float] NULL,
	[Public_Schools_Pre_HS_Exposure] [float] NULL,
	[Public_Schools_Pre_HS_Exposure_Adj] [float] NULL,
	[Public_Schools_Pre_HS_Avg_Rate] [float] NULL,
	[Public_Schools_Pre_HS_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Race_Tracks_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Race_Tracks_Premium] [float] NULL,
	[Race_Tracks_Exposure] [float] NULL,
	[Race_Tracks_Exposure_Adj] [float] NULL,
	[Race_Tracks_Avg_Rate] [float] NULL,
	[Race_Tracks_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sales_Service_Orgs_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sales_Service_Orgs_Premium] [float] NULL,
	[Sales_Service_Orgs_Exposure] [float] NULL,
	[Sales_Service_Orgs_Exposure_Adj] [float] NULL,
	[Sales_Service_Orgs_Avg_Rate] [float] NULL,
	[Sales_Service_Orgs_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Schools_FP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Schools_FP_Premium] [float] NULL,
	[Schools_FP_Exposure] [float] NULL,
	[Schools_FP_Exposure_Adj] [float] NULL,
	[Schools_FP_Avg_Rate] [float] NULL,
	[Schools_FP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Schools_NP_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Schools_NP_Premium] [float] NULL,
	[Schools_NP_Exposure] [float] NULL,
	[Schools_NP_Exposure_Adj] [float] NULL,
	[Schools_NP_Avg_Rate] [float] NULL,
	[Schools_NP_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Shelter_Mission_HlfwHouse_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Shelter_Mission_HlfwHouse_Premium] [float] NULL,
	[Shelter_Mission_HlfwHouse_Exposure] [float] NULL,
	[Shelter_Mission_HlfwHouse_Exposure_Adj] [float] NULL,
	[Shelter_Mission_HlfwHouse_Avg_Rate] [float] NULL,
	[Shelter_Mission_HlfwHouse_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Skating_Rinks_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Skating_Rinks_Premium] [float] NULL,
	[Skating_Rinks_Exposure] [float] NULL,
	[Skating_Rinks_Exposure_Adj] [float] NULL,
	[Skating_Rinks_Avg_Rate] [float] NULL,
	[Skating_Rinks_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Stadiums_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Stadiums_Premium] [float] NULL,
	[Stadiums_Exposure] [float] NULL,
	[Stadiums_Exposure_Adj] [float] NULL,
	[Stadiums_Avg_Rate] [float] NULL,
	[Stadiums_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Swimming_Pools_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Swimming_Pools_Premium] [float] NULL,
	[Swimming_Pools_Exposure] [float] NULL,
	[Swimming_Pools_Exposure_Adj] [float] NULL,
	[Swimming_Pools_Avg_Rate] [float] NULL,
	[Swimming_Pools_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Vocational_Schools_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Vocational_Schools_Premium] [float] NULL,
	[Vocational_Schools_Exposure] [float] NULL,
	[Vocational_Schools_Exposure_Adj] [float] NULL,
	[Vocational_Schools_Avg_Rate] [float] NULL,
	[Vocational_Schools_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[YMCA_YWCA_Class_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[YMCA_YWCA_Premium] [float] NULL,
	[YMCA_YWCA_Exposure] [float] NULL,
	[YMCA_YWCA_Exposure_Adj] [float] NULL,
	[YMCA_YWCA_Avg_Rate] [float] NULL,
	[YMCA_YWCA_Avg_Rate_Range] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
