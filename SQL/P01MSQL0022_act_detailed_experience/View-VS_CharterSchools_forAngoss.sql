IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_CharterSchools_forAngoss]'))
DROP VIEW [dbo].[VS_CharterSchools_forAngoss]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_CharterSchools_forAngoss]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.VS_CharterSchools_forAngoss
AS
SELECT     statecode, Coverage_Reporting_group, productcode, Fiscal_AY_Year, currentearnedpremium, Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      Renew_New_Auto, Branch_Region, program, Written_Premium_Range, Coverage_Group, Product_group, GL_Dom_Terr_Description, GL_Dom_Region_in_State, 
                      Primary_Producer_type, Property_Coverage_Form, FA_Constr_Code_Dominant_NAME, FA_Hail_Dominant, ZIP_Pop_Density_Dominant, FA_Avg_Bld_Rate_Range, 
                      Auto_Vehicle_count_Total_Range, Auto_Vehicle_count_PPT_Range, Auto_Vehicle_count_Buses_Range, Auto_Vehicle_count_Truck_Range, 
                      Auto_Vehicle_count_VanPools_Range, Auto_Vehicle_count_OtherPublic_Range, Auto_Vehicle_count_Other_Range, producttype, Source_Detail_Name, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Private_HS_NP_Avg_Rate_Range, Private_Pre_HS_NP_Avg_Rate_Range, 
                      Private_Schools_FP_Avg_Rate_Range, Public_Schools_Pre_HS_Avg_Rate_Range, Schools_FP_Avg_Rate_Range, Schools_NP_Avg_Rate_Range, 
                      Dormitories_NP_Avg_Rate_Range, Dormitories_FP_Avg_Rate_Range, College_NP_Avg_Rate_Range, College_FP_Avg_Rate_Range, 
                      Public_Schools_HS_Avg_Rate_Range, Vocational_Schools_Avg_Rate_Range, Private_Schools_Avg_Rate_Range, Public_Schools_Avg_Rate_Range, 
                      Dormitories_Avg_Rate_Range, programdesc, PrimaryProducerType, Account_Premium_Range, SubProduct, SubProductGroup, BusinessClassDesc, 
                      Private_Pre_HS_FP_Avg_Rate_Range, Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, GL_Occurrence_Limit, Pool_YN, SAM_OCC_Limit, TIV_Range, 
                      FA_Deductible_to_TIV_Range, FA_Avg_TIV_per_BLD_Range, Dorms_YN, Headstart_YN, Number_of_Total_Employees_Range, 
                      Percent_of_Part_Time_and_Temp_Employees_Range, Number_of_years_in_Operation_Range, Turnover_Rate_Range
FROM         dbo.VS_CharterSchools
WHERE     (PriorityAccountLevelcurrent = ''0'')
' 
GO
