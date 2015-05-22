IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1BK2]'))
DROP VIEW [dbo].[Latest_All_Lines_View_1BK2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1BK2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Latest_All_Lines_View_1BK2]
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_March.statecode, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_March.productcode, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Fraud_Breach_of_Contract_Loss) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Injury_Count) 
                      AS COL_GLBI_Injury_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_March.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_March.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_March.Branch_Region, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_March.Primary_Umbrella, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_Buildings) 
                      AS Earned_Buildings, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_March.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_March.accountnumber, dbo.Policy_Information_ALL_POLICIES_March.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Playground_Equip_YN, dbo.Policy_Information_Underwriting_Check_List_March.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Number_of_Swimming_Pools_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_March.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_March.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.Property_Coverage_Form, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.FA_Deductible, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Fire_Lightning_Explosion_Loss) AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Fire_Lightning_Explosion_Count) AS COL_Prop_Fire_Lightning_Explosion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Other_Loss) AS COL_Prop_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      dbo.Policy_Information_ALL_POLICIES_March.Endorsement_Elite_YN, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.First_Policy_Year, dbo.Policy_Information_ALL_POLICIES_March.PIC_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_March.underwriter, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Month_Ending, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Last_Reporting_Year, dbo.ALL_POLICIES_12_premium_summary_March.Last_Reporting_Month, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio, dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Renewals_Range, dbo.Policy_Information_ALL_POLICIES_March.Branch_Office, 
                      dbo.Policy_Information_ALL_POLICIES_March.Endorsement_HS_004, Act_Pricing.dbo.DNB_Mar2011_Final.CSCORE_GMODEL8, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.FSCORE_GMODEL7_1, Act_Pricing.dbo.DNB_Mar2011_Final.FSCORE_GMODEL7, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.CSCORE_GMODEL7, dbo.Policy_PATHID_Information.productdesc, 
                      dbo.Policy_PATHID_Information.prodmixname, dbo.Policy_PATHID_Information.ProductTypeName, dbo.Policy_PATHID_Information.reportmixname, 
                      dbo.Policy_PATHID_Information.accountname, dbo.Policy_Information_ALL_POLICIES_March.Account_Name, 
                      dbo.Policy_PATHID_Information.CompanyCode, dbo.Policy_PATHID_Information.Product_group, dbo.Policy_PATHID_Information.NewRenewalAuto, 
                      dbo.Policy_PATHID_Information.effectiveYearMonth, dbo.Policy_PATHID_Information.effectiveYear, dbo.Policy_PATHID_Information.effectiveMonth, 
                      dbo.Policy_PATHID_Information.expirationMonth, dbo.Policy_PATHID_Information.expirationYear, 
                      dbo.Policy_PATHID_Information.expirationYearMonth, dbo.Policy_PATHID_Information.Insd_State, dbo.Policy_PATHID_Information.Insd_City, 
                      dbo.Policy_PATHID_Information.Insd_Zip, dbo.Policy_PATHID_Information.underwriterName, dbo.Policy_PATHID_Information.regiondesc, 
                      dbo.Policy_PATHID_Information.programdesc, dbo.Policy_PATHID_Information.program, dbo.Policy_PATHID_Information.Written_Premium_Range, 
                      dbo.Policy_PATHID_Information.Number_of_Renewals, dbo.Policy_PATHID_Information.PICProducer, 
                      dbo.Policy_PATHID_Information.PrimaryProducer, dbo.Policy_PATHID_Information.PrimaryProducerType, 
                      dbo.Policy_PATHID_Information.Account_Premium_Range, dbo.Policy_PATHID_Information.BusinessClassDesc, 
                      dbo.Policy_PATHID_Information.Source_Detail_Name, dbo.Policy_PATHID_Information.DivisionName, dbo.Policy_PATHID_Information.producttype, 
                      dbo.Policy_PATHID_Information.PrimaryProducerNumber, dbo.Policy_PATHID_Information.effectivedate, 
                      dbo.Policy_PATHID_Information.expirationdate, dbo.Policy_PATHID_Information.Insured_Years_Range, 
                      dbo.Policy_PATHID_Information.SLD_BusinessType
