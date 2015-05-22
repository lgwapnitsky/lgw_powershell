IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Account_Losses_View_2_Foresters]'))
DROP VIEW [dbo].[Individual_Account_Losses_View_2_Foresters]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Account_Losses_View_2_Foresters]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Account_Losses_View_2_Foresters
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_October.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_October.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_October.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Coverage_Form, dbo.ALL_POLICIES_12_Detail_Information_1_October.Accident_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_October.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Claim_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_October.Case_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Case_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_October.Paid_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Paid_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_October.Sal_Subro, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_October.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Closed_Without_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Incurred_Claims, dbo.Policy_Information_ALL_POLICIES_October.Endorsement_GLDX_YN, 
                      dbo.Policy_Information_ALL_POLICIES_October.Property_Coverage_Form, dbo.Policy_Information_ALL_POLICIES_October.Account_Premium_range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.GL_Occurrence_Limit, dbo.Policy_Information_ALL_POLICIES_GL_October.GL_Aggregate_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.GL_Deductible, dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_Agg_Limit, dbo.Policy_Information_ALL_POLICIES_GL_October.SAM_Form_Group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Accident_State, dbo.ALL_POLICIES_12_Detail_Information_1_October.Premium_State
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_October RIGHT OUTER JOIN
                      dbo.Individual_Accounts_for_Reports_View_1_Foresters ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Policy_Number = dbo.Individual_Accounts_for_Reports_View_1_Foresters.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_October ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Policy_Number = dbo.Policy_Information_ALL_POLICIES_October.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_October ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Policy_Number = dbo.Policy_Information_ALL_POLICIES_GL_October.policynumber
' 
GO
