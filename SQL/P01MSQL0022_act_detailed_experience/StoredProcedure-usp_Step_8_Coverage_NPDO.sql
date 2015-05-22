IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_NPDO]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_8_Coverage_NPDO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_NPDO]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'














CREATE procedure [dbo].[usp_Step_8_Coverage_NPDO] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

/***********Step 1**********/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_FF_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.Policy_Information_FF_work

CREATE TABLE dbo.Policy_Information_FF_work(
	[policynumber] [varchar](15) NULL,
	[Idnum] [int] NULL,
	[DF_Limit] [varchar](50) NULL,
	[DF_Base_Retention] [float] NULL,
	[DF_Alt_Retention] [float] NULL,
	[DF_RatingClass] [int] NULL,
	[FF_DO_Limit] [float] NULL,
	[FF_DO_Base_Retention] [varchar](50) NULL,
	[FF_DO_Alt_Retention] [varchar](50) NULL,
	[FF_DO_RatingClass] [int] NULL,
	[FF_DO_Revenues] [float] NULL,
	[FF_EPL_Limit] [varchar](50) NULL,
	[FF_EPL_Base_Retention] [varchar](50) NULL,
	[FF_EPL_Alt_Retention] [varchar](50) NULL,
	[FF_EPL_RatingClass] [int] NULL,
	[FF_EPL_Num_of_Employees] [float] NULL,
	[FF_Business_Type] [varchar](200) NULL,
	[FF_EPL_Num_of_Employees_Range] [varchar](50) NULL,
	[FF_EPL_Num_of_Employees_Range_expanded] [varchar](50) NULL,
	[FF_EPL_Num_of_Employees_Range_expanded_2] [varchar](50) NULL,
	[FF_DO_Revenues_range] [varchar](50) NULL,
	[FF_Trade_Assoc] [varchar](10) NULL,
	[TrimBusiness_Type] [varchar](100) NULL,
	FF_DO_Alt_Retention_int float NULL,
	FF_EPL_Limit_int float NULL,
	FF_EPL_Alt_Retention_int float NULL
)

insert into Act_Detailed_Experience.dbo.Policy_Information_FF_work 
(policynumber)
select policynumber
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
where Productcode in (''DF'',''FF'')

update Act_Detailed_Experience.dbo.Policy_Information_FF_work 
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
from Act_Detailed_Experience.dbo.Policy_Information_FF_work PS




------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_FF_work 
set 

DF_Limit = 
--(isnull	(
(select PM.Limit
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataNDO_DF PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	),
--	(select distinct convert("Varchar",convert("int",Path.Limit)) --float
--	from PriceMonitorLegacy.dbo.PATH_NDO_DF Path
--	where PS.policynumber = Path.policynumber
----		and PS.statecode = Path.state
--		and PS.idnum = Path.idnum)))		,

DF_Base_Retention = 
--(isnull(
    (select PM.BaseRetention
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataNDO_DF PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	),
--	(select distinct Path.BaseRetention --float
--	from PriceMonitorLegacy.dbo.PATH_NDO_DF Path
--	where PS.policynumber = Path.policynumber
----		and PS.statecode = Path.state
--		and PS.idnum = Path.idnum))),

DF_Alt_Retention = 
--(isnull(
   (select PM.AlternateRetention
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataNDO_DF PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	),
--	(select distinct Path.AltRetention --float
--	from PriceMonitorLegacy.dbo.PATH_NDO_DF Path
--	where PS.policynumber = Path.policynumber
----		and PS.statecode = Path.state
--		and PS.idnum = Path.idnum))),

DF_RatingClass = 
--(isnull(
    (select PM.RatingClass
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataNDO_DF PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	),
--	(select distinct Path.RatingClass --int
--	from PriceMonitorLegacy.dbo.PATH_NDO_DF Path
--	where PS.policynumber = Path.policynumber
----		and PS.statecode = Path.state
--		and PS.idnum = Path.idnum))),

FF_DO_Limit = 
--(isnull(
    (select CONVERT(money, case when PM.Limit like ''%/%'' then SUBSTRING(limit, 1, charindex(''/'',Limit,1)-1) else PM.Limit end)
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI1''
	),
--	(select distinct Path.DO_Limit  --float
--	from PriceMonitorLegacy.dbo.PATH_FLEXI1_FF_DO Path
--	where PS.policynumber = Path.policynumber
----		and PS.statecode = Path.state
--		and PS.idnum = Path.idnum))),

