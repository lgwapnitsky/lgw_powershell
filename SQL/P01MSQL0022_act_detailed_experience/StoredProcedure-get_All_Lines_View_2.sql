IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_All_Lines_View_2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[get_All_Lines_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_All_Lines_View_2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[get_All_Lines_View_2] @productcode varchar(50),@Fiscal_AY_Year int


AS
begin

	-- EXECUTE Act_Detailed_Experience..get_All_Lines_View_2 ''VS'', 2008

	
	
SELECT     prem_sum.statecode, prem_sum.Coverage_Reporting_group, 
                      prem_sum.productcode, prem_sum.Fiscal_AY_Year, 
                      SUM(prem_sum.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(prem_sum.currentearnedpremium) AS currentearnedpremium, 
                      SUM(prem_sum.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(prem_sum.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(prem_sum.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(prem_sum.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(prem_sum.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(prem_sum.Reported_Claims) AS Reported_Claims, 
                      SUM(prem_sum.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(prem_sum.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(prem_sum.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(prem_sum.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(prem_sum.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(prem_sum.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(prem_sum.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(prem_sum.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(prem_sum.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(prem_sum.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, 
                      SUM(prem_sum.COL_GLBI_PropertyDamage_Loss) AS COL_GLBI_PropertyDamage_Loss, 
                      SUM(prem_sum.COL_GLBI_PropertyDamage_Count) AS COL_GLBI_PropertyDamage_Count, 
                      SUM(prem_sum.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(prem_sum.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(prem_sum.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(prem_sum.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(prem_sum.COL_GLBI_Discrim_WrongfulTermination_Loss) AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(prem_sum.COL_GLBI_Discrim_WrongfulTermination_Count) AS COL_GLBI_Discrim_WrongfulTermination_Count, 
                      SUM(prem_sum.Incurred_Claims) AS Incurred_Claims, 
                      SUM(prem_sum.Commission_dollars) AS Commission_dollars, 
                      SUM(prem_sum.Commission_Premiums) AS Commission_Premiums, 
                      all_pol_st_cvg.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      all_pol.New_Renew_Tail, all_pol.Renew_New_Auto, 
                      all_pol.Branch_Region, all_pol.program, 
                      all_pol.Written_Premium_Range, prem_sum.Coverage_Group, 
                      all_pol.product_group, all_pol.Primary_Umbrella, 
                      SUM(prem_sum.Earned_Buildings) AS Earned_Buildings, 
                      SUM(prem_sum.Earned_Locations) AS Earned_Locations, SUM(prem_sum.Earned_TIV) 
                      AS Earned_TIV, all_pol_st_cvg.GL_Dom_Terr_Description, 
                      all_pol_st_cvg.GL_Dom_Region_in_State, all_pol.Primary_Producer, 
                      SUM(prem_sum.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      all_pol.Account_UltLoss_Ratio_Working_Cover_Range, 
                      all_pol.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(prem_sum.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      all_pol.accountnumber, all_pol.Account_Name, 
                      all_pol.Primary_Producer_type, SUM(prem_sum.Incurred_Loss_ALAE_with_SS) 
                      AS Incurred_Loss_ALAE_with_SS, SUM(prem_sum.Capped_Incurred_Loss_ALAE_with_SS) 
                      AS Capped_Incurred_Loss_ALAE_with_SS, SUM(prem_sum.Ult_LDF_Incurred_Loss_ALAE_with_SS) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS, SUM(prem_sum.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) 
                      AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, all_pol_gl.GL_Aggregate_Limit, 
                      all_pol_gl.GL_Deductible, all_pol_gl.GLDX_Indicator, 
                      all_pol_gl.SAM_Form, all_pol_gl.SAM_OCC_Limit, 
                      all_pol_gl.SAM_Agg_Limit, all_pol_gl.SAM_Form_Group, 
                      all_pol_gl.GL_Occurrence_Limit, all_pol.Endorsement_GLDX_YN, 
                      prem_sum.policynumber, all_pol_fire.Property_Coverage_Form, 
                      prem_sum.Coverage_Form, all_pol_fire.FA_Constr_Code_Dominant_NAME, 
                      all_pol_fire.FA_Hail_Dominant, all_pol_fire.ZIP_Pop_Density_Dominant, 
                      all_pol_fire.FA_Avg_Bld_Rate_Range, all_pol_fire.FA_Avg_Bld_Rate_rd2, 
                      all_pol_fire.FA_Deductible, SUM(prem_sum.COL_Prop_Wind_Hail_Count) 
                      AS COL_Prop_Wind_Hail_Count, SUM(prem_sum.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(prem_sum.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(prem_sum.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(prem_sum.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(prem_sum.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(prem_sum.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(prem_sum.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(prem_sum.COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(prem_sum.COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, 
                      SUM(prem_sum.COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(prem_sum.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      all_pol.Endorsement_Elite_YN, all_pol.First_Policy_Year, 
                      GL_avg_rts.Private_Pre_HS_NP_Avg_Rate_Range, 
                      GL_avg_rts.Private_HS_NP_Avg_Rate_Range, 
                      GL_avg_rts.Vocational_Schools_Avg_Rate_Range, 
                      GL_avg_rts.Private_Pre_HS_FP_Avg_Rate_Range, 
                      GL_avg_rts.Corp_Punishment_Avg_Rate_Range, GL_avg_rts.College_FP_Avg_Rate_Range, 
                      GL_avg_rts.College_NP_Avg_Rate_Range, GL_avg_rts.Dormitories_FP_Avg_Rate_Range, 
                      GL_avg_rts.Dormitories_NP_Avg_Rate_Range, 
                      GL_avg_rts.Private_Schools_FP_Avg_Rate_Range, GL_avg_rts.Schools_FP_Avg_Rate_Range, 
                      GL_avg_rts.Schools_NP_Avg_Rate_Range, GL_avg_rts.Day_Care_FP_Avg_Rate_Range, 
                      GL_avg_rts.Day_Care_NP_Avg_Rate_Range, GL_avg_rts.Day_Care_Avg_Rate_Range, 
                      GL_avg_rts.Camps_NP_Avg_Rate_Range, GL_avg_rts.Camps_FP_Avg_Rate_Range, 
                      GL_avg_rts.Camps_Avg_Rate_Range, uw_chk.Pool_YN, 
                      uw_chk.Number_of_Swimming_Pools_Range, 
                      uw_chk.Number_of_Swimming_Pools, uw_chk.Hired_Exposure_YN, 
                      uw_chk.Life_Safety_Requirements_YN, 
                      uw_chk.Number_of_Buildings_Greater_than_3_Stories_Range, 
                      uw_chk.Coastal_Wind_Guides_YN, uw_chk.Special_Events_YN, 
                      uw_chk.Martial_Arts_YN, uw_chk.Asbestos_Lead_YN, 
                      uw_chk.Dorms_YN, uw_chk.Hail_YN, 
                      uw_chk.PIIC_Boiler_YN, uw_chk.Diving_Board_YN, 
                      uw_chk.Non_Owned_YN, uw_chk.Volunteers_YN, 
                      uw_chk.Locations_Range, uw_chk.UMUIM_State_Issues_YN, 
                      uw_chk.Athletic_Participants_YN, uw_chk.Builders_Risk_YN, 
                      uw_chk.Camps_YN, uw_chk.Stadiums_YN, 
                      uw_chk.Abuse_Molestation_YN, uw_chk.Umbrella_YN, 
                      uw_chk.Mold_YN, uw_chk.Limits_ITV_YN, 
                      all_pol.Endorsement_VS_001, COUNT(*) AS Expr1, all_pol_auto.PolicyID, 
                      all_pol_auto.Auto_Vehicle_All_count, all_pol_auto.Auto_Vehicle_Truck_count, 
                      all_pol_auto.Auto_Vehicle_PPT_count, all_pol_auto.Auto_Vehicle_Buses_count, 
                      all_pol_auto.Auto_Vehicle_VanPools_count, 
                      all_pol_auto.Auto_Vehicle_OtherPublic_count, all_pol_auto.Auto_Vehicle_Other_count, 
                      all_pol_auto.Auto_Vehicle_Dual_Control_count, 
                      all_pol_auto.Auto_Vehicle_count_Total_Range, 
                      all_pol_auto.Auto_Vehicle_count_Truck_Range, 
                      all_pol_auto.Auto_Vehicle_count_PPT_Range, 
                      all_pol_auto.Auto_Vehicle_count_Buses_Range, 
                      all_pol_auto.Auto_Vehicle_count_VanPools_Range, 
                      all_pol_auto.Auto_Vehicle_count_OtherPublic_Range, 
                      all_pol_auto.Auto_Vehicle_count_Other_Range, 
                      all_pol_auto.Auto_Vehicle_count_Dual_Control_Range, 
                      all_pol_auto.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      all_pol_auto.Driving_School, all_pol_auto.Coll_No_Ded, 
                      all_pol_auto.Coll_U1000_Ded, all_pol_auto.Coll_1000_Ded, 
                      all_pol_auto.Coll_O1000_Ded, all_pol_auto.OTC_No_Ded, 
                      all_pol_auto.OTC_U1000_Ded, all_pol_auto.OTC_1000_Ded, 
                      all_pol_auto.OTC_O1000_Ded, all_pol_auto.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_OTC_O1000_Ded_Range, all_pol_auto.Hired_Auto, 
                      all_pol_auto.Non_Owned_Auto, all_pol.Last_Reporting_Year, 
                      all_pol.Last_Reporting_Month,
                      
                      uw_chk.Headstart_YN, 
                      uw_chk.Number_of_Total_Employees_Range, 
                      uw_chk.Percent_of_Part_Time_and_Temp_Employees_Range, 
                      uw_chk.Number_of_years_in_Operation_Range, 
                      uw_chk.Turnover_Rate_Range,
                      
                      all_pol.Account_Premium_Range,
all_pol.Account_RepLoss_Ratio,
all_pol.Account_RepLoss_Ratio_NonCat,
all_pol.Account_UltLoss_Ratio,
all_pol.Account_UltLoss_Ratio_NonCat,
all_pol.BusinessClassDesc,
all_pol.CompanyCode,
all_pol.DivisionName,
GL_avg_rts.Dormitories_Avg_Rate_Range,
prem_sum.Fiscal_AY_Month_Ending,
prem_sum.Incurred_Loss_ALAE_with_SS_CatOnly,
all_pol.PIC_Producer,
uw_chk.Playground_Equip_YN,
uw_chk.Playground_YN,
all_pol_st_cvg.Price_Monitor_Standard_Cov_Grp_Monitored_range,
GL_avg_rts.Private_Schools_Avg_Rate_Range,
all_pol.producttype,
GL_avg_rts.Public_Schools_Avg_Rate_Range,
GL_avg_rts.Public_Schools_HS_Avg_Rate_Range,
GL_avg_rts.Public_Schools_Pre_HS_Avg_Rate_Range,
all_pol.Source_Detail_Name,
uw_chk.Sports_Activities_YN,
uw_chk.Tennis_Bubble_YN,
uw_chk.Tennis_Courts_YN,
all_pol.underwriter,

all_pol_fire.TIV_Range, 
all_pol_fire.FA_Deductible_to_TIV_Range, 
all_pol_fire.FA_Avg_TIV_per_BLD_Range 
FROM         Act_Detailed_Experience..ALL_POLICIES_12_premium_summary_June prem_sum INNER JOIN
                      Act_Detailed_Experience..Policy_Information_ALL_POLICIES_AUTO_June all_pol_auto ON 
                      prem_sum.policynumber = all_pol_auto.policynumber LEFT OUTER JOIN
                      Act_Detailed_Experience..Policy_Information_Underwriting_Check_List_June uw_chk ON 
                      prem_sum.policynumber = uw_chk.policynumber LEFT OUTER JOIN
                      Act_Detailed_Experience..Policy_Information_GL_AVG_RATES_June GL_avg_rts ON 
                      prem_sum.policynumber = GL_avg_rts.Policynumber LEFT OUTER JOIN
                      Act_Detailed_Experience..Policy_Information_ALL_POLICIES_GL_June all_pol_gl ON 
                      prem_sum.policynumber = all_pol_gl.policynumber LEFT OUTER JOIN
                      Act_Detailed_Experience..Policy_Information_ALL_POLICIES_FireAllied_June all_pol_fire ON 
                      prem_sum.policynumber = all_pol_fire.policynumber LEFT OUTER JOIN
                      Act_Detailed_Experience..Policy_Information_ALL_POLICIES_June all_pol ON 
                      prem_sum.policynumber = all_pol.policynumber LEFT OUTER JOIN
                      Act_Detailed_Experience..Policy_Product_State_Coverage_Data_ALL_POLICIES_June all_pol_st_cvg ON 
                      prem_sum.policynumber = all_pol_st_cvg.policynumber AND 
                      prem_sum.productcode = all_pol_st_cvg.Productcode AND 
                      prem_sum.statecode = all_pol_st_cvg.statecode AND 
                      prem_sum.Coverage_Group = all_pol_st_cvg.coverage_group
                      
WHERE all_pol.Primary_Umbrella = ''Primary''
and prem_sum.Fiscal_AY_Year > @Fiscal_AY_Year
and prem_sum.productcode = @productcode
GROUP BY prem_sum.statecode, prem_sum.Coverage_Reporting_group, 
                      prem_sum.productcode, prem_sum.Fiscal_AY_Year, 
                      all_pol_st_cvg.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      all_pol.New_Renew_Tail, all_pol.Renew_New_Auto, 
                      all_pol.Branch_Region, all_pol.program, 
                      all_pol.Written_Premium_Range, prem_sum.Coverage_Group, 
                      all_pol.product_group, all_pol.Primary_Umbrella, 
                      all_pol_st_cvg.GL_Dom_Terr_Description, 
                      all_pol_st_cvg.GL_Dom_Region_in_State, all_pol.Primary_Producer, 
                      all_pol.Account_UltLoss_Ratio_Working_Cover_Range, 
                      all_pol.Account_RepLoss_Ratio_Working_Cover_Range, all_pol.accountnumber, 
                      all_pol.Account_Name, all_pol.Primary_Producer_type, 
                      all_pol_gl.GL_Aggregate_Limit, all_pol_gl.GL_Deductible, 
                      all_pol_gl.GLDX_Indicator, all_pol_gl.SAM_Form, 
                      all_pol_gl.SAM_OCC_Limit, all_pol_gl.SAM_Agg_Limit, 
                      all_pol_gl.SAM_Form_Group, all_pol_gl.GL_Occurrence_Limit, 
                      all_pol.Endorsement_GLDX_YN, prem_sum.policynumber, 
                      all_pol_fire.Property_Coverage_Form, prem_sum.Coverage_Form, 
                      all_pol_fire.FA_Constr_Code_Dominant_NAME, 
                      all_pol_fire.FA_Hail_Dominant, all_pol_fire.ZIP_Pop_Density_Dominant, 
                      all_pol_fire.FA_Avg_Bld_Rate_Range, all_pol_fire.FA_Avg_Bld_Rate_rd2, 
                      all_pol_fire.FA_Deductible, all_pol.Endorsement_Elite_YN, 
                      all_pol.First_Policy_Year, GL_avg_rts.Private_Pre_HS_NP_Avg_Rate_Range, 
                      GL_avg_rts.Private_HS_NP_Avg_Rate_Range, 
                      GL_avg_rts.Vocational_Schools_Avg_Rate_Range, 
                      GL_avg_rts.Private_Pre_HS_FP_Avg_Rate_Range, 
                      GL_avg_rts.Corp_Punishment_Avg_Rate_Range, GL_avg_rts.College_FP_Avg_Rate_Range, 
                      GL_avg_rts.College_NP_Avg_Rate_Range, GL_avg_rts.Dormitories_FP_Avg_Rate_Range, 
                      GL_avg_rts.Dormitories_NP_Avg_Rate_Range, 
                      GL_avg_rts.Private_Schools_FP_Avg_Rate_Range, GL_avg_rts.Schools_FP_Avg_Rate_Range, 
                      GL_avg_rts.Schools_NP_Avg_Rate_Range, GL_avg_rts.Day_Care_FP_Avg_Rate_Range, 
                      GL_avg_rts.Day_Care_NP_Avg_Rate_Range, GL_avg_rts.Day_Care_Avg_Rate_Range, 
                      GL_avg_rts.Camps_NP_Avg_Rate_Range, GL_avg_rts.Camps_FP_Avg_Rate_Range, 
                      GL_avg_rts.Camps_Avg_Rate_Range, uw_chk.Pool_YN, 
                      uw_chk.Number_of_Swimming_Pools_Range, 
                      uw_chk.Number_of_Swimming_Pools, uw_chk.Hired_Exposure_YN, 
                      uw_chk.Life_Safety_Requirements_YN, 
                      uw_chk.Number_of_Buildings_Greater_than_3_Stories_Range, 
                      uw_chk.Coastal_Wind_Guides_YN, uw_chk.Special_Events_YN, 
                      uw_chk.Martial_Arts_YN, uw_chk.Asbestos_Lead_YN, 
                      uw_chk.Dorms_YN, uw_chk.Hail_YN, 
                      uw_chk.PIIC_Boiler_YN, uw_chk.Diving_Board_YN, 
                      uw_chk.Non_Owned_YN, uw_chk.Volunteers_YN, 
                      uw_chk.Locations_Range, uw_chk.UMUIM_State_Issues_YN, 
                      uw_chk.Athletic_Participants_YN, uw_chk.Builders_Risk_YN, 
                      uw_chk.Camps_YN, uw_chk.Stadiums_YN, 
                      uw_chk.Abuse_Molestation_YN, uw_chk.Umbrella_YN, 
                      uw_chk.Mold_YN, uw_chk.Limits_ITV_YN, 
                      all_pol.Endorsement_VS_001, all_pol_auto.PolicyID, 
                      all_pol_auto.Auto_Vehicle_All_count, all_pol_auto.Auto_Vehicle_Truck_count, 
                      all_pol_auto.Auto_Vehicle_PPT_count, all_pol_auto.Auto_Vehicle_Buses_count, 
                      all_pol_auto.Auto_Vehicle_VanPools_count, 
                      all_pol_auto.Auto_Vehicle_OtherPublic_count, all_pol_auto.Auto_Vehicle_Other_count, 
                      all_pol_auto.Auto_Vehicle_Dual_Control_count, 
                      all_pol_auto.Auto_Vehicle_count_Total_Range, 
                      all_pol_auto.Auto_Vehicle_count_Truck_Range, 
                      all_pol_auto.Auto_Vehicle_count_PPT_Range, 
                      all_pol_auto.Auto_Vehicle_count_Buses_Range, 
                      all_pol_auto.Auto_Vehicle_count_VanPools_Range, 
                      all_pol_auto.Auto_Vehicle_count_OtherPublic_Range, 
                      all_pol_auto.Auto_Vehicle_count_Other_Range, 
                      all_pol_auto.Auto_Vehicle_count_Dual_Control_Range, 
                      all_pol_auto.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      all_pol_auto.Driving_School, all_pol_auto.Coll_No_Ded, 
                      all_pol_auto.Coll_U1000_Ded, all_pol_auto.Coll_1000_Ded, 
                      all_pol_auto.Coll_O1000_Ded, all_pol_auto.OTC_No_Ded, 
                      all_pol_auto.OTC_U1000_Ded, all_pol_auto.OTC_1000_Ded, 
                      all_pol_auto.OTC_O1000_Ded, all_pol_auto.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      all_pol_auto.Auto_Vehicle_count_OTC_O1000_Ded_Range, all_pol_auto.Hired_Auto, 
                      all_pol_auto.Non_Owned_Auto, all_pol.Last_Reporting_Year, 
                      all_pol.Last_Reporting_Month,
                      uw_chk.Headstart_YN, 
                      uw_chk.Number_of_Total_Employees_Range, 
                      uw_chk.Percent_of_Part_Time_and_Temp_Employees_Range, 
                      uw_chk.Number_of_years_in_Operation_Range, 
                      uw_chk.Turnover_Rate_Range,
                      
                      all_pol.Account_Premium_Range,
all_pol.Account_RepLoss_Ratio,
all_pol.Account_RepLoss_Ratio_NonCat,
all_pol.Account_UltLoss_Ratio,
all_pol.Account_UltLoss_Ratio_NonCat,
all_pol.BusinessClassDesc,
all_pol.CompanyCode,
all_pol.DivisionName,
GL_avg_rts.Dormitories_Avg_Rate_Range,
prem_sum.Fiscal_AY_Month_Ending,
prem_sum.Incurred_Loss_ALAE_with_SS_CatOnly,
all_pol.PIC_Producer,
uw_chk.Playground_Equip_YN,
uw_chk.Playground_YN,
all_pol_st_cvg.Price_Monitor_Standard_Cov_Grp_Monitored_range,
GL_avg_rts.Private_Schools_Avg_Rate_Range,
all_pol.producttype,
GL_avg_rts.Public_Schools_Avg_Rate_Range,
GL_avg_rts.Public_Schools_HS_Avg_Rate_Range,
GL_avg_rts.Public_Schools_Pre_HS_Avg_Rate_Range,
all_pol.Source_Detail_Name,
uw_chk.Sports_Activities_YN,
uw_chk.Tennis_Bubble_YN,
uw_chk.Tennis_Courts_YN,
all_pol.underwriter,

all_pol_fire.TIV_Range, 
all_pol_fire.FA_Deductible_to_TIV_Range, 
all_pol_fire.FA_Avg_TIV_per_BLD_Range 


end' 
END
GO
