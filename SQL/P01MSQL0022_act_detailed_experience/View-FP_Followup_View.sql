IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FP_Followup_View]'))
DROP VIEW [dbo].[FP_Followup_View]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FP_Followup_View]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.FP_Followup_View
AS
SELECT     accountnumber, statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, SUM(currentwrittenpremium) 
                      AS currentwrittenpremium, SUM(currentearnedpremium) AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) 
                      AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, New_Renew_Tail, Branch_Region, Written_Premium_Range, Primary_Producer, Account_Name, Poor_Account_Indicator, 
                      underwriter, Renewal_Curr_MIPS_WP, Account_Name_Display, Price_Monitor_Standard_Cov_Grp_Monitored_range, Account_Active
FROM         dbo.FP_premium_summary
GROUP BY accountnumber, statecode, Coverage_Group, Coverage_Reporting_group, Coverage_Form, Fiscal_AY_Year, New_Renew_Tail, Branch_Region, 
                      Written_Premium_Range, Primary_Producer, Account_Name, Poor_Account_Indicator, underwriter, Renewal_Curr_MIPS_WP, Account_Name_Display, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Account_Active
' 
GO
