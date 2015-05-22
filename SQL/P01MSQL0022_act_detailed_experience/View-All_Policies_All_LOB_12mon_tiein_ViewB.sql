IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_12mon_tiein_ViewB]'))
DROP VIEW [dbo].[All_Policies_All_LOB_12mon_tiein_ViewB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_12mon_tiein_ViewB]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.All_Policies_All_LOB_12mon_tiein_ViewB
AS
SELECT DISTINCT 
                      acctngyear, Fiscal_AY_Year, experienceproduct, statecode, Coverage_Reporting_group, SUM(Policy_count_Reporting_Coverage) AS policycount, 
                      SUM(currentearnedpremium) AS Earned_Premium, SUM(currentwrittenpremium) AS Written_Prmeium, SUM(Incurred_Claims) AS Incurred_Claims, 
                      SUM(Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_nonCat, SUM(Reported_Claims) AS Reported_Claims, SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_Noncat, SUM(Commission_dollars) AS commission_dollars, SUM(Commission_Premiums) 
                      AS commission_premiums, SUM(COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, SUM(COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, SUM(COL_GLBI_Malpractice_Loss) 
                      AS COL_GLBI_Malpractice_Loss, SUM(COL_GLBI_PropertyDamage_Loss) AS COL_GLBI_PropertyDamage_Loss, 
                      SUM(COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, SUM(COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, SUM(COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, SUM(COL_GLBI_Injury_Count) 
                      AS COL_GLBI_Injury_Count, SUM(COL_GLBI_Sexual_Assault_Molest_Abuse_Count) AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, SUM(COL_GLBI_Fraud_Breach_of_Contract_Count) 
                      AS COL_GLBI_Fraud_Breach_of_Contract_Count, SUM(COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(COL_GLBI_PropertyDamage_Count) AS COL_GLBI_PropertyDamage_Count, SUM(COL_GLBI_SlanderDefamtion_Count) 
                      AS COL_GLBI_SlanderDefamtion_Count, SUM(COL_GLBI_Discrim_WrongfulTermination_Count) AS COL_GLBI_Discrim_WrongfulTermination_Count, 
                      SUM(COL_GLBI_Other_Count) AS COL_GLBI_Other_Count
FROM         dbo.ALL_POLICIES_12_premium_summary_B
GROUP BY acctngyear, Fiscal_AY_Year, experienceproduct, statecode, Coverage_Reporting_group
' 
GO
