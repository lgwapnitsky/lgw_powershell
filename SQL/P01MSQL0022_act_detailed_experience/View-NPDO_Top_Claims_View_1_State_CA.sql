IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Top_Claims_View_1_State_CA]'))
DROP VIEW [dbo].[NPDO_Top_Claims_View_1_State_CA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Top_Claims_View_1_State_CA]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.NPDO_Top_Claims_View_1_State_CA
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_August.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_August.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_August.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_August.Claim_Desc, 
                      SUM(dbo.ALL_POLICIES_12_Detail_Information_1_August.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_August.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_August.Open_Claims, 
                      dbo.Policy_Information_FF_August.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_August.acctngyear, 
                      dbo.ALL_POLICIES_12_premium_summary_August.statecode, dbo.Policy_Information_FF_August.FF_EPL_Num_of_Employees_Range
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_August LEFT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_August ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Premium_State = dbo.ALL_POLICIES_12_premium_summary_August.statecode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Product = dbo.ALL_POLICIES_12_premium_summary_August.productcode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Coverage_Group = dbo.ALL_POLICIES_12_premium_summary_August.Coverage_Group AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Policy_Number = dbo.ALL_POLICIES_12_premium_summary_August.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_FF_August ON dbo.ALL_POLICIES_12_Detail_Information_1_August.Policy_Number = dbo.Policy_Information_FF_August.policynumber
GROUP BY dbo.ALL_POLICIES_12_Detail_Information_1_August.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_August.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_August.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_August.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_August.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_August.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_August.Open_Claims, 
                      dbo.Policy_Information_FF_August.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_August.acctngyear, 
                      dbo.ALL_POLICIES_12_premium_summary_August.statecode, dbo.Policy_Information_FF_August.FF_EPL_Num_of_Employees_Range
HAVING      (dbo.ALL_POLICIES_12_premium_summary_August.statecode = ''CA'') AND (dbo.ALL_POLICIES_12_Detail_Information_1_August.Fiscal_AY_Year > 2007) AND 
                      (dbo.ALL_POLICIES_12_Detail_Information_1_August.Product = ''ff'') AND 
                      (dbo.Policy_Information_FF_August.FF_EPL_Num_of_Employees_Range = ''c: Below 50 Employees'')
' 
GO
