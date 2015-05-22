IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HC_GL_Rates_View_1]'))
DROP VIEW [dbo].[HC_GL_Rates_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HC_GL_Rates_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.HC_GL_Rates_View_1
AS
SELECT     dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Product, YEAR(dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Effective_Date) 
                      * 100 + MONTH(dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Effective_Date) AS Policy_YearMonth, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Policy_Number, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Effective_Date, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.State, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Territory, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Class_Code, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Premium, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Exposure, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Class_Description, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Exposure_Base, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Exposure_Adj_Fac, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Exposure_Adj_Type, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Avg_Rate, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Avg_Rate_Range, dbo.Policy_Information_ALL_POLICIES_January.Term_factor, 
                      dbo.ALL_POLICIES_12_premium_summary_January.Coverage_Reporting_group, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_January.currentwrittenpremium) AS currentwrittenpremium, dbo.HC_PLGL_Exposures_View_1.PREM, 
                      dbo.HC_PLGL_Exposures_View_1.EXPOSURE AS Expr1, dbo.HC_PLGL_Exposures_View_1.AGENCY_PREM, 
                      dbo.HC_PLGL_Exposures_View_1.RESIDENTIAL_PREM, dbo.HC_PLGL_Exposures_View_1.DOCTORATE_PREM, 
                      dbo.HC_PLGL_Exposures_View_1.GRADUATE_PREM, dbo.HC_PLGL_Exposures_View_1.OTHER_COUNSELOR_PREM, 
                      dbo.HC_PLGL_Exposures_View_1.TEACHER_NUTRITIONIST_PREM, dbo.HC_PLGL_Exposures_View_1.AGENCY_RATE, 
                      dbo.HC_PLGL_Exposures_View_1.RESIDENTIAL_RATE, dbo.HC_PLGL_Exposures_View_1.DOCTORATE_RATE, 
                      dbo.HC_PLGL_Exposures_View_1.GRADUATE_RATE, dbo.HC_PLGL_Exposures_View_1.OTHER_COUNSELOR_RATE, 
                      dbo.HC_PLGL_Exposures_View_1.TEACHER_NUTRITIONIST_RATE, dbo.HC_PLGL_Exposures_View_1.AGENCY_EXPOSURE, 
                      dbo.HC_PLGL_Exposures_View_1.RESIDENTIAL_EXPOSURE, dbo.HC_PLGL_Exposures_View_1.DOCTORATE_EXPOSURE, 
                      dbo.HC_PLGL_Exposures_View_1.GRADUATE_EXPOSURE, dbo.HC_PLGL_Exposures_View_1.OTHER_COUNSELOR_EXPOSURE, 
                      dbo.HC_PLGL_Exposures_View_1.TEACHER_NUTRITIONIST_EXPOSURE, dbo.HC_PLGL_Exposures_View_1.EXPOSURE_GRADE, 
                      dbo.Policy_Information_ALL_POLICIES_January.Branch_Region, dbo.Policy_Information_ALL_POLICIES_January.program, 
                      dbo.Policy_Information_ALL_POLICIES_January.Program_Code, dbo.Policy_Information_ALL_POLICIES_January.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_January.Source_Detail_Name, dbo.Policy_Information_ALL_POLICIES_January.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_January.PIC_Producer, dbo.Policy_Information_ALL_POLICIES_January.PIC_Producer_code, 
                      dbo.Policy_Information_ALL_POLICIES_January.Primary_Producer_code, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Expiration_Date, 
                      dbo.Policy_Information_ALL_POLICIES_January.Account_Name
FROM         dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January LEFT OUTER JOIN
                      dbo.HC_PLGL_Exposures_View_1 ON 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Policy_Number = dbo.HC_PLGL_Exposures_View_1.POLICY_NUMBER LEFT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_January ON 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Product = dbo.ALL_POLICIES_12_premium_summary_January.productcode AND 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Effective_Date = dbo.ALL_POLICIES_12_premium_summary_January.policyeffectivedate AND 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.State = dbo.ALL_POLICIES_12_premium_summary_January.statecode AND 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Policy_Number = dbo.ALL_POLICIES_12_premium_summary_January.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Information_ALL_POLICIES_January ON 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Policy_Number = dbo.Policy_Information_ALL_POLICIES_January.policynumber
