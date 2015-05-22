IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1]'))
DROP VIEW [dbo].[Individual_Accounts_for_Reports_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1]'))
EXEC dbo.sp_executesql @statement = N'
CReate view dbo.Individual_Accounts_for_Reports_View_1
AS
SELECT accountnumber,policynumber
From  dbo.Latest_All_Lines_View_1

WHERE accountnumber =''71282''
Group by accountnumber,policynumber' 
GO
