IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1]'))
DROP VIEW [dbo].[Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1
AS
SELECT     policynumber, FA_Number_of_Locations, FA_Number_of_Buildings, FA_Building_Exposure, FA_Contents_Exposure, FA_Business_Interuption_Exposure, 
                      FA_Extra_Expense_Exposure, TIV, FA_Building_Prem, FA_Contents_Prem, FA_Deductible, constr_Code_1_Exposure, constr_Code_2_Exposure, 
                      constr_Code_3_Exposure, constr_Code_4_Exposure, constr_Code_5_Exposure, constr_Code_6_Exposure, constr_Code_7_Exposure, constr_Code_8_Exposure, 
                      constr_Code_9_Exposure, constr_Code_10_Exposure, protect_class_1_Exposure, protect_class_2_Exposure, protect_class_3_Exposure, protect_class_4_Exposure, 
                      protect_class_5_Exposure, protect_class_6_Exposure, protect_class_7_Exposure, protect_class_8_Exposure, protect_class_9_Exposure, 
                      protect_class_10_Exposure, Population_Density_Zone_Metro_Exposure, Population_Density_Zone_Urban_Exposure, 
                      Population_Density_Zone_Suburban_Exposure, Population_Density_Zone_SemiSuburban_Exposure, Population_Density_Zone_Rural_Exposure, Hail_A_Exposure, 
                      Hail_B_Exposure, Hail_C_Exposure, Hail_D_Exposure, Hail_E_Exposure, Hail_F_Exposure, Hail_G_Exposure, Hail_H_Exposure, TIV_Range, FA_Avg_TIV_per_BLD, 
                      FA_Avg_Bld_Rate, FA_Avg_Cts_Rate, FA_Deductible_to_TIV, term_factor, FA_Deductible_to_TIV_Range, FA_Avg_Bld_Rate_rd2, FA_Avg_Bld_Rate_Range, 
                      FA_Avg_Cts_Rate_Range, FA_Avg_TIV_per_BLD_Range, FA_Constr_code_Tot_Exposure, FA_Constr_Code_Max_Exposure, FA_Constr_Code_Dominant, 
                      FA_Constr_Code_Dominant_Percent, FA_Constr_Code_Dominant_NAME, Property_Coverage_Form, FA_protect_class_Tot_Exposure, 
                      FA_protect_class_Max_Exposure, FA_protect_class_Dominant, FA_protect_class_Dominant_Percent, ZIP_Pop_Density_Tot_Exposure, 
                      ZIP_Pop_Density_Max_Exposure, ZIP_Pop_Density_Dominant, ZIP_Pop_Density_Dominant_Percent, FA_Hail_Tot_Exposure, FA_Hail_Max_Exposure, 
                      FA_Hail_Dominant, FA_Hail_Dominant_Percent
FROM         dbo.Policy_Information_ALL_POLICIES_FireAllied_June
' 
GO
