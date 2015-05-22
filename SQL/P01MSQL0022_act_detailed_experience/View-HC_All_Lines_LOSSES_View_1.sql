IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HC_All_Lines_LOSSES_View_1]'))
DROP VIEW [dbo].[HC_All_Lines_LOSSES_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HC_All_Lines_LOSSES_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.HC_All_Lines_LOSSES_View_1
AS
SELECT     v1.accountnumber, v1.Policy_Number, v1.Claim_Number, v1.productcode, v1.Coverage_Reporting_group, v1.Coverage_Form, v1.Accident_Year, 
                      v1.Fiscal_AY_Year, v1.Type_of_Loss_Desc, v1.Claim_Desc, v1.Case_Loss, v1.Case_ALAE, v1.Paid_Loss, v1.Paid_ALAE, v1.Sal_Subro, 
                      v1.Incurred_Loss_ALAE_with_SS, v1.Incurred_Loss_ALAE_with_SS_NonCat, v1.Incurred_Loss_ALAE_with_SS_CatOnly, v1.Reported_Claims, 
                      v1.Open_Claims, v1.Closed_With_Pay_Claims, v1.Closed_Without_Pay_Claims, v1.Incurred_Claims, v1.Coverage_Group, v1.report_year, 
                      v1.report_month, v1.policy_year, v1.policy_month, v1.Type_of_Loss, v1.Written_Premium_Range, v1.Accident_State, cs.aslobcode, cs.sublinecode, 
                      LTRIM(RTRIM(cs.classcode)) AS classcode, cs.coveragecode
FROM         dbo.Latest_All_Lines_Losses_View_1 AS v1 LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_December AS pol ON v1.Policy_Number = pol.policynumber LEFT OUTER JOIN
                      AccessPHLYEOM.dbo.claimsummary AS cs ON v1.Claim_Number = cs.claimnumber
WHERE     (v1.Fiscal_AY_Year >= 2005) AND (v1.productcode = ''HC'')
' 
GO
