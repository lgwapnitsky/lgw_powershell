IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GENERAL_LIABILITY_Loss_View_2]'))
DROP VIEW [dbo].[GENERAL_LIABILITY_Loss_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GENERAL_LIABILITY_Loss_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.GENERAL_LIABILITY_Loss_View_2
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_January.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_January.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_January.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Premium_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Coverage_Form, dbo.ALL_POLICIES_12_Detail_Information_1_January.Accident_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_January.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Claim_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_January.Case_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Case_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_January.Paid_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Paid_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_January.Sal_Subro, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_January.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Closed_Without_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Incurred_Claims, dbo.Policy_Information_ALL_POLICIES_GL_January.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_January.GL_Deductible, dbo.Policy_Information_ALL_POLICIES_GL_January.SAM_OCC_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_January.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_January.SAM_Form_Group, 
                      dbo.Policy_Information_ALL_POLICIES_January.Account_Premium_range, dbo.Policy_Information_ALL_POLICIES_January.Primary_Umbrella, 
                      dbo.Policy_Information_ALL_POLICIES_January.Written_Premium_Range
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_January LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_January ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Policy_Number = dbo.Policy_Information_ALL_POLICIES_GL_January.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_January ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Policy_Number = dbo.Policy_Information_ALL_POLICIES_January.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_January.Coverage_Reporting_group = ''GL'') AND 
                      (dbo.ALL_POLICIES_12_Detail_Information_1_January.Closed_Without_Pay_Claims = 0) AND 
                      (dbo.ALL_POLICIES_12_Detail_Information_1_January.Premium_State = ''VA'')
' 
GO
