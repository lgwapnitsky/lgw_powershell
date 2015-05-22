IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Auto_Premium_Info_Trend_View1]'))
DROP VIEW [dbo].[Auto_Premium_Info_Trend_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Auto_Premium_Info_Trend_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Auto_Premium_Info_Trend_View1
AS
SELECT     acctngyear, acctngmonth, statecode, SUM(currentearnedpremium) AS currentearnedpremium, Coverage_Group
FROM         dbo.Auto_premium_Premium_Info_Trend
GROUP BY acctngyear, acctngmonth, statecode, Coverage_Group
' 
GO
