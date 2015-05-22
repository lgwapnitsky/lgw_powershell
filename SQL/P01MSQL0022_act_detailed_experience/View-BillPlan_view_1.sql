IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BillPlan_view_1]'))
DROP VIEW [dbo].[BillPlan_view_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BillPlan_view_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.BillPlan_view_1
AS
SELECT     SUM(dbo.ALL_POLICIES_15_premium_summary.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Commission_dollars) AS Commission_dollars, 
                      dbo.Policy_Information_ALL_POLICIES.BillplanshortDesc, dbo.ALL_POLICIES_15_premium_summary.acctngyear, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Commission_Premiums) AS Commission_Premiums, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.ALL_POLICIES_15_premium_summary.productcode
FROM         dbo.ALL_POLICIES_15_premium_summary INNER JOIN
                      dbo.Policy_Information_ALL_POLICIES ON 
                      dbo.ALL_POLICIES_15_premium_summary.policynumber = dbo.Policy_Information_ALL_POLICIES.policynumber
GROUP BY dbo.Policy_Information_ALL_POLICIES.BillplanshortDesc, dbo.ALL_POLICIES_15_premium_summary.acctngyear, 
                      dbo.ALL_POLICIES_15_premium_summary.productcode
' 
GO
