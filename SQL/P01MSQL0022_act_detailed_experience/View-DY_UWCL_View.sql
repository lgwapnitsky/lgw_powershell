IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DY_UWCL_View]'))
DROP VIEW [dbo].[DY_UWCL_View]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DY_UWCL_View]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.DY_UWCL_View
AS
SELECT     statecode, Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Account_Name, Pool_YN, Pool_Num, Hired_Exposure_YN, Life_Safety_Requirements_YN, Coastal_Wind_Guides_YN, 
                      Asbestos_Lead_YN, Diving_Board_YN, Non_Owned_YN, Volunteers_YN, Locations_Num, UMUIM_State_Issues_YN, Camps_YN, 
                      Abuse_Molestation_YN, Umbrella_YN, Limits_ITV_YN, Playground_Equip_YN, Pool_Range, Locations_Range, 
                      SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, Commission_pct, Commission_dollars, Commission_Premiums
FROM         dbo.DY_premium_summary
GROUP BY statecode, Coverage_Reporting_group, Fiscal_AY_Year, Account_Name, Pool_YN, Pool_Num, Hired_Exposure_YN, Life_Safety_Requirements_YN, 
                      Coastal_Wind_Guides_YN, Asbestos_Lead_YN, Diving_Board_YN, Non_Owned_YN, Volunteers_YN, Locations_Num, UMUIM_State_Issues_YN, 
                      Camps_YN, Abuse_Molestation_YN, Umbrella_YN, Limits_ITV_YN, Playground_Equip_YN, Pool_Range, Locations_Range, Commission_pct, 
                      Commission_dollars, Commission_Premiums
' 
GO
