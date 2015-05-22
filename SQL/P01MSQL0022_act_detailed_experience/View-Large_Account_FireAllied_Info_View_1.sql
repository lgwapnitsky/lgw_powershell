IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Account_FireAllied_Info_View_1]'))
DROP VIEW [dbo].[Large_Account_FireAllied_Info_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Account_FireAllied_Info_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Large_Account_FireAllied_Info_View_1
AS
SELECT     dbo.Policy_Information_ALL_POLICIES_November.accountnumber, dbo.Policy_Information_ALL_POLICIES_November.Property_Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_Premium_range, dbo.Policy_Information_ALL_POLICIES_November.policyEffectivedate, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Account_Number AS Expr1, dbo.Policy_Information_ALL_POLICIES_November.policynumber, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Address2, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Policy_Number, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Address, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.State, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.County, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.City, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.ZIP, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Tier, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Territory, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Location, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Building, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Class_Code, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Protection_Class, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Construction, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Stories, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Construction_Year, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.TIV, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Wind, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Wind_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Hurricane_Deductible,
                       Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Applicable_Hurricane_Deductible, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Flood_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Flood_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Fire_Allied_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Implied_Rate, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Implied_Rate_Excluding_EQ, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Allocated_Sublimit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Percent_Deductible, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Policy_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Distance_to_Shore, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Hail_Storm_Frequency_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Wildfire_Tier, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Account_Stratification, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Account_Stratification_Description
FROM         Act_Exposure_Mgt.dbo.Property_General_2010_11_30 LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_November ON 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Policy_Number = dbo.Policy_Information_ALL_POLICIES_November.policynumber
WHERE     (dbo.Policy_Information_ALL_POLICIES_November.Account_Premium_range IN (''d: $250k to $500k'', ''e: over $500k''))
' 
GO
