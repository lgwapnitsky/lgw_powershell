IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Property_BM_Rates_View_1]'))
DROP VIEW [dbo].[Individual_Property_BM_Rates_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Property_BM_Rates_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Property_BM_Rates_View_1
AS
SELECT     Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Region_Description, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Account_Number, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Account_Name, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Policy_Number, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Effective_Date, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Policy_Year, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Policy_Month, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Product, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Program_Description, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.New_Renew, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Renew_Auto, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Address, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Address2, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.State, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.County, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.City, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.ZIP, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Location, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Building, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.UC, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Protection_Class, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Class_Code, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Construction, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Construction_Code, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Stories, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Construction_Year, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.TIV, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Wind, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Wind_Deductible, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Hurricane_Deductible, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Flood_Deductible, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Flood_Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Fire_Allied_Deductible, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Implied_Rate, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Implied_Rate_Excluding_EQ, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Total_Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_Fire_Benchmark_premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_Water_Benchmark_Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_OtherNC_Benchmark_Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_Hurricane_Total_Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_Reins_PerRisk_Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_Reins_Fac_Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_OtherWind_Total_Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_EQ_Total_Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_Total_Benchmark_Premium, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_Total_Benchmark_Rate, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Scoring_Total_Benchmark_Rate_Excluding_EQ, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Expiration_Date, Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Expiration_Year, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Expiration_Month, 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Expiration_Year_Month
FROM         Act_Scoring.dbo.Property_Scoring_2010_09_30_GC RIGHT OUTER JOIN
                      dbo.Individual_Accounts_for_Reports_View_1 ON 
                      Act_Scoring.dbo.Property_Scoring_2010_09_30_GC.Policy_Number = dbo.Individual_Accounts_for_Reports_View_1.policynumber
' 
GO
