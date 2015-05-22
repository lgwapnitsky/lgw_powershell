IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Account_GL_Class_Rates_View_2_Foresters]'))
DROP VIEW [dbo].[Individual_Account_GL_Class_Rates_View_2_Foresters]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Account_GL_Class_Rates_View_2_Foresters]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Account_GL_Class_Rates_View_2_Foresters
AS
SELECT     dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Policy_Number, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.State, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Effective_Date, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Expiration_Date, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Territory, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Class_Code, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Premium, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure_Adj_Fac, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure_Adj_Type, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure_Base, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Product, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Class_Description, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Avg_Rate, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Avg_Rate_Range, 
                      YEAR(dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Effective_Date) AS Effective_Year, 
                      dbo.Individual_Accounts_for_Reports_View_1_Foresters.accountnumber, dbo.Individual_Accounts_for_Reports_View_1_Foresters.Companycode, 
                      dbo.Individual_Accounts_for_Reports_View_1_Foresters.Source_Detail_Name
FROM         dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October RIGHT OUTER JOIN
                      dbo.Individual_Accounts_for_Reports_View_1_Foresters ON 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Policy_Number = dbo.Individual_Accounts_for_Reports_View_1_Foresters.policynumber
GROUP BY dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Policy_Number, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.State, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Effective_Date, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Territory, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Class_Code, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Premium, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure_Adj_Fac, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure_Adj_Type, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure_Base, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Product, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Class_Description, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Avg_Rate, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Avg_Rate_Range, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Expiration_Date, dbo.Individual_Accounts_for_Reports_View_1_Foresters.accountnumber, 
                      dbo.Individual_Accounts_for_Reports_View_1_Foresters.Companycode, dbo.Individual_Accounts_for_Reports_View_1_Foresters.Source_Detail_Name
' 
GO
