IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_PA_Lines_Losses_View_1]'))
DROP VIEW [dbo].[State_PA_Lines_Losses_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_PA_Lines_Losses_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_PA_Lines_Losses_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_October.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_October.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_October.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Coverage_Reporting_group, dbo.ALL_POLICIES_12_Detail_Information_1_October.Coverage_Form, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Accident_Year, dbo.ALL_POLICIES_12_Detail_Information_1_October.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_October.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_October.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_October.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Sal_Subro, dbo.ALL_POLICIES_12_Detail_Information_1_October.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Incurred_Loss_ALAE_with_SS_CatOnly, dbo.ALL_POLICIES_12_Detail_Information_1_October.Reported_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Open_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_October.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_October.Incurred_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_October.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_October.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.policy_month, dbo.ALL_POLICIES_12_Detail_Information_1_October.Type_of_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_October.Written_Premium_Range, dbo.ALL_POLICIES_12_Detail_Information_1_October.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Premium_State, dbo.Policy_Information_ALL_POLICIES_October.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_October.DivisionName, dbo.Policy_Information_ALL_POLICIES_October.ProductType
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_October LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_October ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Policy_Number = dbo.Policy_Information_ALL_POLICIES_October.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_October.Premium_State = ''PA'')
' 
GO
