IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Auto_Loss_Info_Trend_View1]'))
DROP VIEW [dbo].[Auto_Loss_Info_Trend_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Auto_Loss_Info_Trend_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Auto_Loss_Info_Trend_View1
AS
SELECT     Coverage_id, Coverage_Group, Claim_Number, Premium_State, SUM(Paid_Loss) AS Paid_Loss, SUM(Paid_ALAE) AS Paid_ALAE, SUM(Reported_Claims) 
                      AS Reported_Claims, SUM(Closed_With_Pay_Claims) AS Closed_With_Pay_Claims, SUM(CWP_Claims_ex_ALAE_only) AS CWP_Claims_ex_ALAE_only, 
                      Year_Closed, Month_Closed, Accident_Year, SUM(Capped_Paid_Loss) AS Capped_Paid_Loss, SUM(Closed_Without_Pay_Claims) 
                      AS Closed_Without_Pay_Claims
FROM         dbo.Auto_Loss_Detail_Trend
GROUP BY Coverage_id, Coverage_Group, Claim_Number, Premium_State, Month_Closed, Year_Closed, Accident_Year
HAVING      (Year_Closed > 2004)
' 
GO
