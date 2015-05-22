IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FP_AutoLiab_View1]'))
DROP VIEW [dbo].[FP_AutoLiab_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FP_AutoLiab_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.FP_AutoLiab_View1
AS
SELECT     Fiscal_AY_Year, Written_Premium_Range, SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(currentearnedpremium) AS currentearnedpremium, SUM(currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, COL_AUTO_LIAB_AllOther_Count, 
                      COL_AUTO_LIAB_AllOther_Loss, COL_AUTO_LIAB_PropDam_Count, COL_AUTO_LIAB_PropDam_Loss, Renewals_Range, New_Renew_Tail, 
                      Renew_New_Auto, First_Policy_Year, County_Pop_Density_Range, Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      Auto_Vehicle_count_Other_Range, Auto_Vehicle_count_OtherPublic_Range, Auto_Vehicle_count_VanPools_Range, Auto_Vehicle_count_Buses_Range, 
                      Auto_Vehicle_count_PPT_Range, Auto_Vehicle_count_Truck_Range, Auto_Vehicle_count_Total_Range, Coverage_Reporting_group, Companycode, 
                      GL_Dom_Region_in_State
FROM         dbo.FP_premium_summary
GROUP BY Fiscal_AY_Year, Written_Premium_Range, COL_AUTO_LIAB_AllOther_Count, COL_AUTO_LIAB_AllOther_Loss, COL_AUTO_LIAB_PropDam_Count, 
                      COL_AUTO_LIAB_PropDam_Loss, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, County_Pop_Density_Range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Auto_Vehicle_count_Other_Range, Auto_Vehicle_count_OtherPublic_Range, 
                      Auto_Vehicle_count_VanPools_Range, Auto_Vehicle_count_Buses_Range, Auto_Vehicle_count_PPT_Range, Auto_Vehicle_count_Truck_Range, 
                      Auto_Vehicle_count_Total_Range, Coverage_Reporting_group, Companycode, GL_Dom_Region_in_State
' 
GO
