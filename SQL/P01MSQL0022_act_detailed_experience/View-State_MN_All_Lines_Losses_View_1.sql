IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MN_All_Lines_Losses_View_1]'))
DROP VIEW [dbo].[State_MN_All_Lines_Losses_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MN_All_Lines_Losses_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_MN_All_Lines_Losses_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_November.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_November.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_November.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Coverage_Form, dbo.ALL_POLICIES_12_Detail_Information_1_November.Accident_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_November.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_November.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_November.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Sal_Subro, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_November.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Closed_Without_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Incurred_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_November.Coverage_Group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.report_year, dbo.ALL_POLICIES_12_Detail_Information_1_November.report_month, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.policy_year, dbo.ALL_POLICIES_12_Detail_Information_1_November.policy_month, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Type_of_Loss, dbo.Policy_Information_ALL_POLICIES_November.Written_Premium_Range, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Accident_State, dbo.ALL_POLICIES_12_Detail_Information_1_November.Premium_State
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_November LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_November ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Policy_Number = dbo.Policy_Information_ALL_POLICIES_November.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_November.Premium_State = ''MN'')
' 
GO
