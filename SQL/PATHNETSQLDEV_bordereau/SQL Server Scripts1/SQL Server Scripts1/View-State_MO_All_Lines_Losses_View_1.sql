IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MO_All_Lines_Losses_View_1]'))
DROP VIEW [dbo].[State_MO_All_Lines_Losses_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MO_All_Lines_Losses_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_MO_All_Lines_Losses_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_January.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_January.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_January.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Coverage_Form, dbo.ALL_POLICIES_12_Detail_Information_1_January.Accident_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_January.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Claim_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_January.Case_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Case_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_January.Paid_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Paid_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_January.Sal_Subro, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_January.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Closed_Without_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Incurred_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_January.Coverage_Group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.report_year, dbo.ALL_POLICIES_12_Detail_Information_1_January.report_month, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.policy_year, dbo.ALL_POLICIES_12_Detail_Information_1_January.policy_month, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Type_of_Loss, dbo.Policy_Information_ALL_POLICIES_January.Written_Premium_Range, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Accident_State, dbo.ALL_POLICIES_12_Detail_Information_1_January.Premium_State
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_January LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_January ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_January.Policy_Number = dbo.Policy_Information_ALL_POLICIES_January.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_January.Premium_State = ''MO'')
' 
GO
