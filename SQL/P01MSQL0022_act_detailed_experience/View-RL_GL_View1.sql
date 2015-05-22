IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RL_GL_View1]'))
DROP VIEW [dbo].[RL_GL_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RL_GL_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.RL_GL_View1
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, currentwrittenpremium, currentearnedpremium, Policy_count_Reporting_Coverage, 
                      COL_GLBI_Malpractice_Count, COL_GLBI_Malpractice_Loss, COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      COL_GLBI_Fraud_Breach_of_Contract_Loss, COL_GLBI_Injury_Count, COL_GLBI_Injury_Loss, COL_GLBI_Other_Count, COL_GLBI_Other_Loss, 
                      COL_GLBI_Sexual_Assault_Molest_Abuse_Count, COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, COL_GLBI_PropertyDamage_Loss, 
                      COL_GLBI_PropertyDamage_Count, COL_GLBI_Theft_Loss, COL_GLBI_Theft_Count, COL_GLBI_SlanderDefamtion_Loss, 
                      COL_GLBI_SlanderDefamtion_Count, COL_GLBI_Discrim_WrongfulTermination_Loss, COL_GLBI_Discrim_WrongfulTermination_Count, 
                      Incurred_Loss_ALAE_with_SS_NonCat, Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Reported_Claims, New_Renew_Tail, Renew_New_Auto, Written_Premium_Range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Price_Monitor_Standard_CovGrp_GL_Monitored_range, SAM_Form_PI_SS_2, 
                      SAM_Form_PI_SO_008, SAM_Form_PI_SO_007, GL_Deductible, GLDX_Indicator, GL_Class_Churches_AvgRate_Range, 
                      GL_Class_Daycare_AvgRate_Range, GL_Class_School_AvgRate_Range, GL_Class_Dwellings_AvgRate_Range, GL_Class_Offices_AvgRate_Range, 
                      GL_Class_Camp_AvgRate_Range
FROM         dbo.RL_premium_summary
' 
GO
