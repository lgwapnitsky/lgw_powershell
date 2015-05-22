IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_TDBank_NAFI]'))
DROP VIEW [dbo].[Individual_Accounts_for_Reports_View_1_TDBank_NAFI]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_TDBank_NAFI]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_for_Reports_View_1_TDBank_NAFI
AS
SELECT     accountnumber, policynumber
FROM         dbo.Latest_All_Lines_View_1
GROUP BY accountnumber, policynumber
HAVING      (accountnumber IN (98140, 53715, 35822, 78269, 78808316, 30508, 81046267, 81070869, 78366))
' 
GO
