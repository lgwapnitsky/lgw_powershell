IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Property_Information_View_1]'))
DROP VIEW [dbo].[Property_Information_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Property_Information_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Property_Information_View_1
AS
SELECT     dbo.Policy_Information_ALL_POLICIES_B.policynumber, dbo.BuildingRates_Property_Exposure.Policy_Number, 
                      dbo.BuildingRates_Property_Exposure.Location, dbo.BuildingRates_Property_Exposure.Building, dbo.BuildingRates_Property_Exposure.State, 
                      dbo.BuildingRates_Property_Exposure.ZIP, dbo.BuildingRates_Property_Exposure.Class_Code, 
                      dbo.BuildingRates_Property_Exposure.AB_BG2_Exposure, dbo.BuildingRates_Property_Exposure.AB_BG2_Construction_Code, 
                      dbo.BuildingRates_Property_Exposure.AB_BG2_Protection_Class, dbo.BuildingRates_Property_Exposure.FB_Exposure, 
                      dbo.BuildingRates_Property_Exposure.FC_Exposure, dbo.BuildingRates_Property_Exposure.AC_BG2_Exposure, 
                      dbo.BuildingRates_Property_Exposure.UCAB_Exposure, dbo.BuildingRates_Property_Exposure.UCAC_Exposure, 
                      dbo.BuildingRates_Property_Exposure.AEE_Exposure, dbo.BuildingRates_Property_Exposure.AI_Exposure, 
                      dbo.BuildingRates_Property_Exposure.TIV, dbo.BuildingRates_Property_Exposure.Address, dbo.BuildingRates_Property_Exposure.City, 
                      dbo.BuildingRates_Property_Exposure.County, dbo.BuildingRates_Property_Exposure.Construction_Code, 
                      dbo.BuildingRates_Property_Exposure.Protection_Class, dbo.BuildingRates_Property_Exposure.Tier, dbo.BuildingRates_Property_Exposure.Wind, 
                      dbo.BuildingRates_Property_Exposure.Wind_Deductible, dbo.BuildingRates_Property_Exposure.UC, 
                      dbo.BuildingRates_Property_Exposure.Population_Density_Zone, dbo.BuildingRates_Property_Exposure.ZIP_Hail_Frequency, 
                      dbo.BuildingRates_Property_Exposure.FA_Deductible, dbo.BuildingRates_Property_Exposure.FA_Building_Exposure, 
                      dbo.BuildingRates_Property_Exposure.FA_Contents_Exposure, dbo.BuildingRates_Property_Exposure.FA_Business_Interuption_Exposure, 
                      dbo.BuildingRates_Property_Exposure.FA_Extra_Expense_Exposure, dbo.BuildingRates_Property_Exposure.FI_Deductible, 
                      dbo.BuildingRates_Property_Exposure.AI_AQS_Premium, dbo.BuildingRates_Property_Exposure.AI_Deductible, 
                      dbo.BuildingRates_Property_Exposure.UCAC_Deductible, dbo.BuildingRates_Property_Exposure.UCAC_AQS_Premium, 
                      dbo.BuildingRates_Property_Exposure.FC_Deductible, dbo.BuildingRates_Property_Exposure.FC_AQS_Premium, 
                      dbo.BuildingRates_Property_Exposure.AC_SCoL_AQS_Premium, dbo.BuildingRates_Property_Exposure.AC_SCoL_Exposure, 
                      dbo.BuildingRates_Property_Exposure.AC_BG2_Deductible, dbo.BuildingRates_Property_Exposure.AC_BG2_AQS_Premium, 
                      dbo.BuildingRates_Property_Exposure.UCAB_Deductible, dbo.BuildingRates_Property_Exposure.UCAB_AQS_Premium, 
                      dbo.BuildingRates_Property_Exposure.FB_Deductible, dbo.BuildingRates_Property_Exposure.AB_SCoL_AQS_Premium, 
                      dbo.BuildingRates_Property_Exposure.AB_SCoL_Exposure, dbo.BuildingRates_Property_Exposure.AB_BG2_Deductible, 
                      dbo.BuildingRates_Property_Exposure.AB_BG2_AQS_Premium, dbo.Policy_Information_ALL_POLICIES_B.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_B.Property_Coverage_Form
FROM         dbo.BuildingRates_Property_Exposure LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.BuildingRates_Property_Exposure.Policy_Number = dbo.Policy_Information_ALL_POLICIES_B.policynumber
' 
GO
