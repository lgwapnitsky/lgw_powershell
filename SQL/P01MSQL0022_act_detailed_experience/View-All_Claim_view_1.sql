IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Claim_view_1]'))
DROP VIEW [dbo].[All_Claim_view_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Claim_view_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.All_Claim_view_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_C.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_C.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_C.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Coverage_Reporting_group, dbo.ALL_POLICIES_12_Detail_Information_1_C.Coverage_Form, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Accident_Year, dbo.ALL_POLICIES_12_Detail_Information_1_C.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_C.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_C.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_C.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Sal_Subro, dbo.ALL_POLICIES_12_Detail_Information_1_C.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_C.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_C.Incurred_Claims, 
                      dbo.ALL_CLAIMS_12_Information_1_C.Claim_Incurred_Loss_Range, dbo.ALL_CLAIMS_12_Information_1_C.Max_Incurred_Loss_Range, 
                      dbo.ALL_CLAIMS_12_Information_1_C.Incurred_Loss_18_months, dbo.Policy_Information_ALL_POLICIES_C.FF_EPL_Num_of_Employees_Range, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_C.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_C.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.policy_month, AccessPhlyEom.dbo.ExperienceProducts.CorporateLOB, 
                      AccessPhlyEom.dbo.ExperienceProducts.BusinessSegment, AccessPhlyEom.dbo.ExperienceProducts.ProductGroupLOB, 
                      AccessPhlyEom.dbo.ExperienceProducts.UnderwritingLOB, AccessPhlyEom.dbo.ExperienceProducts.ReservingLOB, 
                      dbo.Policy_Information_ALL_POLICIES_C.PVCD_PVEPL_Num_of_Employees, dbo.ALL_CLAIMS_12_Information_1_C.Incurred_Loss_6_months, 
                      dbo.ALL_CLAIMS_12_Information_1_C.Incurred_Loss_30_months, dbo.ALL_POLICIES_12_Detail_Information_1_C.Loss_Evaluation_Month, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Loss_Evaluation_Year
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_C LEFT OUTER JOIN
                      AccessPhlyEom.dbo.ExperienceProducts ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Exp_product = AccessPhlyEom.dbo.ExperienceProducts.ExperienceProduct LEFT OUTER JOIN
                      dbo.ALL_CLAIMS_12_Information_1_C ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Claim_Number = dbo.ALL_CLAIMS_12_Information_1_C.Claimnumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_C ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_C.Policy_Number = dbo.Policy_Information_ALL_POLICIES_C.policynumber
' 
GO
