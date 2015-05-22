IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_CL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_8_Coverage_CL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_CL]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'










CREATE procedure [dbo].[usp_Step_8_Coverage_CL] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

/***********Step 1**********/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_CL_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.Policy_Information_CL_work

CREATE TABLE dbo.Policy_Information_CL_work(
	[policynumber] [varchar](15) NULL,
	[Idnum] [int] NULL,
	[CL_Occ_Limit][varchar](200) NULL,
	[CL_Agg_Limit][varchar](200) NULL,
	[CL_Deductible][varchar](200) NULL,
	[CL_Revenues][float] NULL,
	[CL_RetroactiveYears][varchar](200) NULL, 
	[CL_ContractsUsage][varchar](200) NULL,
	[CL_HazardGroup][varchar](200) NULL,
	[CL_ProgramMod_Factor][float] NULL,
	[CL_NumOfEmployees][float] NULL,
	[CL_BusinessType][varchar](200) NULL,

	[CL_Revenue_Per_Employee][float] NULL,
	[CL_Mortgage_Broker_Ind][varchar](10) NULL,

	[CL_NumOfEmployees_range][varchar](4000) NULL,
	[CL_Revenues_range][varchar](4000) NULL,
	[CL_Prior_Years_Range][varchar](4000) NULL,
	[CL_Revenue_Per_Employee_range][varchar](200) NULL,
    CL_Occ_Limit_int float NULL,
    CL_Agg_Limit_int float NULL,
    CL_Deductible_int float NULL
)

insert into Act_Detailed_Experience.dbo.Policy_Information_CL_work 
(policynumber)
select policynumber
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
where Productcode in (''CL'')

