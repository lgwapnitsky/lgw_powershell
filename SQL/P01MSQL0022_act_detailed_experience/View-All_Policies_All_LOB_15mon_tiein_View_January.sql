IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_15mon_tiein_View_January]'))
DROP VIEW [dbo].[All_Policies_All_LOB_15mon_tiein_View_January]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_15mon_tiein_View_January]'))
EXEC dbo.sp_executesql @statement = N'







CREATE VIEW [dbo].[All_Policies_All_LOB_15mon_tiein_View_January]
AS
SELECT     acctngyear, statecode, Coverage_Reporting_group, Fiscal_AY_Year, SUM(Policy_count_Reporting_Coverage) AS policycount, 
                      SUM(currentearnedpremium) AS Earned_Premium, SUM(currentwrittenpremium) AS Written_Prmeium, SUM(Incurred_Claims) AS Incurred_Claims, 
                      SUM(Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_nonCat, SUM(Reported_Claims) AS Reported_Claims, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_Noncat, SUM(Commission_dollars) AS commission_dollars, SUM(Commission_Premiums) 
                      AS commission_premiums, productcode
FROM         dbo.ALL_POLICIES_15_premium_summary_January
GROUP BY acctngyear, statecode, Coverage_Reporting_group, Fiscal_AY_Year, productcode








' 
GO
