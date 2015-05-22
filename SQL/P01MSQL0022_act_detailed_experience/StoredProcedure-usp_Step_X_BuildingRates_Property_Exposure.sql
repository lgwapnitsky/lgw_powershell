IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_X_BuildingRates_Property_Exposure]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_X_BuildingRates_Property_Exposure]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_X_BuildingRates_Property_Exposure]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'











CREATE procedure [dbo].[usp_Step_X_BuildingRates_Property_Exposure] as


update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[BuildingRates_Property_Exposure_work]'') AND type in (N''U''))
DROP TABLE [dbo].[BuildingRates_Property_Exposure_work]

CREATE TABLE [dbo].[BuildingRates_Property_Exposure_work](
      [Policy_Number] [varchar](20) NULL,
      [Location] [smallint] NOT NULL,
      [Building] [smallint] NOT NULL,
      [State] [char](2) NULL,
      [ZIP] [char](5) NULL,
      [Territory] [int] NULL,
      [Class_Code] [varchar](6) NULL,
      [AB_BG2_Exposure] [decimal](15, 2) NULL,
      [AB_BG2_Construction_Code] [smallint] NULL,
      [AB_BG2_Protection_Class] [smallint] NULL,
      [AB_BG2_AQS_Premium] [float] NULL,
      [AB_BG2_Deductible] [varchar](12) NULL,
      [AB_SCoL_Exposure] [decimal](15, 2) NULL,
      [AB_SCoL_AQS_Premium] [float] NULL,
      [FB_Exposure] [decimal](15, 2) NULL,
      [FB_Construction_Code] [smallint] NULL,
      [FB_Protection_Class] [smallint] NULL,
      [FB_AQS_Premium] [float] NULL,
      [FB_Deductible] [varchar](12) NULL,
      [UCAB_Exposure] [decimal](15, 2) NULL,
      [UCAB_Construction_Code] [smallint] NULL,
      [UCAB_Protection_Class] [smallint] NULL,
      [UCAB_AQS_Premium] [float] NULL,
      [UCAB_Deductible] [varchar](12) NULL,
      [AC_BG2_Exposure] [decimal](15, 2) NULL,
      [AC_BG2_AQS_Premium] [float] NULL,
      [AC_BG2_Deductible] [varchar](12) NULL,
      [AC_SCoL_Exposure] [decimal](15, 2) NULL,
      [AC_SCoL_AQS_Premium] [float] NULL,
      [FC_Exposure] [decimal](15, 2) NULL,
      [FC_Construction_Code] [smallint] NULL,
      [FC_Protection_Class] [smallint] NULL,
      [FC_AQS_Premium] [float] NULL,
      [FC_Deductible] [varchar](12) NULL,
      [UCAC_Exposure] [decimal](15, 2) NULL,
      [UCAC_Construction_Code] [smallint] NULL,
      [UCAC_Protection_Class] [smallint] NULL,
      [UCAC_AQS_Premium] [float] NULL,
      [UCAC_Deductible] [varchar](12) NULL,
      [AEE_Exposure] [decimal](15, 2) NULL,
      [AI_Exposure] [decimal](15, 2) NULL,
      [AI_AQS_Premium] [float] NULL,
      [AI_Deductible] [varchar](12) NULL,
      [FEE_Exposure] [decimal](15, 2) NULL,
      [FI_Exposure] [decimal](15, 2) NULL,
      [FI_AQS_Premium] [float] NULL,
      [FI_Deductible] [varchar](12) NULL,
      [UCAE_Exposure] [decimal](15, 2) NULL,
      [UCAI_Exposure] [decimal](15, 2) NULL,
      [UCAI_AQS_Premium] [float] NULL,
      [UCAI_Deductible] [varchar](12) NULL,      
      [FA_Building_Exposure] [float] NULL,
      [FA_Contents_Exposure] [float] NULL,
      [FA_Business_Interuption_Exposure] [float] NULL,
      [FA_Extra_Expense_Exposure] [float] NULL,
      [FA_Deductible] [int] NULL,
      [Address] [varchar](200) NULL,
      [Prior_Policy_Number] [varchar](20) NULL,
      [TIV] [decimal](15, 2) NULL,
      [Inforce_TIV] [float] NULL,
      [Prior_TIV] [decimal](15, 2) NULL,
      [Change_in_TIV] [decimal](15, 2) NULL,
      [Construction_Code] [int] NULL,
      [Protection_Class] [int] NULL,
      [constr_Code_1_Exposure] [float] NULL,
      [constr_Code_2_Exposure] [float] NULL,
      [constr_Code_3_Exposure] [float] NULL,
      [constr_Code_4_Exposure] [float] NULL,
      [constr_Code_5_Exposure] [float] NULL,
      [constr_Code_6_Exposure] [float] NULL,
      [constr_Code_7_Exposure] [float] NULL,
      [constr_Code_8_Exposure] [float] NULL,
      [constr_Code_9_Exposure] [float] NULL,
      [constr_Code_10_Exposure] [float] NULL,
      [protect_class_1_Exposure] [float] NULL,
      [protect_class_2_Exposure] [float] NULL,
      [protect_class_3_Exposure] [float] NULL,
      [protect_class_4_Exposure] [float] NULL,
      [protect_class_5_Exposure] [float] NULL,
      [protect_class_6_Exposure] [float] NULL,
      [protect_class_7_Exposure] [float] NULL,
      [protect_class_8_Exposure] [float] NULL,
      [protect_class_9_Exposure] [float] NULL,
      [protect_class_10_Exposure] [float] NULL,
      [Policy_ID] [int] NULL,
      [UC] [varchar](6) NULL,
      [City] [varchar](30) NULL,
      [County] [varchar](25) NULL,
      [Product] [varchar](2) NULL,
      [Wind] [varchar](8) NULL,
      [Wind_Deductible] [varchar](6) NULL,
      [Hurricane_Deductible] [varchar](6) NULL,
      [Tier] [tinyint] NULL,
      [Distance_to_Shore] [float] NULL,
      [Distance_to_Shore_Range] [varchar](22) NULL,
      [Hurricane_Map_Legend] [varchar](16) NULL,
      [Wind_Map_Legend] [varchar](55) NULL,
      [Hail_Storm_Frequency_Range] [varchar](35) NULL,
      [Wildfire_Tier] [varchar](32) NULL,
      [Implied_Rate] [float] NULL,
      [EQ_Premium] [float] NULL,
      [Flood_Premium] [int] NULL,
      [Terrorism_Premium] [int] NULL,
      [Population_Density_Zone] [varchar](15) NULL,
      [Population_Density_Zone_Metro_Exposure] [float] NULL,
      [Population_Density_Zone_Urban_Exposure] [float] NULL,
      [Population_Density_Zone_Suburban_Exposure] [float] NULL,
      [Population_Density_Zone_SemiSuburban_Exposure] [float] NULL,
      [Population_Density_Zone_Rural_Exposure] [float] NULL,
      [ZIP_Hail_Frequency] [varchar](23) NULL,
      [Hail_A_Exposure] [float] NULL,
      [Hail_B_Exposure] [float] NULL,
      [Hail_C_Exposure] [float] NULL,
      [Hail_D_Exposure] [float] NULL,
      [Hail_E_Exposure] [float] NULL,
      [Hail_F_Exposure] [float] NULL,
      [Hail_G_Exposure] [float] NULL,
      [Hail_H_Exposure] [float] NULL,
      [MinUCRate] [float] NULL,
      [MaxUCRate] [float] NULL,
      [MinUCPrem] [float] NULL,
      [MaxUCPrem] [float] NULL
) ON [PRIMARY]
 

