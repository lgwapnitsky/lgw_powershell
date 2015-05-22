IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_RI_All_Lines_Losses_View_1]'))
DROP VIEW [dbo].[State_RI_All_Lines_Losses_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_RI_All_Lines_Losses_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_RI_All_Lines_Losses_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_March.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_March.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_March.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Coverage_Reporting_group, dbo.ALL_POLICIES_12_Detail_Information_1_March.Coverage_Form, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Accident_Year, dbo.ALL_POLICIES_12_Detail_Information_1_March.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_March.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_March.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_March.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Sal_Subro, dbo.ALL_POLICIES_12_Detail_Information_1_March.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Incurred_Loss_ALAE_with_SS_CatOnly, dbo.ALL_POLICIES_12_Detail_Information_1_March.Reported_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Open_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_March.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_March.Incurred_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_March.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_March.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.policy_month, dbo.ALL_POLICIES_12_Detail_Information_1_March.Type_of_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range, dbo.ALL_POLICIES_12_Detail_Information_1_March.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Premium_State
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_March LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_March ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Policy_Number = dbo.Policy_Information_ALL_POLICIES_March.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_March.Premium_State = ''RI'')
' 
GO
