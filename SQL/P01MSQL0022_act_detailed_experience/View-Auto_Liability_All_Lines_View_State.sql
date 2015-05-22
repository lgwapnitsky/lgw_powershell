IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Auto_Liability_All_Lines_View_State]'))
DROP VIEW [dbo].[Auto_Liability_All_Lines_View_State]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Auto_Liability_All_Lines_View_State]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Auto_Liability_All_Lines_View_State
AS
SELECT     dbo.Latest_All_Lines_View_CA.statecode, dbo.Latest_All_Lines_View_CA.Coverage_Reporting_group, dbo.Latest_All_Lines_View_CA.productcode, 
                      dbo.Latest_All_Lines_View_CA.Fiscal_AY_Year, dbo.Latest_All_Lines_View_CA.currentwrittenpremium, dbo.Latest_All_Lines_View_CA.currentearnedpremium, 
                      dbo.Latest_All_Lines_View_CA.Policy_count_Reporting_Coverage, dbo.Latest_All_Lines_View_CA.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.Latest_All_Lines_View_CA.Capped_Incurred_Loss_ALAE_with_SS_wo_cat, dbo.Latest_All_Lines_View_CA.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.Latest_All_Lines_View_CA.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, dbo.Latest_All_Lines_View_CA.Reported_Claims, 
                      dbo.Latest_All_Lines_View_CA.COL_GLBI_Malpractice_Count, dbo.Latest_All_Lines_View_CA.COL_GLBI_Malpractice_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_GLBI_Fraud_Breach_of_Contract_Count, dbo.Latest_All_Lines_View_CA.COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_GLBI_Injury_Count, dbo.Latest_All_Lines_View_CA.COL_GLBI_Injury_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_GLBI_Other_Count, dbo.Latest_All_Lines_View_CA.COL_GLBI_Other_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_GLBI_Sexual_Assault_Molest_Abuse_Count, dbo.Latest_All_Lines_View_CA.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_GLBI_PropertyDamage_Loss, dbo.Latest_All_Lines_View_CA.COL_GLBI_PropertyDamage_Count, 
                      dbo.Latest_All_Lines_View_CA.COL_GLBI_Theft_Loss, dbo.Latest_All_Lines_View_CA.COL_GLBI_Theft_Count, 
                      dbo.Latest_All_Lines_View_CA.COL_GLBI_SlanderDefamtion_Loss, dbo.Latest_All_Lines_View_CA.COL_GLBI_SlanderDefamtion_Count, 
                      dbo.Latest_All_Lines_View_CA.COL_GLBI_Discrim_WrongfulTermination_Loss, dbo.Latest_All_Lines_View_CA.COL_GLBI_Discrim_WrongfulTermination_Count, 
                      dbo.Latest_All_Lines_View_CA.Incurred_Claims, dbo.Latest_All_Lines_View_CA.Commission_dollars, dbo.Latest_All_Lines_View_CA.Commission_Premiums, 
                      dbo.Latest_All_Lines_View_CA.Price_Monitor_Standard_CovGrp_GL_Monitored_range, dbo.Latest_All_Lines_View_CA.New_Renew_Tail, 
                      dbo.Latest_All_Lines_View_CA.Renew_New_Auto, dbo.Latest_All_Lines_View_CA.Branch_Region, dbo.Latest_All_Lines_View_CA.program, 
                      dbo.Latest_All_Lines_View_CA.Written_Premium_Range, dbo.Latest_All_Lines_View_CA.Coverage_Group, dbo.Latest_All_Lines_View_CA.Product_group, 
                      dbo.Latest_All_Lines_View_CA.Primary_Umbrella, dbo.Latest_All_Lines_View_CA.Earned_Buildings, dbo.Latest_All_Lines_View_CA.Earned_Locations, 
                      dbo.Latest_All_Lines_View_CA.Earned_TIV, dbo.Latest_All_Lines_View_CA.GL_Dom_Terr_Description, dbo.Latest_All_Lines_View_CA.GL_Dom_Region_in_State, 
                      dbo.Latest_All_Lines_View_CA.Primary_Producer, dbo.Latest_All_Lines_View_CA.Policy_count_All_Cov_Combined, 
                      dbo.Latest_All_Lines_View_CA.Account_UltLoss_Ratio_Working_Cover_Range, dbo.Latest_All_Lines_View_CA.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Latest_All_Lines_View_CA.Policy_count_Coverage_Group, dbo.Latest_All_Lines_View_CA.accountnumber, dbo.Latest_All_Lines_View_CA.Primary_Producer_type,
                       dbo.Latest_All_Lines_View_CA.Playground_YN, dbo.Latest_All_Lines_View_CA.Playground_Equip_YN, dbo.Latest_All_Lines_View_CA.Pool_YN, 
                      dbo.Latest_All_Lines_View_CA.Sports_Activities_YN, dbo.Latest_All_Lines_View_CA.Tennis_Bubble_YN, dbo.Latest_All_Lines_View_CA.Tennis_Courts_YN, 
                      dbo.Latest_All_Lines_View_CA.Number_of_Swimming_Pools_Range, dbo.Latest_All_Lines_View_CA.Incurred_Loss_ALAE_with_SS, 
                      dbo.Latest_All_Lines_View_CA.Capped_Incurred_Loss_ALAE_with_SS, dbo.Latest_All_Lines_View_CA.Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      dbo.Latest_All_Lines_View_CA.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, dbo.Latest_All_Lines_View_CA.GL_Aggregate_Limit, 
                      dbo.Latest_All_Lines_View_CA.GL_Deductible, dbo.Latest_All_Lines_View_CA.GLDX_Indicator, dbo.Latest_All_Lines_View_CA.SAM_Form, 
                      dbo.Latest_All_Lines_View_CA.SAM_OCC_Limit, dbo.Latest_All_Lines_View_CA.SAM_Agg_Limit, dbo.Latest_All_Lines_View_CA.SAM_Form_Group, 
                      dbo.Latest_All_Lines_View_CA.GL_Occurrence_Limit, dbo.Latest_All_Lines_View_CA.Endorsement_GLDX_YN, dbo.Latest_All_Lines_View_CA.policynumber, 
                      dbo.Latest_All_Lines_View_CA.Property_Coverage_Form, dbo.Latest_All_Lines_View_CA.Coverage_Form, 
                      dbo.Latest_All_Lines_View_CA.FA_Constr_Code_Dominant_NAME, dbo.Latest_All_Lines_View_CA.FA_Hail_Dominant, 
                      dbo.Latest_All_Lines_View_CA.ZIP_Pop_Density_Dominant, dbo.Latest_All_Lines_View_CA.FA_Avg_Bld_Rate_Range, 
                      dbo.Latest_All_Lines_View_CA.FA_Avg_Bld_Rate_rd2, dbo.Latest_All_Lines_View_CA.FA_Deductible, dbo.Latest_All_Lines_View_CA.COL_Prop_Wind_Hail_Count, 
                      dbo.Latest_All_Lines_View_CA.COL_Prop_Wind_Hail_Loss, dbo.Latest_All_Lines_View_CA.COL_Prop_Water_Other_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_Prop_Water_Other_Count, dbo.Latest_All_Lines_View_CA.COL_Prop_Water_Sprinkler_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_Prop_Water_Sprinkler_Count, dbo.Latest_All_Lines_View_CA.COL_Prop_Theft_Van_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_Prop_Theft_Van_Count, dbo.Latest_All_Lines_View_CA.COL_Prop_Fire_Lightning_Explosion_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_Prop_Fire_Lightning_Explosion_Count, dbo.Latest_All_Lines_View_CA.COL_Prop_Other_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_Prop_Other_Count, dbo.Latest_All_Lines_View_CA.Endorsement_Elite_YN, dbo.Latest_All_Lines_View_CA.Account_Name, 
                      dbo.Latest_All_Lines_View_CA.Incurred_Loss_ALAE_with_SS_CatOnly, dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_Total_Range, 
                      dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_PPT_Range, dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_Buses_Range, 
                      dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_Truck_Range, dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_OtherPublic_Range, dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_Other_Range, 
                      dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_Coll_No_Ded_Range, dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_Coll_1000_Ded_Range, dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_OTC_No_Ded_Range, dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_OTC_1000_Ded_Range, dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_Dual_Control_Range, dbo.Latest_All_Lines_View_CA.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Latest_All_Lines_View_CA.BusinessClassDesc, dbo.Latest_All_Lines_View_CA.DivisionName, dbo.Latest_All_Lines_View_CA.producttype, 
                      dbo.Latest_All_Lines_View_CA.Source_Detail_Name, dbo.Latest_All_Lines_View_CA.First_Policy_Year, dbo.Latest_All_Lines_View_CA.PIC_Producer, 
                      dbo.Latest_All_Lines_View_CA.underwriter, dbo.Latest_All_Lines_View_CA.Fiscal_AY_Month_Ending, dbo.Latest_All_Lines_View_CA.Last_Reporting_Year, 
                      dbo.Latest_All_Lines_View_CA.Last_Reporting_Month, dbo.Latest_All_Lines_View_CA.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Latest_All_Lines_View_CA.Account_UltLoss_Ratio, dbo.Latest_All_Lines_View_CA.Account_UltLoss_Ratio_NonCat, 
                      dbo.Latest_All_Lines_View_CA.Account_RepLoss_Ratio, dbo.Latest_All_Lines_View_CA.Account_RepLoss_Ratio_NonCat, 
                      dbo.Latest_All_Lines_View_CA.CompanyCode, dbo.Latest_All_Lines_View_CA.Endorsement_HS_004, dbo.Latest_All_Lines_View_CA.reportmixname, 
                      dbo.Latest_All_Lines_View_CA.Account_Premium_Range, dbo.Latest_All_Lines_View_CA.programdesc, dbo.Latest_All_Lines_View_CA.PICProducer, 
                      dbo.Latest_All_Lines_View_CA.PrimaryProducer, dbo.Latest_All_Lines_View_CA.PrimaryProducerType, dbo.Latest_All_Lines_View_CA.SLD_BusinessType, 
                      dbo.Latest_All_Lines_View_CA.COL_Breach_of_Contract_Count, dbo.Latest_All_Lines_View_CA.COL_Breach_of_Contract_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_Discrimination_Count, dbo.Latest_All_Lines_View_CA.COL_Discrimination_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_Wrongful_Termination_Count, dbo.Latest_All_Lines_View_CA.COL_Wrongful_Termination_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_Harrassment_Count, dbo.Latest_All_Lines_View_CA.COL_Harrassment_Loss, 
                      dbo.Latest_All_Lines_View_CA.COL_DO_Other_Count, dbo.Latest_All_Lines_View_CA.COL_DO_Other_Loss, dbo.Latest_All_Lines_View_CA.COL_EPL_Other_Count, 
                      dbo.Latest_All_Lines_View_CA.COL_EPL_Other_Loss, dbo.Latest_All_Lines_View_CA.COL_Fiduciary_Other_Count, 
                      dbo.Latest_All_Lines_View_CA.COL_Fiduciary_Other_Loss, dbo.Latest_All_Lines_View_CA.COL_Worplace_Violence_Other_Count, 
                      dbo.Latest_All_Lines_View_CA.COL_Worplace_Violence_Other_Loss, dbo.Latest_All_Lines_View_CA.COL_SLD_All_Other_Count, 
                      dbo.Latest_All_Lines_View_CA.COL_SLD_All_Other_Loss, dbo.Latest_All_Lines_View_CA.County_Pop_Density_Range, dbo.Latest_All_Lines_View_CA.Bylaws_YN, 
                      dbo.Latest_All_Lines_View_CA.Clean_Warranty_Letter_Received_YN, dbo.Latest_All_Lines_View_CA.Disciplinary_Administrative_or_Criminal_Actions_YN, 
                      dbo.Latest_All_Lines_View_CA.Disciplinary_Action_from_Peer_Review_YN, dbo.Latest_All_Lines_View_CA.Employment_Application_YN, 
                      dbo.Latest_All_Lines_View_CA.Employment_Handbook_YN, dbo.Latest_All_Lines_View_CA.Employment_Application_Handbook_YN, 
                      dbo.Latest_All_Lines_View_CA.Financials_YN, dbo.Latest_All_Lines_View_CA.Form_5500_YN, dbo.Latest_All_Lines_View_CA.Information_Only_YN, 
                      dbo.Latest_All_Lines_View_CA.List_of_D_and_Os_YN, dbo.Latest_All_Lines_View_CA.Standard_Setting_or_Member_Certification_Services_YN, 
                      dbo.Latest_All_Lines_View_CA.Merger_Acquisition_or_Consolidation_YN, dbo.Latest_All_Lines_View_CA.No_Loss_Letter_Received_YN, 
                      dbo.Latest_All_Lines_View_CA.No_Prior_Coverage_YN, dbo.Latest_All_Lines_View_CA.Magazines_Periodicals_or_Newsletters_YN, 
                      dbo.Latest_All_Lines_View_CA.Product_Research_or_Development_Testing_Certif_Services_YN, 
                      dbo.Latest_All_Lines_View_CA.Proper_Employment_Procedures_YN, dbo.Latest_All_Lines_View_CA.Peer_Review_or_Disciplinary_Action_YN, 
                      dbo.Latest_All_Lines_View_CA.Positive_Fund_Balance_YN, dbo.Latest_All_Lines_View_CA.Plan_Assets_Range, 
                      dbo.Latest_All_Lines_View_CA.Supplemental_Claim_Form_Loss_Run_YN, dbo.Latest_All_Lines_View_CA.Security_Precautions_YN, 
                      dbo.Latest_All_Lines_View_CA.Subsidiaries_Affiliates_YN, dbo.Latest_All_Lines_View_CA.Supp_Claim_Form_Received_YN, 
                      dbo.Latest_All_Lines_View_CA.Turnover_Rate_Range, dbo.Latest_All_Lines_View_CA.Tax_Exempt_YN, 
                      dbo.Latest_All_Lines_View_CA.Transaction_E_Commerce_YN, dbo.Latest_All_Lines_View_CA.Website_Transactional_E_Commerce_YN, 
                      dbo.Latest_All_Lines_View_CA.Website_Information_Only_YN, dbo.Latest_All_Lines_View_CA.acctngyear, dbo.Latest_All_Lines_View_CA.FF_Cov_ALL, 
                      dbo.Latest_All_Lines_View_CA.PV_Cov_ALL, dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December_test.AL_Territory_Dominant, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December_test.AL_Territory_Dominant_percent, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December_test.AL_Dom_Terr_description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December_test.AL_Dom_Region_in_State, LEFT(dbo.Latest_All_Lines_View_CA.Insd_Zip, 3) AS Zip3
FROM         dbo.Latest_All_Lines_View_CA LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December_test ON 
                      dbo.Latest_All_Lines_View_CA.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December_test.coverage_group AND 
                      dbo.Latest_All_Lines_View_CA.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December_test.Productcode AND 
                      dbo.Latest_All_Lines_View_CA.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December_test.statecode AND 
                      dbo.Latest_All_Lines_View_CA.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_December_test.policynumber
WHERE     (dbo.Latest_All_Lines_View_CA.statecode = ''CA'') AND (dbo.Latest_All_Lines_View_CA.Fiscal_AY_Year > 2006) AND 
                      (dbo.Latest_All_Lines_View_CA.Coverage_Reporting_group IN (''auto liability'', ''auto phys dam''))
' 
GO
