IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HF_View_1_Test]'))
DROP VIEW [dbo].[HF_View_1_Test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HF_View_1_Test]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.HF_View_1_Test
AS
SELECT     dbo.Policy_Information_Underwriting_Check_List_C.Athletic_Participants_YN, dbo.Policy_Information_Underwriting_Check_List_C.Camps_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Day_Care_Ops_YN, dbo.Policy_Information_Underwriting_Check_List_C.Tanning_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Number_of_Swimming_Pools_Range, dbo.ALL_POLICIES_12_premium_summary_C.policynumber,
                       dbo.ALL_POLICIES_12_premium_summary_C.Coverage_Reporting_group, dbo.ALL_POLICIES_12_premium_summary_C.productcode, 
                      dbo.ALL_POLICIES_12_premium_summary_C.Fiscal_AY_Month_Ending, dbo.ALL_POLICIES_12_premium_summary_C.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined
FROM         dbo.Policy_Information_Underwriting_Check_List_C RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_C ON 
                      dbo.Policy_Information_Underwriting_Check_List_C.policynumber = dbo.ALL_POLICIES_12_premium_summary_C.policynumber
WHERE     (dbo.ALL_POLICIES_12_premium_summary_C.productcode = ''hf'')
GROUP BY dbo.Policy_Information_Underwriting_Check_List_C.Athletic_Participants_YN, dbo.Policy_Information_Underwriting_Check_List_C.Camps_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Day_Care_Ops_YN, dbo.Policy_Information_Underwriting_Check_List_C.Tanning_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_C.Number_of_Swimming_Pools_Range, dbo.ALL_POLICIES_12_premium_summary_C.policynumber,
                       dbo.ALL_POLICIES_12_premium_summary_C.Coverage_Reporting_group, dbo.ALL_POLICIES_12_premium_summary_C.productcode, 
                      dbo.ALL_POLICIES_12_premium_summary_C.Fiscal_AY_Month_Ending, dbo.ALL_POLICIES_12_premium_summary_C.Fiscal_AY_Year
' 
GO
