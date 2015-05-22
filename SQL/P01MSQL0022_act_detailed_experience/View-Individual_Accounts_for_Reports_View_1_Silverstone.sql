IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_Silverstone]'))
DROP VIEW [dbo].[Individual_Accounts_for_Reports_View_1_Silverstone]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_for_Reports_View_1_Silverstone]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_for_Reports_View_1_Silverstone
AS
SELECT     accountnumber, policynumber, PrimaryProducer, productcode
FROM         dbo.Latest_All_Lines_View_1
GROUP BY accountnumber, policynumber, PrimaryProducer, productcode
HAVING      (PrimaryProducer LIKE ''SILVERSTONE%'') AND (productcode = ''HC'')
' 
GO
