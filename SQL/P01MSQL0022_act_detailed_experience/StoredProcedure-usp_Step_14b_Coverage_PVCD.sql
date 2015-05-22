IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14b_Coverage_PVCD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_14b_Coverage_PVCD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14b_Coverage_PVCD]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
















CREATE PROCEDURE [dbo].[usp_Step_14b_Coverage_PVCD] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)

/*Moved later in the process because the columns don''t exist until the Endorsement step runs. */

/***********Step 1a**********/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_PVCD_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.Policy_Information_PVCD_work

CREATE TABLE Act_Detailed_Experience.dbo.Policy_Information_PVCD_work (
	[policynumber] [varchar](15) NULL,
	[companycode] [varchar](2) NULL,
	[Renew_New_Auto] [varchar](50) NULL,
	[First_Policy_Year] [varchar](13) NULL,
	[New_Renew_Tail] [varchar](1) NULL,
	[Branch_Region] [varchar](50) NULL,
	[Written_Premium_Range] [varchar](50) NULL,
	[Primary_Producer] [varchar](100) NULL,
	[Primary_Producer_type] [varchar](50) NULL,
	[PVCD_Amendment_End_Y_N] [varchar](50) NULL,
	[PVCD_Partnership_End_Y_N] [varchar](50) NULL,
	[PVCD_ProPak_Elite72_End_Y_N] [varchar](50) NULL,
	[PVCD_ProPak_Elite73_End_Y_N] [varchar](50) NULL,
	[PVCD_Circumstance_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Professional_Services_End_Y_N] [varchar](50) NULL,
	[PVCD_BullsEye_ProPak_End_Y_N] [varchar](50) NULL,
	[PVCD_Sexual_Abuse_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N] [varchar](50) NULL,
	[PVCD_Amend_of_ExclusionK_End_Y_N] [varchar](50) NULL,
	[PVCD_Amend_of_Severability_Provision_End_Y_N] [varchar](50) NULL,
	[PVCD_Third_Party_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Punitive_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Medical_Malpractice_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Insurance_EO_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Full_Securities_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N] [varchar](50) NULL,
	[PVCD_Bankruptcy_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Shareholder_End_Y_N] [varchar](50) NULL,
	[PVCD_Past_Acts_End_Y_N] [varchar](50) NULL,
	[PVCD_No_Liab_Retent_Waiver_End_Y_N] [varchar](50) NULL,
	[PVCD_Election_ERP_End_Y_N] [varchar](50) NULL,
	[PVCD_Delete_Consent_End_Y_N] [varchar](50) NULL,
	[PVCD_Damages_Only_Retention_End_Y_N] [varchar](50) NULL,
	[PVCD_Idnum_Max] [int] NULL,
	[PVCD_Idnum] [int] NULL,
	[PVCD_PVDO_Limit] [float] NULL,
	[PVCD_PVDO_Alt_Retention] [varchar](50) NULL,
	[PVCD_PVDO_RatingClass] [int] NULL,
	[PVCD_PVDO_Assets] [bigint] NULL,
	[PVCD_PVDO_Assets_Range] [varchar](50) NULL,
	[PVCD_PVEPL_Limit] money NULL,
	[PVCD_PVEPL_Alt_Retention] [varchar](50) NULL,
	[PVCD_PVEPL_RatingClass] [int] NULL,
	[PVCD_PVEPL_Num_of_Employees] [int] NULL,
	[PVCD_Financial_Type] [varchar](50) NULL,
	[PVCD_Business_Type] [varchar](50) NULL,
	[PVCD_PVEPL_Num_of_Employees_Range] [varchar](50) NULL,
	[EPL_Id] [varchar](8) NULL,
	PVCD_PVEPL_ZoneMod float,
    PVCD_PVDO_ZoneMod float,
    PV_Zone float,
    PVCD_State_DO varchar(2),
    PVCD_State_EPL varchar(2),
    PVCD_ZipCode_DO  varchar(5),
    PVCD_ZipCode_EPL varchar(5),
    PVCD_ZoneNum_DO  varchar(1),
    PVCD_ZoneNum_EPL  varchar(1),
    PVCD_County_DO varchar(50),
    PVCD_County_EPL varchar(50) 
	)
	

