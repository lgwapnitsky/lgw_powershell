IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_NYSARC]'))
DROP VIEW [dbo].[Individual_Accounts_for_Reports_View_1_NYSARC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_NYSARC]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_for_Reports_View_1_NYSARC
AS
SELECT     accountnumber, policynumber, programdesc
FROM         dbo.Latest_All_Lines_View_1
GROUP BY accountnumber, policynumber, programdesc
HAVING      (programdesc LIKE ''NYSARC%'')
' 
GO