INSERT INTO BuildingRates_Property_Exposure_work
(Policy_Number, Location, Building, State, ZIP, Territory, Class_Code)
select 
DISTINCT
PolicyNumber,
AQSLocationSequence as Location,
AQSBuildingSequence as Building,
PremiumState as State,
LocationZip as ZIP,
Territory,
ClassCode from PriceMonitorSystem..PriceMonitorBaseDataPRP
where 
SnapShotType=''E''
and CoverageCode in (''FB'',''FC'',''FI'',''FE'',''AB'',''AC'',''AI'',''AE'')
UNION ALL
select 
DISTINCT
PolicyNumber,
AQSLocationSequence as Location,
AQSBuildingSequence as Building,
PremiumState as State,
LocationZip as ZIP,
Territory,
ClassCode 
from PriceMonitorSystem..PriceMonitorBaseDataUC
where 
SnapShotType=''E''
and CoverageCode in (''UCAB'',''UCAC'',''UCAE'',''UCAI'')


select 
PolicyNumber,
CoverageCode, 
PremiumState,
AQSLocationSequence,
AQSBuildingSequence,
LocationZip,
Territory,
ClassCode,
case when coveragecode in (''AB'',''AC'') then PerilDescription else NULL end as PerilDescription,
SUM(Exposure) as Exposure,
MAX(ConstructionCode) as ConstructionCode,
MAX(ProtectionClass) as ProtectionClass,
SUM(Premium) as Premium,
MAX(case when Deductible not LIKE ''%H%'' and Deductible not like ''%STM%'' then Deductible else null end) as Deductible
into #AQSInfo
from PriceMonitorSystem.dbo.PriceMonitorBaseDataPRP
where SnapShotType=''E''
group by 
PolicyNumber,
CoverageCode, 
PremiumState,
AQSLocationSequence,
AQSBuildingSequence,
case when coveragecode in (''AB'',''AC'') then PerilDescription else NULL end,
PremiumState,
LocationZip,
Territory,
ClassCode


