IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_EO_Loss_View_1_ClaimAdj]'))
DROP VIEW [dbo].[CL_EO_Loss_View_1_ClaimAdj]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_EO_Loss_View_1_ClaimAdj]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.CL_EO_Loss_View_1_ClaimAdj
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_B.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_B.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_B.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Coverage_Reporting_group, dbo.ALL_POLICIES_12_Detail_Information_1_B.Coverage_Form, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Accident_Year, dbo.ALL_POLICIES_12_Detail_Information_1_B.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_B.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_B.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_B.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Sal_Subro, dbo.ALL_POLICIES_12_Detail_Information_1_B.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_B.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_B.Incurred_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_B.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_B.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.policy_month, dbo.ALL_POLICIES_12_Detail_Information_1_B.Type_of_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, dbo.ALL_POLICIES_12_Detail_Information_1_B.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Premium_State, dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Breach_of_Contract_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Breach_of_Contract_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Breach_of_Fiduciary_Liability_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Breach_of_Fiduciary_Liability_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Financial_Advisor_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Financial_Advisor_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Misconduct_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Misconduct_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Wills_Estate_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Wills_Estate_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Corporate_Count, dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Corporate_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Tax_Liability_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Tax_Liability_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Violation_GAAP_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Violation_GAAP_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Negligent_Training_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Negligent_Training_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Electronic_Data_Damage_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_Electronic_Data_Damage_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_All_Other_Count, dbo.ALL_POLICIES_12_Detail_Information_1_B.COL_CL_All_Other_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_B.Business_Desc
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_B LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Policy_Number = dbo.Policy_Information_ALL_POLICIES_B.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_B.Product = ''CL'') AND (dbo.Policy_Information_ALL_POLICIES_B.Business_Desc LIKE ''%CLAIM%'')
' 
GO
