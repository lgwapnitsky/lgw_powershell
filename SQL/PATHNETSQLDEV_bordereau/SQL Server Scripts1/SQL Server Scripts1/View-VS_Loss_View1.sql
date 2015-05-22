IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_Loss_View1]'))
DROP VIEW [dbo].[VS_Loss_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_Loss_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.VS_Loss_View1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_February.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_February.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_February.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Premium_State, dbo.ALL_POLICIES_12_Detail_Information_1_February.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Coverage_Form, dbo.ALL_POLICIES_12_Detail_Information_1_February.Accident_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_February.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Claim_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_February.Case_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Case_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_February.Paid_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Paid_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_February.Sal_Subro, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_February.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_February.Incurred_Claims, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.GL_Occurrence_Limit, dbo.Policy_Information_ALL_POLICIES_GL_February.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_February.GLDX_Indicator, 
                      dbo.Policy_Information_ALL_POLICIES_GL_February.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_February.Account_Premium_range, 
                      dbo.Policy_Information_ALL_POLICIES_February.Primary_Umbrella, dbo.Policy_Information_ALL_POLICIES_February.Written_Premium_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Driving_School, dbo.Policy_Information_ALL_POLICIES_AUTO_February.Hired_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February.Non_Owned_Auto, dbo.Policy_PATHID_Information.SubProductGroup, 
                      dbo.Policy_PATHID_Information.SubProduct
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_February INNER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_February ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Policy_Number = dbo.Policy_Information_ALL_POLICIES_GL_February.policynumber INNER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_February ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Policy_Number = dbo.Policy_Information_ALL_POLICIES_AUTO_February.policynumber LEFT OUTER JOIN
                      dbo.Policy_PATHID_Information ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Policy_Number = dbo.Policy_PATHID_Information.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_February ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_February.Policy_Number = dbo.Policy_Information_ALL_POLICIES_February.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_February.Closed_Without_Pay_Claims = 0) AND (dbo.ALL_POLICIES_12_Detail_Information_1_February.Product = ''VS'')
' 
GO
