IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_4_Policy_Information]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_4_Policy_Information]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_4_Policy_Information]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE procedure [dbo].[usp_Step_4_Policy_Information]

as

-- Revision #1
-- FootPrints Ticket #62874
-- Revisor:	Erik Godfrey
-- Revision Date: 11/8/2012
-- Revision Description: Add Endorsement HS014, HS003, and HS003D

-- Revision #2
-- FootPrints Ticket #66083
-- Revisor: Erik Godfrey
-- Revision Date: 1/14/2013
-- Revision Description: Add changes to ranges for Products CL and AE
--                       for field Written_Premium_Range_for_Product

-- Revision #3
-- FootPrints Ticket #65106
-- Revisor: Erik Godfrey
-- Revision Date: 1/31/2013
-- Revision Description: Changed Written_Premium_Range_for_Product ranges
--                       for Products PV, FF, CL, and AE

-- Revision #4
-- FootPrints Ticket #50732
-- Revisor: Steve Breisch
-- Revision Date: 6/17/2013
-- Revision Description: Changed Written_Premium_Range_for_Product ranges
--                       for Products DF

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

/*Policy Information*/


CREATE TABLE #Policy_Information_ALL_POLICIES (
	[accountnumber] [int] NULL,
	[Productcode] [varchar](50) NULL,
	[policynumber] [varchar](15) NULL,
	[policyEffectivedate] [datetime] NULL,
	[maxeffdate] [datetime] NULL,
	[policyid] [int] NULL,
	[Account_Name] [varchar](100) NULL,
	[Insured_Name] [varchar](100) NULL,
	[Property_Coverage_Form] [varchar](50) NULL,
	[Primary_Umbrella] [varchar](50) NULL,
	[underwriterPID] [int] NULL,
	[Companycode] [varchar](2) NULL,
	[billplancode] [varchar](10) NULL,
	[product_group] [nvarchar](255) NULL,
	[package_monoline] [nvarchar](255) NULL,
	[policy_effective_year] [int] NULL,
	[policy_effective_month] [int] NULL,
	[policyexpirationdate] [datetime] NULL,
	[canceldate] [datetime] NULL,
	[reinstatementdate] [datetime] NULL,
	[Prior_Policy_number] [varchar](15) NULL,
	[New_Renew_Tail] [varchar](1) NULL,
	[Branchcode] [varchar](3) NULL,
	[Renew_New_Auto] [varchar](50) NULL,
	[FAY_For_Review] [int] NULL,
	[underwriter] [varchar](50) NULL,
	[BillplanshortDesc] [varchar](10) NULL,
	[zipcode] [varchar](10) NULL,
	[Branch_Office] [varchar](50) NULL,
	[Branch_Region] [varchar](50) NULL,
	[East_MidWest_West_Region] [varchar](50) NULL,
	[program] [varchar](255) NULL,
	[NAICS] [varchar](7) NULL,
	[Program_Code] [nvarchar](50) NULL,
	[First_Policy_Year_Temp] [datetime] NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[Inforce_as_of_Cat_Model_Date] [varchar](50) NULL,
	[First_Policy_Year] [varchar](13) NULL,
	[written_premium_policy] [float] NULL,
	[County] [nvarchar](511) NULL,
	[County_Pop_Density] [float] NULL,
	[Term_factor] [float] NULL,
	[Latest_PY] [varchar](9) NULL,
	[Business_Name] [nvarchar](100) NULL,
	[Business_Desc] [char](72) NULL,
	[Written_Premium_Range_for_Product] [varchar](50) NULL,
	[Written_Premium_Range] [varchar](50) NULL,
	[County_Pop_Density_Range] [varchar](50) NULL,
	[Number_of_Renewals] [int] NULL,
	[Renewals_Range] [varchar](20) NULL,
	[prior_policynumber_2] [varchar](15) NULL,
	[prior_policynumber_3] [varchar](15) NULL,
	[prior_policynumber_4] [varchar](15) NULL,
	[prior_policynumber_5] [varchar](15) NULL,
	[prior_policynumber_6] [varchar](15) NULL,
	[prior_policynumber_7] [varchar](15) NULL,
	[prior_policynumber_8] [varchar](15) NULL,
	[New_Renew_Automatic_Prior_Policy] [varchar](50) NULL,
	[New_Renew_Automatic_Prior_Policy_2] [varchar](50) NULL,
	[New_Renew_Automatic_Prior_Policy_3] [varchar](50) NULL,
	[New_Renew_Automatic_Prior_Policy_4] [varchar](50) NULL,
	[New_Renew_Automatic_Prior_Policy_5] [varchar](50) NULL,
	[PIC_Producer_code] [int] NULL,
	[PIC_Commission_pct] [float] NULL,
	[Primary_Producer_code] [int] NULL,
	[Primary_Commission_pct] [float] NULL,
	[PIC_Producer] [varchar](100) NULL,
	[PIC_Producer_type] [varchar](50) NULL,
	[Primary_Producer] [varchar](100) NULL,
	[Primary_Producer_type] [varchar](50) NULL,
	[Commission_pct] [float] NULL,
	[Count_of_Account_Numbers] [float] NULL,
	[Count_of_Account_Numbers_Range] [varchar](50) NULL,
	[Account_UltLoss] [float] NULL,
	[Account_UltLoss_NonCat] [float] NULL,
	[Account_RepLoss] [float] NULL,
	[Account_RepLoss_NonCat] [float] NULL,
	[Account_EarnedPremium] [float] NULL,
	[Account_UltLoss_priorpolperiods] [float] NULL,
	[Account_UltLoss_NonCat_priorpolperiods] [float] NULL,
	[Account_RepLoss_priorpolperiods] [float] NULL,
	[Account_RepLoss_NonCat_priorpolperiods] [float] NULL,
	[Account_EarnedPremium_priorpolperiods] [float] NULL,
	[Account_UltLoss_Working_Cover] [float] NULL,
	[Account_UltLoss_NonCat_Working_Cover] [float] NULL,
	[Account_RepLoss_Working_Cover] [float] NULL,
	[Account_RepLoss_NonCat_Working_Cover] [float] NULL,
	[Account_EarnedPremium_Working_Cover] [float] NULL,
	[Account_UltLoss_Working_Cover_priorpolperiods] [float] NULL,
	[Account_UltLoss_NonCat_Working_Cover_priorpolperiods] [float] NULL,
	[Account_RepLoss_Working_Cover_priorpolperiods] [float] NULL,
	[Account_RepLoss_NonCat_Working_Cover_priorpolperiods] [float] NULL,
	[Account_EarnedPremium_Working_Cover_priorpolperiods] [float] NULL,
	[Account_Premium_latest_year] [int] NULL,
	[Account_Premium_range] [varchar](50) NULL,
	[Account_written_premium_for_product] [float] NULL,
	[Account_written_premium_for_product_max] [float] NULL,
	[Account_Dominant_Product] [varchar](50) NULL,
	[Account_Dominant_Product_Group] [varchar](50) NULL,
	[Account_Dominant_Product_policy_premium_max] [float] NULL,
	[Account_Dominant_Policy] [varchar](15) NULL,
	[Dominant_Policy_max_effdate] [datetime] NULL,
	[Review_quarter] [int] NULL,
	[Account_UltLoss_Ratio] [float] NULL,
	[Account_UltLoss_Ratio_NonCat] [float] NULL,
	[Account_RepLoss_Ratio] [float] NULL,
	[Account_RepLoss_Ratio_NonCat] [float] NULL,
	[Account_UltLoss_Ratio_Working_Cover] [float] NULL,
	[Account_UltLoss_Ratio_nonCat_Working_Cover] [float] NULL,
	[Account_RepLoss_Ratio_Working_Cover] [float] NULL,
	[Account_RepLoss_Ratio_nonCat_Working_Cover] [float] NULL,
	[Account_UltLoss_Ratio_priorpolperiods] [float] NULL,
	[Account_UltLoss_Ratio_NonCat_priorpolperiods] [float] NULL,
	[Account_RepLoss_Ratio_priorpolperiods] [float] NULL,
	[Account_RepLoss_Ratio_NonCat_priorpolperiods] [float] NULL,
	[Account_UltLoss_Ratio_Working_Cover_priorpolperiods] [float] NULL,
	[Account_UltLoss_Ratio_nonCat_Working_Cover_priorpolperiods] [float] NULL,
	[Account_RepLoss_Ratio_Working_Cover_priorpolperiods] [float] NULL,
	[Account_RepLoss_Ratio_nonCat_Working_Cover_priorpolperiods] [float] NULL,
	[Account_UltLoss_Ratio_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_NonCat_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_NonCat_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_priorpolperiods_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_NonCat_priorpolperiods_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_priorpolperiods_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_NonCat_priorpolperiods_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_Working_Cover_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_NonCat_Working_Cover_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_Working_Cover_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_NonCat_Working_Cover_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range] [varchar](50) NULL,
	[Endorsement_VS_001] [varchar](50) NULL,
	[PVCD_Amendment_End_Y_N] [varchar](50) NULL,
	[PVCD_Partnership_End_Y_N] [varchar](50) NULL,
	[PVCD_ProPak_Elite72_End_Y_N] [varchar](50) NULL,
	[PVCD_ProPak_Elite73_End_Y_N] [varchar](50) NULL,
	[PVCD_ProPak_Elite_Vermont7273_End_Y_N] [varchar](50) NULL,
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
	[PVCD_Manuscript_Endorsement_End_Y_N] [varchar](50) NULL,
	[PVCD_Election_ERP_End_Y_N] [varchar](50) NULL,
	[PVCD_Delete_Consent_End_Y_N] [varchar](50) NULL,
	[PVCD_Damages_Only_Retention_End_Y_N] [varchar](50) NULL,
	[PVCD_Class_Action_Sublimit_SubRetention_End_Y_N] [varchar](50) NULL,
	[Endorsement_MOLL] [varchar](50) NULL,
	[Endorsement_MOLL_YN] [varchar](2) NULL,
	[Endorsement_HS_009] [varchar](50) NULL,
	[Endorsement_HS_013] [varchar](50) NULL,
	[Endorsement_HS_014] [varchar](50) NULL,
	[Endorsement_HS_003] [varchar](50) NULL,
	[Endorsement_HS_003D] [varchar](50) NULL,
	[Endorsement_HS_004] [varchar](50) NULL,
	[Endorsement_GLDX] [varchar](50) NULL,
	[Endorsement_GLDX_YN] [varchar](2) NULL,
	[Endorsement_DY_CG2504] [varchar](50) NULL,
	[Endorsement_FA_Elite] [varchar](50) NULL,
	[Endorsement_Elite_YN] [varchar](2) NULL,
	[Endorsement_CG0001] [varchar](6) NULL,
	[Endorsement_CG0002] [varchar](6) NULL,
	[Source_Detail_Name] [varchar](50) NULL,
	[BusinessClassDesc] [varchar](75) NULL,
	[ProductType] [varchar](1) NULL,
	[DivisionName] [varchar](50) NULL,
	[PolicyEntityState] [varchar](2) NULL
	)

