IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hurricane_Irene]'))
DROP VIEW [dbo].[Hurricane_Irene]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hurricane_Irene]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Hurricane_Irene
AS
SELECT DISTINCT 
                      TOP (100) PERCENT pg.Policy_Number, pg.Account_Number, pg.Account_Name, pg.Primary_Producer, pc.PrimaryProducer_Contact, 
                      pc.PrimaryProducer_Phone, pc.PrimaryProducer_Email, pg.Location, pg.Building, pg.Address, pg.Address2, pg.City, pg.State, pg.ZIP, pg.County, 
                      SUM(pg.TIV) AS TIV, pg.Wind, pg.Wind_Deductible, pg.Flood_Premium, pg.Property_Elite_Flood_Exposure_Type, pg.Longitude, pg.Latitude, 
                      pg.TIV_Range
FROM         Act_Exposure_Mgt.dbo.Property_General_2011_07_31 AS pg INNER JOIN
                      dbo.Policy_PATHID_Information AS de ON pg.Policy_Number = de.policynumber INNER JOIN
                      dbo.Producer_Contact_Information AS pc ON pg.Policy_Number = pc.policynumber
WHERE     (pg.State IN (''CT'', ''DE'', ''ME'', ''MD'', ''MA'', ''NH'', ''NJ'', ''NY'', ''NC'', ''PA'', ''RI'', ''SC'', ''VT'', ''VA'', ''DC'')) AND (pg.Wind <> ''Excluded'') AND 
                      (pg.Status NOT IN (''Closed'', ''Canceled''))
GROUP BY pg.Primary_Producer, pg.State, pg.Policy_Number, pg.Account_Number, pg.Account_Name, pg.Primary_Producer, pc.PrimaryProducer_Contact, 
                      pc.PrimaryProducer_Phone, pc.PrimaryProducer_Email, pg.Location, pg.Building, pg.Address, pg.Address2, pg.City, pg.State, pg.ZIP, pg.County, 
                      pg.Wind, pg.Wind_Deductible, pg.Flood_Premium, pg.Property_Elite_Flood_Exposure_Type, pg.Longitude, pg.Latitude, pg.TIV_Range
ORDER BY TIV DESC
' 
GO
