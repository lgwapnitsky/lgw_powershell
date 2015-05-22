IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_DrivingSchools_Loss_view_1]'))
DROP VIEW [dbo].[VS_DrivingSchools_Loss_view_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_DrivingSchools_Loss_view_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.VS_DrivingSchools_Loss_view_1
AS
SELECT     accountnumber, Policy_Number, Claim_Number, Coverage_Reporting_group, Coverage_Form, Accident_Year, Fiscal_AY_Year, Type_of_Loss_Desc, Claim_Desc, 
                      Case_Loss, Case_ALAE, Paid_Loss, Paid_ALAE, Sal_Subro, Incurred_Loss_ALAE_with_SS, Incurred_Loss_ALAE_with_SS_NonCat, 
                      Incurred_Loss_ALAE_with_SS_CatOnly, Reported_Claims, Open_Claims, Closed_With_Pay_Claims, Closed_Without_Pay_Claims, Incurred_Claims, Coverage_Group, 
                      report_year, report_month, policy_year, policy_month, Type_of_Loss, Written_Premium_Range, Accident_State, Driving_School, productcode, SubProduct, 
                      SubProductGroup
FROM         dbo.VS_All_Lines_Losses_View_1
WHERE     (SubProduct = ''Driving School'')
' 
GO