insert into #Policy_Information_ALL_POLICIES
(		accountnumber,
		Productcode,
		policynumber,
		policyEffectivedate,
		maxeffdate)
select   
		accountnumber,
		Productcode,
		policynumber,
		policyEffectivedate,
		policyEffectivedate as maxeffdate
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work
group by accountnumber, productcode, policynumber, policyEffectivedate;
		
/* Taken from step 4a to remove duplicates */

with Re_maxeffdate(policynumber,maxeffdate)
as(
	select 
	policynumber, max(maxeffdate) as maxeffdate
	from #Policy_Information_ALL_POLICIES
	group by policynumber
)
update #Policy_Information_ALL_POLICIES 
set
maxeffdate = md.maxeffdate
from #Policy_Information_ALL_POLICIES POL
left outer join re_maxeffdate md
on md.policynumber = pol.policynumber

update #Policy_Information_ALL_POLICIES 
set
policyeffectivedate = maxeffdate
from #Policy_Information_ALL_POLICIES POL
where policyeffectivedate is null

select distinct *
into #Policy_Information_ALL_POLICIES_temp
from #Policy_Information_ALL_POLICIES POL

drop table #Policy_Information_ALL_POLICIES

/* End step 4a */

create index IX_accountnumber 
on #Policy_Information_ALL_POLICIES_temp
(accountnumber);

