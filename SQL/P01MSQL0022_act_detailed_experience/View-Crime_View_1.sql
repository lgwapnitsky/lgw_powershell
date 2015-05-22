IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Crime_View_1]'))
DROP VIEW [dbo].[Crime_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Crime_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Crime_View_1
AS
SELECT     dbo.Latest_All_Lines_View_1.statecode, dbo.Latest_All_Lines_View_1.Coverage_Reporting_group, dbo.Latest_All_Lines_View_1.productcode, 
                      dbo.Latest_All_Lines_View_1.Fiscal_AY_Year, dbo.Latest_All_Lines_View_1.currentwrittenpremium, dbo.Latest_All_Lines_View_1.currentearnedpremium, 
                      dbo.Latest_All_Lines_View_1.Policy_count_Reporting_Coverage, dbo.Latest_All_Lines_View_1.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.Latest_All_Lines_View_1.Capped_Incurred_Loss_ALAE_with_SS_wo_cat, dbo.Latest_All_Lines_View_1.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.Latest_All_Lines_View_1.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, dbo.Latest_All_Lines_View_1.Reported_Claims, 
                      dbo.Latest_All_Lines_View_1.COL_GLBI_Malpractice_Count, dbo.Latest_All_Lines_View_1.COL_GLBI_Malpractice_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_GLBI_Fraud_Breach_of_Contract_Count, dbo.Latest_All_Lines_View_1.COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_GLBI_Injury_Count, dbo.Latest_All_Lines_View_1.COL_GLBI_Injury_Loss, dbo.Latest_All_Lines_View_1.COL_GLBI_Other_Count, 
                      dbo.Latest_All_Lines_View_1.COL_GLBI_Other_Loss, dbo.Latest_All_Lines_View_1.COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      dbo.Latest_All_Lines_View_1.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, dbo.Latest_All_Lines_View_1.COL_GLBI_PropertyDamage_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_GLBI_PropertyDamage_Count, dbo.Latest_All_Lines_View_1.COL_GLBI_Theft_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_GLBI_Theft_Count, dbo.Latest_All_Lines_View_1.COL_GLBI_SlanderDefamtion_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_GLBI_SlanderDefamtion_Count, dbo.Latest_All_Lines_View_1.COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_GLBI_Discrim_WrongfulTermination_Count, dbo.Latest_All_Lines_View_1.Incurred_Claims, 
                      dbo.Latest_All_Lines_View_1.Commission_dollars, dbo.Latest_All_Lines_View_1.Commission_Premiums, 
                      dbo.Latest_All_Lines_View_1.Price_Monitor_Standard_CovGrp_GL_Monitored_range, dbo.Latest_All_Lines_View_1.New_Renew_Tail, 
                      dbo.Latest_All_Lines_View_1.Renew_New_Auto, dbo.Latest_All_Lines_View_1.Branch_Region, dbo.Latest_All_Lines_View_1.program, 
                      dbo.Latest_All_Lines_View_1.Written_Premium_Range, dbo.Latest_All_Lines_View_1.Coverage_Group, dbo.Latest_All_Lines_View_1.Product_group, 
                      dbo.Latest_All_Lines_View_1.Primary_Umbrella, dbo.Latest_All_Lines_View_1.Earned_Buildings, dbo.Latest_All_Lines_View_1.Earned_Locations, 
                      dbo.Latest_All_Lines_View_1.Earned_TIV, dbo.Latest_All_Lines_View_1.GL_Dom_Terr_Description, dbo.Latest_All_Lines_View_1.GL_Dom_Region_in_State, 
                      dbo.Latest_All_Lines_View_1.Primary_Producer, dbo.Latest_All_Lines_View_1.Policy_count_All_Cov_Combined, 
                      dbo.Latest_All_Lines_View_1.Account_UltLoss_Ratio_Working_Cover_Range, dbo.Latest_All_Lines_View_1.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Latest_All_Lines_View_1.Policy_count_Coverage_Group, dbo.Latest_All_Lines_View_1.accountnumber, dbo.Latest_All_Lines_View_1.Primary_Producer_type, 
                      dbo.Latest_All_Lines_View_1.Playground_YN, dbo.Latest_All_Lines_View_1.Playground_Equip_YN, dbo.Latest_All_Lines_View_1.Pool_YN, 
                      dbo.Latest_All_Lines_View_1.Sports_Activities_YN, dbo.Latest_All_Lines_View_1.Tennis_Bubble_YN, dbo.Latest_All_Lines_View_1.Tennis_Courts_YN, 
                      dbo.Latest_All_Lines_View_1.Number_of_Swimming_Pools_Range, dbo.Latest_All_Lines_View_1.Incurred_Loss_ALAE_with_SS, 
                      dbo.Latest_All_Lines_View_1.Capped_Incurred_Loss_ALAE_with_SS, dbo.Latest_All_Lines_View_1.Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      dbo.Latest_All_Lines_View_1.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, dbo.Latest_All_Lines_View_1.GL_Aggregate_Limit, 
                      dbo.Latest_All_Lines_View_1.GL_Deductible, dbo.Latest_All_Lines_View_1.GLDX_Indicator, dbo.Latest_All_Lines_View_1.SAM_Form, 
                      dbo.Latest_All_Lines_View_1.SAM_OCC_Limit, dbo.Latest_All_Lines_View_1.SAM_Agg_Limit, dbo.Latest_All_Lines_View_1.SAM_Form_Group, 
                      dbo.Latest_All_Lines_View_1.GL_Occurrence_Limit, dbo.Latest_All_Lines_View_1.Endorsement_GLDX_YN, dbo.Latest_All_Lines_View_1.policynumber, 
                      dbo.Latest_All_Lines_View_1.Property_Coverage_Form, dbo.Latest_All_Lines_View_1.Coverage_Form, 
                      dbo.Latest_All_Lines_View_1.FA_Constr_Code_Dominant_NAME, dbo.Latest_All_Lines_View_1.FA_Hail_Dominant, 
                      dbo.Latest_All_Lines_View_1.ZIP_Pop_Density_Dominant, dbo.Latest_All_Lines_View_1.FA_Avg_Bld_Rate_Range, 
                      dbo.Latest_All_Lines_View_1.FA_Avg_Bld_Rate_rd2, dbo.Latest_All_Lines_View_1.FA_Deductible, dbo.Latest_All_Lines_View_1.COL_Prop_Wind_Hail_Count, 
                      dbo.Latest_All_Lines_View_1.COL_Prop_Wind_Hail_Loss, dbo.Latest_All_Lines_View_1.COL_Prop_Water_Other_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_Prop_Water_Other_Count, dbo.Latest_All_Lines_View_1.COL_Prop_Water_Sprinkler_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_Prop_Water_Sprinkler_Count, dbo.Latest_All_Lines_View_1.COL_Prop_Theft_Van_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_Prop_Theft_Van_Count, dbo.Latest_All_Lines_View_1.COL_Prop_Fire_Lightning_Explosion_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_Prop_Fire_Lightning_Explosion_Count, dbo.Latest_All_Lines_View_1.COL_Prop_Other_Loss, 
                      dbo.Latest_All_Lines_View_1.COL_Prop_Other_Count, dbo.Latest_All_Lines_View_1.Endorsement_Elite_YN, dbo.Latest_All_Lines_View_1.Account_Name, 
                      dbo.Latest_All_Lines_View_1.Incurred_Loss_ALAE_with_SS_CatOnly, dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_Total_Range, 
                      dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_PPT_Range, dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_Buses_Range, 
                      dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_Truck_Range, dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_VanPools_Range, 
                      dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_OtherPublic_Range, dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_Other_Range, 
                      dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_Coll_No_Ded_Range, dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_Coll_U1000_Ded_Range, 
                      dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_Coll_1000_Ded_Range, dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_OTC_No_Ded_Range, dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_OTC_U1000_Ded_Range, 
                      dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_OTC_1000_Ded_Range, dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_OTC_O1000_Ded_Range, 
                      dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_Dual_Control_Range, dbo.Latest_All_Lines_View_1.Auto_Vehicle_count_Dual_Control_Percent_Range, 
                      dbo.Latest_All_Lines_View_1.BusinessClassDesc, dbo.Latest_All_Lines_View_1.DivisionName, dbo.Latest_All_Lines_View_1.producttype, 
                      dbo.Latest_All_Lines_View_1.Source_Detail_Name, dbo.Latest_All_Lines_View_1.First_Policy_Year, dbo.Latest_All_Lines_View_1.PIC_Producer, 
                      dbo.Latest_All_Lines_View_1.underwriter, dbo.Latest_All_Lines_View_1.Fiscal_AY_Month_Ending, dbo.Latest_All_Lines_View_1.Last_Reporting_Year, 
                      dbo.Latest_All_Lines_View_1.Last_Reporting_Month, dbo.Latest_All_Lines_View_1.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Latest_All_Lines_View_1.Account_UltLoss_Ratio, dbo.Latest_All_Lines_View_1.Account_UltLoss_Ratio_NonCat, 
                      dbo.Latest_All_Lines_View_1.Account_RepLoss_Ratio, dbo.Latest_All_Lines_View_1.programdesc, dbo.Latest_All_Lines_View_1.PICProducer, 
                      dbo.Latest_All_Lines_View_1.PrimaryProducer, dbo.Latest_All_Lines_View_1.PrimaryProducerType, dbo.Latest_All_Lines_View_1.Account_Premium_Range, 
                      dbo.Latest_All_Lines_View_1.SLD_BusinessType, dbo.Policy_Information_CL_May.CL_Occ_Limit, dbo.Policy_Information_CL_May.CL_Agg_Limit, 
                      dbo.Policy_Information_CL_May.CL_Deductible, dbo.Policy_Information_CL_May.CL_Revenues, dbo.Policy_Information_CL_May.CL_RetroactiveYears, 
                      dbo.Policy_Information_CL_May.CL_ContractsUsage, dbo.Policy_Information_CL_May.CL_HazardGroup, dbo.Policy_Information_CL_May.CL_ProgramMod_Factor, 
                      dbo.Policy_Information_CL_May.CL_NumOfEmployees, dbo.Policy_Information_CL_May.CL_BusinessType, 
                      dbo.Policy_Information_CL_May.CL_Revenue_Per_Employee, dbo.Policy_Information_CL_May.CL_Mortgage_Broker_Ind, 
                      dbo.Policy_Information_CL_May.CL_NumOfEmployees_range, dbo.Policy_Information_CL_May.CL_Revenues_range, 
                      dbo.Policy_Information_CL_May.CL_Prior_Years_Range, dbo.Policy_Information_CL_May.CL_Revenue_Per_Employee_range, 
                      dbo.Policy_Information_CL_May.CL_Occ_Limit_int, dbo.Policy_Information_CL_May.CL_Agg_Limit_int, dbo.Policy_Information_CL_May.CL_Deductible_int, 
                      dbo.Policy_Information_Underwriting_Check_List_May.CGL_Coverage_YN, dbo.Policy_Information_Underwriting_Check_List_May.Complete_Signed_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Independent_Contractors_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Licensed_Professional_Designations_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_May.Standard_Contract_YN, dbo.Latest_All_Lines_View_1.effectivedate, 
                      dbo.Latest_All_Lines_View_1.expirationdate, dbo.Latest_All_Lines_View_1.Business_Desc, dbo.Latest_All_Lines_View_1.PrimaryProducerNumber
FROM         dbo.Latest_All_Lines_View_1 LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_May ON 
                      dbo.Latest_All_Lines_View_1.policynumber = dbo.Policy_Information_Underwriting_Check_List_May.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_CL_May ON dbo.Latest_All_Lines_View_1.policynumber = dbo.Policy_Information_CL_May.policynumber
WHERE     (dbo.Latest_All_Lines_View_1.productcode IN (''CL'', ''AE'', ''DF'', ''FF'', ''PV'')) AND (dbo.Latest_All_Lines_View_1.Fiscal_AY_Year > 2007) AND 
                      (dbo.Latest_All_Lines_View_1.DivisionName = ''SL'') AND (dbo.Latest_All_Lines_View_1.Coverage_Group IN (''CRIME'', ''BOP CR'', ''FIDELITY''))
' 
GO
