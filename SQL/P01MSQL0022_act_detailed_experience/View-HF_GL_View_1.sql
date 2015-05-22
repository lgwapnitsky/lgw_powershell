IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HF_GL_View_1]'))
DROP VIEW [dbo].[HF_GL_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HF_GL_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.HF_GL_View_1
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
                      GL_Occurrence_Limit, GL_Class_Health_Exercise_Club_AvgRate_Range, GL_Class_Swimming_Pools_AvgRate_Range, Written_Premium_Range, 
                      SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, GL_Dom_Region_in_State
FROM         dbo.HF_premium_summary
GROUP BY Coverage_Reporting_group, Fiscal_AY_Year, Policy_count_Reporting_Coverage, Renewals_Range, New_Renew_Tail, Renew_New_Auto, 
                      First_Policy_Year, County_Pop_Density_Range, Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, GL_Deductible, GL_Occurrence_Limit, 
                      GL_Class_Health_Exercise_Club_AvgRate_Range, GL_Class_Swimming_Pools_AvgRate_Range, Written_Premium_Range, GL_Dom_Region_in_State
' 
GO
