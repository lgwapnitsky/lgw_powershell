IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Producer_LOSSES_View_1]'))
DROP VIEW [dbo].[Producer_LOSSES_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Producer_LOSSES_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Producer_LOSSES_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_June.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_June.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_June.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Coverage_Reporting_group, dbo.ALL_POLICIES_12_Detail_Information_1_June.Coverage_Form, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Accident_Year, dbo.ALL_POLICIES_12_Detail_Information_1_June.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_June.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_June.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_June.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Sal_Subro, dbo.ALL_POLICIES_12_Detail_Information_1_June.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_June.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_June.Incurred_Claims, 
                      dbo.Policy_Information_ALL_POLICIES_June.Endorsement_GLDX_YN, dbo.Policy_Information_ALL_POLICIES_June.Property_Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_June.Account_Premium_range, dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_June.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_June.SAM_Form_Group, dbo.ALL_POLICIES_12_Detail_Information_1_June.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Premium_State, dbo.Policy_Information_ALL_POLICIES_June.PIC_Producer_code, 
                      dbo.Policy_Information_ALL_POLICIES_June.PIC_Producer, dbo.Policy_Information_ALL_POLICIES_June.PIC_Producer_type, 
                      dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer, dbo.Policy_Information_ALL_POLICIES_June.Count_of_Account_Numbers_Range, 
                      dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer_code
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_June LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_June ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Policy_Number = dbo.Policy_Information_ALL_POLICIES_June.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_June ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Policy_Number = dbo.Policy_Information_ALL_POLICIES_GL_June.policynumber
WHERE     (dbo.Policy_Information_ALL_POLICIES_June.Primary_Producer_code = 16245)
' 
GO
