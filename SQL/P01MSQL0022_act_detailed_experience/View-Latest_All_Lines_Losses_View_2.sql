IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_2]'))
DROP VIEW [dbo].[Latest_All_Lines_Losses_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Latest_All_Lines_Losses_View_2
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_June.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_June.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Coverage_Form, dbo.ALL_POLICIES_12_Detail_Information_1_June.Accident_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_June.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Claim_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_June.Case_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Case_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_June.Paid_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Paid_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_June.Sal_Subro, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Incurred_Loss_ALAE_with_SS_CatOnly, dbo.ALL_POLICIES_12_Detail_Information_1_June.Reported_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Open_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_June.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_June.Incurred_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Coverage_Group, dbo.ALL_POLICIES_12_Detail_Information_1_June.report_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.report_month, dbo.ALL_POLICIES_12_Detail_Information_1_June.policy_year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.policy_month, dbo.ALL_POLICIES_12_Detail_Information_1_June.Type_of_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Accident_State, dbo.ALL_POLICIES_12_Detail_Information_1_June.Accident_State_for_join, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Exp_product, dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.GL_Dom_Region_in_State, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.GL_Dom_Terr_Description, dbo.Policy_PATHID_Information.reportmixname, 
                      dbo.Policy_PATHID_Information.prodmixname, dbo.Policy_PATHID_Information.policynumber, dbo.Policy_PATHID_Information.CompanyCode, 
                      dbo.Policy_PATHID_Information.accountnumber, dbo.Policy_PATHID_Information.productcode, dbo.Policy_PATHID_Information.ProductTypeName, 
                      dbo.Policy_PATHID_Information.productdesc, dbo.Policy_PATHID_Information.Source_Detail_Name, dbo.Policy_PATHID_Information.BusinessClassDesc, 
                      dbo.Policy_PATHID_Information.producttype, dbo.Policy_PATHID_Information.DivisionName, dbo.Policy_PATHID_Information.Account_Premium_Range, 
                      dbo.Policy_PATHID_Information.PrimaryProducer, dbo.Policy_PATHID_Information.PrimaryProducerType, dbo.Policy_PATHID_Information.PICProducer, 
                      dbo.Policy_PATHID_Information.Written_Premium_Range, dbo.Policy_PATHID_Information.Number_of_Renewals, dbo.Policy_PATHID_Information.regiondesc, 
                      dbo.Policy_PATHID_Information.program, dbo.Policy_PATHID_Information.underwriterName, dbo.Policy_PATHID_Information.NewRenewalAuto, 
                      dbo.Policy_PATHID_Information.Product_group, dbo.Policy_PATHID_Information.accountname, dbo.Policy_PATHID_Information.Number_of_SubsequentRenewals, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Policy_Number, dbo.Policy_PATHID_Information.PrimaryProducerNumber, 
                      dbo.Policy_PATHID_Information.effectivedate, dbo.Policy_PATHID_Information.effectiveYear, dbo.Policy_PATHID_Information.effectiveMonth, 
                      dbo.Policy_PATHID_Information.effectiveYearMonth, dbo.Policy_PATHID_Information.expirationdate, dbo.Policy_PATHID_Information.expirationMonth, 
                      dbo.Policy_PATHID_Information.expirationYear, dbo.Policy_PATHID_Information.expirationYearMonth, dbo.Policy_PATHID_Information.Insd_State, 
                      dbo.Policy_PATHID_Information.Insd_City, dbo.Policy_PATHID_Information.Insd_Zip, dbo.Policy_PATHID_Information.Insured_Years, 
                      dbo.Policy_PATHID_Information.Insured_Years_Range, dbo.Policy_PATHID_Information.SLD_BusinessType, dbo.Policy_PATHID_Information.PV_Cov_ALL, 
                      dbo.Policy_PATHID_Information.FF_Cov_ALL, dbo.Policy_PATHID_Information.programdesc
FROM         dbo.Policy_PATHID_Information RIGHT OUTER JOIN
                      dbo.ALL_POLICIES_12_Detail_Information_1_June LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.coverage_group AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Product = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.Productcode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Accident_State_for_join = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.statecode AND 
                      dbo.ALL_POLICIES_12_Detail_Information_1_June.Policy_Number = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_June.policynumber ON 
                      dbo.Policy_PATHID_Information.policynumber = dbo.ALL_POLICIES_12_Detail_Information_1_June.Policy_Number
' 
GO
