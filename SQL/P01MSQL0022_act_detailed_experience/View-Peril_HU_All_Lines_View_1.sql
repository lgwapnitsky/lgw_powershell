IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Peril_HU_All_Lines_View_1]'))
DROP VIEW [dbo].[Peril_HU_All_Lines_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Peril_HU_All_Lines_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Peril_HU_All_Lines_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_March.statecode, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_March.productcode, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Reported_Claims) AS Reported_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Branch_Region, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_March.Primary_Umbrella, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Region_in_State, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_with_SS_CatOnly) 
                      AS Incurred_Loss_ALAE_with_SS_CatOnly, dbo.Policy_Information_ALL_POLICIES_March.First_Policy_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Month_Ending, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio, dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio, dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_priorpolperiods_Range, dbo.Policy_PATHID_Information.productdesc, 
                      dbo.Policy_PATHID_Information.ProductTypeName, dbo.Policy_PATHID_Information.accountname, dbo.Policy_Information_ALL_POLICIES_March.Account_Name, 
                      dbo.Policy_PATHID_Information.CompanyCode, dbo.Policy_PATHID_Information.Product_group, dbo.Policy_PATHID_Information.Insd_State, 
                      dbo.Policy_PATHID_Information.Insd_City, dbo.Policy_PATHID_Information.Insd_Zip, dbo.Policy_PATHID_Information.regiondesc, 
                      dbo.Policy_PATHID_Information.Number_of_Renewals, dbo.Policy_PATHID_Information.Account_Premium_Range, dbo.Policy_PATHID_Information.expirationdate, 
                      dbo.Policy_PATHID_Information.Insured_Years_Range, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_without_SS_NonCat) 
                      AS Incurred_Loss_ALAE_without_SS_NonCat, dbo.ALL_POLICIES_12_premium_summary_March.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_March.BusinessClassDesc, dbo.ALL_POLICIES_12_premium_summary_March.acctngyear, 
                      dbo.Policy_Information_ALL_POLICIES_March.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_March.policyexpirationdate, 
                      dbo.Policy_Information_ALL_POLICIES_March.Business_Desc, dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range_for_Product, 
                      dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_Cov_Grp_Monitored, 
                      dbo.ALL_POLICIES_12_premium_summary_March.experienceproduct, dbo.Policy_PATHID_Information.producttype, dbo.Policy_PATHID_Information.effectivedate, 
                      dbo.Peril_HU_PoorAccounts.coTVaR_100
FROM         dbo.ALL_POLICIES_12_premium_summary_March RIGHT OUTER JOIN
                      dbo.Peril_HU_PoorAccounts ON dbo.ALL_POLICIES_12_premium_summary_March.accountnumber = dbo.Peril_HU_PoorAccounts.Account_Number LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.policynumber AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.coverage_group LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Information_ALL_POLICIES_March.policynumber AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.productcode = dbo.Policy_Information_ALL_POLICIES_March.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.policyeffectivedate = dbo.Policy_Information_ALL_POLICIES_March.policyEffectivedate LEFT OUTER JOIN
                      dbo.Policy_PATHID_Information ON dbo.Policy_Information_ALL_POLICIES_March.policynumber = dbo.Policy_PATHID_Information.policynumber
GROUP BY dbo.ALL_POLICIES_12_premium_summary_March.statecode, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_March.productcode, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_CovGrp_GL_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Branch_Region, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_March.Primary_Umbrella, dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_Working_Cover_Range, dbo.ALL_POLICIES_12_premium_summary_March.policynumber, 
                      dbo.Policy_Information_ALL_POLICIES_March.First_Policy_Year, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Month_Ending, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio, dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio, dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_priorpolperiods_Range, dbo.Policy_PATHID_Information.productdesc, 
                      dbo.Policy_PATHID_Information.ProductTypeName, dbo.Policy_PATHID_Information.accountname, dbo.Policy_Information_ALL_POLICIES_March.Account_Name, 
                      dbo.Policy_PATHID_Information.CompanyCode, dbo.Policy_PATHID_Information.Product_group, dbo.Policy_PATHID_Information.Insd_State, 
                      dbo.Policy_PATHID_Information.Insd_City, dbo.Policy_PATHID_Information.Insd_Zip, dbo.Policy_PATHID_Information.regiondesc, 
                      dbo.Policy_PATHID_Information.Number_of_Renewals, dbo.Policy_PATHID_Information.Account_Premium_Range, dbo.Policy_PATHID_Information.expirationdate, 
                      dbo.Policy_PATHID_Information.Insured_Years_Range, dbo.ALL_POLICIES_12_premium_summary_March.accountnumber, 
                      dbo.Policy_Information_ALL_POLICIES_March.BusinessClassDesc, dbo.ALL_POLICIES_12_premium_summary_March.acctngyear, 
                      dbo.Policy_Information_ALL_POLICIES_March.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_March.policyexpirationdate, 
                      dbo.Policy_Information_ALL_POLICIES_March.Business_Desc, dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range_for_Product, 
                      dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_Cov_Grp_Monitored, 
                      dbo.ALL_POLICIES_12_premium_summary_March.experienceproduct, dbo.Policy_PATHID_Information.producttype, dbo.Policy_PATHID_Information.effectivedate, 
                      dbo.Peril_HU_PoorAccounts.coTVaR_100
' 
GO
