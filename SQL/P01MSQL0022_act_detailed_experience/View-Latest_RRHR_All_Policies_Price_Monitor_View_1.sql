IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_RRHR_All_Policies_Price_Monitor_View_1]'))
DROP VIEW [dbo].[Latest_RRHR_All_Policies_Price_Monitor_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_RRHR_All_Policies_Price_Monitor_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Latest_RRHR_All_Policies_Price_Monitor_View_1
AS
SELECT     policynumber, currentwrittenpremium, Standard_Curr_MIPS_WP, Standard_Premium_Curr, Standard_Curr_MIPS_WP_GL, 
                      Standard_Curr_MIPS_WP_FA, Standard_Premium_Curr_GL, Standard_Premium_Curr_FA, Renewal_RCPrem_total, Renewal_RCPrem_GL, 
                      Renewal_RCPrem_FA, Prior_PolTerm_WP_total, Prior_PolTerm_WP_GL, Prior_PolTerm_WP_FA, Price_Monitor_Std_Cov_Grp_Monitored, 
                      Price_Monitor_Std_Cov_Grp_Monitored_range
FROM         dbo.RRHR_All_Policies_Price_Monitor_May
' 
GO