create index IX_policynumber 
on #Policy_Information_ALL_POLICIES_temp
(policynumber);


--------------------------------------------------------------------------------


with #Account_Name (
	Accountnumber, 
	Account_Name
) as (
	SELECT 
		p.Accountnumber as Accountnumber,
		na.busname as Account_Name
	FROM accessphlyeom.dbo.nameaddress as na
	INNER JOIN accessphlyeom.dbo.accountlead as a
    ON na.addrid = a.accountaddrid
    INNER JOIN accessphlyeom.dbo.policy as p
    ON p.accountnumber = a.accountnumber)
update #Policy_Information_ALL_POLICIES_temp 
set
Account_Name = AN.Account_Name
from #Policy_Information_ALL_POLICIES_temp PS
left join #Account_Name AN
on An.accountnumber = PS.accountnumber;



-------------------------------------------------
with #Account_data (
	Accountnumber,
	Account_Min_effectivedate
) as (
select
	Accountnumber,
	min(effectivedate)  as Account_Min_effectivedate
from Accessphlyeom.dbo.policy PSx
group by
	Accountnumber
)
update #Policy_Information_ALL_POLICIES_temp 
set
First_Policy_Year_Temp = AD.Account_Min_effectivedate,
First_Policy_Year = (case
	when year(AD.Account_Min_effectivedate) > 2006 
	then convert(varchar(4),year(AD.Account_Min_effectivedate))
	else ''Prior to 2006'' 
	end)
