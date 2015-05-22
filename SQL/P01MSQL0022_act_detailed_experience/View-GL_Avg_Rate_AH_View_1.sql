IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GL_Avg_Rate_AH_View_1]'))
DROP VIEW [dbo].[GL_Avg_Rate_AH_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GL_Avg_Rate_AH_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.GL_Avg_Rate_AH_View_1
AS
SELECT     dbo.Policy_Information_ALL_POLICIES_LQE.policy_effective_year, dbo.Policy_Information_ALL_POLICIES_LQE.Productcode, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.State, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Territory, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Class_Code, SUM(dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Premium) AS Premium, 
                      SUM(dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Exposure) AS Exposure, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Exposure_Adj_Fac, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Exposure_Base
FROM         dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_LQE ON 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Policy_Number = dbo.Policy_Information_ALL_POLICIES_LQE.policynumber
GROUP BY dbo.Policy_Information_ALL_POLICIES_LQE.policy_effective_year, dbo.Policy_Information_ALL_POLICIES_LQE.Productcode, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.State, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Territory, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Class_Code, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Exposure_Adj_Fac, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Exposure_Base
HAVING      (dbo.Policy_Information_ALL_POLICIES_LQE.policy_effective_year = 2009) AND (dbo.Policy_Information_ALL_POLICIES_LQE.Productcode = ''AH'') AND 
                      (dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.State IN (''OR'', ''WA''))
' 
GO
