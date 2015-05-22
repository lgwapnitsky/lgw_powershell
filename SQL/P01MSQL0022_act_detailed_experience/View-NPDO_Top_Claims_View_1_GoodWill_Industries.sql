IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Top_Claims_View_1_GoodWill_Industries]'))
DROP VIEW [dbo].[NPDO_Top_Claims_View_1_GoodWill_Industries]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Top_Claims_View_1_GoodWill_Industries]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW dbo.NPDO_Top_Claims_View_1_GoodWill_Industries
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_March.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_March.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_March.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_March.Claim_Desc, 
                      SUM(dbo.ALL_POLICIES_12_Detail_Information_1_March.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_March.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_March.Open_Claims, 
                      dbo.Policy_Information_FF_March.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_March.acctngyear, 
                      dbo.ALL_POLICIES_12_premium_summary_March.statecode                      
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_March LEFT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_March ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Premium_State = dbo.ALL_POLICIES_12_premium_summary_March.statecode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Product = dbo.ALL_POLICIES_12_premium_summary_March.productcode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Coverage_Group = dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Policy_Number = dbo.ALL_POLICIES_12_premium_summary_March.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_FF_March ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Policy_Number = dbo.Policy_Information_FF_March.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_March.Fiscal_AY_Year > 2008)
  AND dbo.Policy_Information_FF_March.TrimBusiness_Type LIKE ''%Goodwill%''
GROUP BY dbo.ALL_POLICIES_12_Detail_Information_1_March.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_March.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_March.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_March.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_March.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_March.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_March.Open_Claims, 
                      dbo.Policy_Information_FF_March.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_March.acctngyear, 
                      dbo.ALL_POLICIES_12_premium_summary_March.statecode
HAVING      (dbo.ALL_POLICIES_12_Detail_Information_1_March.Product = ''FF'')' 
GO
