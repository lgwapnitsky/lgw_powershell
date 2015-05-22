IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_12mon_tiein_View_2]'))
DROP VIEW [dbo].[All_Policies_All_LOB_12mon_tiein_View_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_12mon_tiein_View_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.All_Policies_All_LOB_12mon_tiein_View_2
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_B.statecode, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_B.productcode, SUM(dbo.ALL_POLICIES_12_premium_summary_B.currentwrittenpremium) 
                      AS currentwrittenpremium, SUM(dbo.ALL_POLICIES_12_premium_summary_B.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Commission_Premiums) AS Commission_Premiums, 
                      dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_Buildings) 
                      AS Earned_Buildings, SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Earned_TIV) AS Earned_TIV, dbo.ALL_POLICIES_12_premium_summary_B.experienceproduct, 
                      dbo.ALL_POLICIES_12_premium_summary_B.acctngyear, dbo.ALL_POLICIES_12_premium_summary_B.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_B.Last_Reporting_Month, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Open_Claims) AS Open_Claims, dbo.ALL_POLICIES_12_premium_summary_B.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_B.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_B.product_group, dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella
FROM         dbo.ALL_POLICIES_12_premium_summary_B LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_12_premium_summary_B.policynumber = dbo.Policy_Information_ALL_POLICIES_B.policynumber
GROUP BY dbo.ALL_POLICIES_12_premium_summary_B.statecode, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_B.productcode, dbo.ALL_POLICIES_12_premium_summary_B.Coverage_Group, 
                      dbo.ALL_POLICIES_12_premium_summary_B.experienceproduct, dbo.ALL_POLICIES_12_premium_summary_B.acctngyear, 
                      dbo.ALL_POLICIES_12_premium_summary_B.Last_Reporting_Year, dbo.ALL_POLICIES_12_premium_summary_B.Last_Reporting_Month, 
                      dbo.ALL_POLICIES_12_premium_summary_B.Fiscal_AY_Year, dbo.Policy_Information_ALL_POLICIES_B.product_group, 
                      dbo.Policy_Information_ALL_POLICIES_B.Renew_New_Auto, dbo.Policy_Information_ALL_POLICIES_B.New_Renew_Tail, 
                      dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella
' 
GO
