IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CA_AutoPhysDam_View1]'))
DROP VIEW [dbo].[CA_AutoPhysDam_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CA_AutoPhysDam_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.CA_AutoPhysDam_View1
AS
SELECT     Fiscal_AY_Year, SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, New_Renew_Tail, Renew_New_Auto, Written_Premium_Range, Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      SUM(COL_AUTO_PHYS_Coll_Count) AS COL_AUTO_PHYS_Coll_Count, SUM(COL_AUTO_PHYS_Coll_Loss) AS COL_AUTO_PHYS_Coll_Loss, 
                      SUM(COL_AUTO_PHYS_Glass_Count) AS COL_AUTO_PHYS_Glass_Count, SUM(COL_AUTO_PHYS_Glass_Loss) AS COL_AUTO_PHYS_Glass_Loss, 
                      SUM(COL_AUTO_PHYS_Other_Count) AS COL_AUTO_PHYS_Other_Count, SUM(COL_AUTO_PHYS_Other_Loss) AS COL_AUTO_PHYS_Other_Loss, 
                      SUM(COL_AUTO_PHYS_Theft_Count) AS COL_AUTO_PHYS_Theft_Count, SUM(COL_AUTO_PHYS_Theft_Loss) AS COL_AUTO_PHYS_Theft_Loss
FROM         dbo.CA_premium_summary
GROUP BY Fiscal_AY_Year, New_Renew_Tail, Renew_New_Auto, Written_Premium_Range, Price_Monitor_Standard_Cov_Grp_Monitored_range
' 
GO
