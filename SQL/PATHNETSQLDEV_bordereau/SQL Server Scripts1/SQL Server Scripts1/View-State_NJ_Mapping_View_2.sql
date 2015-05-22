IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_NJ_Mapping_View_2]'))
DROP VIEW [dbo].[State_NJ_Mapping_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_NJ_Mapping_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_NJ_Mapping_View_2
AS
SELECT     pgt.Account_Number, pgt.Account_Name, pgt.Policy_Number, pgt.Effective_Date, pgt.Expiration_Date, pgt.Status, path.Incurred_LossRatio_Acct_5UWYr_CurrEval, 
                      path.Incurred_LossRatio_Acct_5UWYr_CurrEval_Range, pgt.Region, pgt.Underwriter, pgt.Product, pgt.New_Renew, pgt.Address, pgt.Address_for_Geocoding, 
                      pgt.Address2, pgt.State, pgt.County, pgt.City, pgt.ZIP, pgt.Territory, pgt.Tier, pgt.Location, pgt.Building, pgt.OBJECTNUMBER, pgt.Longitude, pgt.Latitude, 
                      pgt.GeoResult, pgt.MI_Address, pgt.MI_City, pgt.MI_ZIP, pgt.MI_State, pgt.Class_Code, pgt.Protection_Class, pgt.UC, pgt.Construction, pgt.Evaluation, 
                      pgt.Entry_Month, pgt.Region_Description, pgt.Primary_Producer, pgt.Cancel_Date, pgt.Reinstated_Date, pgt.Product_Definition, pgt.Program_Code, 
                      pgt.Program_Description, pgt.Construction_Code, pgt.Stories, pgt.Construction_Year, pgt.ZIP_Population_Density, pgt.Limit, pgt.Building_Limit, pgt.Contents_Limit, 
                      pgt.BusInt_Limit, pgt.ExtraExp_Limit, pgt.Building_and_Contents_Limit, pgt.TIV, pgt.TIV_Range, pgt.TIV_Dollar_Change, pgt.TIV_Percent_Change, pgt.Wind, 
                      pgt.wind_hail_deductible, pgt.Named_Storm_Deductible, pgt.Wind_deductible_amt, pgt.Wind_deductible_pct, pgt.Wind_deductible_other, pgt.Hurricane_Deductible, 
                      pgt.Applicable_Hurricane_Deductible, pgt.Flood_Deductible, pgt.Flood_Premium, pgt.Flood_Zone, pgt.flood_kind, pgt.Flood_limit, pgt.Flood_sublimit, 
                      pgt.Fire_Allied_Deductible, pgt.Premium, pgt.Implied_Rate, pgt.Implied_Rate_Excluding_EQ, pgt.Commission, pgt.EQ_Region, pgt.EQ_Tier, pgt.EQ_Kind, pgt.Sprinkler, 
                      pgt.Sprinkler_Leakage_Only, pgt.EQ_Blanket, pgt.EQ_Sublimit, pgt.EQ_Tot_Coverage, pgt.EQ_Policy_Deductible, pgt.EQ_Deductible, pgt.EQ_Percent_Deductible, 
                      pgt.EQ_Bld_Deductible, pgt.EQ_Premium, pgt.MMI, pgt.Hurricane_Zone, pgt.Distance_to_Shore, pgt.Distance_to_Shore_Range, pgt.Hurricane_Map_Legend, 
                      pgt.Wind_Map_Legend, pgt.TWH_Zone, pgt.Hail_Storm_Frequency_Range, pgt.Hail_Risk_Zone, pgt.TWH_Tier_Min, pgt.Deductible, pgt.Terrorism_Zone, 
                      pgt.Terrorism_Tier, pgt.TIV_in_5_Mile_Buffer, pgt.TIV_5_Mile_Concentration_Range, pgt.Closest_Terr_Target, pgt.Closest_Terr_Target_Dist, 
                      pgt.Closest_Terr_Target_Dist_Range, pgt.Closest_Target_Risk_Value, pgt.Highest_Risk_Target, pgt.Highest_Risk_Target_Dist, pgt.Highest_Risk_Target_Dist_Range, 
                      pgt.Highest_Risk_Value, pgt.Wildfire_Tier, CASE WHEN Incurred_LossRatio_Acct_5UWYr_CurrEval IS NULL THEN NULL 
                      WHEN Incurred_LossRatio_Acct_5UWYr_CurrEval = 0 THEN ''A. Zero'' WHEN Incurred_LossRatio_Acct_5UWYr_CurrEval < .10 THEN ''B. 0% to 10%'' WHEN Incurred_LossRatio_Acct_5UWYr_CurrEval
                       < .25 THEN ''C. 10% to 25%'' WHEN Incurred_LossRatio_Acct_5UWYr_CurrEval < .40 THEN ''D. 25% to 40%'' WHEN Incurred_LossRatio_Acct_5UWYr_CurrEval < .60 THEN
                       ''E. 40% to 60%'' WHEN Incurred_LossRatio_Acct_5UWYr_CurrEval < 1 THEN ''F. 60% to 100%'' WHEN Incurred_LossRatio_Acct_5UWYr_CurrEval < 1.50 THEN ''G. 100% to 150%''
                       ELSE ''H. Over 150%'' END AS Incurred_LossRatio_Acct_5UWYr_CurrEval_Range_2
FROM         Act_Exposure_Mgt.dbo.PropertyUpdate_General_2013_01_31 AS pgt LEFT OUTER JOIN
                      dbo.Policy_PATHID_Information AS path ON pgt.Account_Number = path.accountnumber
WHERE     (pgt.State = ''NJ'') AND (pgt.Policy_Number = path.policynumber)
' 
GO
