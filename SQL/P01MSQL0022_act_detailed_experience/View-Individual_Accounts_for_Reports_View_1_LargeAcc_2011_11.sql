IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_LargeAcc_2011_11]'))
DROP VIEW [dbo].[Individual_Accounts_for_Reports_View_1_LargeAcc_2011_11]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_LargeAcc_2011_11]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_for_Reports_View_1_LargeAcc_2011_11
AS
SELECT     accountnumber, policynumber
FROM         dbo.Latest_All_Lines_View_1
GROUP BY accountnumber, policynumber, program
HAVING      (accountnumber IN (76246, 78803324, 21180, 78805021, 78948211, 93142, 78822359, 78833971, 78920823, 79245203, 79344177, 78803324, 
                      78831947, 80332955, 73508))
' 
GO
