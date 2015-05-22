IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FF_Top_Claims_View_1]'))
DROP VIEW [dbo].[FF_Top_Claims_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FF_Top_Claims_View_1]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW dbo.FF_Top_Claims_View_1
AS
SELECT     
APDT.Policy_Number, 
APDT.Claim_Number, 
APDT.Exp_product, 
APDT.Product, 
APDT.Coverage_Group, 
APDT.Claim_Desc, 
SUM(APDT.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
APDT.Fiscal_AY_Year, 
APDT.Type_of_Loss_Desc, 
APDT.Accident_State_for_join, 
APDT.Open_Claims, 
PIFF.TrimBusiness_Type, 
APPRM.acctngyear, 
APPRM.statecode
FROM Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_March APDT
LEFT OUTER JOIN Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_March APPRM ON APDT.Premium_State = APPRM.statecode 
															AND APDT.Product = APPRM.productcode 
															AND APDT.Coverage_Group = APPRM.Coverage_Group 
															AND APDT.Policy_Number = APPRM.policynumber 
LEFT OUTER JOIN Act_Detailed_Experience.dbo.Policy_Information_FF_March PIFF ON APDT.Policy_Number = PIFF.policynumber
WHERE APDT.Fiscal_AY_Year > 2008
  AND APDT.Product = ''FF''
GROUP BY 
APDT.Policy_Number, 
APDT.Claim_Number, 
APDT.Coverage_Group, 
APDT.Claim_Desc, 
APDT.Exp_product, 
APDT.Product, 
APDT.Fiscal_AY_Year, 
APDT.Type_of_Loss_Desc, 
APDT.Accident_State_for_join, 
APDT.Open_Claims, 
PIFF.TrimBusiness_Type, 
APPRM.acctngyear, 
APPRM.statecode
;' 
GO
