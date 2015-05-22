IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_September]'))
DROP VIEW [dbo].[Latest_All_Lines_Losses_View_1_September]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_September]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Latest_All_Lines_Losses_View_1_September
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_September.Claim_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Coverage_Form, dbo.ALL_POLICIES_12_Detail_Information_1_September.Accident_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Fiscal_AY_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Type_of_Loss_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_September.Claim_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Case_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_September.Case_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Paid_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_September.Paid_ALAE, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Sal_Subro, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_September.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Closed_Without_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Incurred_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_September.Coverage_Group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.report_year, dbo.ALL_POLICIES_12_Detail_Information_1_September.report_month, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.policy_year, dbo.ALL_POLICIES_12_Detail_Information_1_September.policy_month, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Type_of_Loss, dbo.ALL_POLICIES_12_Detail_Information_1_September.Accident_State, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Accident_State_for_join, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Exp_product, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.GL_Dom_Region_in_State, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.GL_Dom_Terr_Description, dbo.Policy_PATHID_Information.reportmixname, 
                      dbo.Policy_PATHID_Information.prodmixname, dbo.Policy_PATHID_Information.CompanyCode, dbo.Policy_PATHID_Information.accountnumber, 
                      dbo.Policy_PATHID_Information.productcode, dbo.Policy_PATHID_Information.ProductTypeName, dbo.Policy_PATHID_Information.productdesc, 
                      dbo.Policy_PATHID_Information.Source_Detail_Name, dbo.Policy_PATHID_Information.BusinessClassDesc, 
                      dbo.Policy_PATHID_Information.producttype, dbo.Policy_PATHID_Information.DivisionName, 
                      dbo.Policy_PATHID_Information.Account_Premium_Range, dbo.Policy_PATHID_Information.PrimaryProducer, 
                      dbo.Policy_PATHID_Information.PrimaryProducerType, dbo.Policy_PATHID_Information.PICProducer, 
                      dbo.Policy_PATHID_Information.Written_Premium_Range, dbo.Policy_PATHID_Information.Number_of_Renewals, 
                      dbo.Policy_PATHID_Information.regiondesc, dbo.Policy_PATHID_Information.program, dbo.Policy_PATHID_Information.underwriterName, 
                      dbo.Policy_PATHID_Information.NewRenewalAuto, dbo.Policy_PATHID_Information.Product_group, dbo.Policy_PATHID_Information.accountname, 
                      dbo.Policy_PATHID_Information.Number_of_SubsequentRenewals, dbo.ALL_POLICIES_12_Detail_Information_1_September.Policy_Number, 
                      dbo.Policy_PATHID_Information.PrimaryProducerNumber, dbo.Policy_PATHID_Information.effectivedate, dbo.Policy_PATHID_Information.effectiveYear, 
                      dbo.Policy_PATHID_Information.effectiveMonth, dbo.Policy_PATHID_Information.effectiveYearMonth, dbo.Policy_PATHID_Information.expirationdate, 
                      dbo.Policy_PATHID_Information.expirationMonth, dbo.Policy_PATHID_Information.expirationYear, 
                      dbo.Policy_PATHID_Information.expirationYearMonth, dbo.Policy_PATHID_Information.Insd_State, dbo.Policy_PATHID_Information.Insd_City, 
                      dbo.Policy_PATHID_Information.Insd_Zip, dbo.Policy_PATHID_Information.Insured_Years, dbo.Policy_PATHID_Information.Insured_Years_Range, 
                      dbo.Policy_PATHID_Information.SLD_BusinessType, dbo.Policy_PATHID_Information.policynumber
FROM         dbo.Policy_Information_ALL_POLICIES_September RIGHT OUTER JOIN
                      dbo.Policy_PATHID_Information RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_12_Detail_Information_1_September ON 
                      dbo.Policy_PATHID_Information.policynumber = dbo.ALL_POLICIES_12_Detail_Information_1_September.Policy_Number ON 
                      dbo.Policy_Information_ALL_POLICIES_September.policynumber = dbo.ALL_POLICIES_12_Detail_Information_1_September.Policy_Number LEFT OUTER
                       JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.coverage_group
                       AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Product = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Productcode AND
                       dbo.ALL_POLICIES_12_Detail_Information_1_September.Accident_State_for_join = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.statecode
                       AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_September.Policy_Number = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.policynumber
                       RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_12_premium_summary_September ON 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.Productcode = dbo.ALL_POLICIES_12_premium_summary_September.productcode
                       AND 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.statecode = dbo.ALL_POLICIES_12_premium_summary_September.statecode AND
                       dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.coverage_group = dbo.ALL_POLICIES_12_premium_summary_September.Coverage_Group
                       AND 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_September.policynumber = dbo.ALL_POLICIES_12_premium_summary_September.policynumber
' 
GO
