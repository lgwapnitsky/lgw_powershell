IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_information_PVCD_View_1]'))
DROP VIEW [dbo].[Latest_Policy_information_PVCD_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_information_PVCD_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_Policy_information_PVCD_View_1
AS
SELECT     policynumber, companycode, Renew_New_Auto, First_Policy_Year, New_Renew_Tail, Branch_Region, Written_Premium_Range, Primary_Producer, 
                      Primary_Producer_type, PVCD_Amendment_End_Y_N, PVCD_Partnership_End_Y_N, PVCD_ProPak_Elite72_End_Y_N, PVCD_ProPak_Elite73_End_Y_N, 
                      PVCD_Circumstance_Exclusion_End_Y_N, PVCD_Professional_Services_End_Y_N, PVCD_BullsEye_ProPak_End_Y_N, PVCD_Sexual_Abuse_Exclusion_End_Y_N, 
                      PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N, PVCD_Amend_of_ExclusionK_End_Y_N, PVCD_Amend_of_Severability_Provision_End_Y_N, 
                      PVCD_Third_Party_Exclusion_End_Y_N, PVCD_Punitive_Exclusion_End_Y_N, PVCD_Medical_Malpractice_Exclusion_End_Y_N, 
                      PVCD_Insurance_EO_Exclusion_End_Y_N, PVCD_Full_Securities_Exclusion_End_Y_N, PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N, 
                      PVCD_Bankruptcy_Exclusion_End_Y_N, PVCD_Shareholder_End_Y_N, PVCD_Past_Acts_End_Y_N, PVCD_No_Liab_Retent_Waiver_End_Y_N, 
                      PVCD_Election_ERP_End_Y_N, PVCD_Delete_Consent_End_Y_N, PVCD_Damages_Only_Retention_End_Y_N, PVCD_Idnum_Max, PVCD_Idnum, PVCD_PVDO_Limit, 
                      PVCD_PVDO_Alt_Retention, PVCD_PVDO_RatingClass, PVCD_PVDO_Assets, PVCD_PVDO_Assets_Range, PVCD_PVEPL_Limit, PVCD_PVEPL_Alt_Retention, 
                      PVCD_PVEPL_RatingClass, PVCD_PVEPL_Num_of_Employees, PVCD_Financial_Type, PVCD_Business_Type, PVCD_PVEPL_Num_of_Employees_Range, EPL_Id, 
                      PVCD_PVEPL_ZoneMod, PVCD_PVDO_ZoneMod, PV_Zone, PVCD_State_DO, PVCD_State_EPL, PVCD_ZipCode_DO, PVCD_ZipCode_EPL, PVCD_ZoneNum_DO, 
                      PVCD_ZoneNum_EPL, PVCD_County_DO, PVCD_County_EPL
FROM         dbo.Policy_Information_PVCD_June
' 
GO
