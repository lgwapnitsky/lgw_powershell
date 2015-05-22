IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Stu_Test_View_1]'))
DROP VIEW [dbo].[Stu_Test_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Stu_Test_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Stu_Test_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_B.statecode, dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.currentwrittenpremium) AS currentwrittenpremium, 
                      dbo.ALL_POLICIES_12_premium_summary_B.acctngyear
FROM         dbo.ALL_POLICIES_12_premium_summary_B LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_B.policynumber
GROUP BY dbo.ALL_POLICIES_12_premium_summary_B.statecode, dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, 
                      dbo.ALL_POLICIES_12_premium_summary_B.acctngyear
HAVING      (dbo.ALL_POLICIES_12_premium_summary_B.statecode = ''NY'') AND (dbo.ALL_POLICIES_12_premium_summary_B.acctngyear >= 2009)
' 
GO
