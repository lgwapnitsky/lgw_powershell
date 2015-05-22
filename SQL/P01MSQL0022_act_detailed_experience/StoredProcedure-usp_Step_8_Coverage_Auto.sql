IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_Auto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_8_Coverage_Auto]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_Auto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'









CREATE procedure [dbo].[usp_Step_8_Coverage_Auto] as 

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_ALL_POLICIES_AUTO_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work

CREATE TABLE dbo.Policy_Information_ALL_POLICIES_AUTO_work (
	policynumber varchar(15) NULL,
	PolicyID int null,
	Auto_Vehicle_All_count varchar(50) NULL,
	Auto_Vehicle_Truck_count varchar(50) NULL,
	Auto_Vehicle_PPT_count varchar(50) NULL,
	Auto_Vehicle_Buses_count varchar(50) NULL,
	Auto_Vehicle_VanPools_count varchar(50) NULL,
	Auto_Vehicle_OtherPublic_count varchar(50) NULL,
	Auto_Vehicle_Other_count varchar(50) NULL,
	Auto_Vehicle_Dual_Control_count varchar(50) NULL,
	Auto_Vehicle_count_Total_Range varchar(20) NULL,
	Auto_Vehicle_count_Truck_Range varchar(20) NULL,
	Auto_Vehicle_count_PPT_Range varchar(20) NULL,
	Auto_Vehicle_count_Buses_Range varchar(20) NULL,
	Auto_Vehicle_count_VanPools_Range varchar(20) NULL,
	Auto_Vehicle_count_OtherPublic_Range varchar(20) NULL,
	Auto_Vehicle_count_Other_Range varchar(20) NULL,
	Auto_Vehicle_count_Dual_Control_Range varchar(20) NULL,
	Auto_Vehicle_count_Dual_Control_Percent_Range varchar(40) NULL,
	Driving_School varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS,
	Coll_No_Ded int,
	Coll_U1000_Ded int,
	Coll_1000_Ded int,
	Coll_O1000_Ded int,
	OTC_No_Ded int,
	OTC_U1000_Ded int,
	OTC_1000_Ded int,
	OTC_O1000_Ded int,
	Auto_Vehicle_count_Coll_No_Ded_Range varchar(20),
	Auto_Vehicle_count_Coll_U1000_Ded_Range varchar(20),
	Auto_Vehicle_count_Coll_1000_Ded_Range varchar(20),
	Auto_Vehicle_count_Coll_O1000_Ded_Range varchar(20),
	Auto_Vehicle_count_OTC_No_Ded_Range varchar(20),
	Auto_Vehicle_count_OTC_U1000_Ded_Range varchar(20),
	Auto_Vehicle_count_OTC_1000_Ded_Range varchar(20),
	Auto_Vehicle_count_OTC_O1000_Ded_Range varchar(20),
	Hired_Auto varchar(3),
	Non_Owned_Auto varchar(3)
)

insert into Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work
(policynumber, PolicyID)
Select 	policynumber, PolicyID
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
group by policynumber, PolicyID



--last run took 3 hours 15 mins 6/5/09
update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work
set 
Auto_Vehicle_All_count = (
		select count(distinct A.VehicleNumber)
		from PriceMonitorSystem.dbo.PriceMonitorBaseDataCAU A
		where A.PolicyNumber = PS.Policynumber
		and A.SnapShotType=''E''
		and A.CoverageCode in (''BI'',''PD'')),
Auto_Vehicle_Truck_count = (
		select count(distinct A.VehicleNumber)
		from PriceMonitorSystem.dbo.PriceMonitorBaseDataCAU A
		where A.PolicyNumber = PS.Policynumber
		and A.SnapShotType=''E''		
		and A.CoverageCode in (''BI'',''PD'')
			and (a.VehicleDescription like ''%TRUCK%'' 
					or a.VehicleDescription like ''%TRAILER%'' 
					or ltrim(rtrim(VehicleType)) like ''%TRK%'')
		),
