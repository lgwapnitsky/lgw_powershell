IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_RL_LargeAccounts]'))
DROP VIEW [dbo].[Individual_Accounts_for_Reports_View_1_RL_LargeAccounts]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_RL_LargeAccounts]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_for_Reports_View_1_RL_LargeAccounts
AS
SELECT     accountnumber, policynumber
FROM         dbo.Latest_All_Lines_View_1
GROUP BY accountnumber, policynumber
HAVING      (accountnumber IN (80322581, 76246, 80604878, 79023824, 78842683, 58139, 80271640))
' 
GO
