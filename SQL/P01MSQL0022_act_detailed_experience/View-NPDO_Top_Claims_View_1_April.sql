IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Top_Claims_View_1_April]'))
DROP VIEW [dbo].[NPDO_Top_Claims_View_1_April]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Top_Claims_View_1_April]'))
EXEC dbo.sp_executesql @statement = N'Create view dbo.NPDO_Top_Claims_View_1_April as
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_April.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_April.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_April.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_April.Claim_Desc, 
                      SUM(dbo.ALL_POLICIES_12_Detail_Information_1_April.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_April.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_April.Open_Claims, 
                      dbo.Policy_Information_FF_April.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_April.acctngyear, 
                      dbo.ALL_POLICIES_12_premium_summary_April.statecode
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_April LEFT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_April ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Premium_State = dbo.ALL_POLICIES_12_premium_summary_April.statecode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Product = dbo.ALL_POLICIES_12_premium_summary_April.productcode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Coverage_Group = dbo.ALL_POLICIES_12_premium_summary_April.Coverage_Group AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Policy_Number = dbo.ALL_POLICIES_12_premium_summary_April.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_FF_April ON dbo.ALL_POLICIES_12_Detail_Information_1_April.Policy_Number = dbo.Policy_Information_FF_April.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_April.Fiscal_AY_Year > 2008)
GROUP BY dbo.ALL_POLICIES_12_Detail_Information_1_April.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_April.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_April.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_April.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_April.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_April.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_April.Open_Claims, 
                      dbo.Policy_Information_FF_April.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_April.acctngyear, 
                      dbo.ALL_POLICIES_12_premium_summary_April.statecode
HAVING      (dbo.ALL_POLICIES_12_Detail_Information_1_April.Product = ''FF'') AND (NOT (dbo.ALL_POLICIES_12_premium_summary_April.statecode IN (''NY'', ''CA'')))' 
GO
