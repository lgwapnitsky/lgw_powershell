IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View_May_Test]'))
DROP VIEW [dbo].[View_May_Test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View_May_Test]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.View_May_Test
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_May.productcode, SUM(dbo.ALL_POLICIES_12_premium_summary_May.currentwrittenpremium) 
                      AS currentwrittenpremium, dbo.Policy_Information_ALL_POLICIES_May.Branch_Region, 
                      dbo.ALL_POLICIES_12_premium_summary_May.experienceproduct, dbo.ALL_POLICIES_12_premium_summary_May.acctngyear
FROM         dbo.ALL_POLICIES_12_premium_summary_May LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_May ON 
                      dbo.ALL_POLICIES_12_premium_summary_May.policynumber = dbo.Policy_Information_ALL_POLICIES_May.policynumber
WHERE     (dbo.Policy_Information_ALL_POLICIES_May.Branch_Region IN (''Northeast'', ''Sunbelt'')) AND 
                      (dbo.ALL_POLICIES_12_premium_summary_May.acctngyear > 2008)
GROUP BY dbo.Policy_Information_ALL_POLICIES_May.Branch_Region, dbo.ALL_POLICIES_12_premium_summary_May.experienceproduct, 
                      dbo.ALL_POLICIES_12_premium_summary_May.acctngyear, dbo.ALL_POLICIES_12_premium_summary_May.productcode, 
                      dbo.ALL_POLICIES_12_premium_summary_May.currentwrittenpremium
' 
GO
