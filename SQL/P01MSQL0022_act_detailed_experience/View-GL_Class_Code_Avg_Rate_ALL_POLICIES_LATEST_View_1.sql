IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GL_Class_Code_Avg_Rate_ALL_POLICIES_LATEST_View_1]'))
DROP VIEW [dbo].[GL_Class_Code_Avg_Rate_ALL_POLICIES_LATEST_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GL_Class_Code_Avg_Rate_ALL_POLICIES_LATEST_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_LATEST_View_1
AS
SELECT     dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November.*
FROM         dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_November
' 
GO