FROM         dbo.Policy_PATHID_Information RIGHT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_March ON 
                      dbo.Policy_PATHID_Information.policynumber = dbo.Policy_Information_ALL_POLICIES_March.policynumber LEFT OUTER JOIN
                      Act_Pricing.dbo.DNB_Mar2011_Final ON 
                      dbo.Policy_Information_ALL_POLICIES_March.accountnumber = Act_Pricing.dbo.DNB_Mar2011_Final.ACCOUNT_NUMBER AND 
                      dbo.Policy_Information_ALL_POLICIES_March.policy_effective_year = Act_Pricing.dbo.DNB_Mar2011_Final.POLICY_YEAR RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_March LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_March AS Policy_Information_Underwriting_Check_List_March_1 ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = Policy_Information_Underwriting_Check_List_March_1.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Information_ALL_POLICIES_AUTO_March.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Information_Underwriting_Check_List_March.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_GL_AVG_RATES_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Information_GL_AVG_RATES_March.Policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Information_ALL_POLICIES_GL_March.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Information_ALL_POLICIES_FireAllied_March.policynumber ON 
                      dbo.Policy_Information_ALL_POLICIES_March.policynumber = dbo.ALL_POLICIES_12_premium_summary_March.policynumber LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.policynumber AND
                       dbo.ALL_POLICIES_12_premium_summary_March.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_March.statecode, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_March.productcode, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_March.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_March.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_March.Branch_Region, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_March.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_March.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.accountnumber, dbo.Policy_Information_ALL_POLICIES_March.Primary_Producer_type, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Playground_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Playground_Equip_YN, dbo.Policy_Information_Underwriting_Check_List_March.Pool_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Sports_Activities_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Tennis_Bubble_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Tennis_Courts_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Number_of_Swimming_Pools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Aggregate_Limit, dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.GLDX_Indicator, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Agg_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_GL_March.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_GL_March.GL_Occurrence_Limit, 
                      dbo.Policy_Information_ALL_POLICIES_March.Endorsement_GLDX_YN, dbo.ALL_POLICIES_12_premium_summary_March.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.Property_Coverage_Form, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.FA_Constr_Code_Dominant_NAME, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.FA_Hail_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.ZIP_Pop_Density_Dominant, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.FA_Avg_Bld_Rate_Range, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.FA_Avg_Bld_Rate_rd2, 
                      dbo.Policy_Information_ALL_POLICIES_FireAllied_March.FA_Deductible, dbo.Policy_Information_ALL_POLICIES_March.Endorsement_Elite_YN, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Total_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_PPT_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Buses_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Truck_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Other_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_March.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.First_Policy_Year, dbo.Policy_Information_ALL_POLICIES_March.PIC_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_March.underwriter, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Month_Ending, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Last_Reporting_Year, dbo.ALL_POLICIES_12_premium_summary_March.Last_Reporting_Month, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio, dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Renewals_Range, dbo.Policy_Information_ALL_POLICIES_March.Branch_Office, 
                      dbo.Policy_Information_ALL_POLICIES_March.Endorsement_HS_004, Act_Pricing.dbo.DNB_Mar2011_Final.CSCORE_GMODEL8, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.FSCORE_GMODEL7_1, Act_Pricing.dbo.DNB_Mar2011_Final.FSCORE_GMODEL7, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.CSCORE_GMODEL7, dbo.Policy_PATHID_Information.productdesc, 
                      dbo.Policy_PATHID_Information.prodmixname, dbo.Policy_PATHID_Information.ProductTypeName, dbo.Policy_PATHID_Information.reportmixname, 
                      dbo.Policy_PATHID_Information.accountname, dbo.Policy_Information_ALL_POLICIES_March.Account_Name, 
                      dbo.Policy_PATHID_Information.CompanyCode, dbo.Policy_PATHID_Information.Product_group, dbo.Policy_PATHID_Information.NewRenewalAuto, 
                      dbo.Policy_PATHID_Information.effectiveYearMonth, dbo.Policy_PATHID_Information.effectiveYear, dbo.Policy_PATHID_Information.effectiveMonth, 
                      dbo.Policy_PATHID_Information.expirationMonth, dbo.Policy_PATHID_Information.expirationYear, 
                      dbo.Policy_PATHID_Information.expirationYearMonth, dbo.Policy_PATHID_Information.Insd_State, dbo.Policy_PATHID_Information.Insd_City, 
                      dbo.Policy_PATHID_Information.Insd_Zip, dbo.Policy_PATHID_Information.underwriterName, dbo.Policy_PATHID_Information.regiondesc, 
                      dbo.Policy_PATHID_Information.programdesc, dbo.Policy_PATHID_Information.program, dbo.Policy_PATHID_Information.Written_Premium_Range, 
                      dbo.Policy_PATHID_Information.Number_of_Renewals, dbo.Policy_PATHID_Information.PICProducer, 
                      dbo.Policy_PATHID_Information.PrimaryProducer, dbo.Policy_PATHID_Information.PrimaryProducerType, 
                      dbo.Policy_PATHID_Information.Account_Premium_Range, dbo.Policy_PATHID_Information.BusinessClassDesc, 
                      dbo.Policy_PATHID_Information.Source_Detail_Name, dbo.Policy_PATHID_Information.DivisionName, dbo.Policy_PATHID_Information.producttype, 
                      dbo.Policy_PATHID_Information.PrimaryProducerNumber, dbo.Policy_PATHID_Information.effectivedate, 
                      dbo.Policy_PATHID_Information.expirationdate, dbo.Policy_PATHID_Information.Insured_Years_Range, 
                      dbo.Policy_PATHID_Information.SLD_BusinessType
' 
GO