select 
PolicyNumber,
CoverageCode, 
PremiumState,
AQSLocationSequence,
AQSBuildingSequence,
LocationZip,
Territory,
ClassCode,
SUM(Exposure) as Exposure,
MAX(ConstructionCode) as ConstructionCode,
MAX(ProtectionClass) as ProtectionClass,
SUM(Premium) as Premium,
MAX(case when Deductible not LIKE ''%H%'' and Deductible not like ''%STM%'' then Deductible else null end) as Deductible
into #AQSInfo_UC
from PriceMonitorSystem.dbo.PriceMonitorBaseDataUC
where SnapShotType=''E''
group by 
PolicyNumber,
CoverageCode, 
PremiumState,
AQSLocationSequence,
AQSBuildingSequence,
PremiumState,
LocationZip,
Territory,
ClassCode


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
AB_BG2_Exposure = AQS_Info.Exposure,
AB_BG2_Construction_Code = AQS_Info.ConstructionCode,
AB_BG2_Protection_Class = AQS_Info.ProtectionClass,
AB_BG2_AQS_Premium = AQS_Info.Premium,
AB_BG2_Deductible = AQS_Info.Deductible
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''AB''
and AQS_Info.PerilDescription=''GROUP II''
 
 
 


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
AB_SCoL_Exposure = AQS_Info.Exposure,
AB_SCoL_AQS_Premium = AQS_Info.Premium
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''AB''
and AQS_Info.PerilDescription=''SPECIAL''


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
FB_Exposure = AQS_Info.Exposure,
FB_Construction_Code = AQS_Info.ConstructionCode,
FB_Protection_Class = AQS_Info.ProtectionClass,
FB_AQS_Premium = AQS_Info.Premium,
FB_Deductible = AQS_Info.Deductible
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''FB''

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
UCAB_Exposure = AQS_Info.Exposure,
UCAB_Construction_Code = AQS_Info.ConstructionCode,
UCAB_Protection_Class = AQS_Info.ProtectionClass,
UCAB_AQS_Premium = AQS_Info.Premium,
UCAB_Deductible = AQS_Info.Deductible
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo_UC AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''UCAB''


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
AC_BG2_Exposure = AQS_Info.Exposure,
AC_BG2_AQS_Premium = AQS_Info.Premium,
AC_BG2_Deductible = AQS_Info.Deductible
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''AC''
and AQS_Info.PerilDescription=''GROUP II''



UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
AC_SCoL_Exposure = AQS_Info.Exposure,
AC_SCoL_AQS_Premium = AQS_Info.Premium
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''AC''
and AQS_Info.PerilDescription=''SPECIAL''



UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
FC_Exposure = AQS_Info.Exposure,
FC_Construction_Code = AQS_Info.ConstructionCode,
FC_Protection_Class = AQS_Info.ProtectionClass,
FC_AQS_Premium = AQS_Info.Premium,
FC_Deductible = AQS_Info.Deductible
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''FC''


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
UCAC_Exposure = AQS_Info.Exposure,
UCAC_Construction_Code = AQS_Info.ConstructionCode,
UCAC_Protection_Class = AQS_Info.ProtectionClass,
UCAC_AQS_Premium = AQS_Info.Premium,
UCAC_Deductible = AQS_Info.Deductible
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo_UC AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''UCAC''


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
AI_Exposure = Exposure,
AI_AQS_Premium =  AQS_Info.Premium,
AI_Deductible =  AQS_Info.Deductible
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''AI''


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
AEE_Exposure = Exposure
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''AE''



UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
FI_Exposure = Exposure,
FI_AQS_Premium =  AQS_Info.Premium,
FI_Deductible =  AQS_Info.Deductible
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''FI''


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
FEE_Exposure = Exposure
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''FE''


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
UCAI_Exposure = Exposure,
UCAI_AQS_Premium =  AQS_Info.Premium,
UCAI_Deductible =  AQS_Info.Deductible
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo_UC AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''UCAI''


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
UCAE_Exposure = Exposure
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
JOIN
#AQSInfo AQS_Info
ON AQS_Info.PolicyNumber = Exposure.Policy_number
and AQS_Info.AQSLocationSequence = Exposure.location
and AQS_Info.AQSBuildingSequence = Exposure.building 
and AQS_Info.PremiumState=Exposure.State
and isnull(AQS_Info.LocationZip,''x'')=isnull(Exposure.ZIP,''x'')
and AQS_Info.Territory=Exposure.Territory
and AQS_Info.ClassCode=Exposure.Class_Code
and AQS_Info.CoverageCode= ''UCAE''



UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
FA_Building_Exposure = (
      SELECT dbo.max_list(
            AB_BG2_Exposure,
            AB_SCoL_Exposure,
            FB_Exposure,
            UCAB_Exposure,
            NULL,NULL,NULL,NULL,NULL)),
FA_Contents_Exposure = (
      SELECT dbo.max_list(
            AC_BG2_Exposure,
            AC_SCoL_Exposure,
            FC_Exposure,
            UCAC_Exposure,
            NULL,NULL,NULL,NULL,NULL)),
FA_Business_Interuption_Exposure = (
      SELECT dbo.max_list(
            AI_Exposure,
            FI_Exposure,
            UCAI_Exposure,NULL,NULL,NULL,NULL,NULL,NULL)),
FA_Extra_Expense_Exposure = (
      SELECT dbo.max_list(
            AEE_Exposure,
            FEE_Exposure,
            UCAE_Exposure,NULL,NULL,NULL,NULL,NULL,NULL)),
FA_Deductible = (
      SELECT dbo.max_list(
            isnull(convert("int",AB_BG2_Deductible),0),
            isnull(convert("int",FB_Deductible),0),
            isnull(convert("int",UCAB_Deductible),0),
            isnull(convert("int",AC_BG2_Deductible),0),
            isnull(convert("int",FC_Deductible),0),
            isnull(convert("int",UCAC_Deductible),0),
            NULL,NULL,NULL))
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
Address = Inf.Address,
Inforce_TIV = Inf.TIV,
Prior_TIV = Inf.Prior_Limit,
Change_in_TIV = Inf.TIV_Percent_Change
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure
INNER JOIN Act_Exposure_Mgt.dbo.ExposureUpdate_Management_Reporting Inf
ON Inf.Policy_number = Exposure.policy_number
and Inf.Location = Exposure.Location
and Inf.Building = Exposure.Building

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
Prior_Policy_Number = (
      SELECT DISTINCT (Pol.prevpolicynumber)
      FROM AccessPHLYEOM.dbo.policy Pol
      WHERE Pol.Policynumber = Exposure.policy_number),
TIV = (
      isnull(Exposure.FA_Extra_Expense_Exposure,0)          
      + isnull(Exposure.FA_Business_Interuption_Exposure,0)       
      + isnull(Exposure.FA_Contents_Exposure,0)
      + isnull(Exposure.FA_Building_Exposure,0))
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
Construction_Code = (
      CASE  
      WHEN UCAB_Construction_Code is not null THEN UCAB_Construction_Code
      WHEN FB_Construction_Code is not null THEN FB_Construction_Code
      WHEN AB_BG2_Construction_Code is not null THEN AB_BG2_Construction_Code
      WHEN FC_Construction_Code is not null THEN FC_Construction_Code
      ELSE UCAC_Construction_Code
      END),
