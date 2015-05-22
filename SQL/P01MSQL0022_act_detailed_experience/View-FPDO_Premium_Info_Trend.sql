IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FPDO_Premium_Info_Trend]'))
DROP VIEW [dbo].[FPDO_Premium_Info_Trend]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FPDO_Premium_Info_Trend]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.FPDO_Premium_Info_Trend
AS
SELECT     acctngyear, acctngmonth, statecode, SUM(currentearnedpremium) AS currentearnedpremium, Coverage_Group
FROM         dbo.FPDO_premium_Premium_Info_Trend
GROUP BY acctngyear, acctngmonth, statecode, Coverage_Group
HAVING      (Coverage_Group IN (''D&O'', ''EPL''))
' 
GO
