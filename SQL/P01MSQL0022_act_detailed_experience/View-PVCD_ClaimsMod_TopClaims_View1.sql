IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_ClaimsMod_TopClaims_View1]'))
DROP VIEW [dbo].[PVCD_ClaimsMod_TopClaims_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_ClaimsMod_TopClaims_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PVCD_ClaimsMod_TopClaims_View1
AS
SELECT     dbo.Latest_All_Lines_Losses_View_1.Policy_Number, dbo.Latest_All_Lines_Losses_View_1.Claim_Number, 
                      dbo.Latest_All_Lines_Losses_View_1.productcode, dbo.Latest_All_Lines_Losses_View_1.Coverage_Group, 
                      dbo.Latest_All_Lines_Losses_View_1.Claim_Desc, SUM(dbo.Latest_All_Lines_Losses_View_1.Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, dbo.Latest_All_Lines_Losses_View_1.Fiscal_AY_Year, 
                      dbo.Latest_All_Lines_Losses_View_1.Type_of_Loss_Desc, dbo.Latest_All_Lines_Losses_View_1.Accident_State_for_join, 
                      dbo.Latest_All_Lines_Losses_View_1.Coverage_Reporting_group, dbo.Latest_All_Lines_Losses_View_1.acctngyear
FROM         dbo.Latest_All_Lines_Losses_View_1 RIGHT OUTER JOIN
                      dbo.PVDO_ClaimsModAccountNumberList ON 
                      dbo.Latest_All_Lines_Losses_View_1.accountnumber = dbo.PVDO_ClaimsModAccountNumberList.AccountNumber
WHERE     (dbo.Latest_All_Lines_Losses_View_1.Fiscal_AY_Year > 2006)
GROUP BY dbo.Latest_All_Lines_Losses_View_1.Policy_Number, dbo.Latest_All_Lines_Losses_View_1.Claim_Number, 
                      dbo.Latest_All_Lines_Losses_View_1.Coverage_Group, dbo.Latest_All_Lines_Losses_View_1.Claim_Desc, 
                      dbo.Latest_All_Lines_Losses_View_1.productcode, dbo.Latest_All_Lines_Losses_View_1.Fiscal_AY_Year, 
                      dbo.Latest_All_Lines_Losses_View_1.Type_of_Loss_Desc, dbo.Latest_All_Lines_Losses_View_1.Accident_State_for_join, 
                      dbo.Latest_All_Lines_Losses_View_1.Coverage_Reporting_group, dbo.Latest_All_Lines_Losses_View_1.acctngyear
HAVING      (dbo.Latest_All_Lines_Losses_View_1.productcode = ''PV'') AND (dbo.Latest_All_Lines_Losses_View_1.Coverage_Group = ''D&O'')
' 
GO