Protection_Class = (
      CASE  
      WHEN UCAB_Protection_Class is not null THEN UCAB_Protection_Class
      WHEN FB_Protection_Class is not null THEN FB_Protection_Class
      WHEN AB_BG2_Protection_Class is not null THEN AB_BG2_Protection_Class
      WHEN FC_Protection_Class is not null THEN FC_Protection_Class
      ELSE UCAC_Protection_Class
      END)
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Exposure

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET 
constr_Code_1_Exposure = (CASE WHEN Construction_Code = 1 THEN TIV ELSE 0.0 END),
constr_Code_2_Exposure = (CASE WHEN Construction_Code = 2 THEN TIV ELSE 0.0 END),
constr_Code_3_Exposure = (CASE WHEN Construction_Code = 3 THEN TIV ELSE 0.0 END),
constr_Code_4_Exposure = (CASE WHEN Construction_Code = 4 THEN TIV ELSE 0.0 END),
constr_Code_5_Exposure = (CASE WHEN Construction_Code = 5 THEN TIV ELSE 0.0 END),
constr_Code_6_Exposure = (CASE WHEN Construction_Code = 6 THEN TIV ELSE 0.0 END),
constr_Code_7_Exposure = (CASE WHEN Construction_Code = 7 THEN TIV ELSE 0.0 END),
constr_Code_8_Exposure = (CASE WHEN Construction_Code = 8 THEN TIV ELSE 0.0 END),
constr_Code_9_Exposure = (CASE WHEN Construction_Code = 9 THEN TIV ELSE 0.0 END),
constr_Code_10_Exposure = (CASE WHEN Construction_Code = 10 THEN TIV ELSE 0.0 END)
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work PS 

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET 
Protect_Class_1_Exposure = (CASE WHEN Protection_Class = 1 THEN TIV ELSE 0.0 END),
Protect_Class_2_Exposure = (CASE WHEN Protection_Class = 2 THEN TIV ELSE 0.0 END),
Protect_Class_3_Exposure = (CASE WHEN Protection_Class = 3 THEN TIV ELSE 0.0 END),
Protect_Class_4_Exposure = (CASE WHEN Protection_Class = 4 THEN TIV ELSE 0.0 END),
Protect_Class_5_Exposure = (CASE WHEN Protection_Class = 5 THEN TIV ELSE 0.0 END),
Protect_Class_6_Exposure = (CASE WHEN Protection_Class = 6 THEN TIV ELSE 0.0 END),
Protect_Class_7_Exposure = (CASE WHEN Protection_Class = 7 THEN TIV ELSE 0.0 END),
Protect_Class_8_Exposure = (CASE WHEN Protection_Class = 8 THEN TIV ELSE 0.0 END),
Protect_Class_9_Exposure = (CASE WHEN Protection_Class = 9 THEN TIV ELSE 0.0 END),
Protect_Class_10_Exposure = (CASE WHEN Protection_Class = 10 THEN TIV ELSE 0.0 END)
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work PS 

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET Policy_ID = (isnull((
      SELECT DISTINCT MAX(pp.policyid)
      FROM PI_AQS_Policy_Prod.dbo.polpolmfl pp
      WHERE pp.lpolnum = t2.policy_number
      and pp.nexpnum=0),
      isnull((
            SELECT DISTINCT MAX(pol.kstokey)
            FROM PICPFN01.aqs.mssnm1polpol pol  
            WHERE pol.lpolnum=t2.policy_number
            and pol.nexpnum=0)
      ,'''')
))
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work t2

--Uses PolicyID to get ZIP code FROM AQS
UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET ZIP = AQS.LZIP
FROM PI_AQS_Policy_Prod.dbo.POLLocationMFL AQS,
Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work BPE
WHERE AQS.policyid = BPE.policy_id
and AQS.nlocnum = BPE.Location
and AQS.nbldnum = BPE.Building
and AQS.nexpnum = 0

--The ZIP code lookup FROM above is incomplete, so this goes back in time and gets remaining ZIPs FROM property databases.
UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET 
Address = CASE WHEN BPE.Address IS NULL THEN PG.Address ELSE BPE.Address END,
ZIP = CASE WHEN BPE.ZIP IS NULL THEN PG.ZIP ELSE BPE.ZIP END,
City = PG.City,
County = PG.County,
Territory = CASE WHEN BPE.Territory IS NULL and ISNUMERIC(PG.Territory)=1 THEN PG.Territory ELSE BPE.Territory END,
Product = PG.Product,
Class_Code = CASE WHEN BPE.Class_Code IS NULL THEN PG.Class_Code ELSE BPE.Class_Code END,
Wind = PG.Wind,
Wind_Deductible = PG.Wind_Deductible,
Hurricane_Deductible = PG.Hurricane_Deductible,
Tier = PG.Tier,
Distance_to_Shore = PG.Distance_to_Shore,
Distance_to_Shore_Range = PG.Distance_to_Shore_Range,
Hurricane_Map_Legend = PG.Hurricane_Map_Legend,
Wind_Map_Legend = PG.Wind_Map_Legend,
Hail_Storm_Frequency_Range = PG.Hail_Storm_Frequency_Range,
Wildfire_Tier = PG.Wildfire_Tier,
Implied_Rate = PG.Implied_Rate,
EQ_Premium = PG.EQ_Premium,
Flood_Premium = PG.Flood_Premium,
Terrorism_Premium = PG.Terrorism_Premium,
UC = PG.UC
FROM Act_Exposure_Mgt.dbo.ExposureUpdate_Management_Reporting_History PG,
Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work BPE
WHERE PG.Policy_Number = BPE.Policy_Number
and PG.Location = BPE.Location
and PG.Building = BPE.Building

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET ZIP = CASE
      WHEN left(ZIP,1) = ''.'' THEN ''0''+right(ZIP,4)
      ELSE ZIP END
      
UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
Population_Density_Zone = PDZ.Population_Density_Zone
FROM Act_Definitions.dbo.Population_Density_by_ZIP PDZ,
Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work BPE
WHERE ISNUMERIC(BPE.ZIP) = 1
and CAST(BPE.ZIP AS int) = PDZ.ZIP

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
Population_Density_Zone_Metro_Exposure = (CASE WHEN Population_Density_Zone = ''Metro'' THEN TIV ELSE 0.0 END),
Population_Density_Zone_Urban_Exposure = (CASE WHEN Population_Density_Zone = ''Urban'' THEN TIV ELSE 0.0 END),
Population_Density_Zone_Suburban_Exposure = (CASE WHEN Population_Density_Zone = ''Suburban'' THEN TIV ELSE 0.0 END),
Population_Density_Zone_SemiSuburban_Exposure = (CASE WHEN Population_Density_Zone = ''Semi Suburban'' THEN TIV ELSE 0.0 END),
Population_Density_Zone_Rural_Exposure = (CASE WHEN Population_Density_Zone = ''Rural'' THEN TIV ELSE 0.0 END)

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
ZIP_Hail_Frequency = isnull ((
      SELECT DISTINCT a.Hail_Storm_Frequency_Range FROM (
            SELECT BR.zip, cbg.Hail_Storm_Frequency_Range
            FROM Act_Exposure_Mgt.dbo.NOAA_Hail_Events_CountByGridtoZIP_1998_2009 CBG,
            Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work BR
            WHERE BR.ZIP = CBG.ZIP
            --this corrects for the single duplicated zip code in the hail events table without excluding other rows with mismatching states
            and case when br.zip=''57724'' then br.state else CBG.State end=CBG.State
      )a
      WHERE Prop.zip = a.zip),''H: < 0.1 per year'')
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work Prop

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
Hail_A_Exposure = (CASE WHEN ZIP_Hail_Frequency = ''A: 5.0 + per year'' THEN TIV ELSE 0.0 END),
Hail_B_Exposure = (CASE WHEN ZIP_Hail_Frequency = ''B: [2.75, 5.0) per year'' THEN TIV ELSE 0.0 END),
Hail_C_Exposure = (CASE WHEN ZIP_Hail_Frequency = ''C: [2.0, 2.75) per year'' THEN TIV ELSE 0.0 END),
Hail_D_Exposure = (CASE WHEN ZIP_Hail_Frequency = ''D: [1.5, 2.0) per year'' THEN TIV ELSE 0.0 END),
Hail_E_Exposure = (CASE WHEN ZIP_Hail_Frequency = ''E: [1.0, 1.5) per year'' THEN TIV ELSE 0.0 END),
Hail_F_Exposure = (CASE WHEN ZIP_Hail_Frequency = ''F: [0.5, 1.0) per year'' THEN TIV ELSE 0.0 END),
Hail_G_Exposure = (CASE WHEN ZIP_Hail_Frequency = ''G: [0.1, 0.5) per year'' THEN TIV ELSE 0.0 END),
Hail_H_Exposure = (CASE WHEN ZIP_Hail_Frequency = ''H: < 0.1 per year'' THEN TIV ELSE 0.0 END)


UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
MinUCRate = C.Low,
MaxUCRate = C.High
FROM Act_Detailed_Experience.dbo.UC_Rating_Matrix_Construction C,
--Act_Detailed_Experience.dbo.UC_Rating_Matrix_Deductible D,
--Act_Detailed_Experience.dbo.UC_Rating_Matrix_Protection P,
Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work B
WHERE B.UC = ''UC''
and C.Product = B.Product
and C.State = B.State
and C.Wind = CASE 
      WHEN B.State = ''FL'' and B.Wind = ''Excluded'' THEN ''Excluded''
      WHEN B.State = ''FL'' THEN ''Included''
      ELSE ''All'' END
and C.Tier = CASE
      WHEN B.State = ''FL'' and B.Tier = 1 and B.Wind != ''Excluded'' THEN ''1''
      WHEN B.State = ''FL'' and (B.Tier > 1 or B.Tier is null) and B.Wind != ''Excluded'' THEN ''Other''
      ELSE ''All'' END
and C.[UC Construction] = CASE
      WHEN B.Construction_Code = 1 THEN ''Frame''
      WHEN B.Construction_Code = 2 THEN ''Joisted Masonry''
      WHEN B.Construction_Code = 3 THEN ''Non-Combustible''
      WHEN B.Construction_Code = 4 THEN ''Masonry Non-Combustible''
      WHEN B.Construction_Code = 5 THEN ''Modified Fire Resistive''
      WHEN B.Construction_Code = 6 THEN ''Fire Resistive''
      ELSE ''Mixed Construction''
      END

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
MinUCRate = MinUCRate * CASE WHEN ltrim(rtrim(B.Wind_Deductible)) not in ('''',''0'',''NONE'') and 
            B.Wind_Deductible is not null and D.Factor > .9 THEN .9 ELSE D.Factor END,
MaxUCRate = MaxUCRate * CASE WHEN ltrim(rtrim(B.Wind_Deductible)) not in ('''',''0'',''NONE'') and
            B.Wind_Deductible is not null and D.Factor > .9 THEN .9 ELSE D.Factor END
FROM --Act_Detailed_Experience.dbo.UC_Rating_Matrix_Construction C,
Act_Detailed_Experience.dbo.UC_Rating_Matrix_Deductible D,
--Act_Detailed_Experience.dbo.UC_Rating_Matrix_Protection P,
Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work B
WHERE B.UC = ''UC''
and D.Product = B.Product
and D.Deductible = CASE
      WHEN convert("int",ltrim(rtrim(B.FA_Deductible))) < 1000 THEN 1000
      WHEN convert("int",ltrim(rtrim(B.FA_Deductible))) > 25000 THEN 25000
      ELSE convert("int",ltrim(rtrim(B.FA_Deductible)))
      END

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
MinUCRate = MinUCRate * CASE
      WHEN B.Construction_Code in (1,2,3) THEN P.[Frame, JM, NC Factor]
      ELSE P.[MNC, MFR, FR Factor]
      END,
MaxUCRate = MaxUCRate * CASE
      WHEN B.Construction_Code in (1,2,3) THEN P.[Frame, JM, NC Factor]
      ELSE P.[MNC, MFR, FR Factor]
      END
FROM --Act_Detailed_Experience.dbo.UC_Rating_Matrix_Construction C,
--Act_Detailed_Experience.dbo.UC_Rating_Matrix_Deductible D,
Act_Detailed_Experience.dbo.UC_Rating_Matrix_Protection P,
Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work B
WHERE B.UC = ''UC''
and P.Product = B.Product
and P.[Protection Class] = B.Protection_Class

UPDATE Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
SET
MinUCPrem = MinUCRate * TIV / 100,
MaxUCPrem = MaxUCRate * TIV / 100
FROM Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure_work
 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[BuildingRates_Property_Exposure]'') AND type in (N''U''))
DROP TABLE [dbo].[BuildingRates_Property_Exposure]

exec sp_rename ''BuildingRates_Property_Exposure_work'',''BuildingRates_Property_Exposure''


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)









' 
END
GO
