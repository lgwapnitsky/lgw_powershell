IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_TN_Lines_Losses_View_1]'))
DROP VIEW [dbo].[State_TN_Lines_Losses_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_TN_Lines_Losses_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_TN_Lines_Losses_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_May.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_May.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_May.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Coverage_Reporting_group, dbo.ALL_POLICIES_12_Detail_Information_1_May.Coverage_Form, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Accident_Year, dbo.ALL_POLICIES_12_Detail_Information_1_May.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_May.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_May.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_May.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Sal_Subro, dbo.ALL_POLICIES_12_Detail_Information_1_May.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_May.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_May.Incurred_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_May.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_May.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.policy_month, dbo.ALL_POLICIES_12_Detail_Information_1_May.Type_of_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_May.Written_Premium_Range, dbo.ALL_POLICIES_12_Detail_Information_1_May.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Premium_State
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_May LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_May ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Policy_Number = dbo.Policy_Information_ALL_POLICIES_May.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_May.Premium_State = ''TN'')
' 
GO
