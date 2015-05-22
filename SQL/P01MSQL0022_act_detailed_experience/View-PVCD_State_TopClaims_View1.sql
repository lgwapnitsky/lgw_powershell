IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_State_TopClaims_View1]'))
DROP VIEW [dbo].[PVCD_State_TopClaims_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_State_TopClaims_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PVCD_State_TopClaims_View1
AS
SELECT     Policy_Number, Claim_Number, Product, Coverage_Group, Claim_Desc, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, Fiscal_AY_Year, Type_of_Loss_Desc, Accident_State_for_join, Coverage_Reporting_group
FROM         dbo.Latest_All_Lines_Losses_View_1
WHERE     (Fiscal_AY_Year > 2005)
GROUP BY Policy_Number, Claim_Number, Coverage_Group, Claim_Desc, Product, Fiscal_AY_Year, Type_of_Loss_Desc, Accident_State_for_join, 
                      Coverage_Reporting_group
HAVING      (Product = ''PV'') AND (Accident_State_for_join = ''TX'')
' 
GO
