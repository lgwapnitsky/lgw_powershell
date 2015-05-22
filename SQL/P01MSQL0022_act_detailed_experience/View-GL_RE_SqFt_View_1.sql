IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GL_RE_SqFt_View_1]'))
DROP VIEW [dbo].[GL_RE_SqFt_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GL_RE_SqFt_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.GL_RE_SqFt_View_1
AS
SELECT     dbo.Policy_Information_ALL_POLICIES_LQE.policy_effective_year, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Class_Code, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Exposure, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Exposure_Base
FROM         dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_LQE ON 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Policy_Number = dbo.Policy_Information_ALL_POLICIES_LQE.policynumber
WHERE     (dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Class_Code IN (''61217'', ''61216'', ''61212'', ''61218'', ''67634'')) AND 
                      (dbo.Policy_Information_ALL_POLICIES_LQE.policy_effective_year = 2009) AND 
                      (dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LQE.Exposure_Base = ''AREA'')
' 
GO
