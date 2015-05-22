IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_CA_TopClaims_View1]'))
DROP VIEW [dbo].[PVCD_CA_TopClaims_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_CA_TopClaims_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PVCD_CA_TopClaims_View1
AS
SELECT     Policy_Number, Claim_Number, productcode, Coverage_Group, Claim_Desc, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      Fiscal_AY_Year, Type_of_Loss_Desc, Accident_State_for_join, Coverage_Reporting_group, PV_Cov_ALL, FF_Cov_ALL
FROM         dbo.Latest_All_Lines_Losses_View_1
WHERE     (Fiscal_AY_Year > 2007)
GROUP BY Policy_Number, Claim_Number, Coverage_Group, Claim_Desc, Fiscal_AY_Year, Type_of_Loss_Desc, Accident_State_for_join, Coverage_Reporting_group, 
                      productcode, PV_Cov_ALL, FF_Cov_ALL
HAVING      (productcode = ''PV'') AND (Accident_State_for_join <> ''ca'')
' 
GO
