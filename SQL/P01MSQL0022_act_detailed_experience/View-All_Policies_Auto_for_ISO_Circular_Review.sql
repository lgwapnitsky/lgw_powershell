IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_Auto_for_ISO_Circular_Review]'))
DROP VIEW [dbo].[All_Policies_Auto_for_ISO_Circular_Review]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_Auto_for_ISO_Circular_Review]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.All_Policies_Auto_for_ISO_Circular_Review
AS
SELECT     dbo.ALL_POLICIES_15_premium_summary_B.statecode, dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_15_premium_summary_B.productcode, dbo.ALL_POLICIES_15_premium_summary_B.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_15_premium_summary_B.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_15_premium_summary_B.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_15_premium_summary_B.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, dbo.Policy_Information_ALL_POLICIES_B.program, 
                      dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.product_group, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_Premium_range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Region_in_State, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer, 
                      dbo.ALL_POLICIES_15_premium_summary_B.accountnumber, dbo.ALL_POLICIES_15_premium_summary_B.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_Name, dbo.Policy_Information_ALL_POLICIES_B.policyexpirationdate, 
                      dbo.Policy_Information_ALL_POLICIES_B.First_Policy_Year, dbo.Policy_Information_ALL_POLICIES_B.Renewals_Range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Business_Desc, dbo.Policy_Information_ALL_POLICIES_B.Companycode, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_AllOther_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_AllOther_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_AllOther_Loss, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_PropDam_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_PropDam_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_PropDam_Loss, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Coll_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Coll_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Coll_Loss, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Glass_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Glass_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Glass_Loss, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Other_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Other_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Other_Loss, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Theft_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Theft_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Theft_Loss, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Other_Range, dbo.Policy_Information_ALL_POLICIES_AUTO_B.Driving_School, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Hired_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_B.Non_Owned_Auto
FROM         dbo.ALL_POLICIES_15_premium_summary_B INNER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B ON 
                      dbo.ALL_POLICIES_15_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_AUTO_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_15_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_15_premium_summary_B.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.policynumber AND 
                      dbo.ALL_POLICIES_15_premium_summary_B.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Productcode AND 
                      dbo.ALL_POLICIES_15_premium_summary_B.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.statecode AND 
                      dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.coverage_group
GROUP BY dbo.ALL_POLICIES_15_premium_summary_B.statecode, dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_15_premium_summary_B.productcode, dbo.ALL_POLICIES_15_premium_summary_B.Fiscal_AY_Year, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.Branch_Region, dbo.Policy_Information_ALL_POLICIES_B.program, 
                      dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.product_group, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Terr_Description, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_Premium_range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.GL_Dom_Region_in_State, dbo.Policy_Information_ALL_POLICIES_B.Primary_Producer, 
                      dbo.ALL_POLICIES_15_premium_summary_B.accountnumber, dbo.ALL_POLICIES_15_premium_summary_B.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_B.Account_Name, dbo.Policy_Information_ALL_POLICIES_B.policyexpirationdate, 
                      dbo.Policy_Information_ALL_POLICIES_B.First_Policy_Year, dbo.Policy_Information_ALL_POLICIES_B.Renewals_Range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Business_Desc, dbo.Policy_Information_ALL_POLICIES_B.Companycode, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_AllOther_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_AllOther_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_AllOther_Loss, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_PropDam_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_PropDam_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_LIAB_PropDam_Loss, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Coll_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Coll_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Coll_Loss, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Glass_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Glass_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Glass_Loss, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Other_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Other_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Other_Loss, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Theft_Count, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Theft_Count_rptd, 
                      dbo.ALL_POLICIES_15_premium_summary_B.COL_AUTO_PHYS_Theft_Loss, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_B.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Other_Range, dbo.Policy_Information_ALL_POLICIES_AUTO_B.Driving_School, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Hired_Auto, dbo.Policy_Information_ALL_POLICIES_AUTO_B.Non_Owned_Auto
HAVING      (dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella = ''Primary'') AND 
                      (dbo.ALL_POLICIES_15_premium_summary_B.Coverage_Reporting_group IN (''Auto Liab'', ''Auto Phys Dam''))
' 
GO
