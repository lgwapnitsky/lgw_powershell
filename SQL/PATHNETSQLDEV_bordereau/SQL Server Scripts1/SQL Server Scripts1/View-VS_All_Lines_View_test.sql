IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_All_Lines_View_test]'))
DROP VIEW [dbo].[VS_All_Lines_View_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_All_Lines_View_test]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.VS_All_Lines_View_test
AS
SELECT     statecode, Coverage_Reporting_group, productcode, Fiscal_AY_Year, currentwrittenpremium, currentearnedpremium, Policy_count_Reporting_Coverage, 
                      Incurred_Loss_ALAE_with_SS_NonCat, Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Reported_Claims, COL_GLBI_Malpractice_Count, COL_GLBI_Malpractice_Loss, 
                      COL_GLBI_Fraud_Breach_of_Contract_Count, COL_GLBI_Fraud_Breach_of_Contract_Loss, COL_GLBI_Injury_Count, COL_GLBI_Injury_Loss, COL_GLBI_Other_Count, 
                      COL_GLBI_Other_Loss, COL_GLBI_Sexual_Assault_Molest_Abuse_Count, COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, COL_GLBI_PropertyDamage_Loss, 
                      COL_GLBI_PropertyDamage_Count, COL_GLBI_Theft_Loss, COL_GLBI_Theft_Count, COL_GLBI_SlanderDefamtion_Loss, COL_GLBI_SlanderDefamtion_Count, 
                      COL_GLBI_Discrim_WrongfulTermination_Loss, COL_GLBI_Discrim_WrongfulTermination_Count, Incurred_Claims, Commission_dollars, Commission_Premiums, 
                      Price_Monitor_Standard_CovGrp_GL_Monitored_range, New_Renew_Tail, Renew_New_Auto, Branch_Region, Coverage_Group, Primary_Umbrella, Earned_Buildings, 
                      Earned_Locations, Earned_TIV, GL_Dom_Terr_Description, GL_Dom_Region_in_State, Primary_Producer, Policy_count_All_Cov_Combined, 
                      Account_UltLoss_Ratio_Working_Cover_Range, Account_RepLoss_Ratio_Working_Cover_Range, Policy_count_Coverage_Group, Primary_Producer_type, 
                      Playground_YN, Playground_Equip_YN, Pool_YN, Sports_Activities_YN, Tennis_Bubble_YN, Tennis_Courts_YN, Number_of_Swimming_Pools_Range, 
                      Incurred_Loss_ALAE_with_SS, Capped_Incurred_Loss_ALAE_with_SS, Ult_LDF_Incurred_Loss_ALAE_with_SS, Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      GL_Aggregate_Limit, GL_Deductible, SAM_Form, SAM_OCC_Limit, SAM_Agg_Limit, SAM_Form_Group, GL_Occurrence_Limit, Endorsement_GLDX_YN, policynumber, 
                      Property_Coverage_Form, Coverage_Form, FA_Constr_Code_Dominant_NAME, FA_Hail_Dominant, ZIP_Pop_Density_Dominant, FA_Avg_Bld_Rate_Range, 
                      FA_Avg_Bld_Rate_rd2, FA_Deductible, COL_Prop_Wind_Hail_Count, COL_Prop_Wind_Hail_Loss, COL_Prop_Water_Other_Loss, COL_Prop_Water_Other_Count, 
                      COL_Prop_Water_Sprinkler_Loss, COL_Prop_Water_Sprinkler_Count, COL_Prop_Theft_Van_Loss, COL_Prop_Theft_Van_Count, 
                      COL_Prop_Fire_Lightning_Explosion_Loss, COL_Prop_Fire_Lightning_Explosion_Count, COL_Prop_Other_Loss, COL_Prop_Other_Count, Endorsement_Elite_YN, 
                      Incurred_Loss_ALAE_with_SS_CatOnly, Auto_Vehicle_count_Total_Range, Auto_Vehicle_count_PPT_Range, Auto_Vehicle_count_Buses_Range, 
                      Auto_Vehicle_count_Truck_Range, Auto_Vehicle_count_VanPools_Range, Auto_Vehicle_count_OtherPublic_Range, Auto_Vehicle_count_Other_Range, 
                      Auto_Vehicle_count_Coll_No_Ded_Range, Auto_Vehicle_count_Coll_U1000_Ded_Range, Auto_Vehicle_count_Coll_1000_Ded_Range, 
                      Auto_Vehicle_count_Coll_O1000_Ded_Range, Auto_Vehicle_count_OTC_No_Ded_Range, Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      Auto_Vehicle_count_OTC_1000_Ded_Range, Auto_Vehicle_count_OTC_O1000_Ded_Range, Auto_Vehicle_count_Dual_Control_Range, 
                      Auto_Vehicle_count_Dual_Control_Percent_Range, First_Policy_Year, PIC_Producer, underwriter, Fiscal_AY_Month_Ending, Last_Reporting_Year, 
                      Last_Reporting_Month, Price_Monitor_Standard_Cov_Grp_Monitored_range, Account_UltLoss_Ratio, Account_UltLoss_Ratio_NonCat, Account_RepLoss_Ratio, 
                      Account_RepLoss_Ratio_NonCat, Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, Account_RepLoss_Ratio_priorpolperiods_Range, Renewals_Range, 
                      Branch_Office, Endorsement_HS_004, CSCORE_GMODEL8, FSCORE_GMODEL7_1, FSCORE_GMODEL7, CSCORE_GMODEL7, productdesc, prodmixname, 
                      ProductTypeName, reportmixname, accountname, Account_Name, CompanyCode, Product_group, NewRenewalAuto, effectiveYearMonth, effectiveYear, 
                      effectiveMonth, expirationMonth, expirationYear, expirationYearMonth, Insd_State, Insd_City, Insd_Zip, underwriterName, regiondesc, programdesc, program, 
                      Number_of_Renewals, PICProducer, PrimaryProducer, PrimaryProducerType, Account_Premium_Range, DivisionName, producttype, PrimaryProducerNumber, 
                      effectivedate, expirationdate, Insured_Years_Range, SLD_BusinessType, Incurred_Loss_ALAE_without_SS_NonCat, accountnumber, Source_Detail_Name, 
                      BusinessClassDesc, COL_Breach_of_Contract_Count, COL_Breach_of_Contract_Loss, COL_Discrimination_Count, COL_Discrimination_Loss, 
                      COL_Wrongful_Termination_Count, COL_Wrongful_Termination_Loss, COL_Harrassment_Count, COL_Harrassment_Loss, COL_DO_Other_Count, 
                      COL_DO_Other_Loss, COL_EPL_Other_Count, COL_EPL_Other_Loss, COL_Fiduciary_Other_Count, COL_Fiduciary_Other_Loss, 
                      COL_Worplace_Violence_Other_Count, COL_Worplace_Violence_Other_Loss, COL_SLD_All_Other_Count, COL_SLD_All_Other_Loss, County_Pop_Density_Range, 
                      Bylaws_YN, Clean_Warranty_Letter_Received_YN, Disciplinary_Administrative_or_Criminal_Actions_YN, Disciplinary_Action_from_Peer_Review_YN, 
                      Employment_Application_YN, Employment_Handbook_YN, Employment_Application_Handbook_YN, Financials_YN, Form_5500_YN, Information_Only_YN, 
                      List_of_D_and_Os_YN, Standard_Setting_or_Member_Certification_Services_YN, Merger_Acquisition_or_Consolidation_YN, No_Loss_Letter_Received_YN, 
                      No_Prior_Coverage_YN, Magazines_Periodicals_or_Newsletters_YN, Product_Research_or_Development_Testing_Certif_Services_YN, 
                      Proper_Employment_Procedures_YN, Peer_Review_or_Disciplinary_Action_YN, Positive_Fund_Balance_YN, Plan_Assets_Range, 
                      Supplemental_Claim_Form_Loss_Run_YN, Security_Precautions_YN, Subsidiaries_Affiliates_YN, Supp_Claim_Form_Received_YN, Turnover_Rate_Range, 
                      Tax_Exempt_YN, Transaction_E_Commerce_YN, Website_Information_Only_YN, Website_Transactional_E_Commerce_YN, acctngyear, FF_Cov_ALL, PV_Cov_ALL, 
                      policyEffectivedate, policyexpirationdate, Business_Desc, GLDX_Indicator, Account_ProductType_P, Endorsement_CG0001, Written_Premium_Range_for_Product, 
                      Endorsement_HS_003, Endorsement_HS_003D, Written_Premium_Range, Price_Monitor_Standard_Cov_Grp_Monitored, College_FP_Avg_Rate_Range, 
                      College_NP_Avg_Rate_Range, Dormitories_Avg_Rate_Range, Dormitories_FP_Avg_Rate_Range, Dormitories_NP_Avg_Rate_Range, 
                      Private_HS_NP_Avg_Rate_Range, Private_Parking_Avg_Rate_Range, Private_Pre_HS_FP_Avg_Rate_Range, Private_Pre_HS_NP_Avg_Rate_Range, 
                      Private_Schools_Avg_Rate_Range, Private_Schools_FP_Avg_Rate_Range, Public_Schools_Avg_Rate_Range, Public_Schools_HS_Avg_Rate_Range, 
                      Public_Schools_Pre_HS_Avg_Rate_Range, Schools_FP_Avg_Rate_Range, Schools_NP_Avg_Rate_Range, SubProduct, SubProductGroup, 
                      Vocational_Schools_Avg_Rate_Range, PriorityAccountLevelEffective, PriorityAccountLevelcurrent
FROM         dbo.Latest_All_Lines_View_1
WHERE     (productcode = ''VS'') AND (Fiscal_AY_Year > 2008)
' 
GO