insert into Act_Detailed_Experience.dbo.Policy_Information_PVCD_work
(policynumber, 
companycode, 
Renew_New_Auto,
First_Policy_Year,
New_Renew_Tail,
Branch_Region, 
	Written_Premium_Range,
	Primary_Producer,
	Primary_Producer_type,
	PVCD_Amendment_End_Y_N,
	PVCD_Partnership_End_Y_N,
	PVCD_ProPak_Elite72_End_Y_N,
	PVCD_ProPak_Elite73_End_Y_N,
	PVCD_Circumstance_Exclusion_End_Y_N,
	PVCD_Professional_Services_End_Y_N,
	PVCD_BullsEye_ProPak_End_Y_N,
    PVCD_Sexual_Abuse_Exclusion_End_Y_N,
    PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N,
	PVCD_Amend_of_ExclusionK_End_Y_N,
	PVCD_Amend_of_Severability_Provision_End_Y_N,
	PVCD_Third_Party_Exclusion_End_Y_N,
	PVCD_Punitive_Exclusion_End_Y_N,
	PVCD_Medical_Malpractice_Exclusion_End_Y_N,
	PVCD_Insurance_EO_Exclusion_End_Y_N,
	PVCD_Full_Securities_Exclusion_End_Y_N,
	PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N,
	PVCD_Bankruptcy_Exclusion_End_Y_N,
	PVCD_Shareholder_End_Y_N,
	PVCD_Past_Acts_End_Y_N,
	PVCD_No_Liab_Retent_Waiver_End_Y_N,
	PVCD_Election_ERP_End_Y_N,
	PVCD_Delete_Consent_End_Y_N,
	PVCD_Damages_Only_Retention_End_Y_N)

select policynumber, 
companycode, 
Renew_New_Auto,
First_Policy_Year,
New_Renew_Tail,
Branch_Region, 
	Written_Premium_Range,
	Primary_Producer,
	Primary_Producer_type,
	PVCD_Amendment_End_Y_N,
	PVCD_Partnership_End_Y_N,
	PVCD_ProPak_Elite72_End_Y_N,
	PVCD_ProPak_Elite73_End_Y_N,
	PVCD_Circumstance_Exclusion_End_Y_N,
	PVCD_Professional_Services_End_Y_N,
	PVCD_BullsEye_ProPak_End_Y_N,
    PVCD_Sexual_Abuse_Exclusion_End_Y_N,
    PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N,
	PVCD_Amend_of_ExclusionK_End_Y_N,
	PVCD_Amend_of_Severability_Provision_End_Y_N,
	PVCD_Third_Party_Exclusion_End_Y_N,
	PVCD_Punitive_Exclusion_End_Y_N,
	PVCD_Medical_Malpractice_Exclusion_End_Y_N,
	PVCD_Insurance_EO_Exclusion_End_Y_N,
	PVCD_Full_Securities_Exclusion_End_Y_N,
	PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N,
	PVCD_Bankruptcy_Exclusion_End_Y_N,
	PVCD_Shareholder_End_Y_N,
	PVCD_Past_Acts_End_Y_N,
	PVCD_No_Liab_Retent_Waiver_End_Y_N,
	PVCD_Election_ERP_End_Y_N,
	PVCD_Delete_Consent_End_Y_N,
	PVCD_Damages_Only_Retention_End_Y_N
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
where Productcode in (''PV'',''CD'')


update Act_Detailed_Experience.dbo.Policy_Information_PVCD_work 
set 

PVCD_Idnum = (
select 
MAX(pt.PathID)
from 
pathnet2.dbo.PATHtransaction pt with (nolock)
join 
pathnet2.dbo.PolicySnapshot pss with (nolock)
ON
pt.TransactionID = pss.TransactionID
WHERE
pss.PolicyNumber=PS.policynumber
and 
pt.CurrentTransactionStatus=''Sold''),

