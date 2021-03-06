IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_12_premium_summary_Latest_View_1]'))
DROP VIEW [dbo].[ALL_POLICIES_12_premium_summary_Latest_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ALL_POLICIES_12_premium_summary_Latest_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.ALL_POLICIES_12_premium_summary_Latest_View_1
AS
SELECT     Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) AS currentearnedpremium, SUM(Incurred_Loss_ALAE_with_SS) 
                      AS Incurred_Loss_ALAE_with_SS, SUM(Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, Fiscal_AY_Month_Ending
FROM         dbo.ALL_POLICIES_12_premium_summary_June
WHERE     (Fiscal_AY_Year > 2008)
GROUP BY Fiscal_AY_Year, Fiscal_AY_Month_Ending
' 
GO
