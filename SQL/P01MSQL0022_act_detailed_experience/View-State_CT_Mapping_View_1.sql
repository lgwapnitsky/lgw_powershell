IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_CT_Mapping_View_1]'))
DROP VIEW [dbo].[State_CT_Mapping_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_CT_Mapping_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_CT_Mapping_View_1
AS
SELECT     Account_UltLoss_Ratio_Working_Cover_Range, Account_UltLoss_Ratio_NonCat_Working_Cover_Range, Primary_Key, kstokey, Evaluation, 
                      Entry_Month, Region, Region_Description, Underwriter, Primary_Producer, Account_Number, Account_Name, Policy_Number, Effective_Date, 
                      Policy_Year, Policy_Month, Expiration_Date, Expiration_Year, Expiration_Month, Expiration_Year_Month, Status, Cancel_Date, Product, 
                      Product_Definition, Program_Code, Program_Description, New_Renew, AQS_Type, Renew_Auto, Address, Address_for_Geocoding, Address2, State, 
                      County, City, ZIP, Tier, Territory, Location, Building, Longitude, Latitude, GeoResult, Class_Code, Protection_Class, UC, Construction, 
                      Construction_Code, Stories, Construction_Year, ZIP_Population_Density, Limit, Building_Limit, Contents_Limit, BusInt_Limit, ExtraExp_Limit, 
                      Building_and_Contents_Limit, TIV, TIV_Range, Wind, Wind_Deductible, Hurricane_Deductible, Flood_Deductible, Flood_Premium, 
                      Property_Elite_Flood_Exposure, Terrorism, Fire_Allied_Deductible, AQS_Building_Content_Premium, Premium, Implied_Rate, 
                      Implied_Rate_Excluding_EQ, Commission, EQ_Region, EQ_Tier, EQ_Kind, Sprinkler, Sprinkler_Leakage_Only, EQ_Blanket, EQ_Sublimit, 
                      EQ_Tot_Coverage, Hurricane_Zone, Distance_to_Shore, Distance_to_Shore_Range, Wind_Map_Legend, TWH_Zone, Hail_Risk_Zone, 
                      Hail_Storm_Frequency_Range, TWH_Tier_Min, Hail_Tier, Deductible, Terrorism_Zone, Terrorism_Tier, Closest_Terr_Target, 
                      Closest_Terr_Target_Dist_Range, Closest_Terr_Target_Dist, Closest_Target_Risk_Value, Highest_Risk_Target, Highest_Risk_Target_Dist, 
                      Account_Stratification_Description, Account_Stratification, Wildfire_Tier, Highest_Risk_Value, Highest_Risk_Target_Dist_Range
FROM         dbo.State_Latest_Mapping_View_1
WHERE     (State = ''CT'')
' 
GO
