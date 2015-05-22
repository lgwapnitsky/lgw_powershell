IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[UW_CheckList_Test_View_1]'))
DROP VIEW [dbo].[UW_CheckList_Test_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[UW_CheckList_Test_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.UW_CheckList_Test_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_C.policynumber, dbo.ALL_POLICIES_12_premium_summary_C.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_C.productcode, dbo.ALL_POLICIES_12_premium_summary_C.Fiscal_AY_Month_Ending, 
                      dbo.ALL_POLICIES_12_premium_summary_C.Fiscal_AY_Year, SUM(dbo.ALL_POLICIES_12_premium_summary_C.currentwrittenpremium) 
                      AS currentwrittenpremium, SUM(dbo.ALL_POLICIES_12_premium_summary_C.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.ALL_POLICIES_12_premium_summary_C.statecode, dbo.Policy_Information_Underwriting_Check_List_C.Life_Safety_Requirements_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Hired_Exposure_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Number_of_Buildings_Greater_than_3_Stories_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Fleet_Size_Range
FROM         dbo.Policy_Information_Underwriting_Check_List_C RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_C ON 
                      dbo.Policy_Information_Underwriting_Check_List_C.policynumber = dbo.ALL_POLICIES_12_premium_summary_C.policynumber
WHERE     (dbo.ALL_POLICIES_12_premium_summary_C.productcode = ''FP'')
GROUP BY dbo.ALL_POLICIES_12_premium_summary_C.policynumber, dbo.ALL_POLICIES_12_premium_summary_C.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_C.productcode, dbo.ALL_POLICIES_12_premium_summary_C.Fiscal_AY_Month_Ending, 
                      dbo.ALL_POLICIES_12_premium_summary_C.Fiscal_AY_Year, dbo.ALL_POLICIES_12_premium_summary_C.statecode, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Life_Safety_Requirements_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Hired_Exposure_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Number_of_Buildings_Greater_than_3_Stories_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Fleet_Size_Range
' 
GO
