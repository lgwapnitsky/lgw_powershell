IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hotel_GL_View1_20091231]'))
DROP VIEW [dbo].[Hotel_GL_View1_20091231]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hotel_GL_View1_20091231]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Hotel_GL_View1_20091231
AS
SELECT     Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, SUM(COL_GLBI_Malpractice_Loss) 
                      AS COL_GLBI_Malpractice_Loss, SUM(COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
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
                      AS Reported_Claims, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Written_Premium_Range, 
                      County_Pop_Density_Range, program, Price_Monitor_Standard_Cov_Grp_Monitored_range, GL_Deductible, 
                      GL_Class_HT_w_PB_LT4_AvgRate_Range, GL_Class_HT_w_PB_GE4_AvgRate_Range, GL_Class_HT_wo_PB_LT4_AvgRate_Range, 
                      GL_Class_HT_wo_PB_GE4_AvgRate_Range, GL_Class_HT_All_Hotel_cls_AvgRate_Range, SUM(Policy_count_Reporting_Coverage) 
                      AS Policy_count_Reporting_Coverage, Number_of_Rooms_Range, GLDX_Indicator, Percentage_Occupancy_Range, 
                      IMPLIED_HOTEL_ROOM_RATE_RANGE, Average_Room_Rate_Range
FROM         dbo.Hotel_Premium_Summary_20091231
GROUP BY Coverage_Reporting_group, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Written_Premium_Range, 
                      County_Pop_Density_Range, program, Price_Monitor_Standard_Cov_Grp_Monitored_range, GL_Deductible, 
                      GL_Class_HT_w_PB_LT4_AvgRate_Range, GL_Class_HT_w_PB_GE4_AvgRate_Range, GL_Class_HT_wo_PB_LT4_AvgRate_Range, 
                      GL_Class_HT_wo_PB_GE4_AvgRate_Range, GL_Class_HT_All_Hotel_cls_AvgRate_Range, Number_of_Rooms_Range, GLDX_Indicator, 
                      Percentage_Occupancy_Range, IMPLIED_HOTEL_ROOM_RATE_RANGE, Average_Room_Rate_Range
' 
GO
