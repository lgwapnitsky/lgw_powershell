IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hired_NonOwned_Loss_View_2]'))
DROP VIEW [dbo].[Hired_NonOwned_Loss_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hired_NonOwned_Loss_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Hired_NonOwned_Loss_View_2
AS
SELECT     dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Accountnumber, dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Policy_Number, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Claim_Number, dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Product, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Premium_State, dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Coverage_Reporting_group, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Coverage_Form, dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Accident_Year, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Fiscal_AY_Year, dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Type_of_Loss_Desc, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Claim_Desc, dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Case_Loss, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Case_ALAE, dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Paid_Loss, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Paid_ALAE, dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Sal_Subro, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Incurred_Loss_ALAE_with_SS, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Reported_Claims, dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Open_Claims, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Closed_With_Pay_Claims, 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Closed_Without_Pay_Claims, dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Incurred_Claims, 
                      dbo.Policy_Information_Hired_NonOwned.Primary_Umbrella, dbo.Policy_Information_Hired_NonOwned.Written_Premium_Range
FROM         dbo.Comm_Auto_Liab_Hired_NonOwned_Detail LEFT OUTER JOIN
                      dbo.Policy_Information_Hired_NonOwned ON 
                      dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Policy_Number = dbo.Policy_Information_Hired_NonOwned.policynumber
WHERE     (dbo.Comm_Auto_Liab_Hired_NonOwned_Detail.Closed_Without_Pay_Claims = 0)
' 
GO
