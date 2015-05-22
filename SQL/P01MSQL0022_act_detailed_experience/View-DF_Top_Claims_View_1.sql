IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DF_Top_Claims_View_1]'))
DROP VIEW [dbo].[DF_Top_Claims_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DF_Top_Claims_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.DF_Top_Claims_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_May.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_May.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_May.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_May.Claim_Desc, 
                      SUM(dbo.ALL_POLICIES_12_Detail_Information_1_May.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_May.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_May.Open_Claims, 
                      dbo.Policy_Information_FF_May.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_May.acctngyear
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_May LEFT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_May ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Premium_State = dbo.ALL_POLICIES_12_premium_summary_May.statecode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Product = dbo.ALL_POLICIES_12_premium_summary_May.productcode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Coverage_Group = dbo.ALL_POLICIES_12_premium_summary_May.Coverage_Group AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Policy_Number = dbo.ALL_POLICIES_12_premium_summary_May.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_FF_May ON dbo.ALL_POLICIES_12_Detail_Information_1_May.Policy_Number = dbo.Policy_Information_FF_May.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_May.Fiscal_AY_Year > 2008)
GROUP BY dbo.ALL_POLICIES_12_Detail_Information_1_May.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_May.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_May.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_May.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_May.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_May.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_May.Open_Claims, 
                      dbo.Policy_Information_FF_May.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_May.acctngyear
HAVING      (dbo.ALL_POLICIES_12_Detail_Information_1_May.Product = ''DF'')
' 
GO
