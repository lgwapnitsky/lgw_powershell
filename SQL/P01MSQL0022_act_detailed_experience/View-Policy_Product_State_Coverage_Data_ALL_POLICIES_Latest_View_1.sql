IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_Latest_View_1]'))
DROP VIEW [dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_Latest_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_Latest_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_Latest_View_1
AS
SELECT     policynumber, Productcode, statecode, coverage_group, currentwrittenpremium, FA_Frost_State, Renewal_Curr_MIPS_WP, 
                      Renewal_calc_RateChangePrem_onExpiringTermPrem, Prior_MIPS_PolTerm_WP, Standard_Curr_MIPS_WP, Standard_Premium_Curr, 
                      Benchmark_Curr_MIPS_WP, Benchmark_NormPrem, Benchmark_Curr_Exposure, Price_Monitor_Standard_CovGrp_GL_Monitored, 
                      Price_Monitor_Standard_Portion_of_CovGrp_GL_Monitored, Price_Monitor_Renewal_Portion_of_All_Cov_Monitored, 
                      Price_Monitor_Renewal_Changes_of_All_Cov_Monitored, Price_Monitor_Renewal_Portion_of_Cov_Grp_Monitored, 
                      Price_Monitor_Renewal_Changes_of_Cov_Grp_Monitored, Price_Monitor_Renewal_Portion_of_CovGrp_St_Class_Monitored, 
                      Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored, Price_Monitor_Standard_Portion_of_All_Cov_Monitored, 
                      Price_Monitor_Standard_Changes_of_All_Cov_Monitored, Price_Monitor_Standard_Portion_of_Cov_Grp_Monitored, 
                      Price_Monitor_Standard_Cov_Grp_Monitored, Price_Monitor_Benchmark_Rate, Price_Monitor_Benchmark_CW_for_Class, 
                      Price_Monitor_Standard_CovGrp_GL_Monitored_range, Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range, 
                      Price_Monitor_Standard_Cov_Grp_Monitored_range, Price_Monitor_Benchmark_Rate_to_CW_range, GL_Territory_Dominant, 
                      GL_Territory_Dominant_Percent, GL_Dom_Terr_Description, GL_Dom_Region_in_State
FROM         dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_January
' 
GO
