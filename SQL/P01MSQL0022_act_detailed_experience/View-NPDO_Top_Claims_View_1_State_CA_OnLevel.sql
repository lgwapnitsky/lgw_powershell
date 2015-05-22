IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Top_Claims_View_1_State_CA_OnLevel]'))
DROP VIEW [dbo].[NPDO_Top_Claims_View_1_State_CA_OnLevel]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Top_Claims_View_1_State_CA_OnLevel]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.NPDO_Top_Claims_View_1_State_CA_OnLevel
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_July.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_July.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_July.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_July.Claim_Desc, 
                      SUM(dbo.ALL_POLICIES_12_Detail_Information_1_July.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_July.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_July.Open_Claims, 
                      dbo.Policy_Information_FF_July.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_July.acctngyear, 
                      dbo.ALL_POLICIES_12_premium_summary_July.statecode
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_July LEFT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_July ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Premium_State = dbo.ALL_POLICIES_12_premium_summary_July.statecode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Product = dbo.ALL_POLICIES_12_premium_summary_July.productcode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Coverage_Group = dbo.ALL_POLICIES_12_premium_summary_July.Coverage_Group AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Policy_Number = dbo.ALL_POLICIES_12_premium_summary_July.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_FF_July ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Policy_Number = dbo.Policy_Information_FF_July.policynumber
GROUP BY dbo.ALL_POLICIES_12_Detail_Information_1_July.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_July.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_July.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_July.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_July.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_July.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_July.Open_Claims, 
                      dbo.Policy_Information_FF_July.TrimBusiness_Type, dbo.ALL_POLICIES_12_premium_summary_July.acctngyear, 
                      dbo.ALL_POLICIES_12_premium_summary_July.statecode
HAVING      (dbo.ALL_POLICIES_12_premium_summary_July.statecode = ''CA'') AND (dbo.ALL_POLICIES_12_Detail_Information_1_July.Fiscal_AY_Year > 2007)
' 
GO
