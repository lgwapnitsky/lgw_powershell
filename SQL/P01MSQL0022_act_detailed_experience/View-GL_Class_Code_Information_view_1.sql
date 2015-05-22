IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GL_Class_Code_Information_view_1]'))
DROP VIEW [dbo].[GL_Class_Code_Information_view_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GL_Class_Code_Information_view_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.GL_Class_Code_Information_view_1
AS
SELECT     dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Policy_Number, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.State, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Territory, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Class_Code, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Premium, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure_Adj_Fac, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Exposure_Base, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Avg_Rate, dbo.Policy_Information_ALL_POLICIES_October.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_October.Productcode, dbo.Policy_Information_ALL_POLICIES_October.policyEffectivedate, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Class_Description
FROM         dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_October ON 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_October.Policy_Number = dbo.Policy_Information_ALL_POLICIES_October.policynumber
' 
GO