GROUP BY dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Product, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Policy_Number, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Effective_Date, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.State, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Territory, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Class_Code, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Premium, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Exposure, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Class_Description, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Exposure_Base, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Exposure_Adj_Fac, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Exposure_Adj_Type, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Avg_Rate, 
                      dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Avg_Rate_Range, 
                      YEAR(dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Effective_Date) 
                      * 100 + MONTH(dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Effective_Date), dbo.Policy_Information_ALL_POLICIES_January.Term_factor, 
                      dbo.ALL_POLICIES_12_premium_summary_January.Coverage_Reporting_group, dbo.HC_PLGL_Exposures_View_1.PREM, 
                      dbo.HC_PLGL_Exposures_View_1.EXPOSURE, dbo.HC_PLGL_Exposures_View_1.AGENCY_PREM, 
                      dbo.HC_PLGL_Exposures_View_1.RESIDENTIAL_PREM, dbo.HC_PLGL_Exposures_View_1.DOCTORATE_PREM, 
                      dbo.HC_PLGL_Exposures_View_1.GRADUATE_PREM, dbo.HC_PLGL_Exposures_View_1.OTHER_COUNSELOR_PREM, 
                      dbo.HC_PLGL_Exposures_View_1.TEACHER_NUTRITIONIST_PREM, dbo.HC_PLGL_Exposures_View_1.AGENCY_RATE, 
                      dbo.HC_PLGL_Exposures_View_1.RESIDENTIAL_RATE, dbo.HC_PLGL_Exposures_View_1.DOCTORATE_RATE, 
                      dbo.HC_PLGL_Exposures_View_1.GRADUATE_RATE, dbo.HC_PLGL_Exposures_View_1.OTHER_COUNSELOR_RATE, 
                      dbo.HC_PLGL_Exposures_View_1.TEACHER_NUTRITIONIST_RATE, dbo.HC_PLGL_Exposures_View_1.AGENCY_EXPOSURE, 
                      dbo.HC_PLGL_Exposures_View_1.RESIDENTIAL_EXPOSURE, dbo.HC_PLGL_Exposures_View_1.DOCTORATE_EXPOSURE, 
                      dbo.HC_PLGL_Exposures_View_1.GRADUATE_EXPOSURE, dbo.HC_PLGL_Exposures_View_1.OTHER_COUNSELOR_EXPOSURE, 
                      dbo.HC_PLGL_Exposures_View_1.TEACHER_NUTRITIONIST_EXPOSURE, dbo.HC_PLGL_Exposures_View_1.EXPOSURE_GRADE, 
                      dbo.Policy_Information_ALL_POLICIES_January.Branch_Region, dbo.Policy_Information_ALL_POLICIES_January.program, 
                      dbo.Policy_Information_ALL_POLICIES_January.Program_Code, dbo.Policy_Information_ALL_POLICIES_January.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_January.Source_Detail_Name, dbo.Policy_Information_ALL_POLICIES_January.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_January.PIC_Producer, dbo.Policy_Information_ALL_POLICIES_January.PIC_Producer_code, 
                      dbo.Policy_Information_ALL_POLICIES_January.Primary_Producer_code, dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Expiration_Date, 
                      dbo.Policy_Information_ALL_POLICIES_January.Account_Name
HAVING      (dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Product = ''HC'') AND 
                      (YEAR(dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Effective_Date) 
                      * 100 + MONTH(dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_January.Effective_Date) >= 201001) AND 
                      (dbo.ALL_POLICIES_12_premium_summary_January.Coverage_Reporting_group = ''GL'')
' 
GO
