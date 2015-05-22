IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Top_Claims_View_1_December]'))
DROP VIEW [dbo].[NPDO_Top_Claims_View_1_December]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Top_Claims_View_1_December]'))
EXEC dbo.sp_executesql @statement = N'Create view dbo.NPDO_Top_Claims_View_1_December as
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_December.Policy_Number, dbo.ALL_POLICIES_12_Detail_Information_1_December.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Exp_product, dbo.ALL_POLICIES_12_Detail_Information_1_December.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_December.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_December.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Accident_State_for_join, dbo.ALL_POLICIES_12_Detail_Information_1_December.Open_Claims, 
                      dbo.Policy_Information_FF_December.TrimBusiness_Type
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_December LEFT OUTER JOIN
                      dbo.Policy_Information_FF_December ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_December.Policy_Number = dbo.Policy_Information_FF_December.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_December.Fiscal_AY_Year > 2007) AND (dbo.ALL_POLICIES_12_Detail_Information_1_December.Product = ''FF'')' 
GO
