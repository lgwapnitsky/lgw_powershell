IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_LOSSES_view_1]'))
DROP VIEW [dbo].[All_Policies_All_LOB_LOSSES_view_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_LOSSES_view_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.All_Policies_All_LOB_LOSSES_view_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_C.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_C.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_C.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Coverage_Reporting_group, dbo.ALL_POLICIES_12_Detail_Information_1_C.Coverage_Form, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Accident_Year, dbo.ALL_POLICIES_12_Detail_Information_1_C.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_C.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_C.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_C.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Sal_Subro, dbo.ALL_POLICIES_12_Detail_Information_1_C.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_C.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_C.Incurred_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_C.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_C.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.policy_month, dbo.ALL_POLICIES_12_Detail_Information_1_C.Type_of_Loss
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_C LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_C ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Policy_Number = dbo.Policy_Information_ALL_POLICIES_C.policynumber
' 
GO
