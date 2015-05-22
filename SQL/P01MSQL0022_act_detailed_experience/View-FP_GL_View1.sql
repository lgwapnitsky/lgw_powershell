IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FP_GL_View1]'))
DROP VIEW [dbo].[FP_GL_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FP_GL_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.FP_GL_View1
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, Policy_count_Reporting_Coverage, COL_GLBI_Malpractice_Count, COL_GLBI_Malpractice_Loss, 
                      COL_GLBI_Fraud_Breach_of_Contract_Count, COL_GLBI_Fraud_Breach_of_Contract_Loss, COL_GLBI_Injury_Count, COL_GLBI_Injury_Loss, 
                      COL_GLBI_Other_Count, COL_GLBI_Other_Loss, COL_GLBI_Sexual_Assault_Molest_Abuse_Count, COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, 
                      COL_GLBI_PropertyDamage_Loss, COL_GLBI_PropertyDamage_Count, COL_GLBI_Theft_Loss, COL_GLBI_Theft_Count, 
                      COL_GLBI_SlanderDefamtion_Loss, COL_GLBI_SlanderDefamtion_Count, COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      COL_GLBI_Discrim_WrongfulTermination_Count, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) AS Reported_Claims, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Renewals_Range, 
                      New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Written_Premium_Range, County_Pop_Density_Range, 
                      Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, Price_Monitor_Standard_Cov_Grp_Monitored_range, GL_Occurrence_Limit, 
                      GL_Deductible, GL_Class_FP_Boarding_Rooming_House_AvgRate_Range, GL_Class_FP_Health_Care_Facility_AvgRate_Range, 
                      GL_Class_FP_Office_AvgRate_Range, GL_Class_FP_Sales_Service_Orgs_AvgRate_Range, GL_Class_FP_Schools_AvgRate_Range, 
                      GL_Dom_Region_in_State, GLDX_Indicator, GL_Aggregate_Limit, SAM_OCC_Limit, SAM_Form, Account_Name_Display, Account_Active, 
                      accountnumber, policyexpirationdate, Price_Monitor_Standard_CovGrp_GL_Monitored_range, Coverage_Group
FROM         dbo.FP_premium_summary
GROUP BY Coverage_Reporting_group, Fiscal_AY_Year, COL_GLBI_Malpractice_Count, COL_GLBI_Malpractice_Loss, 
                      COL_GLBI_Fraud_Breach_of_Contract_Count, COL_GLBI_Fraud_Breach_of_Contract_Loss, COL_GLBI_Injury_Count, COL_GLBI_Injury_Loss, 
                      COL_GLBI_Other_Count, COL_GLBI_Other_Loss, COL_GLBI_Sexual_Assault_Molest_Abuse_Count, COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, 
                      COL_GLBI_PropertyDamage_Loss, COL_GLBI_PropertyDamage_Count, COL_GLBI_Theft_Loss, COL_GLBI_Theft_Count, 
                      COL_GLBI_SlanderDefamtion_Loss, COL_GLBI_SlanderDefamtion_Count, COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      COL_GLBI_Discrim_WrongfulTermination_Count, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Written_Premium_Range, 
                      County_Pop_Density_Range, Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, GL_Occurrence_Limit, GL_Deductible, 
                      GL_Class_FP_Boarding_Rooming_House_AvgRate_Range, GL_Class_FP_Health_Care_Facility_AvgRate_Range, 
                      GL_Class_FP_Office_AvgRate_Range, GL_Class_FP_Sales_Service_Orgs_AvgRate_Range, GL_Class_FP_Schools_AvgRate_Range, 
                      GL_Dom_Region_in_State, GLDX_Indicator, GL_Aggregate_Limit, SAM_OCC_Limit, SAM_Form, Policy_count_Reporting_Coverage, 
                      Account_Name_Display, Account_Active, accountnumber, policyexpirationdate, Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      Coverage_Group
' 
GO
