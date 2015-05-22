IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MS_Mapping_View_1]'))
DROP VIEW [dbo].[State_MS_Mapping_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MS_Mapping_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_MS_Mapping_View_1
AS
SELECT     dbo.Policy_Information_ALL_POLICIES_May.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_May.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Primary_Key, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.kstokey, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Evaluation, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Entry_Month, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Region, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Region_Description, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Underwriter, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Primary_Producer, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Account_Number, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Account_Name, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Policy_Number, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Effective_Date, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Policy_Year, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Policy_Month, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Expiration_Date, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Expiration_Year, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Expiration_Month, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Expiration_Year_Month, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Status, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Cancel_Date, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Product, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Product_Definition, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Program_Code, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Program_Description, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.New_Renew, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.AQS_Type, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Renew_Auto, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Address, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Address_for_Geocoding, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Address2, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.State, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.County, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.City, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.ZIP, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Tier, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Territory, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Location, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Building, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Longitude, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Latitude, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.GeoResult, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Class_Code, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Protection_Class, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.UC, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Construction, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Construction_Code, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Stories, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Construction_Year, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.ZIP_Population_Density, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Building_Limit, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Contents_Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.BusInt_Limit, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.ExtraExp_Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Building_and_Contents_Limit, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.TIV, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.TIV_Range, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Wind, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Wind_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Hurricane_Deductible,
                       Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Flood_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Flood_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Property_Elite_Flood_Exposure, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Terrorism, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Fire_Allied_Deductible, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.AQS_Building_Content_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Premium, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Implied_Rate, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Implied_Rate_Excluding_EQ, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Commission, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.EQ_Region, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.EQ_Tier, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.EQ_Kind, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Sprinkler, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Sprinkler_Leakage_Only, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.EQ_Blanket, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.EQ_Sublimit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.EQ_Tot_Coverage, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Hurricane_Zone, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Distance_to_Shore, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Distance_to_Shore_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Wind_Map_Legend, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.TWH_Zone, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Hail_Risk_Zone, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Hail_Storm_Frequency_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.TWH_Tier_Min, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Hail_Tier, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Terrorism_Zone, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Terrorism_Tier, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Closest_Terr_Target, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Closest_Terr_Target_Dist_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Closest_Terr_Target_Dist, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Closest_Target_Risk_Value, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Highest_Risk_Target, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Highest_Risk_Target_Dist, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Account_Stratification_Description, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Account_Stratification, Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Wildfire_Tier, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Highest_Risk_Value, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Highest_Risk_Target_Dist_Range
FROM         dbo.Policy_Information_ALL_POLICIES_May RIGHT OUTER JOIN
                      Act_Exposure_Mgt.dbo.Property_General_2010_05_31 ON 
                      dbo.Policy_Information_ALL_POLICIES_May.policynumber = Act_Exposure_Mgt.dbo.Property_General_2010_05_31.Policy_Number
WHERE     (Act_Exposure_Mgt.dbo.Property_General_2010_05_31.State = ''MS'')
' 
GO
