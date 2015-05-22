IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ME_AutoPhysDam_View1]'))
DROP VIEW [dbo].[ME_AutoPhysDam_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ME_AutoPhysDam_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.ME_AutoPhysDam_View1
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(currentearnedpremium) AS currentearnedpremium, SUM(currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, COL_AUTO_PHYS_Coll_Loss, 
                      COL_AUTO_PHYS_Glass_Count, COL_AUTO_PHYS_Glass_Loss, COL_AUTO_PHYS_Other_Count, COL_AUTO_PHYS_Other_Loss, 
                      COL_AUTO_PHYS_Theft_Count, COL_AUTO_PHYS_Theft_Loss, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, 
                      Written_Premium_Range, County_Pop_Density_Range, Price_Monitor_Standard_Cov_Grp_Monitored_range, Auto_Vehicle_count_Other_Range, 
                      Auto_Vehicle_count_OtherPublic_Range, Auto_Vehicle_count_VanPools_Range, Auto_Vehicle_count_Buses_Range, Auto_Vehicle_count_Truck_Range, 
                      Auto_Vehicle_count_PPT_Range, Auto_Vehicle_count_Total_Range, COL_AUTO_PHYS_Coll_Count
FROM         dbo.mental_health_premium_summary
GROUP BY Coverage_Reporting_group, Fiscal_AY_Year, COL_AUTO_PHYS_Coll_Loss, COL_AUTO_PHYS_Glass_Count, COL_AUTO_PHYS_Glass_Loss, 
                      COL_AUTO_PHYS_Other_Count, COL_AUTO_PHYS_Other_Loss, COL_AUTO_PHYS_Theft_Count, COL_AUTO_PHYS_Theft_Loss, Renewals_Range, 
                      New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Written_Premium_Range, County_Pop_Density_Range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Auto_Vehicle_count_Other_Range, Auto_Vehicle_count_OtherPublic_Range, 
                      Auto_Vehicle_count_VanPools_Range, Auto_Vehicle_count_Buses_Range, Auto_Vehicle_count_Truck_Range, Auto_Vehicle_count_PPT_Range, 
                      Auto_Vehicle_count_Total_Range, COL_AUTO_PHYS_Coll_Count
' 
GO
