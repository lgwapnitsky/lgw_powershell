IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FLOOD_Top_Claims_View_1]'))
DROP VIEW [dbo].[FLOOD_Top_Claims_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FLOOD_Top_Claims_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.FLOOD_Top_Claims_View_1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_October.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_October.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_October.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_October.Claim_Desc, 
                      SUM(dbo.ALL_POLICIES_12_Detail_Information_1_October.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_October.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_October.Open_Claims, 
                      dbo.Policy_Information_FF_October.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_October.acctngyear
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_October LEFT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_October ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Premium_State = dbo.ALL_POLICIES_12_premium_summary_October.statecode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Product = dbo.ALL_POLICIES_12_premium_summary_October.productcode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Coverage_Group = dbo.ALL_POLICIES_12_premium_summary_October.Coverage_Group AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Policy_Number = dbo.ALL_POLICIES_12_premium_summary_October.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_FF_October ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Policy_Number = dbo.Policy_Information_FF_October.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_October.Fiscal_AY_Year > 2005)
GROUP BY dbo.ALL_POLICIES_12_Detail_Information_1_October.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_October.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_October.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_October.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_October.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_October.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_October.Open_Claims, 
                      dbo.Policy_Information_FF_October.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_October.acctngyear
HAVING      (dbo.ALL_POLICIES_12_Detail_Information_1_October.Coverage_Group = ''FLOOD'')
' 
GO
