IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DY_GL_View1]'))
DROP VIEW [dbo].[DY_GL_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DY_GL_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.DY_GL_View1
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentearnedpremium) AS currentearnedpremium, Policy_count_Reporting_Coverage, 
                      SUM(COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, SUM(COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, SUM(COL_GLBI_Injury_Count) 
                      AS COL_GLBI_Injury_Count, SUM(COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, SUM(COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, SUM(COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, SUM(COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(COL_GLBI_PropertyDamage_Loss) AS COL_GLBI_PropertyDamage_Loss, 
                      SUM(COL_GLBI_PropertyDamage_Count) AS COL_GLBI_PropertyDamage_Count, SUM(COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, SUM(COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, SUM(COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, SUM(COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, County_Pop_Density_Range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, GL_Deductible, 
                      GL_Occurrence_Limit, GL_Class_DC_For_Profit_AvgRate_Range, GL_Class_DC_NonProfit_AvgRate_Range, 
                      GL_Class_Parks_Playgrounds_AvgRate_Range, GL_Class_Swimming_Pools_AvgRate_Range, GL_Class_Camps_For_Profit_AvgRate_Range, 
                      GL_Class_Camps_NonProfit_AvgRate_Range, GL_Class_Corp_Punishment_AvgRate_Range, GL_Class_Private_Schools_For_Profit_AvgRate_Range, 
                      GL_Class_Private_Schools_NonProfit_AvgRate_Range, Written_Premium_Range, SUM(currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, GL_Territory_Dominant, 
                      GL_Territory_Dominant_percent, GL_Dom_Terr_description, GL_Dom_Region_in_State, statecode, GLDX_Indicator, Business_Grp, 
                      SAM_Exclusion_from_CG_21_46, SAM_Form_PI_SS_2, SAM_Form_PI_SO_008, SAM_Form_PI_SO_007, SAM_PI_SS_2_OCC_Limit, 
                      SAM_PI_SS_2_Agg_Limit, SAM_PI_SO_008_OCC_Limit, SAM_PI_SO_008_Agg_Limit, SAM_PI_SO_007_OCC_Limit, SAM_PI_SO_007_Agg_Limit, 
                      SAM_OCC_Limit, SAM_Agg_Limit, SAM_Exclusion_from_CG_21_46_b, SAM_Form_PI_SO_008_b, SAM_Form_PI_SO_007_b, SAM_Form_PI_SS_2_b, 
                      accountnumber, Account_Name, policyexpirationdate, Account_Name_Display, Account_Active, Coverage_Group, Policy_count_Coverage_Group, 
                      Price_Monitor_Standard_CovGrp_GL_Monitored_range, Dominant_Population_Density_Policywide, Location_count, DY_Center_Exposure, 
                      Number_of_States_Operating_in, DY_Center_Exposure_Location_max, program, DY_Profile, DY_State_Groups, Commission_pct, 
                      Commission_dollars, Commission_Premiums
FROM         dbo.DY_premium_summary
GROUP BY Coverage_Reporting_group, Fiscal_AY_Year, Policy_count_Reporting_Coverage, Renewals_Range, New_Renew_Tail, Renew_New_Auto, 
                      First_Policy_Year, County_Pop_Density_Range, Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, GL_Deductible, GL_Occurrence_Limit, 
                      GL_Class_DC_For_Profit_AvgRate_Range, GL_Class_DC_NonProfit_AvgRate_Range, GL_Class_Parks_Playgrounds_AvgRate_Range, 
                      GL_Class_Swimming_Pools_AvgRate_Range, GL_Class_Camps_For_Profit_AvgRate_Range, GL_Class_Camps_NonProfit_AvgRate_Range, 
                      GL_Class_Corp_Punishment_AvgRate_Range, GL_Class_Private_Schools_For_Profit_AvgRate_Range, 
                      GL_Class_Private_Schools_NonProfit_AvgRate_Range, Written_Premium_Range, GL_Territory_Dominant, GL_Territory_Dominant_percent, 
                      GL_Dom_Terr_description, GL_Dom_Region_in_State, statecode, GLDX_Indicator, Business_Grp, SAM_Exclusion_from_CG_21_46, 
                      SAM_Form_PI_SS_2, SAM_Form_PI_SO_008, SAM_Form_PI_SO_007, SAM_PI_SS_2_OCC_Limit, SAM_PI_SS_2_Agg_Limit, 
                      SAM_PI_SO_008_OCC_Limit, SAM_PI_SO_008_Agg_Limit, SAM_PI_SO_007_OCC_Limit, SAM_PI_SO_007_Agg_Limit, SAM_OCC_Limit, 
                      SAM_Agg_Limit, SAM_Exclusion_from_CG_21_46_b, SAM_Form_PI_SO_008_b, SAM_Form_PI_SO_007_b, SAM_Form_PI_SS_2_b, accountnumber, 
                      Account_Name, policyexpirationdate, Account_Name_Display, Account_Active, Coverage_Group, Policy_count_Coverage_Group, 
                      Price_Monitor_Standard_CovGrp_GL_Monitored_range, Dominant_Population_Density_Policywide, Location_count, DY_Center_Exposure, 
                      Number_of_States_Operating_in, DY_Center_Exposure_Location_max, program, DY_Profile, DY_State_Groups, Commission_pct, 
                      Commission_dollars, Commission_Premiums
HAVING      (Coverage_Reporting_group = ''GL'')
' 
GO
