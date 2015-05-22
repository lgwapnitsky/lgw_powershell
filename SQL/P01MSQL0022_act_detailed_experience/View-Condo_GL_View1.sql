IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Condo_GL_View1]'))
DROP VIEW [dbo].[Condo_GL_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Condo_GL_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Condo_GL_View1
AS
SELECT     Fiscal_AY_Year, Coverage_Reporting_group, SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(currentearnedpremium) AS currentearnedpremium, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(COL_GLBI_Malpractice_Count) 
                      AS COL_GLBI_Malpractice_Count, SUM(COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
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
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renewals_Range, Renew_New_Auto, New_Renew_Tail, First_Policy_Year, Written_Premium_Range, 
                      County_Pop_Density_Range, Price_Monitor_Standard_Cov_Grp_Monitored_range, GL_Deductible, GL_Class_Clubs_AvgRate_Range, 
                      GL_Class_Swimming_Pools_AvgRate_Range, GL_Class_ResidentialCondos_AvgRate_Range, GL_Class_Clubs_AvgRate, 
                      GL_Class_Swimming_Pools_AvgRate, GL_Class_ResidentialCondos_AvgRate, statecode, GL_Class_Clubs_AvgRate_rd0, 
                      GL_Class_ResidentialCondos_AvgRate_rd0, GL_Class_Private_Parking_AvgRate, GL_Class_Private_Parking_AvgRate_Range, 
                      GL_Class_Private_Parking_AvgRate_rd0, GL_FL_CO_LE4_AvgRate, GL_FL_CO_GT4_AvgRate, GL_FL_CO_Dominant_type, 
                      GL_FL_CO_Dominant_type_AvgRate, GL_FL_CO_LE4_AvgRate_Range, GL_FL_CO_GT4_AvgRate_Range, GL_FL_CO_Dominant_type_AvgRate_Range,
                       GL_FL_CO_LE4_AvgRate_rd0, GL_FL_CO_GT4_AvgRate_rd0, GL_FL_CO_Dominant_type_AvgRate_rd0, GL_Territory_Dominant, 
                      GL_Dom_Terr_description, GL_Dom_Region_in_State, GL_Territory_Dominant_percent, GL_ResidentialCondos_LossCost_LE4, 
                      GL_ResidentialCondos_LossCost_GT4
FROM         dbo.Condo_premium_summary
GROUP BY Fiscal_AY_Year, Coverage_Reporting_group, Renewals_Range, Renew_New_Auto, New_Renew_Tail, First_Policy_Year, Written_Premium_Range, 
                      County_Pop_Density_Range, Price_Monitor_Standard_Cov_Grp_Monitored_range, GL_Deductible, GL_Class_Clubs_AvgRate_Range, 
                      GL_Class_Swimming_Pools_AvgRate_Range, GL_Class_ResidentialCondos_AvgRate_Range, GL_Class_Clubs_AvgRate, 
                      GL_Class_Swimming_Pools_AvgRate, GL_Class_ResidentialCondos_AvgRate, statecode, GL_Class_Clubs_AvgRate_rd0, 
                      GL_Class_ResidentialCondos_AvgRate_rd0, GL_Class_Private_Parking_AvgRate, GL_Class_Private_Parking_AvgRate_Range, 
                      GL_Class_Private_Parking_AvgRate_rd0, GL_FL_CO_LE4_AvgRate, GL_FL_CO_GT4_AvgRate, GL_FL_CO_Dominant_type, 
                      GL_FL_CO_Dominant_type_AvgRate, GL_FL_CO_LE4_AvgRate_Range, GL_FL_CO_GT4_AvgRate_Range, GL_FL_CO_Dominant_type_AvgRate_Range,
                       GL_FL_CO_LE4_AvgRate_rd0, GL_FL_CO_GT4_AvgRate_rd0, GL_FL_CO_Dominant_type_AvgRate_rd0, GL_Territory_Dominant, 
                      GL_Dom_Terr_description, GL_Dom_Region_in_State, GL_Territory_Dominant_percent, GL_ResidentialCondos_LossCost_LE4, 
                      GL_ResidentialCondos_LossCost_GT4
' 
GO
