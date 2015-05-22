IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DO_Only_FF_PV_View1]'))
DROP VIEW [dbo].[DO_Only_FF_PV_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DO_Only_FF_PV_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.DO_Only_FF_PV_View1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_June.productcode, dbo.ALL_POLICIES_12_premium_summary_June.policynumber, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_June.currentwrittenpremium) AS currentwrittenpremium, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Group, dbo.Policy_Information_FF_June.FF_EPL_RatingClass, 
                      dbo.Policy_Information_PVCD_June.PVCD_PVEPL_RatingClass, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_June.policyeffectivedate
FROM         dbo.ALL_POLICIES_12_premium_summary_June LEFT OUTER JOIN
                      dbo.Policy_Information_FF_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_FF_June.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_PVCD_June ON 
                      dbo.ALL_POLICIES_12_premium_summary_June.policynumber = dbo.Policy_Information_PVCD_June.policynumber
GROUP BY dbo.ALL_POLICIES_12_premium_summary_June.productcode, dbo.ALL_POLICIES_12_premium_summary_June.policynumber, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Group, dbo.Policy_Information_FF_June.FF_EPL_RatingClass, 
                      dbo.Policy_Information_PVCD_June.PVCD_PVEPL_RatingClass, dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_June.Coverage_Form, dbo.ALL_POLICIES_12_premium_summary_June.policyeffectivedate
HAVING      (dbo.ALL_POLICIES_12_premium_summary_June.productcode IN (''FF'', ''PV'')) AND 
                      (dbo.ALL_POLICIES_12_premium_summary_June.policyeffectivedate >= CONVERT(DATETIME, ''2009-06-30 00:00:00'', 102)) AND 
                      (dbo.ALL_POLICIES_12_premium_summary_June.policyeffectivedate <= CONVERT(DATETIME, ''2010-06-30 00:00:00'', 102))
' 
GO