from #Policy_Information_ALL_POLICIES_temp PS
left join #Account_data AD
on AD.accountnumber = PS.accountnumber;



------------------------------------------
-- Policy Data
with #Policy_data (
	policynumber,
	PolicyEffectivedate,
	Policyexpirationdate,
	insuredaddrid,
	underwriterPID,
	companycode,
	prevpolicynumber,
	programcode,
	branchcode,
	pathtype,
	SICcode,
	reinstatementdate,
	canceldate
) as (
select
	policynumber,
	Effectivedate as policyEffectivedate,
	max(expirationdate) as Policyexpirationdate,
	insuredaddrid,
	underwriterPID,
	companycode,
	prevpolicynumber,
	programcode,
	branchcode,
	pathtype,
	SICcode,
	max(reinstatementdate) as Reinstatementdate,
	max(canceldate) as Canceldate
from Accessphlyeom.dbo.policy PSx
group by
	policynumber,
	insuredaddrid,
	Effectivedate,
	underwriterPID,
	companycode,
	prevpolicynumber,
	branchcode,
	programcode,
	pathtype,
	SICcode,
	insuredaddrid
)
update #Policy_Information_ALL_POLICIES_temp 
set
Insured_Name = (
	select distinct busname
	from accessphlyeom.dbo.nameaddress as NA
	where NA.addrid = pol.insuredaddrid),
underwriterPID = pol.underwriterPID,
underwriter = (
	select distinct ltrim(rtrim(e.lastname))+'', ''+ltrim(rtrim(e.firstname))
    from Accessphlyeom.dbo.GBLEmployee e
	where e.personid = Pol.underwriterPID),
companycode = pol.companycode ,
policyexpirationdate =  pol.policyexpirationdate,
canceldate = pol.canceldate,
reinstatementdate = pol.reinstatementdate,
Term_Factor = round((case
	when pol.canceldate is null or pol.canceldate = 0
	then isnull(cast((pol.policyexpirationdate
		 - pol.policyeffectivedate) as float)/365,1)
	else (case
		when pol.reinstatementdate is null
		then isnull(cast((pol.canceldate
			- pol.policyeffectivedate) as float)/365,1)
		else (case
			when pol.reinstatementdate >= pol.canceldate
			then isnull(cast((pol.policyexpirationdate
				- pol.policyeffectivedate) as float)/365,1)
			else isnull(cast((pol.canceldate
			- pol.policyeffectivedate) as float)/365,1)
			end)
		end)
	end),2),
