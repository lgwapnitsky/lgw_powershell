IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NP_GL_View1]'))
DROP VIEW [dbo].[NP_GL_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NP_GL_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.NP_GL_View1
AS
SELECT     Fiscal_AY_Year, SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, New_Renew_Tail, COL_GLBI_Malpractice_Count, COL_GLBI_Malpractice_Loss, COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      COL_GLBI_Fraud_Breach_of_Contract_Loss, COL_GLBI_Injury_Count, COL_GLBI_Injury_Loss, COL_GLBI_Other_Count, COL_GLBI_Other_Loss, 
                      COL_GLBI_Sexual_Assault_Molest_Abuse_Count, COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, COL_GLBI_PropertyDamage_Loss, 
                      COL_GLBI_PropertyDamage_Count, COL_GLBI_Theft_Loss, COL_GLBI_Theft_Count, COL_GLBI_SlanderDefamtion_Loss, 
                      COL_GLBI_SlanderDefamtion_Count, COL_GLBI_Discrim_WrongfulTermination_Loss, COL_GLBI_Discrim_WrongfulTermination_Count, 
                      Renewals_Range, Renew_New_Auto, First_Policy_Year, County_Pop_Density_Range, Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, GL_Deductible, GL_Occurrence_Limit, Written_Premium_Range, 
                      Coverage_Reporting_group, GLDX_Indicator, GL_Class_NP_HCFac_AvgRate_Range, GL_Class_NP_Outpatient_AvgRate_Range, 
                      GL_Class_NP_Office_AvgRate_Range, SAM_Form, SAM_OCC_Limit, GL_Aggregate_Limit, Latest_Product, Companycode, GL_Dom_Region_in_State, 
                      GL_Class_NP_YMCA_YWCA_AvgRate_Range, GL_Class_NP_Boarding_Rooming_Houses_AvgRate_Range, 
                      GL_Class_NP_Shelter_Mission_HalfwayHouse_AvgRate_Range, Coverage_Group, Price_Monitor_Standard_CovGrp_GL_Monitored_range
FROM         dbo.Non_Profit_premium_summary
GROUP BY Fiscal_AY_Year, New_Renew_Tail, COL_GLBI_Malpractice_Count, COL_GLBI_Malpractice_Loss, COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      COL_GLBI_Fraud_Breach_of_Contract_Loss, COL_GLBI_Injury_Count, COL_GLBI_Injury_Loss, COL_GLBI_Other_Count, COL_GLBI_Other_Loss, 
                      COL_GLBI_Sexual_Assault_Molest_Abuse_Count, COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, COL_GLBI_PropertyDamage_Loss, 
                      COL_GLBI_PropertyDamage_Count, COL_GLBI_Theft_Loss, COL_GLBI_Theft_Count, COL_GLBI_SlanderDefamtion_Loss, 
                      COL_GLBI_SlanderDefamtion_Count, COL_GLBI_Discrim_WrongfulTermination_Loss, COL_GLBI_Discrim_WrongfulTermination_Count, 
                      Renewals_Range, Renew_New_Auto, First_Policy_Year, County_Pop_Density_Range, Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, GL_Deductible, GL_Occurrence_Limit, Written_Premium_Range, 
                      Coverage_Reporting_group, GLDX_Indicator, GL_Class_NP_HCFac_AvgRate_Range, GL_Class_NP_Outpatient_AvgRate_Range, 
                      GL_Class_NP_Office_AvgRate_Range, SAM_Form, SAM_OCC_Limit, GL_Aggregate_Limit, Latest_Product, Companycode, GL_Dom_Region_in_State, 
                      GL_Class_NP_YMCA_YWCA_AvgRate_Range, GL_Class_NP_Boarding_Rooming_Houses_AvgRate_Range, 
                      GL_Class_NP_Shelter_Mission_HalfwayHouse_AvgRate_Range, Coverage_Group, Price_Monitor_Standard_CovGrp_GL_Monitored_range
' 
GO
