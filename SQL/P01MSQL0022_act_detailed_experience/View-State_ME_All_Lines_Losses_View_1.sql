IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_ME_All_Lines_Losses_View_1]'))
DROP VIEW [dbo].[State_ME_All_Lines_Losses_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_ME_All_Lines_Losses_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_ME_All_Lines_Losses_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_September.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_September.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_September.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Coverage_Form, dbo.ALL_POLICIES_12_Detail_Information_1_September.Accident_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_September.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_September.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_September.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Sal_Subro, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_September.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Closed_Without_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Incurred_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_September.Coverage_Group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.report_year, dbo.ALL_POLICIES_12_Detail_Information_1_September.report_month, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.policy_year, dbo.ALL_POLICIES_12_Detail_Information_1_September.policy_month, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Type_of_Loss, dbo.Policy_Information_ALL_POLICIES_September.Written_Premium_Range, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Premium_State
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_September LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_September ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Policy_Number = dbo.Policy_Information_ALL_POLICIES_September.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_September.Premium_State = ''ME'')
' 
GO
