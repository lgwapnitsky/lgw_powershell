IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_NY_Lines_Losses_View_1]'))
DROP VIEW [dbo].[State_NY_Lines_Losses_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_NY_Lines_Losses_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_NY_Lines_Losses_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_December.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_December.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_December.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Coverage_Reporting_group, dbo.ALL_POLICIES_12_Detail_Information_1_December.Coverage_Form, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Accident_Year, dbo.ALL_POLICIES_12_Detail_Information_1_December.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_December.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_December.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_December.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Sal_Subro, dbo.ALL_POLICIES_12_Detail_Information_1_December.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_December.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_December.Incurred_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_December.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_December.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.policy_month, dbo.ALL_POLICIES_12_Detail_Information_1_December.Type_of_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_December.Written_Premium_Range, dbo.ALL_POLICIES_12_Detail_Information_1_December.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Premium_State, dbo.Policy_Information_ALL_POLICIES_December.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_December.DivisionName, dbo.Policy_Information_ALL_POLICIES_December.ProductType
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_December LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_December ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Policy_Number = dbo.Policy_Information_ALL_POLICIES_December.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_December.Premium_State = ''NY'')
' 
GO
