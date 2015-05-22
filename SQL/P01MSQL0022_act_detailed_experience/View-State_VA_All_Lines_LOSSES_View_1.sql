IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_VA_All_Lines_LOSSES_View_1]'))
DROP VIEW [dbo].[State_VA_All_Lines_LOSSES_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_VA_All_Lines_LOSSES_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_VA_All_Lines_LOSSES_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_April.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_April.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_April.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Coverage_Reporting_group, dbo.ALL_POLICIES_12_Detail_Information_1_April.Coverage_Form, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Accident_Year, dbo.ALL_POLICIES_12_Detail_Information_1_April.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_April.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_April.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_April.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Sal_Subro, dbo.ALL_POLICIES_12_Detail_Information_1_April.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Incurred_Loss_ALAE_with_SS_CatOnly, dbo.ALL_POLICIES_12_Detail_Information_1_April.Reported_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Open_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_April.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_April.Incurred_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_April.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_April.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.policy_month, dbo.ALL_POLICIES_12_Detail_Information_1_April.Type_of_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_April.Written_Premium_Range, dbo.ALL_POLICIES_12_Detail_Information_1_April.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Premium_State
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_April LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_April ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Policy_Number = dbo.Policy_Information_ALL_POLICIES_April.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_April.Premium_State = ''VA'') AND (dbo.ALL_POLICIES_12_Detail_Information_1_April.Coverage_Reporting_group = ''gl'') 
                      AND (dbo.ALL_POLICIES_12_Detail_Information_1_April.Product <> ''%u'')
' 
GO
