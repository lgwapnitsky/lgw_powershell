IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Account_LOSSES_View_2]'))
DROP VIEW [dbo].[Large_Account_LOSSES_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Account_LOSSES_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Large_Account_LOSSES_View_2
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_August.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_August.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_August.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Coverage_Form, dbo.ALL_POLICIES_12_Detail_Information_1_August.Accident_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_August.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Claim_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_August.Case_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Case_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_August.Paid_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Paid_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_August.Sal_Subro, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_August.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Closed_Without_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Incurred_Claims, dbo.Policy_Information_ALL_POLICIES_August.Endorsement_GLDX_YN, 
                      dbo.Policy_Information_ALL_POLICIES_August.Property_Coverage_Form, dbo.Policy_Information_ALL_POLICIES_August.Account_Premium_range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Occurrence_Limit, dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Aggregate_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.GL_Deductible, dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_GL_August.SAM_Form_Group, 
                      dbo.Policy_Information_ALL_POLICIES_August.DivisionName, dbo.Policy_Information_ALL_POLICIES_August.ProductType
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_August LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_August ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Policy_Number = dbo.Policy_Information_ALL_POLICIES_August.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_August ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Policy_Number = dbo.Policy_Information_ALL_POLICIES_GL_August.policynumber
WHERE     (dbo.Policy_Information_ALL_POLICIES_August.Account_Premium_range IN (''d: $250k to $500k'', ''e: over $500k''))
' 
GO
