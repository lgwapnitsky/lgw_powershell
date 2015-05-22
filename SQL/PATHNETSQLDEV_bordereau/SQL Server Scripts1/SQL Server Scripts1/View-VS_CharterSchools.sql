IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_CharterSchools]'))
DROP VIEW [dbo].[VS_CharterSchools]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_CharterSchools]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.VS_CharterSchools
AS
SELECT     dbo.VS_All_Lines_View_2.statecode, dbo.VS_All_Lines_View_2.Coverage_Reporting_group, dbo.VS_All_Lines_View_2.productcode, 
                      dbo.VS_All_Lines_View_2.Fiscal_AY_Year, dbo.VS_All_Lines_View_2.currentwrittenpremium, dbo.VS_All_Lines_View_2.currentearnedpremium, 
                      dbo.VS_All_Lines_View_2.Policy_count_Reporting_Coverage, dbo.VS_All_Lines_View_2.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.VS_All_Lines_View_2.Capped_Incurred_Loss_ALAE_with_SS_wo_cat, dbo.VS_All_Lines_View_2.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.VS_All_Lines_View_2.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, dbo.VS_All_Lines_View_2.Reported_Claims, 
                      dbo.VS_All_Lines_View_2.COL_GLBI_Malpractice_Count, dbo.VS_All_Lines_View_2.COL_GLBI_Malpractice_Loss, 
                      dbo.VS_All_Lines_View_2.COL_GLBI_Fraud_Breach_of_Contract_Count, dbo.VS_All_Lines_View_2.COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      dbo.VS_All_Lines_View_2.COL_GLBI_Injury_Count, dbo.VS_All_Lines_View_2.COL_GLBI_Injury_Loss, dbo.VS_All_Lines_View_2.COL_GLBI_Other_Count, 
                      dbo.VS_All_Lines_View_2.COL_GLBI_Other_Loss, dbo.VS_All_Lines_View_2.COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      dbo.VS_All_Lines_View_2.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, dbo.VS_All_Lines_View_2.COL_GLBI_PropertyDamage_Loss, 
                      dbo.VS_All_Lines_View_2.COL_GLBI_PropertyDamage_Count, dbo.VS_All_Lines_View_2.COL_GLBI_Theft_Loss, dbo.VS_All_Lines_View_2.COL_GLBI_Theft_Count, 
                      dbo.VS_All_Lines_View_2.COL_GLBI_SlanderDefamtion_Loss, dbo.VS_All_Lines_View_2.COL_GLBI_SlanderDefamtion_Count, 
                      dbo.VS_All_Lines_View_2.COL_GLBI_Discrim_WrongfulTermination_Loss, dbo.VS_All_Lines_View_2.COL_GLBI_Discrim_WrongfulTermination_Count, 
                      dbo.VS_All_Lines_View_2.Incurred_Claims, dbo.VS_All_Lines_View_2.Commission_dollars, dbo.VS_All_Lines_View_2.Commission_Premiums, 
                      dbo.VS_All_Lines_View_2.Price_Monitor_Standard_CovGrp_GL_Monitored_range, dbo.VS_All_Lines_View_2.New_Renew_Tail, 
                      dbo.VS_All_Lines_View_2.Renew_New_Auto, dbo.VS_All_Lines_View_2.Branch_Region, dbo.VS_All_Lines_View_2.program, 
                      dbo.VS_All_Lines_View_2.Written_Premium_Range, dbo.VS_All_Lines_View_2.Coverage_Group, dbo.VS_All_Lines_View_2.Product_group, 
                      dbo.VS_All_Lines_View_2.Primary_Umbrella, dbo.VS_All_Lines_View_2.Earned_Buildings, dbo.VS_All_Lines_View_2.Earned_Locations, 
                      dbo.VS_All_Lines_View_2.Earned_TIV, dbo.VS_All_Lines_View_2.GL_Dom_Terr_Description, dbo.VS_All_Lines_View_2.GL_Dom_Region_in_State, 
                      dbo.VS_All_Lines_View_2.Primary_Producer, dbo.VS_All_Lines_View_2.Policy_count_All_Cov_Combined, 
                      dbo.VS_All_Lines_View_2.Account_UltLoss_Ratio_Working_Cover_Range, dbo.VS_All_Lines_View_2.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.VS_All_Lines_View_2.Policy_count_Coverage_Group, dbo.VS_All_Lines_View_2.Primary_Producer_type, dbo.VS_All_Lines_View_2.Playground_YN, 
                      dbo.VS_All_Lines_View_2.Playground_Equip_YN, dbo.VS_All_Lines_View_2.Pool_YN, dbo.VS_All_Lines_View_2.Sports_Activities_YN, 
                      dbo.VS_All_Lines_View_2.Tennis_Bubble_YN, dbo.VS_All_Lines_View_2.Tennis_Courts_YN, dbo.VS_All_Lines_View_2.Number_of_Swimming_Pools_Range, 
                      dbo.VS_All_Lines_View_2.Incurred_Loss_ALAE_with_SS, dbo.VS_All_Lines_View_2.Capped_Incurred_Loss_ALAE_with_SS, 
                      dbo.VS_All_Lines_View_2.Ult_LDF_Incurred_Loss_ALAE_with_SS, dbo.VS_All_Lines_View_2.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.VS_All_Lines_View_2.GL_Aggregate_Limit, dbo.VS_All_Lines_View_2.GL_Deductible, dbo.VS_All_Lines_View_2.GLDX_Indicator, 
                      dbo.VS_All_Lines_View_2.SAM_Form, dbo.VS_All_Lines_View_2.SAM_OCC_Limit, dbo.VS_All_Lines_View_2.SAM_Agg_Limit, 
                      dbo.VS_All_Lines_View_2.SAM_Form_Group, dbo.VS_All_Lines_View_2.GL_Occurrence_Limit, dbo.VS_All_Lines_View_2.Endorsement_GLDX_YN, 
                      dbo.VS_All_Lines_View_2.policynumber, dbo.VS_All_Lines_View_2.Property_Coverage_Form, dbo.VS_All_Lines_View_2.Coverage_Form, 
                      dbo.VS_All_Lines_View_2.FA_Constr_Code_Dominant_NAME, dbo.VS_All_Lines_View_2.FA_Hail_Dominant, dbo.VS_All_Lines_View_2.ZIP_Pop_Density_Dominant, 
                      dbo.VS_All_Lines_View_2.FA_Avg_Bld_Rate_Range, dbo.VS_All_Lines_View_2.FA_Avg_Bld_Rate_rd2, dbo.VS_All_Lines_View_2.FA_Deductible, 
                      dbo.VS_All_Lines_View_2.COL_Prop_Wind_Hail_Count, dbo.VS_All_Lines_View_2.COL_Prop_Wind_Hail_Loss, 
                      dbo.VS_All_Lines_View_2.COL_Prop_Water_Other_Loss, dbo.VS_All_Lines_View_2.COL_Prop_Water_Other_Count, 
                      dbo.VS_All_Lines_View_2.COL_Prop_Water_Sprinkler_Loss, dbo.VS_All_Lines_View_2.COL_Prop_Water_Sprinkler_Count, 
                      dbo.VS_All_Lines_View_2.COL_Prop_Theft_Van_Loss, dbo.VS_All_Lines_View_2.COL_Prop_Theft_Van_Count, 
                      dbo.VS_All_Lines_View_2.COL_Prop_Fire_Lightning_Explosion_Loss, dbo.VS_All_Lines_View_2.COL_Prop_Fire_Lightning_Explosion_Count, 
                      dbo.VS_All_Lines_View_2.COL_Prop_Other_Loss, dbo.VS_All_Lines_View_2.COL_Prop_Other_Count, dbo.VS_All_Lines_View_2.Endorsement_Elite_YN, 
                      dbo.VS_All_Lines_View_2.Incurred_Loss_ALAE_with_SS_CatOnly, dbo.VS_All_Lines_View_2.Auto_Vehicle_count_Total_Range, 
                      dbo.VS_All_Lines_View_2.Auto_Vehicle_count_PPT_Range, dbo.VS_All_Lines_View_2.Auto_Vehicle_count_Buses_Range, 
                      dbo.VS_All_Lines_View_2.Auto_Vehicle_count_Truck_Range, dbo.VS_All_Lines_View_2.Auto_Vehicle_count_VanPools_Range, 
                      dbo.VS_All_Lines_View_2.Auto_Vehicle_count_OtherPublic_Range, dbo.VS_All_Lines_View_2.Auto_Vehicle_count_Other_Range, 
                      dbo.VS_All_Lines_View_2.Auto_Vehicle_count_Coll_No_Ded_Range, dbo.VS_All_Lines_View_2.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.VS_All_Lines_View_2.Auto_Vehicle_count_Coll_1000_Ded_Range, dbo.VS_All_Lines_View_2.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.VS_All_Lines_View_2.Auto_Vehicle_count_OTC_No_Ded_Range, dbo.VS_All_Lines_View_2.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.VS_All_Lines_View_2.Auto_Vehicle_count_OTC_1000_Ded_Range, dbo.VS_All_Lines_View_2.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.VS_All_Lines_View_2.Auto_Vehicle_count_Dual_Control_Range, dbo.VS_All_Lines_View_2.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.VS_All_Lines_View_2.DivisionName, dbo.VS_All_Lines_View_2.producttype, dbo.VS_All_Lines_View_2.Source_Detail_Name, 
                      dbo.VS_All_Lines_View_2.First_Policy_Year, dbo.VS_All_Lines_View_2.PIC_Producer, dbo.VS_All_Lines_View_2.underwriter, 
                      dbo.VS_All_Lines_View_2.Fiscal_AY_Month_Ending, dbo.VS_All_Lines_View_2.Last_Reporting_Year, dbo.VS_All_Lines_View_2.Last_Reporting_Month, 
                      dbo.VS_All_Lines_View_2.Price_Monitor_Standard_Cov_Grp_Monitored_range, dbo.VS_All_Lines_View_2.Account_UltLoss_Ratio, 
                      dbo.VS_All_Lines_View_2.Account_UltLoss_Ratio_NonCat, dbo.VS_All_Lines_View_2.Account_RepLoss_Ratio, 
                      dbo.VS_All_Lines_View_2.Account_RepLoss_Ratio_NonCat, dbo.VS_All_Lines_View_2.Private_HS_NP_Avg_Rate_Range, 
                      dbo.VS_All_Lines_View_2.Private_Pre_HS_NP_Avg_Rate_Range, dbo.VS_All_Lines_View_2.Private_Schools_FP_Avg_Rate_Range, 
                      dbo.VS_All_Lines_View_2.Public_Schools_Pre_HS_Avg_Rate_Range, dbo.VS_All_Lines_View_2.Schools_FP_Avg_Rate_Range, 
                      dbo.VS_All_Lines_View_2.Schools_NP_Avg_Rate_Range, dbo.VS_All_Lines_View_2.Dormitories_NP_Avg_Rate_Range, 
                      dbo.VS_All_Lines_View_2.Dormitories_FP_Avg_Rate_Range, dbo.VS_All_Lines_View_2.College_NP_Avg_Rate_Range, 
                      dbo.VS_All_Lines_View_2.College_FP_Avg_Rate_Range, dbo.VS_All_Lines_View_2.Public_Schools_HS_Avg_Rate_Range, 
                      dbo.VS_All_Lines_View_2.Vocational_Schools_Avg_Rate_Range, dbo.VS_All_Lines_View_2.Private_Schools_Avg_Rate_Range, 
                      dbo.VS_All_Lines_View_2.Public_Schools_Avg_Rate_Range, dbo.VS_All_Lines_View_2.Dormitories_Avg_Rate_Range, dbo.VS_All_Lines_View_2.CompanyCode, 
                      dbo.VS_All_Lines_View_2.programdesc, dbo.VS_All_Lines_View_2.PICProducer, dbo.VS_All_Lines_View_2.PrimaryProducer, 
                      dbo.VS_All_Lines_View_2.PrimaryProducerType, dbo.VS_All_Lines_View_2.Account_Premium_Range, dbo.VS_All_Lines_View_2.SubProduct, 
                      dbo.VS_All_Lines_View_2.SubProductGroup, dbo.VS_All_Lines_View_2.BusinessClassDesc, dbo.VS_All_Lines_View_2.accountnumber, 
                      dbo.VS_All_Lines_View_2.Private_Pre_HS_FP_Avg_Rate_Range, dbo.VS_All_Lines_View_2.accountname, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table.TIV_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table.FA_Deductible_to_TIV_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table.FA_Avg_TIV_per_BLD_Range, 
                      dbo.Latest_Policy_Information_UWChecklist_View_1_table.Dorms_YN, dbo.Latest_Policy_Information_UWChecklist_View_1_table.Headstart_YN, 
                      dbo.Latest_Policy_Information_UWChecklist_View_1_table.Number_of_Total_Employees_Range, 
                      dbo.Latest_Policy_Information_UWChecklist_View_1_table.Percent_of_Part_Time_and_Temp_Employees_Range, 
                      dbo.Latest_Policy_Information_UWChecklist_View_1_table.Number_of_years_in_Operation_Range, 
                      dbo.Latest_Policy_Information_UWChecklist_View_1_table.Turnover_Rate_Range, dbo.VS_All_Lines_View_2.PriorityAccountLevelcurrent
FROM         dbo.VS_All_Lines_View_2 LEFT OUTER JOIN
                      dbo.Latest_Policy_Information_UWChecklist_View_1_table ON 
                      dbo.VS_All_Lines_View_2.policynumber = dbo.Latest_Policy_Information_UWChecklist_View_1_table.policynumber LEFT OUTER JOIN
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table ON 
                      dbo.VS_All_Lines_View_2.policynumber = dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table.policynumber
WHERE     (dbo.VS_All_Lines_View_2.SubProduct = ''Charter Schools'')
' 
GO
