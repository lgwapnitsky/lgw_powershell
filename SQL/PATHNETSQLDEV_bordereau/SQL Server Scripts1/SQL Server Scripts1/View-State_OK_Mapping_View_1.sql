IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_OK_Mapping_View_1]'))
DROP VIEW [dbo].[State_OK_Mapping_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_OK_Mapping_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_OK_Mapping_View_1
AS
SELECT     dbo.Policy_Information_ALL_POLICIES_January.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_January.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Evaluation, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Entry_Month, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Region_Description, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Underwriter, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Primary_Producer, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Account_Number, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Account_Name, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Policy_Number, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Effective_Date, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Expiration_Date, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Status, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Product, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Renew_Auto, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Address, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Address_for_Geocoding, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Address2, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.State, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.County, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.City, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.ZIP, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Tier, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Location, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Building, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Longitude, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Latitude, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.GeoResult, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.UC, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Construction, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Stories, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Construction_Year, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Roof_Construction_Year, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Roof_Type, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.ZIP_Population_Density, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Prior_Policy_Number, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Prior_Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.TIV, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.TIV_State, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.TIV_Policy, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Wind, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Wind_Deductible, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Hurricane_Deductible,
                       Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Flood_Deductible, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Flood_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Property_Elite_Form, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Property_Elite_Flood_Exposure_Type, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Property_Elite_Flood_Exposure_Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Flood_Zone, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Terrorism, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Terrorism_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Fire_Allied_Deductible, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Implied_Rate, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Commission, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Distance_to_Shore, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Distance_to_Shore_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Hurricane_Map_Legend, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Wind_Map_Legend, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Hail_Risk_Zone, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Hail_Storm_Frequency_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.TIV_in_5_Mile_Buffer, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.TIV_5_Mile_Concentration_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Terrorism_Tier, Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Closest_Terr_Target, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Closest_Terr_Target_Dist, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Closest_Target_Risk_Value, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Highest_Risk_Target, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Highest_Risk_Target_Dist, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Highest_Risk_Value, 
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Account_Stratification
FROM         dbo.Policy_Information_ALL_POLICIES_January RIGHT OUTER JOIN
                      Act_Exposure_Mgt.dbo.Property_General_2011_01_31 ON 
                      dbo.Policy_Information_ALL_POLICIES_January.policynumber = Act_Exposure_Mgt.dbo.Property_General_2011_01_31.Policy_Number
WHERE     (Act_Exposure_Mgt.dbo.Property_General_2011_01_31.State = ''OK'')
' 
GO