update Act_Detailed_Experience.dbo.Policy_Information_CL_work 
set 
Idnum = (
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
from Act_Detailed_Experience.dbo.Policy_Information_CL_work PS

------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_CL_work 
set 

CL_Occ_Limit = 
--(isnull(
    (select OccurrenceLimit
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataCL PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E'')
	--,(
	--isnull(
	--	(select distinct Path.Occ_Limit  --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum),

	--	(select distinct Path.Occ_Limit  --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum)))))
		,

CL_Agg_Limit = 
--(isnull(
    (select AggregateLimit
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataCL PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E'')
	--,
	--(
	--isnull(
	--	(select distinct Path.Agg_Limit  --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum),

	--	(select distinct Path.Agg_Limit  --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum)))))
		,

CL_Deductible = 
--(isnull(
    (select Deductible
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataCL PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E'')
	--,
	--(
	--isnull(
	--	(select distinct convert(char,Path.Deductible) --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum),

	--	(select distinct convert(char,Path.Deductible) --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum)))))
		,

CL_Revenues = 
--(isnull(
    (select Revenues
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataCL PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E'')
	--,
	--(
	--isnull(
	--	(select distinct Path.Exposure --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum),

	--	(select distinct Path.Exposure --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum)))))
		,

CL_RetroactiveYears = 
--(isnull(
    (select PriorYears
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataCL PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E'')
	--,
	--(
	--isnull(
	--	(select distinct Path.RetroactiveYears --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum),

	--	(select distinct Path.RetroactiveYears --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum)))))
		,

CL_ContractsUsage = 
--(isnull(
    (select ContractUsage
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataCL PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E'')
	--,
	--(
	--isnull(
	--	(select distinct Path.ContractsUsage --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum),

	--	(select distinct Path.ContractsUsage --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum)))))
		,

CL_HazardGroup = 
--(isnull(
    (select RatingClass
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataCL PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E'')
	--,
	--(
	--isnull(
	--	(select distinct Path.HazardGroup --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum),

	--	(select distinct Path.HazardGroup --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum)))))
		,

CL_ProgramMod_Factor = 
--(isnull(
    (select SizeOfProgramMod
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataCL PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E'')
	--,
	--(
	--isnull(
	--	(select top 1 Path.ProgramMod_Factor --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum),

	--	(select top 1 Path.ProgramMod_Factor --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum)))))
		,

CL_NumOfEmployees = 
--(isnull(
(convert(varchar,(select MFL.nmscrat2 
				from PI_AQS_POLICY_PROD.dbo.BOPcovMFL MFL
				where lcovcde=''EPL'' and lmscmat2=''NUMEMP''
				and MFL.policyid=PS.idnum)))
	--			,
	--(
	--isnull(
	--	(select distinct Path.NumOfEmployees --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum),

	--	(select distinct Path.NumOfEmployees --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber
	--	and PS.idnum = Path.idnum)))))
		,

CL_BusinessType = 
--(isnull(
   (select BusinessType
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataCL PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E'')
	--,
	--	(select top 1 Path.BusinessType --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_CL  Path
	--	where PS.policynumber = Path.policynumber)))

from Act_Detailed_Experience.dbo.Policy_Information_CL_work PS





------------------------------------------------------------------------
/***********Step 2**********/

update Act_Detailed_Experience.dbo.Policy_Information_CL_work 
set 
	CL_Revenue_Per_Employee = (case
		when CL_NumOfEmployees is Null or CL_NumOfEmployees = 0 or CL_Revenues is null 
		then Null
		else CL_Revenues / CL_NumOfEmployees
		end),
	CL_Mortgage_Broker_Ind = (case when  CL_businesstype like ''Mortgage Broker%'' 
							then ''MB'' else ''OTMB'' end)
		
from Act_Detailed_Experience.dbo.Policy_Information_CL_work PS

------------------------------------------------------------------------
/***********Step 3**********/

update Act_Detailed_Experience.dbo.Policy_Information_CL_work 
set 
	CL_NumOfEmployees_range = (case
		when CL_NumOfEmployees is Null then ''a: No Data''
		when CL_NumOfEmployees = 0 then ''b: No Employees''
		when CL_NumOfEmployees < 10 then ''c: Below 10 Employees''
		when CL_NumOfEmployees <= 25 then ''d: 10 to 25 Employees''
		when CL_NumOfEmployees <= 100 then ''e: 25 to 100 Employees''
		else ''f: 100 or more Employees''
		end),

	CL_Revenues_range = 
		(case
		when CL_Revenues is Null then ''a: No Data''
		when CL_Revenues < 100000 then ''b: 0 to $100k''
		when CL_Revenues < 500000 then ''c: $100k to $500k''
		when CL_Revenues < 800000 then ''d: $500k to $800k''
		when CL_Revenues < 1250000 then ''e: $800k to $1.25M''
		when CL_Revenues < 5000000 then ''f: $1.25M to $5M''
		when CL_Revenues < 10000000 then ''g: $5M to $10M''
		when CL_Revenues < 75000000 then ''h: $10M to $75M''
		else ''i: $75M or more''
		end),

	CL_Prior_Years_Range = (case
		when CL_RetroactiveYears is Null then ''a: No Data''
		when rtrim(ltrim(CL_RetroactiveYears)) = ''0'' then ''b: No Prior Years''
		when rtrim(ltrim(CL_RetroactiveYears)) = ''1'' then ''c: 1 Prior Year''
		when rtrim(ltrim(CL_RetroactiveYears)) in (''2'',''3'',''4'') then ''d: 2 to 4 Prior Years''
		else ''e: 5 or more Prior Years''
		end),
		
	CL_Revenue_Per_Employee_range = (case
		when CL_Revenue_Per_Employee is Null or CL_Revenue_Per_Employee = 0 then ''a: No Data''
		when CL_Revenue_Per_Employee <= 50000 then ''b: <= $50k''
		when CL_Revenue_Per_Employee <= 100000 then ''c: $50k to $100k''
		when CL_Revenue_Per_Employee <= 150000 then ''d: $100k to $150k''
		when CL_Revenue_Per_Employee <= 200000 then ''e: $150k to $200k''
		else ''f: > $200k''
		end)
		
from Act_Detailed_Experience.dbo.Policy_Information_CL_work PS

update Act_Detailed_Experience.dbo.Policy_Information_CL_work
set
CL_Occ_Limit_int = (case     
      when CL_Occ_Limit in ('''',''NONE'') then null
      else CONVERT(float,CL_Occ_Limit)
      end),
CL_Agg_Limit_int= (case 
      when CL_Agg_Limit in ('''',''NONE'') then null
      else CONVERT(float,CL_Agg_Limit)
      end),
CL_Deductible_int= (case    
      when CL_Deductible in ('''',''NONE'') then null
 else CONVERT(float,CL_Deductible)
      end)

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)









' 
END
GO
