IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_CAY]'))
DROP VIEW [dbo].[Latest_All_Lines_View_1_CAY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_CAY]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Latest_All_Lines_View_1_CAY
AS
SELECT     dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.statecode, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Coverage_Reporting_group, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.productcode, dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Fiscal_AY_Year, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Malpractice_Count) 
                      AS COL_GLBI_Malpractice_Count, SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Malpractice_Loss) 
                      AS COL_GLBI_Malpractice_Loss, SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Fraud_Breach_of_Contract_Loss) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Loss, SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Injury_Count) 
                      AS COL_GLBI_Injury_Count, SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_PropertyDamage_Loss) AS COL_GLBI_PropertyDamage_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_PropertyDamage_Count) AS COL_GLBI_PropertyDamage_Count, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Incurred_Claims) 
                      AS Incurred_Claims, SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.New_Renew_Tail, dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Renew_New_Auto, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Branch_Region, dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Coverage_Group, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Primary_Umbrella, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Earned_TIV) AS Earned_TIV, 
                      dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.GL_Dom_Terr_Description, 
                      dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.GL_Dom_Region_in_State, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Primary_Producer, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Primary_Producer_type, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Playground_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Playground_Equip_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Pool_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Sports_Activities_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Tennis_Bubble_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Tennis_Courts_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Number_of_Swimming_Pools_Range, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) 
                      AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.GL_Aggregate_Limit, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.GL_Deductible, dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.GLDX_Indicator, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.SAM_Form, dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.SAM_OCC_Limit, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.SAM_Agg_Limit, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.SAM_Form_Group, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.GL_Occurrence_Limit, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Endorsement_GLDX_YN, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.policynumber, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.Property_Coverage_Form, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Coverage_Form, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.FA_Constr_Code_Dominant_NAME, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.FA_Hail_Dominant, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.ZIP_Pop_Density_Dominant, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.FA_Avg_Bld_Rate_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.FA_Avg_Bld_Rate_rd2, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.FA_Deductible, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Wind_Hail_Count) AS COL_Prop_Wind_Hail_Count, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Wind_Hail_Loss) AS COL_Prop_Wind_Hail_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Water_Other_Loss) AS COL_Prop_Water_Other_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Water_Other_Count) AS COL_Prop_Water_Other_Count, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Water_Sprinkler_Loss) AS COL_Prop_Water_Sprinkler_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Water_Sprinkler_Count) AS COL_Prop_Water_Sprinkler_Count, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Theft_Van_Loss) AS COL_Prop_Theft_Van_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Theft_Van_Count) AS COL_Prop_Theft_Van_Count, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Fire_Lightning_Explosion_Loss) 
                      AS COL_Prop_Fire_Lightning_Explosion_Loss, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Fire_Lightning_Explosion_Count) 
                      AS COL_Prop_Fire_Lightning_Explosion_Count, SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Other_Loss) 
                      AS COL_Prop_Other_Loss, SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.COL_Prop_Other_Count) AS COL_Prop_Other_Count, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Endorsement_Elite_YN, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Total_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_PPT_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Buses_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Truck_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Other_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.First_Policy_Year, dbo.Latest_Policy_Information_ALL_POLICIES_View_1.PIC_Producer, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.underwriter, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Fiscal_AY_Month_Ending, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Last_Reporting_Year, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Last_Reporting_Month, 
                      dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_UltLoss_Ratio, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_UltLoss_Ratio_NonCat, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_RepLoss_Ratio, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_RepLoss_Ratio_NonCat, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_RepLoss_Ratio_priorpolperiods_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Renewals_Range, dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Branch_Office, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Endorsement_HS_004, Act_Pricing.dbo.DNB_Mar2011_Final.CSCORE_GMODEL8, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.FSCORE_GMODEL7_1, Act_Pricing.dbo.DNB_Mar2011_Final.FSCORE_GMODEL7, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.CSCORE_GMODEL7, dbo.Policy_PATHID_Information.productdesc, 
                      dbo.Policy_PATHID_Information.prodmixname, dbo.Policy_PATHID_Information.ProductTypeName, dbo.Policy_PATHID_Information.reportmixname, 
                      dbo.Policy_PATHID_Information.accountname, dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_Name, 
                      dbo.Policy_PATHID_Information.CompanyCode, dbo.Policy_PATHID_Information.Product_group, dbo.Policy_PATHID_Information.NewRenewalAuto, 
                      dbo.Policy_PATHID_Information.effectiveYearMonth, dbo.Policy_PATHID_Information.effectiveYear, dbo.Policy_PATHID_Information.effectiveMonth, 
                      dbo.Policy_PATHID_Information.expirationMonth, dbo.Policy_PATHID_Information.expirationYear, 
                      dbo.Policy_PATHID_Information.expirationYearMonth, dbo.Policy_PATHID_Information.Insd_State, dbo.Policy_PATHID_Information.Insd_City, 
                      dbo.Policy_PATHID_Information.Insd_Zip, dbo.Policy_PATHID_Information.underwriterName, dbo.Policy_PATHID_Information.regiondesc, 
                      dbo.Policy_PATHID_Information.programdesc, dbo.Policy_PATHID_Information.program, dbo.Policy_PATHID_Information.Written_Premium_Range, 
                      dbo.Policy_PATHID_Information.Number_of_Renewals, dbo.Policy_PATHID_Information.PICProducer, 
                      dbo.Policy_PATHID_Information.PrimaryProducer, dbo.Policy_PATHID_Information.PrimaryProducerType, 
                      dbo.Policy_PATHID_Information.Account_Premium_Range, dbo.Policy_PATHID_Information.DivisionName, 
                      dbo.Policy_PATHID_Information.producttype, dbo.Policy_PATHID_Information.PrimaryProducerNumber, dbo.Policy_PATHID_Information.effectivedate, 
                      dbo.Policy_PATHID_Information.expirationdate, dbo.Policy_PATHID_Information.Insured_Years_Range, 
                      dbo.Policy_PATHID_Information.SLD_BusinessType, 
                      SUM(dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Incurred_Loss_ALAE_without_SS_NonCat) 
                      AS Incurred_Loss_ALAE_without_SS_NonCat, dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.accountnumber, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Source_Detail_Name, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.BusinessClassDesc, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.acctngyear
