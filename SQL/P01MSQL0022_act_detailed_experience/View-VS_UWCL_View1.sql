IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_UWCL_View1]'))
DROP VIEW [dbo].[VS_UWCL_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_UWCL_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.VS_UWCL_View1
AS
SELECT     statecode, Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Account_Name, Pool_YN, Pool_Num, Hired_Exposure_YN, Life_Safety_Requirements_YN, Coastal_Wind_Guides_YN, 
                      Asbestos_Lead_YN, Diving_Board_YN, Non_Owned_YN, Volunteers_YN, Locations_Num, UMUIM_State_Issues_YN, Camps_YN, 
                      Abuse_Molestation_YN, Umbrella_YN, Limits_ITV_YN, Pool_Range, Locations_Range, SUM(Policy_count_Reporting_Coverage) 
                      AS Policy_count_Reporting_Coverage, Endorsement_VS_001, Charter_YN, Auto_Driver_Training_Commercial_YN, 
                      Auto_Driver_Training_Educational_YN, Tall_Buildings_Range, Mold_YN, Stadiums_YN, Builders_Risk_YN, Athletic_Participants_YN, PIIC_Boiler_YN, 
                      Hail_YN, Dorms_YN, Martial_Arts_YN, Special_Events_YN, Tall_Buildings_Num
FROM         dbo.VS_premium_summary
WHERE     (Companycode = ''PH'')
GROUP BY statecode, Coverage_Reporting_group, Fiscal_AY_Year, Account_Name, Pool_YN, Pool_Num, Hired_Exposure_YN, Life_Safety_Requirements_YN, 
                      Coastal_Wind_Guides_YN, Asbestos_Lead_YN, Diving_Board_YN, Non_Owned_YN, Volunteers_YN, Locations_Num, UMUIM_State_Issues_YN, 
                      Camps_YN, Abuse_Molestation_YN, Umbrella_YN, Limits_ITV_YN, Pool_Range, Locations_Range, Endorsement_VS_001, Charter_YN, 
                      Auto_Driver_Training_Commercial_YN, Auto_Driver_Training_Educational_YN, Tall_Buildings_Range, Mold_YN, Stadiums_YN, Builders_Risk_YN, 
                      Athletic_Participants_YN, PIIC_Boiler_YN, Hail_YN, Dorms_YN, Martial_Arts_YN, Special_Events_YN, Tall_Buildings_Num
' 
GO
