IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_EO_Loss_ClaimsAdjuster_View_1]'))
DROP VIEW [dbo].[CL_EO_Loss_ClaimsAdjuster_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_EO_Loss_ClaimsAdjuster_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.CL_EO_Loss_ClaimsAdjuster_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_June.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_June.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Claim_Number, dbo.Policy_Information_ALL_POLICIES_June.Productcode, 
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
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_June.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_June.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.policy_month, dbo.ALL_POLICIES_12_Detail_Information_1_June.Type_of_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_June.Written_Premium_Range, dbo.ALL_POLICIES_12_Detail_Information_1_June.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Premium_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Breach_of_Contract_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Breach_of_Contract_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Breach_of_Fiduciary_Liability_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Breach_of_Fiduciary_Liability_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Financial_Advisor_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Financial_Advisor_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Misconduct_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Misconduct_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Wills_Estate_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Wills_Estate_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Corporate_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Corporate_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Tax_Liability_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Tax_Liability_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Violation_GAAP_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Violation_GAAP_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Negligent_Training_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Negligent_Training_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Electronic_Data_Damage_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_Electronic_Data_Damage_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_All_Other_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.COL_CL_All_Other_Loss, dbo.Policy_Information_ALL_POLICIES_June.Business_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Accident_State_for_join
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_June LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_June ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Policy_Number = dbo.Policy_Information_ALL_POLICIES_June.policynumber
WHERE     (dbo.Policy_Information_ALL_POLICIES_June.Productcode = ''CL'') AND 
                      (dbo.Policy_Information_ALL_POLICIES_June.Business_Desc = ''Claims adjuster'')
' 
GO
