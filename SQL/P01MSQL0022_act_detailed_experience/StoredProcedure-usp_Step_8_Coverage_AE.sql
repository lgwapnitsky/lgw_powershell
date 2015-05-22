IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_AE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_8_Coverage_AE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_AE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'











CREATE procedure [dbo].[usp_Step_8_Coverage_AE] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

/***********Step 1**********/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_AE_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.Policy_Information_AE_work

CREATE TABLE dbo.Policy_Information_AE_work(
	[policynumber] [varchar](15) NULL,
	[Idnum] [int] NULL,
	[AE_Limit][varchar](4000) NULL,
	[AE_Limit_Type][varchar](4000) NULL,
	[AE_Accountant_Type][varchar](4000) NULL,
	[AE_Deductible] [varchar](50) NULL,
	[AE_Num_of_Accountants] [float] NULL,
	[AE_Revenues] [float] NULL,
	[AE_Prior_Years][varchar](200) NULL,
	
	[AE_Revenue_Per_Accountant][float] NULL,	

	[AE_Num_of_Accountants_Range] [varchar](50) NULL,	
	[AE_Years_Prior_to_Retro][varchar](200) NULL,	
	[AE_Program_Type][varchar](200) NULL,	
	[AE_Revenues_range] [varchar](50) NULL,
	[AE_Revenue_Per_Accountant_Range][varchar](200) NULL,
	[AE_Limit_Trim][varchar](500) NULL,	
	[AE_Limit_Type_Trim][varchar](500) NULL	



)

insert into Act_Detailed_Experience.dbo.Policy_Information_AE_work 
(policynumber)
select policynumber
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
where Productcode in (''AE'')

update Act_Detailed_Experience.dbo.Policy_Information_AE_work 
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
from Act_Detailed_Experience.dbo.Policy_Information_AE_work PS

------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_AE_work 
set 


AE_Limit = 
--(isnull(
(select CM.Limit --varchar(4000)
	from PriceMonitorSystem..PriceMonitorBaseDataAE CM
	where PS.policynumber = CM.policynumber
	and SnapShotType=''E'')
	--,

	--	(select top 1 Path.Limit  --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_AE  Path
	--	where PS.policynumber = Path.policynumber)))
		,

AE_Limit_Type = 
--(	isnull(
	(select CM.TYPE --varchar(4000)
	from PriceMonitorSystem..PriceMonitorBaseDataAE CM
	where PS.policynumber = CM.policynumber
	and SnapShotType=''E'')
	--,

	--	(select top 1 Path.LimitType  --varchar(12)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_AE  Path
	--	where PS.policynumber = Path.policynumber)))
		,



AE_Accountant_Type = 
--(isnull(
	(select CM.AccountantType --varchar(4000)
	from PriceMonitorSystem..PriceMonitorBaseDataAE CM
	where PS.policynumber = CM.policynumber
	and SnapShotType=''E'')
	--,

	--	(select top 1 Path.AccountantType  --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_AE  Path
	--	where PS.policynumber = Path.policynumber)))
		,



AE_Deductible = 
--(isnull(
	(select CM.Deductible --varchar(4000)
	from PriceMonitorSystem..PriceMonitorBaseDataAE CM
	where PS.policynumber = CM.policynumber
	and SnapShotType=''E'')
	--,

	--	(select top 1 Path.Deductible --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_AE  Path
	--	where PS.policynumber = Path.policynumber)))
		,

AE_Num_of_Accountants = 
--(isnull(
 (select CM.NumAccountant --varchar(4000)
	from PriceMonitorSystem..PriceMonitorBaseDataAE CM
	where PS.policynumber = CM.policynumber
	and SnapShotType=''E'')
	,
	--(isnull(
	--	(select distinct max(convert(int,STRINGVALUE))
	--	from PI_AQS_Policy_prod.dbo.BOPPOLEXTmfl BOPEXT
	--	where nexpnum = 0
	--	and [name] = ''NAP''
	--	and lpgmtyp in (''ACT'',''ACE'')
	--	and PS.idnum = BOPEXT.policyID),

	--	(select distinct max(convert(int,STRINGVALUE))
	--	from PI_AQS_Policy_prod.dbo.BOPPOLEXTmfl BOPEXT
	--	where nexpnum = 0
	--	and [name] = ''NAP''
	--	and lpgmtyp in (''ACT'',''ACE'')
	--	and PS.idnum = BOPEXT.policyID)))))
		--,


AE_Revenues = 
--(isnull(
    (select CM.Exposure --varchar(4000)
	from PriceMonitorSystem..PriceMonitorBaseDataAE CM
	where PS.policynumber = CM.policynumber
	and SnapShotType=''E'')
	--,

	--	(select top 1 Path.Exposure --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_AE  Path
	--	where PS.policynumber = Path.policynumber)))
		,

AE_Prior_Years = 
--(isnull(
    (select CM.prioryears --varchar(4000)
	from PriceMonitorSystem..PriceMonitorBaseDataAE CM
	where PS.policynumber = CM.policynumber
	and SnapShotType=''E'')
	--,

	--	(select top 1 Path.PriorYears  --varchar(200)
	--	from PriceMonitorLegacy.dbo.PATH_GLBI_AE  Path
	--	where PS.policynumber = Path.policynumber)))
