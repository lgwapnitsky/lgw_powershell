IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Targets_201102_View_1]'))
DROP VIEW [dbo].[Targets_201102_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Targets_201102_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Targets_201102_View_1
AS
SELECT     accountnumber, Policynumber, Account_Name, Insured_Name, Productcode, ProductType, DivisionName, Branch_Region, PIC_Producer, 
                      Primary_Producer, underwriter, PolicyEntityState, policyEffectivedate, policyexpirationdate, policy_effective_year, Last_Reporting_Year, 
                      Last_Reporting_Month, Renew_New_Auto, Number_of_Renewals, Prior_Policy_number, prior_policynumber_2, prior_policynumber_3, 
                      prior_policynumber_4, prior_policynumber_5, New_Renew_Automatic_Prior_Policy, New_Renew_Automatic_Prior_Policy_2, 
                      New_Renew_Automatic_Prior_Policy_3, New_Renew_Automatic_Prior_Policy_4, New_Renew_Automatic_Prior_Policy_5, written_premium_policy, 
                      Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, Account_RepLoss_Ratio_NonCat, AutoRen_Written_Premium_Range, 
                      AutoRen_Consecutive_Prior_AutoRenewals, Account_Loss_Ratio_CurrentPolicy_and_4PriorRenewals_100DaysPreExpDate, 
                      AutoRen_Loss_Ratio_5PriorRenewals_45DaysPreEffDate, Incurred_Claims_3YrsPrior_90DaysPreEffDate, Open_claims_3YrsPrior_90DaysPreEffDate, 
                      Loss_Ratio_5PriorRenewals_45DaysPreEffDate, Last_Reporting_Date, Inforce_Policy_Indicator, 
                      Account_Loss_Ratio_5PriorRenewals_45DaysPreEffDate, Automatic_CLD_Index_201102, Automatic_CLD_Written_Premium_Threshold_201102, 
                      Automatic_CLD_Account_Reported_Loss_Ratio_201102, Automatic_CLD_Applies_First_Renewal_201102, Automatic_Qualifies_201102, 
                      PIC_Producer_code, Primary_Producer_code, Program_Code, Automatic_SLD_Index_201102, Automatic_SLD_Written_Premium_Threshold_201102, 
                      Automatic_SLD_Max_Years_for_Auto_Renewal_201102, Automatic_SLD_Incurred_Claims_Number_201102, 
                      Automatic_SLD_Incurred_Claims_for_Years_201102, Automatic_SLD_Highest_Occurrence_Limit_201102, Automatic_SLD_Max_Employees_201102, 
                      Automatic_SLD_Blocked_Producers_201102, Program, Automatic_CLD_Max_Years_for_Auto_Renewal_201102, Target_Renewal, Target_Automatic, 
                      Target_Final, Target_Dollar, Account_Loss_Ratio_CurrentPolicy_and_4PriorRenewals_100DaysPreExpDate_range, 
                      Account_Loss_Ratio_5PriorRenewals_45DaysPreEffDate_range, Target_LossRatio_for_Evaluation, Target_LossRatio_for_Evaluation_Range, 
                      Automatic_SLD_Limit_for_Evalution, Automatic_SLD_NumOfEmployees_for_Evalution, Automatic_SLD_BusinessType_for_Evalution, 
                      PriceMonitor_Monitored_Premium, PriceMonitor_Policy_Premium, PriceMonitor_Monitored_YN, Target_Final_with_PriceMonitorChanges, 
                      Target_Final_with_PriceMonitor_Dollar, Target_Final_with_PriceMonitorChanges_Source, Target_RRHR_disposition
FROM         dbo.Policy_Information_ALL_POLICIES_Target_201102
WHERE     (Inforce_Policy_Indicator = ''Y'')
' 
GO
