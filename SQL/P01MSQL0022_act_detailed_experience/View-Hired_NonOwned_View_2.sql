IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hired_NonOwned_View_2]'))
DROP VIEW [dbo].[Hired_NonOwned_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Hired_NonOwned_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Hired_NonOwned_View_2
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.statecode, 
                      dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.productcode, 
                      dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Malpractice_Count) 
                      AS COL_GLBI_Malpractice_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Malpractice_Loss) 
                      AS COL_GLBI_Malpractice_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Fraud_Breach_of_Contract_Loss) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Injury_Count) 
                      AS COL_GLBI_Injury_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Injury_Loss) 
                      AS COL_GLBI_Injury_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Other_Count) 
                      AS COL_GLBI_Other_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_PropertyDamage_Loss) AS COL_GLBI_PropertyDamage_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_PropertyDamage_Count) AS COL_GLBI_PropertyDamage_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Incurred_Claims) 
                      AS Incurred_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Information_Hired_NonOwned.New_Renew_Tail, dbo.Policy_Information_Hired_NonOwned.Renew_New_Auto, 
                      dbo.Policy_Information_Hired_NonOwned.Branch_Region, dbo.Policy_Information_Hired_NonOwned.program, 
                      dbo.Policy_Information_Hired_NonOwned.Written_Premium_Range, 
                      dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Coverage_Group, dbo.Policy_Information_Hired_NonOwned.product_group, 
                      dbo.Policy_Information_Hired_NonOwned.Primary_Umbrella, dbo.Policy_Information_Hired_NonOwned.Primary_Producer
FROM         dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013 LEFT OUTER JOIN
                      dbo.Policy_Information_Hired_NonOwned ON 
                      dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.policynumber = dbo.Policy_Information_Hired_NonOwned.policynumber
GROUP BY dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.statecode, 
                      dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.productcode, 
                      dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Fiscal_AY_Year, dbo.Policy_Information_Hired_NonOwned.New_Renew_Tail, 
                      dbo.Policy_Information_Hired_NonOwned.Renew_New_Auto, dbo.Policy_Information_Hired_NonOwned.Branch_Region, 
                      dbo.Policy_Information_Hired_NonOwned.program, dbo.Policy_Information_Hired_NonOwned.Written_Premium_Range, 
                      dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_March_2013.Coverage_Group, dbo.Policy_Information_Hired_NonOwned.product_group, 
                      dbo.Policy_Information_Hired_NonOwned.Primary_Umbrella, dbo.Policy_Information_Hired_NonOwned.Primary_Producer
HAVING      (dbo.Policy_Information_Hired_NonOwned.Primary_Umbrella = ''Primary'')
' 
GO