PVCD_Idnum_Max = (
select 
MAX(pt.PathID)
from 
pathnet2.dbo.PATHtransaction pt with (nolock)
join 
pathnet2.dbo.PolicySnapshot pss with (nolock)
ON
pt.TransactionID = pss.TransactionID
WHERE
pss.PolicyNumber=PS.policynumber
and 
pt.CurrentTransactionStatus=''Sold'')

from Act_Detailed_Experience.dbo.Policy_Information_PVCD_work PS

/***********Step 1b**********/




update Act_Detailed_Experience.dbo.Policy_Information_PVCD_work 
set 

PVCD_PVDO_Limit = 
--(isnull(
    (select PM.OccurrenceLimit --float
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	where PS.policynumber = PM.PolicyNumber
	and PM.CoverageCode=''GLBI1''
	and PM.SnapShotType=''E''),
	--(
	--isnull(
	--	(select distinct Path.DO_Limit  --float
	--	from PriceMonitorLegacy.dbo.PATH_GLBI1_PV_DO  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.PVCD_Idnum = Path.idnum),

	--	(select distinct Path.DO_Limit  --float
	--	from PriceMonitorLegacy.dbo.PATH_GLBI1_PV_DO  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.PVCD_Idnum_max = Path.idnum))))),

PVCD_PVDO_Alt_Retention = 
--(isnull(
    (select PM.AltRetention --char
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	where PS.policynumber = PM.PolicyNumber
	and PM.CoverageCode=''GLBI1''
	and PM.SnapShotType=''E''),
	--(
	--isnull(
	--	(select distinct convert("Varchar",convert("int",Path.DO_AltRetention)) --float
	--	from PriceMonitorLegacy.dbo.PATH_GLBI1_PV_DO  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.PVCD_Idnum = Path.idnum),

	--	(select distinct convert("Varchar",convert("int",Path.DO_AltRetention)) --float
	--	from PriceMonitorLegacy.dbo.PATH_GLBI1_PV_DO  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.PVCD_Idnum_max = Path.idnum))))),

PVCD_PVDO_RatingClass =	
--(isnull(
    (select PM.RatingClass --int
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	where PS.policynumber = PM.PolicyNumber
	and PM.CoverageCode=''GLBI1''
	and PM.SnapShotType=''E''),
	--(
	--isnull(
	--(select distinct Path1.DO_RatingClass --int
	--from PriceMonitorLegacy.dbo.PATH_GLBI1_PV_DO  Path1
	--where PS.policynumber = Path1.policynumber
	--and PS.PVCD_Idnum = Path1.idnum),

	--(select distinct Path1.DO_RatingClass --int
	--from PriceMonitorLegacy.dbo.PATH_GLBI1_PV_DO  Path1
	--where PS.policynumber = Path1.policynumber
	--and PS.PVCD_Idnum_max = Path1.idnum))))),

PVCD_PVDO_Assets =	
--(isnull(
    (select PM.Assets --int
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	where PS.policynumber = PM.PolicyNumber
	and PM.CoverageCode=''GLBI1''
	and PM.SnapShotType=''E''),
	--(
	--isnull(
	--(select distinct Path1.DO_Assets --int
	--from PriceMonitorLegacy.dbo.PATH_GLBI1_PV_DO  Path1
	--where PS.policynumber = Path1.policynumber
	--and PS.PVCD_Idnum = Path1.idnum),

	--(select distinct Path1.DO_Assets --int
	--from PriceMonitorLegacy.dbo.PATH_GLBI1_PV_DO  Path1
	--where PS.policynumber = Path1.policynumber
	--and PS.PVCD_Idnum_max = Path1.idnum))))),

