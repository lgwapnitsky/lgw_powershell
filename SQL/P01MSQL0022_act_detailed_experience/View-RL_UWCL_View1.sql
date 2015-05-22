IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RL_UWCL_View1]'))
DROP VIEW [dbo].[RL_UWCL_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RL_UWCL_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.RL_UWCL_View1
AS
SELECT     statecode, Coverage_Reporting_group, Fiscal_AY_Year, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) 
                      AS currentearnedpremium, SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Pool_YN, Pool_Num, Hired_Exposure_YN, Life_Safety_Requirements_YN, Tall_Buildings_Num, Coastal_Wind_Guides_YN, 
                      Special_Events_YN, Asbestos_Lead_YN, Dorms_YN, Hail_YN, Diving_Board_YN, Non_Owned_YN, Volunteers_YN, Locations_Num, 
                      UMUIM_State_Issues_YN, Athletic_Participants_YN, Builders_Risk_YN, Camps_YN, Abuse_Molestation_YN, Umbrella_YN, Mold_YN, Limits_ITV_YN, 
                      Tall_Buildings_Range, Pool_Range, Locations_Range, SUM(Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      Church_Members_Range, Clergy_Range, Workshops_YN, WomensShelters_YN, Weatherization_YN, RiskMeterCheck_YN, VacantLand_YN, 
                      VacantBuildings_YN, StainedGlass_YN, RentalProp_YN, ChurchMembers_Num, MentallyIll_YN, MealsOnWheels_YN, LiquorLiability_YN, 
                      DriversList_YN, DriversUnder25Transport_YN, IndependentContractors_YN, HomelessShelters_YN, GroupHomes_YN, FosterCarePlacement_YN, 
                      ForProfit_YN, DrugAlcoholCenter_YN, DriversUnder21_YN, VehicleSeatCapacity_YN, FullVINNum_YN, DayCare_YN, ChurchTrips_YN, 
                      CafeteriaRestaurant_YN, MVRChecks_YN, Adoption_YN, [4YHardCopyLossRuns_YN], Clergy_Num, Playground_YN, Written_Premium_Range, 
                      accountnumber, Account_Name_Display, Account_Active
FROM         dbo.RL_premium_summary
GROUP BY statecode, Coverage_Reporting_group, Fiscal_AY_Year, Pool_YN, Pool_Num, Hired_Exposure_YN, Life_Safety_Requirements_YN, 
                      Tall_Buildings_Num, Coastal_Wind_Guides_YN, Special_Events_YN, Asbestos_Lead_YN, Dorms_YN, Hail_YN, Diving_Board_YN, Non_Owned_YN, 
                      Volunteers_YN, Locations_Num, UMUIM_State_Issues_YN, Athletic_Participants_YN, Builders_Risk_YN, Camps_YN, Abuse_Molestation_YN, 
                      Umbrella_YN, Mold_YN, Limits_ITV_YN, Tall_Buildings_Range, Pool_Range, Locations_Range, Church_Members_Range, Clergy_Range, 
                      Workshops_YN, WomensShelters_YN, Weatherization_YN, RiskMeterCheck_YN, VacantLand_YN, VacantBuildings_YN, StainedGlass_YN, 
                      RentalProp_YN, ChurchMembers_Num, MentallyIll_YN, MealsOnWheels_YN, LiquorLiability_YN, DriversList_YN, DriversUnder25Transport_YN, 
                      IndependentContractors_YN, HomelessShelters_YN, GroupHomes_YN, FosterCarePlacement_YN, ForProfit_YN, DrugAlcoholCenter_YN, 
                      DriversUnder21_YN, VehicleSeatCapacity_YN, FullVINNum_YN, DayCare_YN, ChurchTrips_YN, CafeteriaRestaurant_YN, MVRChecks_YN, 
                      Adoption_YN, [4YHardCopyLossRuns_YN], Clergy_Num, Playground_YN, Written_Premium_Range, accountnumber, Account_Name_Display, 
                      Account_Active
' 
GO
