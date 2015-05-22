IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Umb_InForce_Policy_List]'))
DROP VIEW [dbo].[Umb_InForce_Policy_List]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Umb_InForce_Policy_List]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Umb_InForce_Policy_List
AS
SELECT     PriceMonitorSystem.dbo.vwPriceMonitorCurrentPriorUMB.CurrentPolicyEffectiveDate, 
                      PriceMonitorSystem.dbo.vwPriceMonitorCurrentPriorUMB.CurrentPolicyExpirationDate, 
                      PriceMonitorSystem.dbo.vwPriceMonitorCurrentPriorUMB.CurrentPremiumOverrideInd, 
                      PriceMonitorSystem.dbo.vwPriceMonitorCurrentPriorUMB.StandardNormfacCombinedCurrent, dbo.Latest_All_Lines_View_1.statecode, 
                      dbo.Latest_All_Lines_View_1.Coverage_Reporting_group, dbo.Latest_All_Lines_View_1.currentwrittenpremium, 
                      dbo.Latest_All_Lines_View_1.policynumber, dbo.Latest_All_Lines_View_1.accountname, dbo.Latest_All_Lines_View_1.policyEffectivedate, 
                      dbo.Latest_All_Lines_View_1.policyexpirationdate
FROM         dbo.Latest_All_Lines_View_1 LEFT OUTER JOIN
                      PriceMonitorSystem.dbo.vwPriceMonitorCurrentPriorUMB ON 
                      dbo.Latest_All_Lines_View_1.policynumber = PriceMonitorSystem.dbo.vwPriceMonitorCurrentPriorUMB.CurrentPolicyNumber
WHERE     (dbo.Latest_All_Lines_View_1.Coverage_Reporting_group = ''umbrella'') AND (YEAR(dbo.Latest_All_Lines_View_1.policyEffectivedate) > 2010)
' 
GO
