IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_FF_View_1]'))
DROP VIEW [dbo].[Latest_Policy_Information_FF_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_FF_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_Policy_Information_FF_View_1
AS
SELECT     policynumber, Idnum, DF_Limit, DF_Base_Retention, DF_Alt_Retention, DF_RatingClass, FF_DO_Limit, FF_DO_Base_Retention, FF_DO_Alt_Retention, 
                      FF_DO_RatingClass, FF_DO_Revenues, FF_EPL_Limit, FF_EPL_Base_Retention, FF_EPL_Alt_Retention, FF_EPL_RatingClass, FF_EPL_Num_of_Employees, 
                      FF_Business_Type, FF_EPL_Num_of_Employees_Range, FF_EPL_Num_of_Employees_Range_expanded, FF_EPL_Num_of_Employees_Range_expanded_2, 
                      FF_DO_Revenues_range, FF_Trade_Assoc, TrimBusiness_Type, FF_DO_Alt_Retention_int, FF_EPL_Limit_int, FF_EPL_Alt_Retention_int
FROM         dbo.Policy_Information_FF_June
' 
GO
