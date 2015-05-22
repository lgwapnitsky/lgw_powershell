IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Account_GL_Class_Rates_View_2]'))
DROP VIEW [dbo].[Individual_Account_GL_Class_Rates_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Account_GL_Class_Rates_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Account_GL_Class_Rates_View_2
AS
SELECT     dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Policy_Number, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.State, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Effective_Date, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Expiration_Date, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Territory, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Class_Code, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Premium, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure_Adj_Fac, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure_Adj_Type, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure_Base, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Product, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Class_Description, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Avg_Rate, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Avg_Rate_Range, 
                      YEAR(dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Effective_Date) AS Effective_Year, 
                      dbo.Individual_Accounts_for_Reports_View_1.accountnumber
FROM         dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November RIGHT OUTER JOIN
                      dbo.Individual_Accounts_for_Reports_View_1 ON 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Policy_Number = dbo.Individual_Accounts_for_Reports_View_1.policynumber
GROUP BY dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Policy_Number, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.State, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Effective_Date, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Territory, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Class_Code, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Premium, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure_Adj_Fac, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure_Adj_Type, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure_Base, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Product, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Class_Description, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Avg_Rate, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Avg_Rate_Range, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Expiration_Date, dbo.Individual_Accounts_for_Reports_View_1.accountnumber
' 
GO
