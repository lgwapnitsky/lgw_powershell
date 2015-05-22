IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Premium_Info_Trend_View_1]'))
DROP VIEW [dbo].[NPDO_Premium_Info_Trend_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Premium_Info_Trend_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.NPDO_Premium_Info_Trend_View_1
AS
SELECT     acctngyear, acctngmonth, statecode, SUM(currentearnedpremium) AS currentearnedpremium, Coverage_Group
FROM         dbo.NPDO_premium_Premium_Info_Trend
GROUP BY acctngyear, acctngmonth, statecode, Coverage_Group
HAVING      (Coverage_Group IN (''D&O'', ''EPL''))
' 
GO