FF_DO_Base_Retention = 
--(isnull(
    (select PM.BaseRetention
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI1''
	),
--	(select distinct convert("Varchar",convert("int",Path.DO_BaseRetention)) --float
--	from PriceMonitorLegacy.dbo.PATH_FLEXI1_FF_DO Path
--	where PS.policynumber = Path.policynumber
----		and PS.statecode = Path.state
--		and PS.idnum = Path.idnum))),

FF_DO_Alt_Retention = 
--(isnull(
    (select PM.AltRetention
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI1''
	),
--	(select distinct convert("Varchar",convert("int",Path.DO_Deductible)) --float
--	from PriceMonitorLegacy.dbo.PATH_FLEXI1_FF_DO Path
--	where PS.policynumber = Path.policynumber
----		and PS.statecode = Path.state
--		and PS.idnum = Path.idnum))),
		
FF_DO_RatingClass =	
--(isnull(
    (select PM.RatingClass
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI1''),
	--(select distinct Path1.DO_RatingClass --int
	--from PriceMonitorLegacy.dbo.PATH_FLEXI1_FF_DO Path1
	--where PS.idnum = Path1.idnum))),

FF_DO_Revenues =	
--(isnull(
   (select PM.Exposure
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI1''),
	--(select distinct Path1.DO_Revenues --float
	--from PriceMonitorLegacy.dbo.PATH_FLEXI1_FF_DO Path1
	--where PS.idnum = Path1.idnum))),


FF_EPL_Limit = 
--(isnull(
    (select PM.Limit
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI2''
	),
--	(select distinct convert("Varchar",convert("int",Path.EPL_Limit)) -- float
--	from PriceMonitorLegacy.dbo.PATH_FLEXI2_FF_EPL Path
--	where PS.policynumber = Path.policynumber
----		and PS.statecode = Path.state
--		and PS.idnum = Path.idnum))),

FF_EPL_Base_Retention = 
--(isnull(
    (select PM.BaseRetention
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI2''
	),
--	(select distinct convert("Varchar",convert("int",Path.EPL_BaseRetention)) --float
--	from PriceMonitorLegacy.dbo.PATH_FLEXI2_FF_EPL Path
--	where PS.policynumber = Path.policynumber
----		and PS.statecode = Path.state
--		and PS.idnum = Path.idnum))),
FF_EPL_Alt_Retention = 
--(isnull(
    (select PM.AltRetention
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI2''
	),
--	(select distinct convert("Varchar",convert("int", Path.EPL_Deductible))--float
--	from PriceMonitorLegacy.dbo.PATH_FLEXI2_FF_EPL Path
--	where PS.policynumber = Path.policynumber
----		and PS.statecode = Path.state
--		and PS.idnum = Path.idnum))),
		
FF_EPL_RatingClass = 
--isnull(
    (select PM.RatingClass
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI2''),
	--(select distinct Path2.EPL_RatingClass --int
	--from PriceMonitorLegacy.dbo.PATH_FLEXI2_FF_EPL Path2
	--where PS.idnum = Path2.idnum)),
	
FF_EPL_Num_of_Employees = 
--isnull(
    (select PM.Exposure
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI2''),
	--(select distinct Path2.NumOfEmployees --int
	--from PriceMonitorLegacy.dbo.PATH_FLEXI2_FF_EPL Path2
	--where PS.idnum = Path2.idnum)),
	
FF_Business_Type = 	
--(isnull(
    (select PM.BusinessType
	from PriceMonitorSystem.dbo.PriceMonitorBaseDataFLX PM
	where PS.policynumber = PM.PolicyNumber
	and PM.SnapShotType=''E''
	and PM.CoverageCode=''FLEXI1''
	) 
--	,(select distinct Path.DO_Businesstype 
--	from PriceMonitorLegacy.dbo.PATH_FLEXI1_FF_DO Path
--	where PS.policynumber = Path.policynumber
----	and PS.statecode = Path.state
--	and PS.idnum = Path.idnum)))

from Act_Detailed_Experience.dbo.Policy_Information_FF_work PS





------------------------------------------------------------------------
/***********Step 2**********/

update Act_Detailed_Experience.dbo.Policy_Information_FF_work 
set 
FF_EPL_Num_of_Employees_range = (case
	when FF_EPL_Num_of_Employees is Null then ''a: No Data''
	when FF_EPL_Num_of_Employees = 0 then ''b: No Employees''
	when FF_EPL_Num_of_Employees < 50 then ''c: Below 50 Employees''
	when FF_EPL_Num_of_Employees <= 100 then ''d: 50 to 100 Employees''
	when FF_EPL_Num_of_Employees <= 200 then ''e: 100 to 200 Employees''
	else ''f: 200 or more Employees''
	end),
