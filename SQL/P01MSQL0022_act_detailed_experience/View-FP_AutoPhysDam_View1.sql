IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FP_AutoPhysDam_View1]'))
DROP VIEW [dbo].[FP_AutoPhysDam_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FP_AutoPhysDam_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.FP_AutoPhysDam_View1
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, Policy_count_Reporting_Coverage, COL_AUTO_PHYS_Coll_Count, COL_AUTO_PHYS_Coll_Loss, 
                      COL_AUTO_PHYS_Glass_Count, COL_AUTO_PHYS_Glass_Loss, COL_AUTO_PHYS_Other_Count, COL_AUTO_PHYS_Other_Loss, 
                      COL_AUTO_PHYS_Theft_Count, COL_AUTO_PHYS_Theft_Loss, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Reported_Claims) AS Reported_Claims, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Written_Premium_Range, 
                      County_Pop_Density_Range, Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Auto_Vehicle_count_Total_Range, Auto_Vehicle_count_Truck_Range, 
                      Auto_Vehicle_count_PPT_Range, Auto_Vehicle_count_Buses_Range, Auto_Vehicle_count_VanPools_Range, Auto_Vehicle_count_OtherPublic_Range, 
                      Auto_Vehicle_count_Other_Range
FROM         dbo.FP_premium_summary
GROUP BY Coverage_Reporting_group, Fiscal_AY_Year, Policy_count_Reporting_Coverage, COL_AUTO_PHYS_Coll_Count, COL_AUTO_PHYS_Coll_Loss, 
                      COL_AUTO_PHYS_Glass_Count, COL_AUTO_PHYS_Glass_Loss, COL_AUTO_PHYS_Other_Count, COL_AUTO_PHYS_Other_Loss, 
                      COL_AUTO_PHYS_Theft_Count, COL_AUTO_PHYS_Theft_Loss, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, 
                      Written_Premium_Range, County_Pop_Density_Range, Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Auto_Vehicle_count_Total_Range, Auto_Vehicle_count_Truck_Range, 
                      Auto_Vehicle_count_PPT_Range, Auto_Vehicle_count_Buses_Range, Auto_Vehicle_count_VanPools_Range, Auto_Vehicle_count_OtherPublic_Range, 
                      Auto_Vehicle_count_Other_Range
' 
GO
