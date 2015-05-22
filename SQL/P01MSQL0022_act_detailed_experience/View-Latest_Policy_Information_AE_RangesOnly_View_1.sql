IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_AE_RangesOnly_View_1]'))
DROP VIEW [dbo].[Latest_Policy_Information_AE_RangesOnly_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_AE_RangesOnly_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_Policy_Information_AE_RangesOnly_View_1
AS
SELECT     policynumber, Idnum, AE_Limit, AE_Limit_Type, AE_Accountant_Type, AE_Deductible, AE_Prior_Years, AE_Num_of_Accountants_Range, AE_Years_Prior_to_Retro, 
                      AE_Program_Type, AE_Revenues_range, AE_Revenue_Per_Accountant_Range, AE_Limit_Trim, AE_Limit_Type_Trim
FROM         dbo.Policy_Information_AE_June
' 
GO