PVCD_PVEPL_Limit = cast(
	(select PM.OccurrenceLimit --char
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	where PS.policynumber = PM.PolicyNumber
	and PM.CoverageCode=''GLBI2''
	and PM.SnapShotType=''E'') as money),
	--(
	--isnull(
	--(select distinct convert("Varchar",convert("int",Path.EPL_Limit)) -- float
	--from PriceMonitorLegacy.dbo.PATH_GLBI2_PV_EPL Path
	--where PS.policynumber = Path.policynumber
	--	and PS.PVCD_Idnum = Path.idnum),

	--(select distinct convert("Varchar",convert("int",Path.EPL_Limit)) -- float
	--from PriceMonitorLegacy.dbo.PATH_GLBI2_PV_EPL Path
	--where PS.policynumber = Path.policynumber
	--	and PS.PVCD_Idnum_max = Path.idnum))))) ,

PVCD_PVEPL_Alt_Retention = 
--(isnull( 
    (select PM.AltRetention
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	where PS.policynumber = PM.PolicyNumber
	and PM.CoverageCode=''GLBI2''
	and PM.SnapShotType=''E''),
	--(
	--isnull(
	--(select distinct convert("Varchar",convert("int", Path.EPL_AltRetention))--float
	--from PriceMonitorLegacy.dbo.PATH_GLBI2_PV_EPL Path
	--where PS.policynumber = Path.policynumber
	--	and PS.PVCD_Idnum = Path.idnum),

	--(select distinct convert("Varchar",convert("int", Path.EPL_AltRetention))--float
	--from PriceMonitorLegacy.dbo.PATH_GLBI2_PV_EPL Path
	--where PS.policynumber = Path.policynumber
	--	and PS.PVCD_Idnum_max = Path.idnum))))),

PVCD_PVEPL_RatingClass = 
--(isnull(
    (select PM.RatingClass --int
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	where PS.policynumber = PM.PolicyNumber
	and PM.CoverageCode=''GLBI2''
	and PM.SnapShotType=''E''),
	--(
	--isnull(
	--(select distinct Path2.EPL_RatingClass --int
	--from PriceMonitorLegacy.dbo.PATH_GLBI2_PV_EPL Path2
	--where PS.policynumber = Path2.policynumber
	--and PS.PVCD_Idnum = Path2.idnum),

	--(select distinct Path2.EPL_RatingClass --int
	--from PriceMonitorLegacy.dbo.PATH_GLBI2_PV_EPL Path2
	--where PS.policynumber = Path2.policynumber
	--and PS.PVCD_Idnum_max = Path2.idnum))))),

PVCD_PVEPL_Num_of_Employees = 
--(isnull(
    (select PM.NumberOfEmp --int
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	where PS.policynumber = PM.PolicyNumber
	and PM.CoverageCode=''GLBI2''
	and PM.SnapShotType=''E''),
	--(
	--isnull(
	--(select distinct Path2.EPL_Exposure --int
	--from PriceMonitorLegacy.dbo.PATH_GLBI2_PV_EPL Path2
	--where PS.policynumber = Path2.policynumber
	--and PS.PVCD_Idnum = Path2.idnum),

	--(select distinct Path2.EPL_Exposure --int
	--from PriceMonitorLegacy.dbo.PATH_GLBI2_PV_EPL Path2
	--where PS.policynumber = Path2.policynumber
	--and PS.PVCD_Idnum_max = Path2.idnum))))),

PVCD_Business_Type = 	isnull((select PM.BusinessType
					            from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
					            where PS.policynumber = PM.PolicyNumber
					            and PM.CoverageCode=''GLBI1''
					            and PM.SnapShotType=''E''),
					(select PM.BusinessType
					from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
					where PS.policynumber = PM.PolicyNumber
					and PM.CoverageCode=''GLBI2'' 
					and PM.SnapShotType=''E'')),

PVCD_Financial_Type = 	isnull((select PM.FinancialRiskType
					from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
					            where PS.policynumber = PM.PolicyNumber
					            and PM.CoverageCode=''GLBI1'' 
					            and PM.SnapShotType=''E''),
					(select PM.FinancialRiskType
					from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
					where PS.policynumber = PM.PolicyNumber
					and PM.CoverageCode=''GLBI2'' 
					and PM.SnapShotType=''E'')),
	   
