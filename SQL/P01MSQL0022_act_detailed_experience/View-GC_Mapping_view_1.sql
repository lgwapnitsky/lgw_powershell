IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GC_Mapping_view_1]'))
DROP VIEW [dbo].[GC_Mapping_view_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GC_Mapping_view_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.GC_Mapping_view_1
AS
SELECT     dbo.Policy_Information_ALL_POLICIES_B.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Primary_Key, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.kstokey, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Evaluation, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Entry_Month, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Region, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Region_Description, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Underwriter, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Primary_Producer, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Account_Number, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Account_Name, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Policy_Number, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Effective_Date, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Policy_Year, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Policy_Month, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Expiration_Date, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Expiration_Year, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Expiration_Month, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Expiration_Year_Month, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Status, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Cancel_Date, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Product, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Product_Definition, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Program_Code, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Program_Description, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.New_Renew, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.AQS_Type, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Renew_Auto, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Address, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Address_for_Geocoding, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Address2, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.State, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.County, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.City, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.ZIP, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Tier, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Territory, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Location, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Building, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Longitude, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Latitude, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.GeoResult, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Class_Code, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Protection_Class, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.UC, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Construction, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Construction_Code, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Stories, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Construction_Year, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.ZIP_Population_Density, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Building_Limit, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Contents_Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.BusInt_Limit, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.ExtraExp_Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Building_and_Contents_Limit, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.TIV, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.TIV_Range, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Wind, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Wind_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Hurricane_Deductible,
                       Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Flood_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Flood_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Property_Elite_Flood_Exposure, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Terrorism, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Fire_Allied_Deductible, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.AQS_Building_Content_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Premium, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Implied_Rate, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Implied_Rate_Excluding_EQ, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Commission, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.EQ_Region, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.EQ_Tier, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.EQ_Kind, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Sprinkler, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Sprinkler_Leakage_Only, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.EQ_Blanket, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.EQ_Sublimit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.EQ_Tot_Coverage, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Hurricane_Zone, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Distance_to_Shore, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Distance_to_Shore_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Wind_Map_Legend, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.TWH_Zone, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Hail_Risk_Zone, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Hail_Storm_Frequency_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.TWH_Tier_Min, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Hail_Tier, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Terrorism_Zone, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Terrorism_Tier, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Closest_Terr_Target, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Closest_Terr_Target_Dist_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Closest_Terr_Target_Dist, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Closest_Target_Risk_Value, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Highest_Risk_Target, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Highest_Risk_Target_Dist, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Account_Stratification_Description, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Account_Stratification, Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Wildfire_Tier, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Highest_Risk_Value, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Highest_Risk_Target_Dist_Range
FROM         dbo.Policy_Information_ALL_POLICIES_B RIGHT OUTER JOIN
                      Act_Exposure_Mgt.dbo.Property_General_2010_02_28 ON 
                      dbo.Policy_Information_ALL_POLICIES_B.policynumber = Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Policy_Number
WHERE     (Act_Exposure_Mgt.dbo.Property_General_2010_02_28.Product = ''GC'')
' 
GO
