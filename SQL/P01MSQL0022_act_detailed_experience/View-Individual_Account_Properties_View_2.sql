IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Account_Properties_View_2]'))
DROP VIEW [dbo].[Individual_Account_Properties_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Account_Properties_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Account_Properties_View_2
AS
SELECT     Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Account_Number, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Account_Name, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Policy_Number, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Region_Description, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Underwriter, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Primary_Producer, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Effective_Date, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Policy_Year, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Expiration_Date, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Product, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Program_Description, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Renew_Auto, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Address, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Address2, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.State, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.County, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.City, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.ZIP, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Location, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Building, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.GeoResult, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Class_Code, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Protection_Class, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.UC, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Construction, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Construction_Code, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Stories, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Construction_Year, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.TIV, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Building_Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Contents_Limit, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.ExtraExp_Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.BusInt_Limit, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Wind, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Wind_Deductible, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Hurricane_Deductible,
                       Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Flood_Deductible, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Flood_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Terrorism, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Terrorism_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Fire_Allied_Deductible, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Implied_Rate, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Implied_Rate_Excluding_EQ, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Commission, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.EQ_Kind, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.EQ_Blanket, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.EQ_Sublimit, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.EQ_Sublimit_Percent, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.EQ_Percent_Deductible, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.EQ_Policy_Deductible, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.EQ_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Distance_to_Shore, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Hail_Storm_Frequency_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Wildfire_Tier, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Account_Stratification_Description, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Account_Stratification, 
                      YEAR(Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Effective_Date) 
                      * 100 + MONTH(Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Effective_Date) AS EffectiveYearMonth
FROM         Act_Exposure_Mgt.dbo.Property_General_2011_01_31 RIGHT OUTER JOIN
                      dbo.Individual_Accounts_for_Reports_View_1 ON 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Policy_Number = dbo.Individual_Accounts_for_Reports_View_1.policynumber
' 
GO
