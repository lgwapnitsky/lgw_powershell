IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AE_SPSS_Data_Step_4_View_1]'))
DROP VIEW [dbo].[AE_SPSS_Data_Step_4_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AE_SPSS_Data_Step_4_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.AE_SPSS_Data_Step_4_View_1
AS
SELECT     dbo.AE_SPSS_Data_Step_3_View_1.*
FROM         dbo.AE_SPSS_Data_Step_3_View_1
' 
GO