Prior_Policy_number = pol.prevpolicynumber,
New_Renew_Tail = (case
	when UPPER(RIGHT(RTRIM(PS.policynumber), 1)) = ''T'' 
	then ''T'' 
	else (case 
		when left(LTRIM(RTRIM(pol.prevpolicynumber)),1) in ('''' ,''N'')
		then ''N'' 
		else ''R'' 
		end) 
	end),
Branchcode = pol.branchcode,
Branch_Office= (
	select distinct branchdesc
	from accessphlyeom.dbo.branch B
	where Pol.branchcode = B.branchcode),
Branch_Region =	(
	select distinct regiondesc
	from accessphlyeom.dbo.region R
	where R.regioncode = (
		select distinct regioncode
		from AccessPHLYEOM.dbo.branch bo
		where bo.branchcode = 	Pol.Branchcode)),
NAICS = Pol.SICcode,
Program_Code = pol.ProgramCode,
Program = (
	select distinct PG.programdesc
	from Accessphlyeom.dbo.program PG
	where Pol.ProgramCode = PG.Programcode),
Renew_New_Auto = (
	select pt.typedesc
	from AccessPHLYEOM.dbo.pathtype pt
	where pt.[type] = pol.pathtype),
PolicyEntityState = (
      select distinct statecode
      from accessphlyeom.dbo.nameaddress as NA
      where NA.addrid = pol.insuredaddrid)
from #Policy_Information_ALL_POLICIES_temp PS
left join #Policy_data POL
on POL.policynumber = PS.policynumber;



------------------------------------------
-- AQS V3 Policy Data
with #AQS3_data (
	policynumber,
	policyid
) as (
select
	lpolnum as policynumber,
	MAX(pp.policyid) as policyid
FROM PI_AQS_Policy_Prod.dbo.polpolmfl pp with (nolock)
INNER JOIN PI_AQS_SYSTEM_Prod.dbo.wrkActivity wrk with (nolock)
on pp.policyid = wrk.actpolicyid 
WHERE pp.nexpnum=0
	AND wrk.act_wstID = 11
GROUP BY pp.LPOLNUM
)
update #Policy_Information_ALL_POLICIES_temp 
set
policyid = Pol.policyid
from #Policy_Information_ALL_POLICIES_temp PS
left join #AQS3_data POL
on POL.policynumber = PS.policynumber;




-- AQS V2 Policy Data
with #AQS2_data (
	policynumber,
	policyid
) as (
select
	lpolnum as policynumber,
	MAX(pol.kstokey) as policyid
FROM PICPFN01.aqs .mssnm1polpol pol  
WHERE pol.nexpnum=0
group by lpolnum
)
update #Policy_Information_ALL_POLICIES_temp 
set
policyid = Pol.policyid
from #Policy_Information_ALL_POLICIES_temp PS
left join #AQS2_data POL
on POL.policynumber = PS.policynumber
where PS.policyid is null;



-------------------------------------------------
with #BillPlan (
	policynumber,
	policyeffectivedate,
	billplancode
) as (
select  
	policynumber,
	effectivedate as policyeffectivedate,
	billplancode
from AccessPHLYEOM.dbo.policybillplan BP2
where billplanrevseq = 0
group by 
	policynumber,
	effectivedate,
	billplancode
)
update #Policy_Information_ALL_POLICIES_temp 
set
billplancode = BP.billplancode,
BillplanshortDesc = (
	select distinct BP1.billplanshortdesc
	from AccessPHLYEOM.dbo.billplan BP1
	where BP.billplancode = BP1.billplancode)
from #Policy_Information_ALL_POLICIES_temp PS
left join #BillPlan BP
on BP.policynumber = PS.policynumber
	and BP.policyeffectivedate = PS.policyeffectivedate;



-------------------------------------------------
with #PremSum(
	Policynumber,
	Property_Coverage_Form,
	Last_Reporting_Year,
	Last_Reporting_Month,
	Written_Premium_Policy
) as (
select
	policynumber,
	IsNull(
	(	select distinct coverage_form
		from Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work PS3
		where PS3.Coverage_Form =''UC''
			and PS2.policynumber = PS3.Policynumber),
	''ISO'') as Property_Coverage_Form,
	max(Last_Reporting_Year) as Last_Reporting_Year,
	max(Last_Reporting_Month) as Last_Reporting_Month,
	sum(currentwrittenpremium) as Written_Premium_Policy
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work PS2
group by policynumber)
update #Policy_Information_ALL_POLICIES_temp 
set
FAY_For_Review = PS2.Last_Reporting_Year,
Property_Coverage_Form = PS2.Property_Coverage_Form,
Written_Premium_Policy = PS2.Written_Premium_Policy,
Last_Reporting_Year = PS2.Last_Reporting_Year,
Last_Reporting_Month = PS2.Last_Reporting_Month
from #Policy_Information_ALL_POLICIES_temp PS
left join #PremSum PS2
on PS2.policynumber = PS.policynumber;




-------------------------------------------------
with #PolLoc (
	policynumber,
	zipcode
) as (
select distinct  
	policynumber,
	left(rtrim(ltrim(Polloc.zip)),5) as zipcode
from accessphlyeom.dbo.policylocation Polloc
where Polloc.zip is not null
group by
	policynumber,
	zip
	)
update #Policy_Information_ALL_POLICIES_temp 
set
zipcode = PolLoc.zipcode,
County = (
	select distinct top 1 CPD.State+''_''+CPD.County
	from Act_Definitions.dbo.State_County_City_ZIP_PopDen CPD
	where PolLoc.zipcode = CPD.ZIP),
County_Pop_Density = (
	select distinct CPD.Cty_Pop_Density
	from Act_Definitions.dbo.State_County_City_ZIP_PopDen CPD
	where left(PolLoc.zipcode,5) = CPD.ZIP)
from #Policy_Information_ALL_POLICIES_temp PS
left join #PolLoc Polloc
on POLloc.policynumber = PS.policynumber;





-------------------------------------------------
declare @Inforce_as_of_Cat_Model_Date as varchar (10)
set @Inforce_as_of_Cat_Model_Date = (select Inforce_as_of_Cat_Model_Date from Detailed_Experience_Parameters)

update #Policy_Information_ALL_POLICIES_temp 
set
policy_effective_year = year(policyEffectivedate),
policy_effective_month = month (policyEffectivedate),
East_MidWest_West_Region = ( case 
		when Branch_Region in (''Northeast'',''Metro'',''Mid Atlantic'',''Southeast'',''Florida'',''House'') then ''East''
		when Branch_Region in (''Central'',''North Central'',''Ohio Valley'',''South West'') then ''Midwest''
		when Branch_Region in (''West'',''Northwest'',''Sunbelt'',''Rocky Mountain'') then ''West''
		when Branch_Region in (''NE'',''M'',''MA'',''SE'',''FL'',''H'') then ''East''
		when Branch_Region in (''C'',''NC'',''OV'',''SW'') then ''Midwest''
		when Branch_Region in (''W'',''NW'',''SB'',''RM'') then ''West''
		else ''Other''
		end),
Inforce_as_of_Cat_Model_Date = (case
	when policyeffectivedate <= @Inforce_as_of_Cat_Model_Date
		and policyexpirationdate > @Inforce_as_of_Cat_Model_Date
		and (canceldate = ''1/1/1900'' or canceldate > @Inforce_as_of_Cat_Model_Date
			or (reinstatementdate <= @Inforce_as_of_Cat_Model_Date and canceldate <= reinstatementdate))
	then ''Inforce at ''+@Inforce_as_of_Cat_Model_Date
	else ''''
	end),
Term_Factor = round((case
	when canceldate is null or canceldate = 0
	then isnull(cast((policyexpirationdate - policyeffectivedate) as float)/365,1)
	when reinstatementdate is null
	then isnull(cast((canceldate - policyeffectivedate) as float)/365,1)
	when reinstatementdate >= canceldate
	then isnull(cast((policyexpirationdate - policyeffectivedate) as float)/365,1)
	else isnull(cast((canceldate - policyeffectivedate) as float)/365,1)
	end),2),
Product_Group = 
		(select distinct PG.Product_Group
			from Act_Definitions.dbo.Product_Groups_MIPS PG
			where PS.PRoductcode = PG.MIPS_Product),
Primary_Umbrella = 
		(select distinct PG.Primary_Umbrella
			from Act_Definitions.dbo.Product_Groups_MIPS PG
			where PS.PRoductcode = PG.MIPS_Product),
Package_Monoline = 
		(select distinct PG.Package_Monoline
		from Act_Definitions.dbo.Product_Groups_MIPS PG
		where PS.PRoductcode = PG.MIPS_Product)
from #Policy_Information_ALL_POLICIES_temp PS;








-----------------------------------------------------------------------------------


update #Policy_Information_ALL_POLICIES_temp 
set
	Latest_PY = (case
		when year(policyeffectivedate)*100+month(policyeffectivedate) > (Last_Reporting_Year-1) * 100 + Last_Reporting_Month
			and year(policyeffectivedate)*100+month(policyeffectivedate) <= Last_Reporting_Year * 100 + Last_Reporting_Month
		Then ''Latest PY''
		else ''''
		end),
	Business_Name = (
		select distinct nam.LINSPRINAM
		from PI_AQS_Policy_Prod.dbo.POLNAMMFL nam
		where nexpnum = 0 
			and nam.policyID = PS.policyid),
	Business_Desc = ltrim(rtrim((isnull(
		(select distinct V2.LCdedta2
		from PICPFN01.aqs .mssnm1polPLC V2
		where v2.kstokey=PS.policyid
			and v2.nexpnum =0
			and V2.LCdedta2 is not null),
		(isnull(
			(select distinct V3.Lbusdes
			from PI_AQS_POLICY_PROD.dbo.polpolv3xmfl V3
			where v3.policyid=PS.policyid
				and v3.nexpnum =0
				and V3.Lbusdes is not null),
		''''))))))

from #Policy_Information_ALL_POLICIES_temp PS;






/**********Step 4**********/


update #Policy_Information_ALL_POLICIES_temp
set		
	Written_Premium_Range_for_Product = (case 
		when Productcode = ''NP'' then (case
			when Written_Premium_Policy is null then ''a: no data''
			when Written_Premium_Policy < 5000 then ''b: less than $5k''
			when Written_Premium_Policy	< 20000 then ''c: $5k to $20k''
			when Written_Premium_Policy < 50000 then ''d: $20k to $50k''
			else ''e: over $50k'' 
			end)
		when Productcode = ''RL'' then (case
			when Written_Premium_Policy is null then ''a: no data''
			when Written_Premium_Policy < 10000 then ''b: less than $10k''
			when Written_Premium_Policy	< 20000 then ''c: $10k to $20k''
			when Written_Premium_Policy < 50000 then ''d: $20k to $50k''
			when Written_Premium_Policy < 150000 then ''e: $50k to $150k''
			when Written_Premium_Policy < 500000 then ''f: $150k to $500k''
			else ''g: over $500k'' 
			end)
		when Productcode = ''HF'' then (case
            when Written_Premium_Policy is null then ''a: no data''
            when Written_Premium_Policy < 5000 then ''b: less than $5k''
            when Written_Premium_Policy   < 10000 then ''c: $5k to $10k''
            when Written_Premium_Policy < 15000 then ''d: $10k to $15k''
            when Written_Premium_Policy < 20000 then ''e: $15k to $20k''
            when Written_Premium_Policy < 25000 then ''f: $20k to $25k''
            when Written_Premium_Policy < 50000 then ''g: $25k to $50k''
            when Written_Premium_Policy < 150000 then ''h: $50k to $150k''
            when Written_Premium_Policy < 500000 then ''i: $150k to $500k''
            else ''j: over $500k'' 
            end)
		when Productcode = ''VS'' then (case
			when Written_Premium_Policy is null then ''e: no data''
			when Written_Premium_Policy < 15000 then ''a: less than $15k''
			when Written_Premium_Policy	< 50000 then ''b: $15k to $50k''
			when Written_Premium_Policy < 100000 then ''c: $50k to $100k''
			else ''d: over $100k'' 
			end)
-- Commented out as Part of Revision #2
		--when Productcode = ''PV'' then (case
		--	when Written_Premium_Policy is null then ''a: no data''
		--	when Written_Premium_Policy < 2500 then ''b: less than $2,500''
		--	when Written_Premium_Policy < 5000 then ''c: $2,500 to $5k''
		--	when Written_Premium_Policy < 10000 then ''d: $5k to $10k'' 
		--	when Written_Premium_Policy < 15000 then ''e: $10k to $15k'' 
		--	when Written_Premium_Policy < 20000 then ''f: $15k to $20k'' 
		--	when Written_Premium_Policy < 25000 then ''g: $20k to $25k'' 
		--	when Written_Premium_Policy < 35000 then ''h: $25k to $35k'' 
		--	when Written_Premium_Policy < 50000 then ''i: $35k to $50k'' 
		--	else ''j: over $50k''
		--	end)		
		--when Productcode = ''FF'' then (case
		--	when Written_Premium_Policy is null then ''a: no data''
		--	when Written_Premium_Policy < 2500 then ''b: less than $2,500''
		--	when Written_Premium_Policy < 5000 then ''c: $2,500 to $5k''
		--	when Written_Premium_Policy < 10000 then ''d: $5k to $10k'' 
		--	when Written_Premium_Policy < 15000 then ''e: $10k to $15k'' 
		--	when Written_Premium_Policy < 20000 then ''f: $15k to $20k'' 
		--	when Written_Premium_Policy < 25000 then ''g: $20k to $25k'' 
		--	when Written_Premium_Policy < 35000 then ''h: $25k to $35k'' 
		--	when Written_Premium_Policy < 50000 then ''i: $35k to $50k'' 
		--	else ''j: over $50k''
		--	end)
-- End of code Commented out as Part of Revision #2

-- Code added as part of Revision #2
-- Code changed for Revision #4 - Added productcode DF
		when Productcode in(''PV'',''FF'',''CL'',''AE'', ''DF'') then (case
            when Written_Premium_Policy is null then ''a: no data''
            when Written_Premium_Policy < 2500  then ''b: less than $2.5k''
            when Written_Premium_Policy < 5000  then ''c: $2.5k to $5k''
            when Written_Premium_Policy < 7500  then ''d: $5k to $7.5k''
            when Written_Premium_Policy < 10000 then ''e: $7.5k to $10k'' 
            when Written_Premium_Policy < 15000 then ''f: $10k to $15k'' 
            when Written_Premium_Policy < 20000 then ''g: $15k to $20k'' 
            when Written_Premium_Policy < 25000 then ''h: $20k to $25k'' 
            when Written_Premium_Policy < 35000 then ''i: $25k to $35k'' 
            when Written_Premium_Policy < 50000 then ''j: $35k to $50k'' 
            else ''k: over $50k''
			end)		
-- End of Code added as part of Revision #2

		else (case
			when Written_Premium_Policy is null then ''a: no data''
			when Written_Premium_Policy < 5000 then ''b: less than $5k''
			when Written_Premium_Policy	< 20000 then ''c: $5k to $20k''
			when Written_Premium_Policy < 50000 then ''d: $20k to $50k''
			else ''e: over $50k'' 
			end)
		end),
	Written_Premium_Range = (case 
		when Written_Premium_Policy is null then ''a: no data''
		when Written_Premium_Policy < 5000 then ''b: less than $5k''
		when Written_Premium_Policy	< 20000 then ''c: $5k to $20k''
		when Written_Premium_Policy < 50000 then ''d: $20k to $50k''
		else ''e: over $50k'' 
		end),
	County_Pop_Density_range = (case
		when County_Pop_Density is Null then ''a: No Data''
		when County_Pop_Density < 500 then ''b: Rural (Pop Den < 500 psm)''
		when County_Pop_Density < 1000 then ''c: Semi-Suburban (Pop Den 500 to 1,000 psm)''
		when County_Pop_Density <= 2000 then ''d: Suburban (Pop Den 1,000 to 2,000 psm)''
		when County_Pop_Density <= 5600 then ''e: Urban (Pop Den 1000 to 5,600 psm)''
		else ''f: Metropolitan (Pop Den > 5,600 psm)''
		end)
from #Policy_Information_ALL_POLICIES_temp PS;


select distinct ps.PolicyNumber, esd.SourceDetailName 
into #SourceDetailName
from 
PathNet2..PolicySnapshot ps with (nolock)
inner join PathNet2..EntitySourceDetail esd with (nolock)
on  ps.SourceDetailID = esd.SourceDetailID
where SourceDetailName!=''Not Applicable'' and SourceDetailName is not null
and ps.PolicyNumber is not null
 and (exists
 (select 1 from PathNet2..PathTransaction pt with (nolock)
join PathNet2..TransactionType tt with (nolock) on pt.TransactionTypeID=tt.TransactionTypeID
where TransactionTypeName in (''New'',''Renewal'',''Automatic'') and ps.TransactionID=pt.TransactionID)
or not exists
(select 1 from PathNet2..PolicySnapshot ps2 with (nolock)
join PathNet2..EntitySourceDetail esd2 with (nolock)
on  ps2.SourceDetailID = esd2.SourceDetailID
where esd2.SourceDetailName!=''Not Applicable'' and esd2.SourceDetailName is not null
and ps2.PolicyNumber=ps.PolicyNumber and esd2.SourceDetailName!=esd.SourceDetailName))
 
 
select distinct ps.PolicyNumber,  bc.Description
into #BusinessClass 
from 
PathNet2..PolicySnapshot ps with (nolock)
inner join PathNet2..BusinessClass bc with (nolock) on ps.BusinessClassID=bc.BusinessClassID
where ps.PolicyNumber is not null and bc.Description is not null
  and (exists
 (select 1 from PathNet2..PathTransaction pt 
join PathNet2..TransactionType tt on pt.TransactionTypeID=tt.TransactionTypeID
where TransactionTypeName in (''New'',''Renewal'',''Automatic'') and ps.TransactionID=pt.TransactionID)
or not exists
(select 1 from PathNet2..PolicySnapshot ps2 with (nolock)
inner join PathNet2..BusinessClass bc2 with (nolock) on ps2.BusinessClassID=bc2.BusinessClassID
where bc2.Description is not null
and ps2.PolicyNumber=ps.PolicyNumber and bc2.Description!=bc.Description))
 
 
 update #Policy_Information_ALL_POLICIES_temp set BusinessClassDesc=bc.Description,
 Source_Detail_Name=sd.SourceDetailName
 from #Policy_Information_ALL_POLICIES_temp piap 
 left outer join #SourceDetailName sd on piap.PolicyNumber=sd.PolicyNumber
 left outer join #BusinessClass bc on piap.PolicyNumber=bc.PolicyNumber


update #Policy_Information_ALL_POLICIES_temp set ProductType=pro.producttype,
DivisionName=div.DivisionName
from #Policy_Information_ALL_POLICIES_temp piap 
join 
AccessPHLYEOM.dbo.Product pro on piap.productcode=pro.productcode
join AccessPHLYEOM.dbo.Division div on div.DivisionID=pro.DivisionID
 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_ALL_POLICIES_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work

select * into Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work from #Policy_Information_ALL_POLICIES_temp

if not exists ( select 1 from sys.indexes 
where name = ''IX_accountnumber''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work''))
create index IX_accountnumber 
on Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
(accountnumber);

if not exists ( select 1 from sys.indexes 
where name = ''IX_policynumber''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work''))
create index IX_policynumber 
on Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
(policynumber);




update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)





' 
END
GO
