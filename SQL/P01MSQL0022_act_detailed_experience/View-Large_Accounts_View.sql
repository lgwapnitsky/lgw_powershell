IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Accounts_View]'))
DROP VIEW [dbo].[Large_Accounts_View]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Large_Accounts_View]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Large_Accounts_View
AS
SELECT     accountnumber, policynumber, policyeffectivedate, Coverage_Reporting_group, productcode, SUM(currentearnedpremium) AS currentearnedpremium, 
                      SUM(currentwrittenpremium) AS currentwrittenpremium, Review_quarter, Dominant_Productcode, Account_Premium_Range, Dominant_Policy, 
                      Account_Premium, Account_Loss_Ratio_Range, Account_Name, Account_Loss_Ratio, FAY_For_Review, Term_factor, Commission_pct, 
                      Primary_Producer, Primary_Producer_type, Written_Premium_Range, Program_Code, Branch_Region, underwriter, First_Policy_Year, 
                      New_Renew_Tail, policy_effective_year, policyexpirationdate, SUM(Reported_Claims) AS Reported_Claims, SUM(Open_Claims) AS Open_Claims, 
                      SUM(Closed_With_Pay_Claims) AS Closed_With_Pay_Claims, SUM(Closed_Without_Pay_Claims) AS Closed_Without_Pay_Claims, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      Last_Reporting_Year, Last_Reporting_Month, Coverage_Group, Price_Monitor_Standard_Cov_Grp_Monitored_range
FROM         dbo.Large_Accounts_premium_summary
GROUP BY accountnumber, policynumber, policyeffectivedate, Coverage_Reporting_group, productcode, Review_quarter, Dominant_Productcode, 
                      Account_Premium_Range, Dominant_Policy, Account_Premium, Account_Loss_Ratio_Range, Account_Name, Account_Loss_Ratio, FAY_For_Review, 
                      Term_factor, Commission_pct, Primary_Producer, Primary_Producer_type, Written_Premium_Range, Program_Code, Branch_Region, underwriter, 
                      First_Policy_Year, New_Renew_Tail, policy_effective_year, policyexpirationdate, Last_Reporting_Year, Last_Reporting_Month, Coverage_Group, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range
' 
GO
