IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[temp_All_Lines_Losses_View_1]'))
DROP VIEW [dbo].[temp_All_Lines_Losses_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[temp_All_Lines_Losses_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[temp_All_Lines_Losses_View_1]
AS
SELECT     Accountnumber, Policy_Number, Claim_Number, Product, Coverage_Reporting_group, Coverage_Form, Accident_Year, Fiscal_AY_Year, 
                      Type_of_Loss_Desc, Claim_Desc, Case_Loss, Case_ALAE, Paid_Loss, Paid_ALAE, Sal_Subro, Incurred_Loss_ALAE_with_SS, 
                      Incurred_Loss_ALAE_with_SS_NonCat, Incurred_Loss_ALAE_with_SS_CatOnly, Reported_Claims, Open_Claims, Closed_With_Pay_Claims, 
                      Closed_Without_Pay_Claims, Incurred_Claims, Coverage_Group, report_year, report_month, policy_year, policy_month, Type_of_Loss, 
                      Written_Premium_Range, Accident_State
FROM         dbo.Latest_All_Lines_Losses_View_1
WHERE     (Product IN (''ra'', ''rs'', ''op''))
' 
GO
