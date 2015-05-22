IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_EO_Loss_View_1]'))
DROP VIEW [dbo].[CL_EO_Loss_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_EO_Loss_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.CL_EO_Loss_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_March.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_March.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Claim_Number, dbo.Policy_Information_ALL_POLICIES_March.Productcode, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Coverage_Reporting_group, dbo.ALL_POLICIES_12_Detail_Information_1_March.Coverage_Form, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Accident_Year, dbo.ALL_POLICIES_12_Detail_Information_1_March.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_March.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_March.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_March.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Sal_Subro, dbo.ALL_POLICIES_12_Detail_Information_1_March.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Incurred_Loss_ALAE_with_SS_CatOnly, dbo.ALL_POLICIES_12_Detail_Information_1_March.Reported_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Open_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_March.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_March.Incurred_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_March.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_March.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.policy_month, dbo.ALL_POLICIES_12_Detail_Information_1_March.Type_of_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range, dbo.ALL_POLICIES_12_Detail_Information_1_March.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Premium_State, dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Breach_of_Contract_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Breach_of_Contract_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Breach_of_Fiduciary_Liability_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Breach_of_Fiduciary_Liability_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Financial_Advisor_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Financial_Advisor_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Misconduct_Count, dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Misconduct_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Wills_Estate_Count, dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Wills_Estate_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Corporate_Count, dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Corporate_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Tax_Liability_Count, dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Tax_Liability_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Violation_GAAP_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Violation_GAAP_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Negligent_Training_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Negligent_Training_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Electronic_Data_Damage_Count, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_Electronic_Data_Damage_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_All_Other_Count, dbo.ALL_POLICIES_12_Detail_Information_1_March.COL_CL_All_Other_Loss, 
                      dbo.Policy_Information_ALL_POLICIES_March.Business_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_March.Accident_State_for_join, 
                      dbo.Latest_All_Lines_View_1.statecode, dbo.Latest_All_Lines_View_1.currentearnedpremium, dbo.Latest_All_Lines_View_1.SLD_BusinessType
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_March INNER JOIN
                      dbo.Latest_All_Lines_View_1 ON dbo.ALL_POLICIES_12_Detail_Information_1_March.Policy_Number = dbo.Latest_All_Lines_View_1.policynumber INNER JOIN
                      dbo.Policy_Information_ALL_POLICIES_March ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Policy_Number = dbo.Policy_Information_ALL_POLICIES_March.policynumber
WHERE     (dbo.Latest_All_Lines_View_1.SLD_BusinessType = ''Claims Adjuster'') AND (dbo.Policy_Information_ALL_POLICIES_March.Productcode = ''CL'') AND 
                      (dbo.ALL_POLICIES_12_Detail_Information_1_March.Fiscal_AY_Year > 2008)
' 
GO