PVCD_PVEPL_ZoneMod=
(select PM.ZoneMod
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	where PS.policynumber = PM.PolicyNumber
	and PM.CoverageCode=''GLBI2'' 
	and PM.SnapShotType=''E'')
,
PVCD_PVDO_ZoneMod=
(select PM.ZoneMod
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	where PS.policynumber = PM.PolicyNumber
	and PM.CoverageCode=''GLBI1''
	and PM.SnapShotType=''E'')
	
from Act_Detailed_Experience.dbo.Policy_Information_PVCD_work PS


/***********Step 2**********/
update Act_Detailed_Experience.dbo.Policy_Information_PVCD_work 
set 

PVCD_PVDO_Assets_range = (case
            when PVCD_Financial_Type = ''Non-Financial'' and PVCD_PVDO_Assets <= 10000000 then ''b: Less than $10M''
            when PVCD_Financial_Type = ''Non-Financial'' and PVCD_PVDO_Assets <= 25000000 then ''c: $10M to $25M''
            when PVCD_Financial_Type = ''Non-Financial'' and PVCD_PVDO_Assets <= 50000000 then ''d: $25M to $50M''
            when PVCD_Financial_Type = ''Non-Financial'' and PVCD_PVDO_Assets <= 100000000 then ''e: $50M to $100M''
            when PVCD_Financial_Type = ''Non-Financial'' and PVCD_PVDO_Assets <= 250000000 then ''f: $100M to $250M''
            when PVCD_Financial_Type = ''Non-Financial'' and PVCD_PVDO_Assets <= 500000000 then ''g: $250M to $500M''
            when PVCD_Financial_Type = ''Non-Financial'' and PVCD_PVDO_Assets > 500000000 then ''h: Greater than $500M''
            when PVCD_Financial_Type = ''Financial'' and PVCD_PVDO_Assets <= 100000000 then ''i: Less than $100M''
            when PVCD_Financial_Type = ''Financial'' and PVCD_PVDO_Assets <= 250000000 then ''j: $100M to $250M''
            when PVCD_Financial_Type = ''Financial'' and PVCD_PVDO_Assets <= 500000000 then ''k: $250M to $500M''
            when PVCD_Financial_Type = ''Financial'' and PVCD_PVDO_Assets <= 1000000000 then ''l: $500M to $1B''
            when PVCD_Financial_Type = ''Financial'' and PVCD_PVDO_Assets <= 2000000000 then ''m: $1B to $2B''
            when PVCD_Financial_Type = ''Financial'' and PVCD_PVDO_Assets <= 3000000000 then ''n: $2B to $3B''
            when PVCD_Financial_Type = ''Financial'' and PVCD_PVDO_Assets <= 5000000000 then ''o: $3B to $5B''
            when PVCD_Financial_Type = ''Financial'' and PVCD_PVDO_Assets > 5000000000 then ''p: Greater than $5B''
            else ''a: No Data''
            end),

PVCD_PVEPL_Num_of_Employees_range = (case
            when PVCD_PVEPL_Num_of_Employees is Null then ''a: No Data''
            when PVCD_PVEPL_Num_of_Employees <= 5 then ''b: Less than 6 Employees''
            when PVCD_PVEPL_Num_of_Employees <= 25 then ''c: 6 to 25 Employees''
            when PVCD_PVEPL_Num_of_Employees <= 50 then ''d: 26 to 50 Employees''
            when PVCD_PVEPL_Num_of_Employees <= 100 then ''e: 51 to 100 Employees''
            when PVCD_PVEPL_Num_of_Employees <= 150 then ''f: 101 to 150 Employees''
            when PVCD_PVEPL_Num_of_Employees <= 200 then ''g: 151 to 200 Employees''
            when PVCD_PVEPL_Num_of_Employees <= 250 then ''h: 201 to 250 Employees''
            when PVCD_PVEPL_Num_of_Employees <= 350 then ''i: 251 to 350 Employees''
            when PVCD_PVEPL_Num_of_Employees <= 450 then ''j: 351 to 450 Employees''
            when PVCD_PVEPL_Num_of_Employees <= 700 then ''k: 451 to 700 Employees''
            when PVCD_PVEPL_Num_of_Employees <= 1000 then ''l: 701 to 1,000 Employees''
            else ''m: Greater than 1,000 Employees''
            end)