FROM         dbo.Policy_PATHID_Information RIGHT OUTER JOIN
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1 ON 
                      dbo.Policy_PATHID_Information.policynumber = dbo.Latest_Policy_Information_ALL_POLICIES_View_1.policynumber LEFT OUTER JOIN
                      Act_Pricing.dbo.DNB_Mar2011_Final ON 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.accountnumber = Act_Pricing.dbo.DNB_Mar2011_Final.ACCOUNT_NUMBER AND 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.policy_effective_year = Act_Pricing.dbo.DNB_Mar2011_Final.POLICY_YEAR RIGHT OUTER JOIN
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1 LEFT OUTER JOIN
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1 ON 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.policynumber = dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.policynumber LEFT
                       OUTER JOIN
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1 ON 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.policynumber = dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.policynumber
                       LEFT OUTER JOIN
                      dbo.Latest_Policy_Information_GL_AVG_RATES_View_1 ON 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.policynumber = dbo.Latest_Policy_Information_GL_AVG_RATES_View_1.Policynumber LEFT
                       OUTER JOIN
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1 ON 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.policynumber = dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.policynumber LEFT
                       OUTER JOIN
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1 ON 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.policynumber = dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.policynumber
                       ON 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.policynumber = dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.policynumber LEFT OUTER
                       JOIN
                      dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1 ON 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.policynumber = dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.policynumber
                       AND 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.productcode = dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.Productcode
                       AND 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.statecode = dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.statecode
                       AND 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Coverage_Group = dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.coverage_group
