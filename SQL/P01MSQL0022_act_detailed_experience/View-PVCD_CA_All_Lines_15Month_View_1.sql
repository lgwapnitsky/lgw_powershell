IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_CA_All_Lines_15Month_View_1]'))
DROP VIEW [dbo].[PVCD_CA_All_Lines_15Month_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_CA_All_Lines_15Month_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PVCD_CA_All_Lines_15Month_View_1
AS
SELECT     statecode, Coverage_Reporting_group, productcode, Fiscal_AY_Year, currentwrittenpremium, currentearnedpremium, 
                      Policy_count_Reporting_Coverage, Incurred_Loss_ALAE_with_SS_NonCat, Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Reported_Claims, Incurred_Claims, 
                      Commission_dollars, Commission_Premiums, New_Renew_Tail, Renew_New_Auto, Branch_Region, program, Written_Premium_Range, 
                      Coverage_Group, product_group, Primary_Umbrella, Earned_Buildings, Earned_Locations, Earned_TIV, GL_Dom_Terr_Description, 
                      GL_Dom_Region_in_State, Primary_Producer, Policy_count_All_Cov_Combined, Account_UltLoss_Ratio_Working_Cover_Range, 
                      Account_RepLoss_Ratio_Working_Cover_Range, Policy_count_Coverage_Group, accountnumber, Primary_Producer_type, 
                      Incurred_Loss_ALAE_with_SS, Capped_Incurred_Loss_ALAE_with_SS, Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, policynumber, Coverage_Form, Endorsement_Elite_YN, Account_Name, 
                      Incurred_Loss_ALAE_with_SS_CatOnly, Employment_Handbook_YN, Form_5500_YN, Retro_Date_Applies_YN, EEO1_Report_Received_YN, 
                      Subsidiaries_Affiliates_YN, Board_Experience_YN, Employment_Policies_YN, Claims_Past_5yrs_Range, Number_of_Full_Time_Employees_Range, 
                      Number_of_Part_Time_Employees_Range, Number_of_Temporary_Employees_Range, Number_of_Total_Employees_Range, 
                      Insider_Shareholder_Percent_Range, Employee_Salary_GT100k_Range, Salary_100K_to_Total_Employees_Range, 
                      Percent_of_Part_Time_and_Temp_Employees_Range, Plan_Assets_Range, Total_Participants_Range, Total_Claims_Range, PVCD_PVDO_Limit, 
                      PVCD_PVEPL_Limit, PVCD_PVDO_Alt_Retention, PVCD_PVEPL_Alt_Retention, PVCD_PVDO_RatingClass, PVCD_PVEPL_RatingClass, 
                      PVCD_PVEPL_Num_of_Employees_Range, PVCD_Amendment_End_Y_N, PVCD_Partnership_End_Y_N, PVCD_ProPak_Elite72_End_Y_N, 
                      PVCD_ProPak_Elite73_End_Y_N, PVCD_Circumstance_Exclusion_End_Y_N, PVCD_Professional_Services_End_Y_N, 
                      PVCD_Sexual_Abuse_Exclusion_End_Y_N, PVCD_BullsEye_ProPak_End_Y_N, PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N, 
                      PVCD_Amend_of_ExclusionK_End_Y_N, PVCD_Amend_of_Severability_Provision_End_Y_N, PVCD_Third_Party_Exclusion_End_Y_N, 
                      PVCD_Punitive_Exclusion_End_Y_N, PVCD_Medical_Malpractice_Exclusion_End_Y_N, PVCD_Insurance_EO_Exclusion_End_Y_N, 
                      PVCD_Full_Securities_Exclusion_End_Y_N, PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N, PVCD_Bankruptcy_Exclusion_End_Y_N, 
                      PVCD_Shareholder_End_Y_N, PVCD_Past_Acts_End_Y_N, PVCD_No_Liab_Retent_Waiver_End_Y_N, PVCD_Delete_Consent_End_Y_N, 
                      PVCD_Election_ERP_End_Y_N, PVCD_Damages_Only_Retention_End_Y_N, County_Pop_Density_Range, Branch_Office, PVCD_Business_Type, 
                      COL_Breach_of_Contract_Loss, COL_Discrimination_Loss, COL_Wrongful_Termination_Loss, COL_Harrassment_Loss, COL_SLD_All_Other_Loss, 
                      COL_SLD_All_Other_Count, COL_Harassment_Count, COL_WrongfulTermination_Count, COL_Discrimination_Count, COL_Breach_of_Contract_Count, 
                      First_Policy_Year, Clean_Warranty_Letter_Received_YN, Price_Monitor_Standard_Cov_Grp_Monitored_range, COL_DO_Other_Loss, 
                      COL_EPL_Other_Count, COL_EPL_Other_Loss, COL_Fiduciary_Other_Count, COL_Fiduciary_Other_Loss, COL_Worplace_Violence_Other_Count, 
                      COL_Worplace_Violence_Other_Loss, COL_Internet_Other_Count, COL_Internet_Other_Loss, PVCD_PVDO_ZoneMod, PVCD_PVEPL_ZoneMod, 
                      PVCD_PVEPL_Num_of_Employees, Fiscal_AY_Month_Ending, Last_Reporting_Year, Last_Reporting_Month, underwriter, PIC_Producer, 
                      Source_Detail_Name, BusinessClassDesc, ProductType, DivisionName, Written_Premium_Range_for_Product, PVCD_ZoneNum_DO, 
                      PVCD_ZoneNum_EPL, PICProducer, programdesc, PV_Cov_ALL, COL_Breach_of_Contract_Count1, ASCOL_Breach_of_Contract_Loss1, 
                      COL_Discrimination_Count1, COL_Discrimination_Loss1, COL_Wrongful_Termination_Count, COL_Wrongful_Termination_Loss1, 
                      COL_Harrassment_Count, COL_Harrassment_Loss1, COL_DO_Other_Count, acctngyear, Insd_County, Insd_Zip, LEFT(Insd_Zip, 3) AS Zip3, 
                      Insd_County AS Expr7
FROM         dbo.PVCD_All_Lines_15Month_View_1
WHERE     (statecode = ''CA'') AND (Fiscal_AY_Year > ''2005'') AND (Coverage_Reporting_group = ''D&O'') AND (productcode = ''PV'')
' 
GO
