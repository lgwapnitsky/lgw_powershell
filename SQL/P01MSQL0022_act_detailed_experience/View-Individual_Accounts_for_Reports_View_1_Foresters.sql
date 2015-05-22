IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_Foresters]'))
DROP VIEW [dbo].[Individual_Accounts_for_Reports_View_1_Foresters]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_Foresters]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_for_Reports_View_1_Foresters
AS
SELECT     accountnumber, policynumber, Source_Detail_Name, SUM(currentwrittenpremium) AS Curr_WP, SUM(currentearnedpremium) AS curr_EP, 
                      Companycode
FROM         dbo.Latest_All_Lines_View_1
GROUP BY accountnumber, policynumber, Source_Detail_Name, Companycode
HAVING      (Source_Detail_Name LIKE ''%ACFM%'') OR
                      (Source_Detail_Name LIKE ''%ACFN%'')
' 
GO
