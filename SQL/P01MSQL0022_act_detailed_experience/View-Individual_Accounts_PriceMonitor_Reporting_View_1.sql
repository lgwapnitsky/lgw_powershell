IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_PriceMonitor_Reporting_View_1]'))
DROP VIEW [dbo].[Individual_Accounts_PriceMonitor_Reporting_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_PriceMonitor_Reporting_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_PriceMonitor_Reporting_View_1
AS
SELECT     PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Account_Number, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Policy_number, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Division, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Product, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.coverage_form, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Subline, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Class_Code, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Premium_State, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Territory, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Branch_reg, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Underwriter, SUM(PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Prior_MIPS_PolTerm_WP) 
                      AS Prior_MIPS_PolTerm_WP, SUM(PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Curr_MIPS_WP) AS Curr_MIPS_WP, 
                      SUM(PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Renewal_calc_RateChangePrem_onExpiringTermPrem) 
                      AS Renewal_calc_RateChangePrem_onExpiringTermPrem, SUM(PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Standard_Premium_Curr) 
                      AS Standard_Premium_Curr, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Account_Name, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Branch_Region_Name, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Region_description, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Curr_Policy_Expiration_Date, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.curr_policy_expiration_YYYYMM, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Renewal_Reportable_YN, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Standard_Reportable_YN, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Coverage_Reporting_Group, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Coverage_Group, (CASE WHEN Renewal_Reportable_YN = ''Y'' THEN 1 ELSE 0 END) 
                      AS Renewal_Reportable_01, (CASE WHEN Standard_Reportable_YN = ''Y'' THEN 1 ELSE 0 END) AS Standard_Reportable_10
FROM         dbo.Individual_Accounts_for_Reports_View_1 LEFT OUTER JOIN
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting ON 
                      dbo.Individual_Accounts_for_Reports_View_1.policynumber = PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Policy_number AND 
                      dbo.Individual_Accounts_for_Reports_View_1.accountnumber = PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Account_Number
GROUP BY PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Account_Number, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Policy_number, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Division, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Product, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.coverage_form, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Subline, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Class_Code, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Premium_State, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Territory, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Branch_reg, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Underwriter, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Account_Name, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Branch_Region_Name, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Region_description, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Curr_Policy_Expiration_Date, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.curr_policy_expiration_YYYYMM, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Renewal_Reportable_YN, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Standard_Reportable_YN, 
                      PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Coverage_Reporting_Group, PriceMonitor.dbo.Price_Monitor_Detailed_Reporting.Coverage_Group
' 
GO