from Act_Detailed_Experience.dbo.Policy_Information_PVCD_work PS


/******************************************************************************************/

update Act_Detailed_Experience.dbo.Policy_Information_PVCD_work
set EPL_Id = (case 
	when Act_Detailed_Experience.dbo.Policy_Information_PVCD_work.PVCD_PVDO_Limit is Null or Act_Detailed_Experience.dbo.Policy_Information_PVCD_work.PVCD_PVDO_Limit = 0 then ''Y''
	else ''N''
end)


--Added 4/18/2011 per actuarial request

update Act_Detailed_Experience.dbo.Policy_Information_PVCD_work
set 
PVCD_State_DO = (
      select PM.PremiumState
      from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	  where PS.policynumber = PM.PolicyNumber
	  and PM.CoverageCode=''GLBI1''
	  and PM.SnapShotType=''E''),
PVCD_State_EPL = (
      select PM.PremiumState --char
      from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	  where PS.policynumber = PM.PolicyNumber
	  and PM.CoverageCode=''GLBI2''
	  and PM.SnapShotType=''E'')
from Act_Detailed_Experience.dbo.Policy_Information_PVCD_work PS

update Policy_Information_PVCD_work set
PVCD_ZipCode_DO=
(select PM.InsurableZIP
      from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	  where PS.policynumber = PM.PolicyNumber
	  and PM.CoverageCode=''GLBI1''
	  and PM.SnapShotType=''E'')
,
PVCD_ZipCode_EPL=
(select PM.InsurableZIP
      from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	  where PS.policynumber = PM.PolicyNumber
	  and PM.CoverageCode=''GLBI2''
	  and PM.SnapShotType=''E'')
,
PVCD_ZoneNum_DO=
(select PM.Zone
      from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	  where PS.policynumber = PM.PolicyNumber
	  and PM.CoverageCode=''GLBI1''
	  and PM.SnapShotType=''E'')
,
PVCD_ZoneNum_EPL=
(select PM.Zone
      from PriceMonitorSystem.dbo.PriceMonitorBaseDataPV PM
	  where PS.policynumber = PM.PolicyNumber
	  and PM.CoverageCode=''GLBI2''
	  and PM.SnapShotType=''E'')
from Policy_Information_PVCD_work ps

update Policy_Information_PVCD_work
set PVCD_County_DO=(select COUNTY from Phlyreports..ZIP_Code_Master_Table cnty
where pvcd.PVCD_ZipCode_DO=cnty.zip),
PVCD_County_EPL=(select COUNTY from Phlyreports..ZIP_Code_Master_Table cnty
where pvcd.PVCD_ZipCode_EPL=cnty.zip)
from Policy_Information_PVCD_work pvcd


update Act_Detailed_Experience.dbo.Policy_Information_PVCD_work
set 
PV_Zone = (
      select PVZ.PV_Zone 
      from Act_pricing.dbo.PV_Zone_Description_Factors PVZ
      where PVZ.Inception_date <= Pol.policyeffectivedate
            and PVZ.Expiration_Date > Pol.policyeffectivedate 
            and PVZ.State = ISNULL(PVCD_State_DO,PVCD_State_EPL)
            and PVZ.ZipCode3 = left(ISNULL(PVCD_ZipCode_DO,PVCD_ZipCode_EPL),3))

from Act_Detailed_Experience.dbo.Policy_Information_PVCD_work PS
left join Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work Pol
on pol.policynumber = PS.policynumber


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)










' 
END
GO