GROUP BY dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.statecode, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Coverage_Reporting_group, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.productcode, dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Fiscal_AY_Year, 
                      dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.New_Renew_Tail, dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Renew_New_Auto, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Branch_Region, dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Coverage_Group, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Primary_Umbrella, 
                      dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.GL_Dom_Terr_Description, 
                      dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.GL_Dom_Region_in_State, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Primary_Producer, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Primary_Producer_type, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Playground_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Playground_Equip_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Pool_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Sports_Activities_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Tennis_Bubble_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Tennis_Courts_YN, 
                      dbo.Latest_Policy_Information_Underwriting_Check_List_View_1.Number_of_Swimming_Pools_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.GL_Aggregate_Limit, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.GL_Deductible, dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.GLDX_Indicator, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.SAM_Form, dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.SAM_OCC_Limit, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.SAM_Agg_Limit, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.SAM_Form_Group, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1.GL_Occurrence_Limit, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Endorsement_GLDX_YN, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.policynumber, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.Property_Coverage_Form, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Coverage_Form, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.FA_Constr_Code_Dominant_NAME, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.FA_Hail_Dominant, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.ZIP_Pop_Density_Dominant, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.FA_Avg_Bld_Rate_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.FA_Avg_Bld_Rate_rd2, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1.FA_Deductible, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Endorsement_Elite_YN, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Total_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_PPT_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Buses_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Truck_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_OtherPublic_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Other_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Coll_No_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_OTC_No_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Dual_Control_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.First_Policy_Year, dbo.Latest_Policy_Information_ALL_POLICIES_View_1.PIC_Producer, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.underwriter, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Fiscal_AY_Month_Ending, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Last_Reporting_Year, 
                      dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.Last_Reporting_Month, 
                      dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_UltLoss_Ratio, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_UltLoss_Ratio_NonCat, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_RepLoss_Ratio, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_RepLoss_Ratio_NonCat, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_RepLoss_Ratio_priorpolperiods_Range, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Renewals_Range, dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Branch_Office, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Endorsement_HS_004, Act_Pricing.dbo.DNB_Mar2011_Final.CSCORE_GMODEL8, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.FSCORE_GMODEL7_1, Act_Pricing.dbo.DNB_Mar2011_Final.FSCORE_GMODEL7, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.CSCORE_GMODEL7, dbo.Policy_PATHID_Information.productdesc, 
                      dbo.Policy_PATHID_Information.prodmixname, dbo.Policy_PATHID_Information.ProductTypeName, dbo.Policy_PATHID_Information.reportmixname, 
                      dbo.Policy_PATHID_Information.accountname, dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Account_Name, 
                      dbo.Policy_PATHID_Information.CompanyCode, dbo.Policy_PATHID_Information.Product_group, dbo.Policy_PATHID_Information.NewRenewalAuto, 
                      dbo.Policy_PATHID_Information.effectiveYearMonth, dbo.Policy_PATHID_Information.effectiveYear, dbo.Policy_PATHID_Information.effectiveMonth, 
                      dbo.Policy_PATHID_Information.expirationMonth, dbo.Policy_PATHID_Information.expirationYear, 
                      dbo.Policy_PATHID_Information.expirationYearMonth, dbo.Policy_PATHID_Information.Insd_State, dbo.Policy_PATHID_Information.Insd_City, 
                      dbo.Policy_PATHID_Information.Insd_Zip, dbo.Policy_PATHID_Information.underwriterName, dbo.Policy_PATHID_Information.regiondesc, 
                      dbo.Policy_PATHID_Information.programdesc, dbo.Policy_PATHID_Information.program, dbo.Policy_PATHID_Information.Written_Premium_Range, 
                      dbo.Policy_PATHID_Information.Number_of_Renewals, dbo.Policy_PATHID_Information.PICProducer, 
                      dbo.Policy_PATHID_Information.PrimaryProducer, dbo.Policy_PATHID_Information.PrimaryProducerType, 
                      dbo.Policy_PATHID_Information.Account_Premium_Range, dbo.Policy_PATHID_Information.DivisionName, 
                      dbo.Policy_PATHID_Information.producttype, dbo.Policy_PATHID_Information.PrimaryProducerNumber, dbo.Policy_PATHID_Information.effectivedate, 
                      dbo.Policy_PATHID_Information.expirationdate, dbo.Policy_PATHID_Information.Insured_Years_Range, 
                      dbo.Policy_PATHID_Information.SLD_BusinessType, dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.accountnumber, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.Source_Detail_Name, 
                      dbo.Latest_Policy_Information_ALL_POLICIES_View_1.BusinessClassDesc, dbo.Latest_ALL_POLICIES_12_premium_summary_View_1.acctngyear
' 
GO
