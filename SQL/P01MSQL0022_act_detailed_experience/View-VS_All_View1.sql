IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_All_View1]'))
DROP VIEW [dbo].[VS_All_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_All_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.VS_All_View1
AS
SELECT     statecode, Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, Business_Desc, 
                      Written_Premium_Range, Primary_Producer_type, Primary_Producer, program, Account_Name, GL_Territory_Dominant, 
                      GL_Territory_Dominant_percent, GL_Dom_Terr_description, GL_Dom_Region_in_State, Business_Grp, accountnumber, policynumber, 
                      GL_Class_Private_Pre_High_NFP_AvgRate_Range, GL_Class_Vocational_AvgRate_Range, GL_Class_Private_High_NFP_AvgRate_Range, 
                      GL_Class_Private_Pre_High_OTNFP_AvgRate_Range, GL_Class_Fac_Liab_for_Corp_Pun_AvgRate_Range, GL_Class_College_NFP_AvgRate_Range, 
                      GL_Class_Day_Care_OTNFP_AvgRate_Range, GL_Class_Camp_NFP_AvgRate_Range, GL_Class_College_OTNFP_AvgRate_Range, 
                      GL_Class_Day_Care_NFP_AvgRate_Range, GL_Class_Dorms_NFP_AvgRate_Range, GL_Class_Camp_OTNFP_AvgRate_Range, 
                      GL_Class_Schools_OTNFP_AvgRate_Range, GL_Class_Schools_NFP_AvgRate_Range, Endorsement_VS_001, Auto_Driver_Training_Educational_YN, 
                      Auto_Driver_Training_Commercial_YN, Charter_YN, policyexpirationdate, Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      Account_Name_Display, Poor_Account_Indicator, Account_Active, ZIP_Pop_Density_Dominant, Count_of_Account_Numbers_Range, 
                      Coverage_Group
FROM         dbo.VS_premium_summary
WHERE     (Companycode = ''PH'')
GROUP BY statecode, Coverage_Reporting_group, Fiscal_AY_Year, Renewals_Range, New_Renew_Tail, Renew_New_Auto, First_Policy_Year, Branch_Region, 
                      Business_Desc, Written_Premium_Range, Primary_Producer_type, Primary_Producer, program, Account_Name, GL_Territory_Dominant, 
                      GL_Territory_Dominant_percent, GL_Dom_Terr_description, GL_Dom_Region_in_State, Business_Grp, accountnumber, policynumber, 
                      GL_Class_Private_Pre_High_NFP_AvgRate_Range, GL_Class_Vocational_AvgRate_Range, GL_Class_Private_High_NFP_AvgRate_Range, 
                      GL_Class_Private_Pre_High_OTNFP_AvgRate_Range, GL_Class_Fac_Liab_for_Corp_Pun_AvgRate_Range, GL_Class_College_NFP_AvgRate_Range, 
                      GL_Class_Day_Care_OTNFP_AvgRate_Range, GL_Class_Camp_NFP_AvgRate_Range, GL_Class_College_OTNFP_AvgRate_Range, 
                      GL_Class_Day_Care_NFP_AvgRate_Range, GL_Class_Dorms_NFP_AvgRate_Range, GL_Class_Camp_OTNFP_AvgRate_Range, 
                      GL_Class_Schools_OTNFP_AvgRate_Range, GL_Class_Schools_NFP_AvgRate_Range, Endorsement_VS_001, Auto_Driver_Training_Educational_YN, 
                      Auto_Driver_Training_Commercial_YN, Charter_YN, policyexpirationdate, Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      Account_Name_Display, Poor_Account_Indicator, Account_Active, ZIP_Pop_Density_Dominant, Count_of_Account_Numbers_Range, Coverage_Group
' 
GO
