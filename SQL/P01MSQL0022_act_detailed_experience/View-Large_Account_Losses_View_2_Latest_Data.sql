IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Account_Losses_View_2_Latest_Data]'))
DROP VIEW [dbo].[Large_Account_Losses_View_2_Latest_Data]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Account_Losses_View_2_Latest_Data]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Large_Account_Losses_View_2_Latest_Data
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
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Incurred_Claims, dbo.Policy_Information_ALL_POLICIES_November.Endorsement_GLDX_YN, 
                      dbo.Policy_Information_ALL_POLICIES_November.Property_Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_Premium_range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_November.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_November.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_November.SAM_Form_Group, dbo.ALL_POLICIES_12_Detail_Information_1_November.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Accident_State_for_join, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Premium_State, dbo.Policy_Information_ALL_POLICIES_November.DivisionName, 
                      dbo.Policy_Information_ALL_POLICIES_November.ProductType
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_November LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_November ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Policy_Number = dbo.Policy_Information_ALL_POLICIES_November.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_November ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_November.Policy_Number = dbo.Policy_Information_ALL_POLICIES_GL_November.policynumber
WHERE     (dbo.Policy_Information_ALL_POLICIES_November.Account_Premium_range IN (''d: $250k to $500k'', ''e: over $500k''))
' 
GO
