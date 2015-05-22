IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_MRM]'))
DROP VIEW [dbo].[Individual_Accounts_for_Reports_View_1_MRM]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_MRM]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_for_Reports_View_1_MRM
AS
SELECT     accountnumber, policynumber
FROM         dbo.Latest_All_Lines_View_1
GROUP BY accountnumber, policynumber, program
HAVING      (program LIKE ''%MRM%'')
' 
GO
