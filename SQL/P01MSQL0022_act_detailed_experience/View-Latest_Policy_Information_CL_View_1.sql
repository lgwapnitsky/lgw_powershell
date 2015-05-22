IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_CL_View_1]'))
DROP VIEW [dbo].[Latest_Policy_Information_CL_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_CL_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_Policy_Information_CL_View_1
AS
SELECT     policynumber, Idnum, CL_Occ_Limit, CL_Agg_Limit, CL_Deductible, CL_Revenues, CL_RetroactiveYears, CL_ContractsUsage, CL_HazardGroup, 
                      CL_ProgramMod_Factor, CL_NumOfEmployees, CL_BusinessType, CL_Revenue_Per_Employee, CL_Mortgage_Broker_Ind, CL_NumOfEmployees_range, 
                      CL_Revenues_range, CL_Prior_Years_Range, CL_Revenue_Per_Employee_range, CL_Occ_Limit_int, CL_Agg_Limit_int, CL_Deductible_int
FROM         dbo.Policy_Information_CL_June
' 
GO
