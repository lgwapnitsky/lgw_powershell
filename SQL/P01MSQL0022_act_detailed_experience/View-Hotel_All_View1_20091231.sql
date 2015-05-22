IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hotel_All_View1_20091231]'))
DROP VIEW [dbo].[Hotel_All_View1_20091231]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hotel_All_View1_20091231]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Hotel_All_View1_20091231
AS
SELECT     statecode, Fiscal_AY_Year, Coverage_Reporting_group, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, Business_Desc, 
                      Written_Premium_Range, County_Pop_Density_Range, program, Primary_Producer, Primary_Producer_type, 
                      GL_Class_HT_w_PB_LT4_AvgRate_Range, GL_Class_HT_w_PB_GE4_AvgRate_Range, GL_Class_HT_wo_PB_LT4_AvgRate_Range, 
                      GL_Class_HT_wo_PB_GE4_AvgRate_Range, GL_Class_HT_All_Hotel_cls_AvgRate_Range, Account_Name, Number_of_Rooms_Range, 
                      FA_Avg_Bld_Rate_Range, IMPLIED_HOTEL_ROOM_RATE_RANGE, Percentage_Occupancy_Range, Average_Room_Rate, 
                      Average_Room_Rate_Range, acctngyear, ShouldHaveBeenNonRenewed_Indicator, Hotel_Brand, Hotel_Type, Brand_YN, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly, 
                      SUM(Incurred_Loss_ALAE_with_SS_CatOnly) AS Incurred_Loss_ALAE_with_SS_CatOnly
FROM         dbo.Hotel_Premium_Summary_20091231
GROUP BY statecode, Fiscal_AY_Year, Coverage_Reporting_group, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, 
                      Business_Desc, Written_Premium_Range, County_Pop_Density_Range, program, Primary_Producer, Primary_Producer_type, 
                      GL_Class_HT_w_PB_LT4_AvgRate_Range, GL_Class_HT_w_PB_GE4_AvgRate_Range, GL_Class_HT_wo_PB_LT4_AvgRate_Range, 
                      GL_Class_HT_wo_PB_GE4_AvgRate_Range, GL_Class_HT_All_Hotel_cls_AvgRate_Range, Account_Name, Number_of_Rooms_Range, 
                      FA_Avg_Bld_Rate_Range, IMPLIED_HOTEL_ROOM_RATE_RANGE, Percentage_Occupancy_Range, Average_Room_Rate, 
                      Average_Room_Rate_Range, acctngyear, ShouldHaveBeenNonRenewed_Indicator, Hotel_Brand, Hotel_Type, Brand_YN
' 
GO
