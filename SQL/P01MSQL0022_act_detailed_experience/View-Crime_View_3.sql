IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Crime_View_3]'))
DROP VIEW [dbo].[Crime_View_3]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Crime_View_3]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Crime_View_3
AS
SELECT     statecode, Coverage_Reporting_group, productcode, Fiscal_AY_Year, currentwrittenpremium, currentearnedpremium, Policy_count_Reporting_Coverage, 
                      Incurred_Loss_ALAE_with_SS_NonCat, Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Reported_Claims, COL_GLBI_Malpractice_Count, COL_GLBI_Malpractice_Loss, 
                      COL_GLBI_Fraud_Breach_of_Contract_Count, COL_GLBI_Fraud_Breach_of_Contract_Loss, COL_GLBI_Injury_Count, COL_GLBI_Injury_Loss, COL_GLBI_Other_Count, 
                      COL_GLBI_Other_Loss, COL_GLBI_Sexual_Assault_Molest_Abuse_Count, COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, COL_GLBI_PropertyDamage_Loss, 
                      COL_GLBI_PropertyDamage_Count, COL_GLBI_Theft_Loss, COL_GLBI_Theft_Count, COL_GLBI_SlanderDefamtion_Loss, COL_GLBI_SlanderDefamtion_Count, 
                      COL_GLBI_Discrim_WrongfulTermination_Loss, COL_GLBI_Discrim_WrongfulTermination_Count, Incurred_Claims, Commission_dollars, Commission_Premiums, 
                      Price_Monitor_Standard_CovGrp_GL_Monitored_range, New_Renew_Tail, Renew_New_Auto, Branch_Region, program, Written_Premium_Range, Coverage_Group, 
                      Product_group, Primary_Umbrella, Earned_Buildings, Earned_Locations, Earned_TIV, GL_Dom_Terr_Description, GL_Dom_Region_in_State, Primary_Producer, 
                      Policy_count_All_Cov_Combined, Account_UltLoss_Ratio_Working_Cover_Range, Account_RepLoss_Ratio_Working_Cover_Range, Policy_count_Coverage_Group, 
                      Primary_Producer_type, Playground_YN, Playground_Equip_YN, Pool_YN, Sports_Activities_YN, Tennis_Bubble_YN, Tennis_Courts_YN, 
                      Number_of_Swimming_Pools_Range, Incurred_Loss_ALAE_with_SS, Capped_Incurred_Loss_ALAE_with_SS, Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, GL_Aggregate_Limit, GL_Deductible, GLDX_Indicator, SAM_Form, SAM_OCC_Limit, SAM_Agg_Limit, SAM_Form_Group, 
                      GL_Occurrence_Limit, Endorsement_GLDX_YN, policynumber, Property_Coverage_Form, Coverage_Form, FA_Constr_Code_Dominant_NAME, FA_Hail_Dominant, 
                      ZIP_Pop_Density_Dominant, FA_Avg_Bld_Rate_Range, FA_Avg_Bld_Rate_rd2, FA_Deductible, COL_Prop_Wind_Hail_Count, COL_Prop_Wind_Hail_Loss, 
                      COL_Prop_Water_Other_Loss, COL_Prop_Water_Other_Count, COL_Prop_Water_Sprinkler_Loss, COL_Prop_Water_Sprinkler_Count, COL_Prop_Theft_Van_Loss, 
                      COL_Prop_Theft_Van_Count, COL_Prop_Fire_Lightning_Explosion_Loss, COL_Prop_Fire_Lightning_Explosion_Count, COL_Prop_Other_Loss, 
                      COL_Prop_Other_Count, Endorsement_Elite_YN, Account_Name, Incurred_Loss_ALAE_with_SS_CatOnly, Auto_Vehicle_count_Total_Range, 
                      Auto_Vehicle_count_PPT_Range, Auto_Vehicle_count_Buses_Range, Auto_Vehicle_count_Truck_Range, Auto_Vehicle_count_VanPools_Range, 
                      Auto_Vehicle_count_OtherPublic_Range, Auto_Vehicle_count_Other_Range, Auto_Vehicle_count_Coll_No_Ded_Range, Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      Auto_Vehicle_count_Coll_1000_Ded_Range, Auto_Vehicle_count_Coll_O1000_Ded_Range, Auto_Vehicle_count_OTC_No_Ded_Range, 
                      Auto_Vehicle_count_OTC_U1000_Ded_Range, Auto_Vehicle_count_OTC_1000_Ded_Range, Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      Auto_Vehicle_count_Dual_Control_Range, Auto_Vehicle_count_Dual_Control_Percent_Range, BusinessClassDesc, DivisionName, producttype, Source_Detail_Name, 
                      First_Policy_Year, PIC_Producer, underwriter, Fiscal_AY_Month_Ending, Last_Reporting_Year, Last_Reporting_Month, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Account_UltLoss_Ratio, Account_UltLoss_Ratio_NonCat, Account_RepLoss_Ratio, programdesc, PICProducer, 
                      PrimaryProducer, PrimaryProducerType, Account_Premium_Range, SLD_BusinessType, effectivedate, expirationdate, Business_Desc, PrimaryProducerNumber, 
                      underwriterName, regiondesc, Written_Premium_Range_for_Product, accountnumber
FROM         dbo.Latest_All_Lines_View_1
WHERE     (Fiscal_AY_Year > 2008) AND (productcode IN (''CL'', ''FF'', ''DF'', ''PV'', ''AE'')) AND (Coverage_Group IN (''Crime'', ''Fidelity'', ''BOP CR''))
' 
GO
