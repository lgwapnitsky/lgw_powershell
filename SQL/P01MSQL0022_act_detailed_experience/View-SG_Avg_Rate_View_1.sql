IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SG_Avg_Rate_View_1]'))
DROP VIEW [dbo].[SG_Avg_Rate_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SG_Avg_Rate_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.SG_Avg_Rate_View_1
AS
SELECT     dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Policy_Number, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Effective_Date, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Expiration_Date, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.State, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Territory, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Class_Code, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Premium, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Exposure, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Exposure_Adj_Fac, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Exposure_Adj_Type, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Exposure_Base, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.GL_Territory_Dominant, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.GL_Dom_Terr_Description, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.GL_Dom_Region_in_State, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Product, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Class_Description, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Avg_Rate, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Avg_Rate_Range, dbo.ALL_POLICIES_12_premium_summary_February.productcode, 
                      dbo.ALL_POLICIES_12_premium_summary_February.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_February.Coverage_Reporting_group
FROM         dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February INNER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_February ON 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Policy_Number = dbo.ALL_POLICIES_12_premium_summary_February.policynumber
WHERE     (dbo.ALL_POLICIES_12_premium_summary_February.productcode = ''SG'') AND 
                      (dbo.ALL_POLICIES_12_premium_summary_February.Fiscal_AY_Year = 2011) AND 
                      (dbo.ALL_POLICIES_12_premium_summary_February.Coverage_Reporting_group = ''GL'') AND 
                      (dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_February.Class_Code IN (''91127'', ''91130''))
' 
GO
