IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Account_GL_Info_View_1]'))
DROP VIEW [dbo].[Large_Account_GL_Info_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Account_GL_Info_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Large_Account_GL_Info_View_1
AS
SELECT     dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Policy_Number, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.State, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Territory, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Class_Code, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Premium, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure_Adj_Fac, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Exposure_Base, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Avg_Rate, 
                      dbo.Policy_Information_ALL_POLICIES_November.accountnumber, dbo.Policy_Information_ALL_POLICIES_November.Productcode, 
                      dbo.Policy_Information_ALL_POLICIES_November.policyEffectivedate, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Class_Description, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_Premium_range
FROM         dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_November ON 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.Policy_Number = dbo.Policy_Information_ALL_POLICIES_November.policynumber
WHERE     (dbo.Policy_Information_ALL_POLICIES_November.Account_Premium_range IN (''d: $250k to $500k'', ''e: over $500k''))
' 
GO
