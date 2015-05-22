IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_Exhibits_View2_Loss]'))
DROP VIEW [dbo].[PVCD_Exhibits_View2_Loss]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_Exhibits_View2_Loss]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PVCD_Exhibits_View2_Loss
AS
SELECT     dbo.Policy_Information_ALL_POLICIES.Productcode, dbo.Policy_Information_ALL_POLICIES.accountnumber, 
                      dbo.ALL_POLICIES_15_Detail_Information_1_C.Loss_Evaluation_Year, dbo.ALL_POLICIES_15_Detail_Information_1_C.Loss_Evaluation_Month, 
                      dbo.ALL_POLICIES_15_Detail_Information_1_C.Claim_Number, dbo.Policy_Information_ALL_POLICIES.policynumber, 
                      dbo.ALL_POLICIES_15_Detail_Information_1_C.company, dbo.ALL_POLICIES_15_Detail_Information_1_C.Accident_Year, 
                      dbo.ALL_POLICIES_15_Detail_Information_1_C.Claim_Desc, SUM(dbo.ALL_POLICIES_15_Detail_Information_1_C.Incurred_Loss_ALAE_with_SS) 
                      AS Incurred_Loss_ALAE_with_SS, dbo.ALL_POLICIES_15_Detail_Information_1_C.Coverage_Group, 
                      dbo.ALL_POLICIES_15_Detail_Information_1_C.Coverage_Reporting_group, dbo.Policy_Information_ALL_POLICIES.PVCD_PVEPL_Num_of_Employees,
                       dbo.ALL_POLICIES_15_Detail_Information_1_C.Premium_State, dbo.Policy_Information_ALL_POLICIES.policyEffectivedate, 
                      dbo.Policy_Information_ALL_POLICIES.Written_Premium_Range
FROM         dbo.Policy_Information_ALL_POLICIES RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_15_Detail_Information_1_C ON 
                      dbo.Policy_Information_ALL_POLICIES.policynumber = dbo.ALL_POLICIES_15_Detail_Information_1_C.Policy_Number
GROUP BY dbo.Policy_Information_ALL_POLICIES.Productcode, dbo.Policy_Information_ALL_POLICIES.accountnumber, 
                      dbo.ALL_POLICIES_15_Detail_Information_1_C.Loss_Evaluation_Year, dbo.ALL_POLICIES_15_Detail_Information_1_C.Loss_Evaluation_Month, 
                      dbo.ALL_POLICIES_15_Detail_Information_1_C.Claim_Number, dbo.Policy_Information_ALL_POLICIES.policynumber, 
                      dbo.ALL_POLICIES_15_Detail_Information_1_C.company, dbo.ALL_POLICIES_15_Detail_Information_1_C.Accident_Year, 
                      dbo.ALL_POLICIES_15_Detail_Information_1_C.Claim_Desc, dbo.ALL_POLICIES_15_Detail_Information_1_C.Coverage_Group, 
                      dbo.ALL_POLICIES_15_Detail_Information_1_C.Coverage_Reporting_group, dbo.Policy_Information_ALL_POLICIES.PVCD_PVEPL_Num_of_Employees,
                       dbo.ALL_POLICIES_15_Detail_Information_1_C.Premium_State, dbo.Policy_Information_ALL_POLICIES.policyEffectivedate, 
                      dbo.Policy_Information_ALL_POLICIES.Written_Premium_Range
HAVING      (dbo.Policy_Information_ALL_POLICIES.Productcode IN (''PV'', ''CD''))
' 
GO
