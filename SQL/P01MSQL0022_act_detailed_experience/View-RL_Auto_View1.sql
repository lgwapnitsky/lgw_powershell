IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RL_Auto_View1]'))
DROP VIEW [dbo].[RL_Auto_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RL_Auto_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.RL_Auto_View1
AS
SELECT     Coverage_Reporting_group, currentwrittenpremium, currentearnedpremium, Policy_count_Reporting_Coverage, COL_AUTO_LIAB_AllOther_Count, 
                      COL_AUTO_LIAB_AllOther_Loss, COL_AUTO_LIAB_PropDam_Count, COL_AUTO_LIAB_PropDam_Loss, COL_AUTO_PHYS_Coll_Count, 
                      COL_AUTO_PHYS_Coll_Loss, COL_AUTO_PHYS_Glass_Count, COL_AUTO_PHYS_Glass_Loss, COL_AUTO_PHYS_Other_Count, 
                      COL_AUTO_PHYS_Other_Loss, COL_AUTO_PHYS_Theft_Count, COL_AUTO_PHYS_Theft_Loss, Incurred_Loss_ALAE_with_SS_NonCat, 
                      Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Reported_Claims, New_Renew_Tail, Renew_New_Auto, Written_Premium_Range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Auto_Vehicle_count_Total_Range, Auto_Vehicle_count_Truck_Range, 
                      Auto_Vehicle_count_PPT_Range, Auto_Vehicle_count_Buses_Range, Auto_Vehicle_count_VanPools_Range, Auto_Vehicle_count_OtherPublic_Range, 
                      Auto_Vehicle_count_Other_Range, ZIP_Pop_Density_Zone, Fiscal_AY_Year
FROM         dbo.RL_premium_summary
' 
GO
