IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_12mon_tiein_View_1]'))
DROP VIEW [dbo].[All_Policies_All_LOB_12mon_tiein_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_12mon_tiein_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.All_Policies_All_LOB_12mon_tiein_View_1
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_C.statecode, dbo.ALL_POLICIES_12_premium_summary_C.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_C.productcode, SUM(dbo.ALL_POLICIES_12_premium_summary_C.currentwrittenpremium) 
                      AS currentwrittenpremium, SUM(dbo.ALL_POLICIES_12_premium_summary_C.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_C.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Malpractice_Count) AS COL_GLBI_Malpractice_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Malpractice_Loss) AS COL_GLBI_Malpractice_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Fraud_Breach_of_Contract_Count) AS COL_GLBI_Fraud_Breach_of_Contract_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Fraud_Breach_of_Contract_Loss) AS COL_GLBI_Fraud_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Injury_Count) AS COL_GLBI_Injury_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Injury_Loss) AS COL_GLBI_Injury_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Other_Count) AS COL_GLBI_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Other_Loss) AS COL_GLBI_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Sexual_Assault_Molest_Abuse_Count) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Sexual_Assault_Molest_Abuse_Loss) 
                      AS COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_PropertyDamage_Loss) 
                      AS COL_GLBI_PropertyDamage_Loss, SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_PropertyDamage_Count) 
                      AS COL_GLBI_PropertyDamage_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Theft_Loss) AS COL_GLBI_Theft_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Theft_Count) AS COL_GLBI_Theft_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_SlanderDefamtion_Loss) AS COL_GLBI_SlanderDefamtion_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_SlanderDefamtion_Count) AS COL_GLBI_SlanderDefamtion_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Discrim_WrongfulTermination_Loss) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.COL_GLBI_Discrim_WrongfulTermination_Count) 
                      AS COL_GLBI_Discrim_WrongfulTermination_Count, SUM(dbo.ALL_POLICIES_12_premium_summary_C.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Commission_Premiums) AS Commission_Premiums, 
                      dbo.ALL_POLICIES_12_premium_summary_C.Coverage_Group, SUM(dbo.ALL_POLICIES_12_premium_summary_C.Earned_Buildings) 
                      AS Earned_Buildings, SUM(dbo.ALL_POLICIES_12_premium_summary_C.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Earned_TIV) AS Earned_TIV, dbo.ALL_POLICIES_12_premium_summary_C.experienceproduct, 
                      dbo.ALL_POLICIES_12_premium_summary_C.acctngyear, dbo.ALL_POLICIES_12_premium_summary_C.Last_Reporting_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_C.Last_Reporting_Month, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Open_Claims) AS Open_Claims, dbo.ALL_POLICIES_12_premium_summary_C.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_C.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_C.product_group, dbo.Policy_Information_ALL_POLICIES_C.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_C.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_C.Primary_Umbrella, 
                      dbo.Policy_Information_ALL_POLICIES_C.Branch_Region, dbo.Policy_Information_ALL_POLICIES_C.Primary_Producer
FROM         dbo.ALL_POLICIES_12_premium_summary_C LEFT OUTER JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_C ON 
                      dbo.ALL_POLICIES_12_premium_summary_C.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_C.coverage_group AND 
                      dbo.ALL_POLICIES_12_premium_summary_C.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_C.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_C.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_C.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_C.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_C.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_C ON 
                      dbo.ALL_POLICIES_12_premium_summary_C.policynumber = dbo.Policy_Information_ALL_POLICIES_C.policynumber
GROUP BY dbo.ALL_POLICIES_12_premium_summary_C.statecode, dbo.ALL_POLICIES_12_premium_summary_C.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_C.productcode, dbo.ALL_POLICIES_12_premium_summary_C.Coverage_Group, 
                      dbo.ALL_POLICIES_12_premium_summary_C.experienceproduct, dbo.ALL_POLICIES_12_premium_summary_C.acctngyear, 
                      dbo.ALL_POLICIES_12_premium_summary_C.Last_Reporting_Year, dbo.ALL_POLICIES_12_premium_summary_C.Last_Reporting_Month, 
                      dbo.ALL_POLICIES_12_premium_summary_C.Fiscal_AY_Year, dbo.Policy_Information_ALL_POLICIES_C.product_group, 
                      dbo.Policy_Information_ALL_POLICIES_C.Renew_New_Auto, dbo.Policy_Information_ALL_POLICIES_C.New_Renew_Tail, 
                      dbo.Policy_Information_ALL_POLICIES_C.Primary_Umbrella, dbo.Policy_Information_ALL_POLICIES_C.Branch_Region, 
                      dbo.Policy_Information_ALL_POLICIES_C.Primary_Producer
' 
GO