Auto_Vehicle_PPT_count = (
		select count(distinct A.VehicleNumber)
		from PriceMonitorSystem.dbo.PriceMonitorBaseDataCAU A
		where A.PolicyNumber = PS.Policynumber
		and A.SnapShotType=''E''
		and A.CoverageCode in (''BI'',''PD'')
			and not (a.VehicleDescription like ''%TRUCK%'' 
					or a.VehicleDescription like ''%TRAILER%'' 
					or ltrim(rtrim(VehicleType)) like ''%TRK%'')
			and (ltrim(rtrim(a.VehicleDescription)) = '''' and ltrim(rtrim(VehicleType)) in (''PPT'',''PSL'',''PERSONAL''))
		),
Auto_Vehicle_Buses_count = (
		select count(distinct A.VehicleNumber)
		from PriceMonitorSystem.dbo.PriceMonitorBaseDataCAU A
		where A.PolicyNumber = PS.Policynumber
		and A.SnapShotType=''E''
		and A.CoverageCode in (''BI'',''PD'')
		and not (a.VehicleDescription like ''%TRUCK%'' 
					or a.VehicleDescription like ''%TRAILER%'' 
					or ltrim(rtrim(VehicleType)) like ''%TRK%'')
			and not (ltrim(rtrim(a.VehicleDescription)) = '''' and ltrim(rtrim(VehicleType)) in (''PPT'',''PSL'',''PERSONAL''))
			and (a.VehicleDescription like ''%OTHER BUSES%'' or a.VehicleDescription like ''%SCH & CH%'' or VehicleDescription like ''SCHOOL & CHURCH'')
		),
Auto_Vehicle_VanPools_count = (
		select count(distinct A.VehicleNumber)
		from PriceMonitorSystem.dbo.PriceMonitorBaseDataCAU A
		where A.PolicyNumber = PS.Policynumber
		and A.SnapShotType=''E''
		and A.CoverageCode in (''BI'',''PD'')
			and not (a.VehicleDescription like ''%TRUCK%'' 
					or a.VehicleDescription like ''%TRAILER%'' 
					or ltrim(rtrim(VehicleType)) like ''%TRK%'')
			and not (ltrim(rtrim(a.VehicleDescription)) = '''' and ltrim(rtrim(VehicleType)) in (''PPT'',''PSL'',''PERSONAL''))
			and not (a.VehicleDescription like ''%OTHER BUSES%'' or a.VehicleDescription like ''%SCH & CH%'' 
			         or VehicleDescription like ''SCHOOL & CHURCH'')
			and a.VehicleDescription like ''%VAN%''
		),
Auto_Vehicle_OtherPublic_count = (
		select count(distinct A.VehicleNumber)
		from PriceMonitorSystem.dbo.PriceMonitorBaseDataCAU A
		where A.PolicyNumber = PS.Policynumber
		and A.SnapShotType=''E''
		and A.CoverageCode in (''BI'',''PD'')
			and not (a.VehicleDescription like ''%TRUCK%'' 
					or a.VehicleDescription like ''%TRAILER%'' 
					or ltrim(rtrim(VehicleType)) like ''%TRK%'')
			and not (ltrim(rtrim(a.VehicleDescription)) = '''' and ltrim(rtrim(VehicleType)) in (''PPT'',''PSL'',''PERSONAL''))
			and not (a.VehicleDescription like ''%OTHER BUSES%'' or a.VehicleDescription like ''%SCH & CH%'' 
			         or VehicleDescription like ''SCHOOL & CHURCH'')
			and not (a.VehicleDescription like ''%VAN%'')
			and ltrim(rtrim(VehicleType)) like ''%PBL%''
		),
Auto_Vehicle_Other_count = (
		select count(distinct A.VehicleNumber)
		from PriceMonitorSystem.dbo.PriceMonitorBaseDataCAU A
		where A.PolicyNumber = PS.Policynumber
		and A.SnapShotType=''E''
		and A.CoverageCode in (''BI'',''PD'')
			and not (a.VehicleDescription like ''%TRUCK%'' 
					or a.VehicleDescription like ''%TRAILER%'' 
					or ltrim(rtrim(VehicleType)) like ''%TRK%'')
			and not (ltrim(rtrim(a.VehicleDescription)) = '''' and ltrim(rtrim(VehicleType)) in (''PPT'',''PSL'',''PERSONAL''))
			and not (a.VehicleDescription like ''%OTHER BUSES%'' or a.VehicleDescription like ''%SCH & CH%'' 
			         or VehicleDescription like ''SCHOOL & CHURCH'')
			and not (a.VehicleDescription like ''%VAN%'')
			and not (ltrim(rtrim(VehicleType)) like ''%PBL%'')
		)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work PS;


WITH DualControl (PolicyID, Vehicle_Count)
AS
(
	SELECT DISTINCT PolicyID, count(NVEHNUM) AS Vehicle_Count
	FROM PI_AQS_Policy_Prod.dbo.CAUVEHPPTMFL
	WHERE LDUACTL = ''YES''
		and NEXPNUM = 0
	GROUP BY PolicyID
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work
SET 
Auto_Vehicle_Dual_Control_Count = isnull(DC.Vehicle_Count,0)
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work PS
LEFT OUTER JOIN DualControl DC
ON DC.PolicyID = PS.policyid



------------------------------------------------------------------------------

--20 minute run time 6/8/09
update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work
set
	Auto_Vehicle_count_Total_Range = (case
		when Auto_Vehicle_all_count is Null then ''a: No Data''
		when Auto_Vehicle_all_count = 0 then ''b: 0''
		when Auto_Vehicle_all_count <= 5 then ''c: 1 to 5''
		when Auto_Vehicle_all_count <= 15 then ''d: 6 to 15''
		else ''e: more than 15''
		end),
	Auto_Vehicle_count_Truck_Range = (case
		when Auto_Vehicle_truck_count is Null then ''a: No Data''
		when Auto_Vehicle_truck_count = 0 then ''b: 0''
		when Auto_Vehicle_truck_count <= 5 then ''c: 1 to 5''
		when Auto_Vehicle_truck_count <= 15 then ''d: 6 to 15''
		else ''e: more than 15''
		end),
	Auto_Vehicle_count_PPT_Range = (case
		when Auto_Vehicle_ppt_count is Null then ''a: No Data''
		when Auto_Vehicle_ppt_count = 0 then ''b: 0''
		when Auto_Vehicle_ppt_count <= 5 then ''c: 1 to 5''
		when Auto_Vehicle_ppt_count <= 15 then ''d: 6 to 15''
		else ''e: more than 15''
		end),
	Auto_Vehicle_count_Buses_Range = (case
		when Auto_Vehicle_buses_count is Null then ''a: No Data''
		when Auto_Vehicle_buses_count = 0 then ''b: 0''
		when Auto_Vehicle_buses_count <= 5 then ''c: 1 to 5''
		when Auto_Vehicle_buses_count <= 15 then ''d: 6 to 15''
		else ''e: more than 15''
		end),
	Auto_Vehicle_count_VanPools_Range = (case
		when Auto_Vehicle_vanpools_count is Null then ''a: No Data''
		when Auto_Vehicle_vanpools_count = 0 then ''b: 0''
		when Auto_Vehicle_vanpools_count <= 5 then ''c: 1 to 5''
		when Auto_Vehicle_vanpools_count <= 15 then ''d: 6 to 15''
		else ''e: more than 15''
		end),
	Auto_Vehicle_count_OtherPublic_Range = (case
		when Auto_Vehicle_otherpublic_count is Null then ''a: No Data''
		when Auto_Vehicle_otherpublic_count = 0 then ''b: 0''
		when Auto_Vehicle_otherpublic_count <= 5 then ''c: 1 to 5''
		when Auto_Vehicle_otherpublic_count <= 15 then ''d: 6 to 15''
		else ''e: more than 15''
		end),
	Auto_Vehicle_count_Other_Range = (case
		when Auto_Vehicle_other_count is Null then ''a: No Data''
		when Auto_Vehicle_other_count = 0 then ''b: 0''
		when Auto_Vehicle_other_count <= 5 then ''c: 1 to 5''
		when Auto_Vehicle_other_count <= 15 then ''d: 6 to 15''
		else ''e: more than 15''
		end),
	Auto_Vehicle_count_Dual_Control_Range = (case
		when Auto_Vehicle_Dual_Control_count is Null then ''a: No Data''
		when Auto_Vehicle_Dual_Control_count = 0 then ''b: 0''
		when Auto_Vehicle_Dual_Control_count <= 5 then ''c: 1 to 5''
		when Auto_Vehicle_Dual_Control_count <= 15 then ''d: 6 to 15''
		else ''e: more than 15''
		end),
	Auto_Vehicle_count_Dual_Control_Percent_Range = (case
		when Auto_Vehicle_Dual_Control_count is Null then ''a: No Data''
		when Auto_Vehicle_Dual_Control_count = 0 or Auto_Vehicle_All_count = 0 then ''b: No DC''
		when cast(Auto_Vehicle_Dual_Control_count AS int)*1.0/cast(Auto_Vehicle_All_count as int)*1.0 <= .5
			then ''c: Up to 50% DC''
		when cast(Auto_Vehicle_Dual_Control_count AS int)*1.0/cast(Auto_Vehicle_All_count as int)*1.0 < 1
			then ''d: Over 50% DC but Less than 100% DC''
		else ''e: 100% DC''
		end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work;


WITH DrivingSchoolList (Policy_Number, SchoolType)
AS
(
      SELECT
      PolicyNumber,
      CASE
            WHEN ClassCode in (''007926'',''7926'',''792600'',''79260'',''07926'', 
                                          ''007201'',''7201'',''720100'',''72010'',''07201'',
                                          ''007202'',''7202'',''720200'',''72020'',''07202'')
                  THEN ''Educational''
            WHEN ClassCode in (''007927'',''07927'',''7927'',''79270'',
                                          ''007223'',''7223'',''722300'',''72230'',''07223'',
                                          ''007224'',''7224'',''722400'',''72240'',''07224'',
                                          ''007225'',''7225'',''722500'',''72250'',''07225'',
                                          ''007226'',''7226'',''722600'',''72260'',''07226'')
                  THEN ''Commercial''
            ELSE ''N/A'' END
      as SchoolType
      FROM PriceMonitorSystem.dbo.PriceMonitorBaseDataCAU A
	  WHERE A.CoverageCode in (''BI'',''PD'')
		    AND A.SnapShotType=''E''
            AND ClassCode in (''007926'',''7926'',''792600'',''79260'',''07926'',
                                    ''007201'',''7201'',''720100'',''72010'',''07201'',
                                    ''007202'',''7202'',''720200'',''72020'',''07202'',
                                    ''007223'',''7223'',''722300'',''72230'',''07223'',
                                    ''007224'',''7224'',''722400'',''72240'',''07224'',
                                    ''007225'',''7225'',''722500'',''72250'',''07225'',
                                    ''007226'',''7226'',''722600'',''72260'',''07226'',
                                    ''007927'',''07927'',''7927'',''79270'')
      GROUP BY PolicyNumber,
            CASE
            WHEN ClassCode in (''007926'',''7926'',''792600'',''79260'',''07926'', 
                                          ''007201'',''7201'',''720100'',''72010'',''07201'',
                                          ''007202'',''7202'',''720200'',''72020'',''07202'')
                  THEN ''Educational''
            WHEN ClassCode in (''007927'',''07927'',''7927'',''79270'',
                                          ''007223'',''7223'',''722300'',''72230'',''07223'',
                                          ''007224'',''7224'',''722400'',''72240'',''07224'',
                                          ''007225'',''7225'',''722500'',''72250'',''07225'',
                                          ''007226'',''7226'',''722600'',''72260'',''07226'')
                  THEN ''Commercial''
            ELSE ''N/A'' END
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work
SET
Driving_School = DrivingSchoolList.SchoolType
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work AP
INNER JOIN DrivingSchoolList
ON AP.policynumber = DrivingSchoolList.Policy_Number;


--------------------------------------------------------------------------------------
--Comprehensive and Collision Deductibles


select PolicyNumber, VehicleNumber, case when Deductible=''FULL'' OR Deductible='''' then 0 else convert(int,Deductible) end as Deductible
into #AQS_Detail_COLL_Combined
      FROM PriceMonitorSystem.dbo.PriceMonitorBaseDataCAU A
	  WHERE A.CoverageCode = ''COLL''
		    AND A.SnapShotType=''E''


select PolicyNumber, VehicleNumber, case when Deductible in (''FULL'',''NONE'',''NO'','''',''N/A'') then 0 else convert(int,Deductible) end as Deductible
into #AQS_Detail_OTC_Combined
      FROM PriceMonitorSystem.dbo.PriceMonitorBaseDataCAU A
	  WHERE A.CoverageCode = ''OTC''
	        AND A.CoverageType=''OTC''
		    AND A.SnapShotType=''E'';
		       

WITH NoDed(Policy_Number, Vehicle_Count)
AS (
	SELECT PolicyNumber, count(VehicleNumber)
	FROM #AQS_Detail_COLL_Combined
	WHERE Deductible is null or Deductible = 0
	GROUP BY PolicyNumber
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
Coll_No_Ded = D.Vehicle_Count
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work AP
INNER JOIN NoDed D
ON AP.policynumber = D.Policy_Number;

WITH U1000Ded(Policy_Number, Vehicle_Count)
AS (
	SELECT PolicyNumber, count(VehicleNumber)
	FROM #AQS_Detail_COLL_Combined
	WHERE Deductible < 1000 and Deductible > 0
	GROUP BY PolicyNumber
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
Coll_U1000_Ded = D.Vehicle_Count
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work AP
INNER JOIN U1000Ded D
ON AP.policynumber = D.Policy_Number;

WITH ThouDed(Policy_Number, Vehicle_Count)
AS (
	SELECT PolicyNumber, count(VehicleNumber)
	FROM #AQS_Detail_COLL_Combined
	WHERE Deductible = 1000
	GROUP BY PolicyNumber
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
Coll_1000_Ded = D.Vehicle_Count
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work AP
INNER JOIN ThouDed D
ON AP.policynumber = D.Policy_Number;

WITH O1000Ded(Policy_Number, Vehicle_Count)
AS (
	SELECT PolicyNumber, count(VehicleNumber)
	FROM #AQS_Detail_COLL_Combined
	WHERE Deductible > 1000
	GROUP BY PolicyNumber
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
Coll_O1000_Ded = D.Vehicle_Count
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work AP
INNER JOIN O1000Ded D
ON AP.policynumber = D.Policy_Number;

WITH NoDed(Policy_Number, Vehicle_Count)
AS (
	SELECT PolicyNumber, count(VehicleNumber)
	FROM #AQS_Detail_OTC_Combined
	WHERE Deductible is null or Deductible = 0
	GROUP BY PolicyNumber
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
OTC_No_Ded = D.Vehicle_Count
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work AP
INNER JOIN NoDed D
ON AP.policynumber = D.Policy_Number;

WITH U1000Ded(Policy_Number, Vehicle_Count)
AS (
	SELECT PolicyNumber, count(VehicleNumber)
	FROM #AQS_Detail_OTC_Combined
	WHERE Deductible < 1000 and Deductible > 0
	GROUP BY PolicyNumber
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
OTC_U1000_Ded = D.Vehicle_Count
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work AP
INNER JOIN U1000Ded D
ON AP.policynumber = D.Policy_Number;

WITH ThouDed(Policy_Number, Vehicle_Count)
AS (
	SELECT PolicyNumber, count(VehicleNumber)
	FROM #AQS_Detail_OTC_Combined
	WHERE Deductible = 1000
	GROUP BY PolicyNumber
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
OTC_1000_Ded = D.Vehicle_Count
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work AP
INNER JOIN ThouDed D
ON AP.policynumber = D.Policy_Number;

WITH O1000Ded(Policy_Number, Vehicle_Count)
AS (
	SELECT PolicyNumber, count(VehicleNumber)
	FROM #AQS_Detail_OTC_Combined
	WHERE Deductible > 1000
	GROUP BY PolicyNumber
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
OTC_O1000_Ded = D.Vehicle_Count
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work AP
INNER JOIN O1000Ded D
ON AP.policynumber = D.Policy_Number;

UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
Auto_Vehicle_count_Coll_No_Ded_Range = (case
	when Coll_No_Ded is Null then ''a: No Data''
	when Coll_No_Ded = 0 then ''b: 0''
	when Coll_No_Ded <= 5 then ''c: 1 to 5''
	when Coll_No_Ded <= 15 then ''d: 6 to 15''
	else ''e: more than 15''
	end),
Auto_Vehicle_count_Coll_U1000_Ded_Range = (case
	when Coll_U1000_Ded is Null then ''a: No Data''
	when Coll_U1000_Ded = 0 then ''b: 0''
	when Coll_U1000_Ded <= 5 then ''c: 1 to 5''
	when Coll_U1000_Ded <= 15 then ''d: 6 to 15''
	else ''e: more than 15''
	end),
Auto_Vehicle_count_Coll_1000_Ded_Range = (case
	when Coll_1000_Ded is Null then ''a: No Data''
	when Coll_1000_Ded = 0 then ''b: 0''
	when Coll_1000_Ded <= 5 then ''c: 1 to 5''
	when Coll_1000_Ded <= 15 then ''d: 6 to 15''
	else ''e: more than 15''
	end),
Auto_Vehicle_count_Coll_O1000_Ded_Range = (case
	when Coll_O1000_Ded is Null then ''a: No Data''
	when Coll_O1000_Ded = 0 then ''b: 0''
	when Coll_O1000_Ded <= 5 then ''c: 1 to 5''
	when Coll_O1000_Ded <= 15 then ''d: 6 to 15''
	else ''e: more than 15''
	end),
Auto_Vehicle_count_OTC_No_Ded_Range = (case
	when OTC_No_Ded is Null then ''a: No Data''
	when OTC_No_Ded = 0 then ''b: 0''
	when OTC_No_Ded <= 5 then ''c: 1 to 5''
	when OTC_No_Ded <= 15 then ''d: 6 to 15''
	else ''e: more than 15''
	end),
Auto_Vehicle_count_OTC_U1000_Ded_Range = (case
	when OTC_U1000_Ded is Null then ''a: No Data''
	when OTC_U1000_Ded = 0 then ''b: 0''
	when OTC_U1000_Ded <= 5 then ''c: 1 to 5''
	when OTC_U1000_Ded <= 15 then ''d: 6 to 15''
	else ''e: more than 15''
	end),
Auto_Vehicle_count_OTC_1000_Ded_Range = (case
	when OTC_1000_Ded is Null then ''a: No Data''
	when OTC_1000_Ded = 0 then ''b: 0''
	when OTC_1000_Ded <= 5 then ''c: 1 to 5''
	when OTC_1000_Ded <= 15 then ''d: 6 to 15''
	else ''e: more than 15''
	end),
Auto_Vehicle_count_OTC_O1000_Ded_Range = (case
	when OTC_O1000_Ded is Null then ''a: No Data''
	when OTC_O1000_Ded = 0 then ''b: 0''
	when OTC_O1000_Ded <= 5 then ''c: 1 to 5''
	when OTC_O1000_Ded <= 15 then ''d: 6 to 15''
	else ''e: more than 15''
	end);
	
------------------------------------------------------------------------------------------
--Hired and Non-Owned Auto

WITH Hired (PN, HA)
AS (
	SELECT
	policynumber,
	HA = ''Yes''
	FROM AccessPHLYEOM.dbo.premiumsummary
	WHERE classcode in (
		SELECT CLASS4
		FROM Act_Definitions.dbo.CommAuto_Class_Codes	
		WHERE CLASS_GROUP like ''Hired%'')
	and currentwrittenpremium <> 0
	and aslobcode in (193, 194, 212)
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
Hired_Auto = H.HA
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work DE
INNER JOIN Hired H
ON DE.policynumber = H.PN;

WITH NonOwned (PN, Non_Owned)
AS (
	SELECT
	policynumber,
	Non_Owned = ''Yes''
	FROM AccessPHLYEOM.dbo.premiumsummary
	WHERE classcode in (
		SELECT CLASS4
		FROM Act_Definitions.dbo.CommAuto_Class_Codes	
		WHERE CLASS_GROUP like ''Non%'')
	and currentwrittenpremium <> 0
	and aslobcode in (193, 194, 212)
)
UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
Non_Owned_Auto = Non.Non_Owned
FROM Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work DE
INNER JOIN NonOwned Non
ON DE.policynumber = Non.PN;

UPDATE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_AUTO_work 
SET
Hired_Auto = ISNULL(Hired_Auto,''No''),
Non_Owned_Auto = ISNULL(Non_Owned_Auto,''No'');

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)







' 
END
GO