FF_EPL_Num_of_Employees_range_Expanded = (case
	when FF_EPL_Num_of_Employees is Null then ''a: No Data''
	when FF_EPL_Num_of_Employees = 0 then ''b: No Employees''
	when FF_EPL_Num_of_Employees <= 15 then ''c: 1 to 15 Employees''
	when FF_EPL_Num_of_Employees <= 50 then ''d: 16 to 50 Employees''
	when FF_EPL_Num_of_Employees <= 100 then ''e: 51 to 100 Employees''
	when FF_EPL_Num_of_Employees <= 200 then ''f: 101 to 200 Employees''
	when FF_EPL_Num_of_Employees <= 300 then ''g: 201 to 300 Employees''
	when FF_EPL_Num_of_Employees <= 400 then ''h: 301 to 400 Employees''
	else ''i: 401 or more Employees''
	end),
FF_EPL_Num_of_Employees_range_Expanded_2 = (case
	when FF_EPL_Num_of_Employees is Null then ''a: No Data''
	when FF_EPL_Num_of_Employees = 0 then ''b: No Employees''
	when FF_EPL_Num_of_Employees <= 5 then ''c: 1 to 5 Employees''
	when FF_EPL_Num_of_Employees <= 15 then ''d: 6 to 15 Employees''
	when FF_EPL_Num_of_Employees <= 50 then ''e: 16 to 50 Employees''
	when FF_EPL_Num_of_Employees <= 100 then ''f: 51 to 100 Employees''
	when FF_EPL_Num_of_Employees <= 200 then ''g: 101 to 200 Employees''
	when FF_EPL_Num_of_Employees <= 300 then ''h: 201 to 300 Employees''
	when FF_EPL_Num_of_Employees <= 400 then ''i: 301 to 400 Employees''
	else ''j: 401 or more Employees''
	end),
FF_DO_Revenues_range = (case
	when FF_DO_Revenues is Null then ''a: No Data''
	when FF_DO_Revenues < 100000 then ''b: 0 to $100k''
	when FF_DO_Revenues < 500000 then ''c: $100k to $500k''
	when FF_DO_Revenues < 1000000 then ''d: $500k to $1M''
	when FF_DO_Revenues < 5000000 then ''e: $1M to $5M''
	when FF_DO_Revenues < 10000000 then ''f: $5M to $10M''
	when FF_DO_Revenues < 75000000 then ''g: $10M to $75M''
	else ''h: $75M or more''
	end),
FF_Trade_Assoc = (case 
	when FF_Business_Type like ''%trade%'' and FF_Business_type not like ''%Non-Trade%'' 
	then ''Y'' 
	else ''N'' 
	end),
TrimBusiness_Type = (case 
	when FF_business_type = ''Alcohol/Drug Rehabilitation Center'' then ''Alcohol & Drug Rehabilitation Center'' 
	when FF_business_type = ''Day Care Center (under 2M in Rev)'' then ''Day Care Center (< $2 million in revenue)''
	when FF_business_type = ''Fairs/Exhibitions'' then ''Fairs & Exhibitions'' 
	when FF_business_type = ''Schools (Nursery - 12)'' then ''Schools (Nursery-12), Technical Schools'' 
	when FF_business_type = ''Trade Association'' then ''Trade Associations'' 
	when FF_business_type = ''Visitor/Convention Bureau'' then ''Visitors & Convention Bureau'' 
	when FF_business_type like ''Women%'' then ''Womens Shelter'' 
	else FF_business_type 
	end)
from Act_Detailed_Experience.dbo.Policy_Information_FF_work PS

update Act_Detailed_Experience.dbo.Policy_Information_FF_work
set 
FF_DO_Alt_Retention_int = (case     
      when FF_DO_Alt_Retention in ('''',''NONE'') then null
      else CONVERT(float,FF_DO_Alt_Retention)
      end),
FF_EPL_Limit_int= (case 
      when FF_EPL_Limit in ('''',''NONE'') then null
      else CONVERT(float,CONVERT(money, case when FF_EPL_Limit like ''%/%'' 
                                             then SUBSTRING(FF_EPL_Limit, 1, charindex(''/'',FF_EPL_Limit,1)-1) 
                                             else FF_EPL_Limit end))
      end),
FF_EPL_Alt_Retention_int = (case    
      when FF_EPL_Alt_Retention in ('''',''NONE'') then null
      else CONVERT(float,FF_EPL_Alt_Retention)
      end)
from Act_Detailed_Experience.dbo.Policy_Information_FF_work PS



update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)








' 
END
GO
