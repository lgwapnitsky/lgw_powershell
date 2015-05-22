IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Property_Premium_Info_Trend_View1]'))
DROP VIEW [dbo].[Property_Premium_Info_Trend_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Property_Premium_Info_Trend_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Property_Premium_Info_Trend_View1
AS
SELECT     Coverage_Group, acctngyear, acctngmonth, statecode, SUM(currentearnedpremium) AS currentearnedpremium
FROM         dbo.Property_Premium_Info_Trend
GROUP BY statecode, acctngmonth, acctngyear, Coverage_Group
' 
GO