from Act_Detailed_Experience.dbo.Policy_Information_AE_work PS





------------------------------------------------------------------------
/***********Step 2**********/

update Act_Detailed_Experience.dbo.Policy_Information_AE_work 
set 
	AE_Revenue_Per_Accountant = (case
		when AE_Num_of_Accountants is Null or AE_Num_of_Accountants = 0 or AE_Revenues is null 
		then Null
		else AE_Revenues / AE_Num_of_Accountants
		end)
		
from Act_Detailed_Experience.dbo.Policy_Information_AE_work PS

------------------------------------------------------------------------
/***********Step 3**********/

update Act_Detailed_Experience.dbo.Policy_Information_AE_work 
set 
AE_Num_of_Accountants_Range = (case
		when AE_Num_of_Accountants is Null then ''a: No Data''
		when AE_Num_of_Accountants = 0 then ''b: No Employees''
		when AE_Num_of_Accountants <= 5 then ''c: 1 to 5''
		when AE_Num_of_Accountants <= 15 then ''d: 6 to 15''
		when AE_Num_of_Accountants <= 25 then ''e: 16 to 25''
		when AE_Num_of_Accountants <= 100 then ''f: 26 to 100''
		else ''g: 100+ Employees''
		end),

AE_Limit_Trim = (
case when AE_Limit = ''1,000,000/1,000,000'' then ''$1,000,000/$1,000,000''
when AE_Limit = ''1,000,000/2,000,000'' then ''$1,000,000/$2,000,000''
when AE_Limit = ''10,000,000/10,000,000'' then ''$10,000,000/$10,000,000''
when AE_Limit = ''100,000/300,000'' then ''$  100,000/$300,000''
when AE_Limit = ''2,000,000/2,000,000'' then ''$2,000,000/$2,000,000''
when AE_Limit = ''2,000,000/4,000,000'' then ''$2,000,000/$4,000,000''
when AE_Limit = ''250,000/250,000'' then ''$  250,000/$250,000''
when AE_Limit = ''250,000/500,000'' then ''$  250,000/$500,000''
when AE_Limit = ''3,000,000/3,000,000'' then ''$3,000,000/$3,000,000''
when AE_Limit = ''4,000,000/4,000,000'' then ''$4,000,000/$4,000,000''
when AE_Limit = ''5,000,000/5,000,000'' then ''$5,000,000/$5,000,000''
when AE_Limit = ''500,000/1,000,000'' then ''$  500,000/$1,000,000''
when AE_Limit = ''500,000/500,000'' then ''$  500,000/$500,000''
when AE_Limit = ''6,000,000/6,000,000'' then ''$6,000,000/$6,000,000''
when AE_Limit = ''7,000,000/7,000,000'' then ''$7,000,000/$7,000,000''
when AE_Limit = ''8,000,000/8,000,000'' then ''$8,000,000/$8,000,000''
else AE_Limit end),

AE_Limit_Type_Trim = (
case when AE_Limit_Type = ''FirstDollar'' then ''FIRST DOLLAR OF DEFENSE''
when AE_Limit_Type = ''InsideLimit'' then ''EXPENSES INSIDE THE LIMIT''
when AE_Limit_Type = ''OutsideLimit'' then ''EXPENSES IN ADDITION TO LIMIT''
when AE_Limit_Type = '''' or AE_Limit_Type is null or AE_Limit_Type like ''%blank%'' then ''(blank)''
else AE_Limit_Type end),

AE_Years_Prior_to_Retro = (case
		when AE_Prior_Years = ''4+''  or AE_Prior_Years like ''%4 PLUS%'' then ''4 PLUS''
		else AE_Prior_Years end),

AE_Program_Type = 	(case when AE_Revenues is null and AE_Accountant_Type is null
			then ''Enrolled Agents''
			else ''Accounting Firms'' end),

AE_Revenues_range = 
		(case
		when AE_Revenues is Null then ''a: No Data''
		when AE_Revenues < 100000 then ''b: 0 to $100k''
		when AE_Revenues < 500000 then ''c: $100k to $500k''
		when AE_Revenues < 800000 then ''d: $500k to $800k''
		when AE_Revenues < 1250000 then ''e: $800k to $1.25M''
		when AE_Revenues < 5000000 then ''f: $1.25M to $5M''
		when AE_Revenues < 10000000 then ''g: $5M to $10M''
		else ''h: $10M or more''
		end),

AE_Revenue_Per_Accountant_Range = (case
		when AE_Revenue_Per_Accountant is Null or AE_Revenue_Per_Accountant = 0 then ''a: No Data''
		when AE_Revenue_Per_Accountant <= 50000 then ''b: <= $50k''
		when AE_Revenue_Per_Accountant <= 100000 then ''c: $50k to $100k''
		when AE_Revenue_Per_Accountant <= 150000 then ''d: $100k to $150k''
		when AE_Revenue_Per_Accountant <= 200000 then ''e: $150k to $200k''
		else ''f: > $200k''
		end)
		
from Act_Detailed_Experience.dbo.Policy_Information_AE_work PS



update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)









' 
END
GO
