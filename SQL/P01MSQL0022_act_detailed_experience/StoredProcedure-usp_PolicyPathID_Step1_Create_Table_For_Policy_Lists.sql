IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PolicyPathID_Step1_Create_Table_For_Policy_Lists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PolicyPathID_Step1_Create_Table_For_Policy_Lists]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PolicyPathID_Step1_Create_Table_For_Policy_Lists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE procedure [dbo].[usp_PolicyPathID_Step1_Create_Table_For_Policy_Lists]

as

-- Policy PathId Monthly Step 1
-- FootPrints Ticket #59691
-- Erik Godfrey
-- 7/16/2012

-- FootPrints Ticket #71085
-- Steven Breisch
-- 4/9/2013
-- Add new field "NewRenewalAutoV2" 

-- FootPrints Ticket #52724 & #52726
-- Steven Breisch
-- 6/26/2013
-- Add more data detail to"NewRenewalAutoV2" 
-- Remove duplicates


if exists (select * from act_pricing.dbo.sysobjects where name = ''Policy_Renewals'' )
   drop table Act_Pricing.dbo.Policy_Renewals

Select
	temp8.policynumber,
	temp8.prior_policynumber,
	temp8.prior_policynumber_2,
	temp8.prior_policynumber_3,
	temp8.prior_policynumber_4,
	temp8.prior_policynumber_5,
	temp8.prior_policynumber_6,
	temp8.prior_policynumber_7,
	temp8.prior_policynumber_8,
	
		(Case 	when (temp8.prior_policynumber is Null 
				or left(ltrim(temp8.prior_policynumber),1) = ''N''
				or temp8.prior_policynumber = '''')
			then 0 
			else 1 +
			(Case 	When (temp8.prior_policynumber_2 is Null 
				or left(ltrim(temp8.prior_policynumber_2),1) = ''N''
					or temp8.prior_policynumber_2 = '''')
				then 0 
				else 1 +
				(Case 	When (temp8.prior_policynumber_3 is Null 
					or left(ltrim(temp8.prior_policynumber_3),1) = ''N''
						or temp8.prior_policynumber_3 = '''')
					then 0 
					else 1 +
					(Case 	When (temp8.prior_policynumber_4 is Null 
						or left(ltrim(temp8.prior_policynumber_4),1) = ''N''
							or temp8.prior_policynumber_4 = '''')
						then 0 
						else 1 +
						(Case 	When (temp8.prior_policynumber_5 is Null 
								or left(ltrim(temp8.prior_policynumber_5),1) = ''N''
								or temp8.prior_policynumber_5 = '''')
							then 0 
							else 1 +
						(Case 	When (temp8.prior_policynumber_6 is Null 
								or left(ltrim(temp8.prior_policynumber_6),1) = ''N''
								or temp8.prior_policynumber_6 = '''')
							then 0 
							else 1 +
						(Case 	When (temp8.prior_policynumber_7 is Null 
								or left(ltrim(temp8.prior_policynumber_7),1) = ''N''
								or temp8.prior_policynumber_7 = '''')
							then 0 
							else 1 +
						(Case 	When (temp8.prior_policynumber_8 is Null 
								or left(ltrim(temp8.prior_policynumber_8),1) = ''N''
								or temp8.prior_policynumber_8 = '''')
							then 0 
							else 1 
							end)
							end)
							end)
							end)
						end)
					end)
				end)
			end) as	Number_of_Renewals,
			CAST(null as varchar(50)) as New_Renew_Automatic_Prior_Policy,
			CAST(null as varchar(50)) as New_Renew_Automatic_Prior_Policy_2,
			CAST(null as varchar(50)) as New_Renew_Automatic_Prior_Policy_3,
			CAST(null as varchar(50)) as New_Renew_Automatic_Prior_Policy_4,
			CAST(null as varchar(50)) as New_Renew_Automatic_Prior_Policy_5 
into Act_Pricing.dbo.Policy_Renewals
from
(Select
	temp7.policynumber,
	temp7.prior_policynumber,
	temp7.prior_policynumber_2,
	temp7.prior_policynumber_3,
	temp7.prior_policynumber_4,
	temp7.prior_policynumber_5,
	temp7.prior_policynumber_6,
	temp7.prior_policynumber_7,
	 ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp7.prior_policynumber_7=PO.policynumber))) as prior_policynumber_8
from
(Select
	temp6.policynumber,
	temp6.prior_policynumber,
	temp6.prior_policynumber_2,
	temp6.prior_policynumber_3,
	temp6.prior_policynumber_4,
	temp6.prior_policynumber_5,
	temp6.prior_policynumber_6,
	ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp6.prior_policynumber_6=PO.policynumber))) as prior_policynumber_7
from
(Select
	temp5.policynumber,
	temp5.prior_policynumber,
	temp5.prior_policynumber_2,
	temp5.prior_policynumber_3,
	temp5.prior_policynumber_4,
	temp5.prior_policynumber_5,
	 ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp5.prior_policynumber_5=PO.policynumber))) as prior_policynumber_6
from
(Select
	temp4.policynumber,
	temp4.prior_policynumber,
	temp4.prior_policynumber_2,
	temp4.prior_policynumber_3,
	temp4.prior_policynumber_4,
	 ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp4.prior_policynumber_4=PO.policynumber))) as prior_policynumber_5
from
(Select
	temp3.policynumber,
	temp3.prior_policynumber,
	temp3.prior_policynumber_2,
	temp3.prior_policynumber_3,
	ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp3.prior_policynumber_3=PO.policynumber))) as prior_policynumber_4
from
(Select
	temp2.policynumber,
	temp2.prior_policynumber,
	temp2.prior_policynumber_2,
	 ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp2.prior_policynumber_2=PO.policynumber))) as prior_policynumber_3
from
(Select
	temp1.policynumber,
	temp1.prior_policynumber,
	 rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp1.prior_policynumber=PO.policynumber)) as prior_policynumber_2
from
(select distinct
	policynumber,
	ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where PS.policynumber=PO.policynumber))) as prior_policynumber 
from AccessPHLYEOM.dbo.premiumsummary PS
) as temp1
) as temp2
) as temp3
) as temp4
) as temp5
) as temp6
) as temp7
) as temp8

--go

Alter Table Act_Pricing.dbo.Policy_Renewals
add
      [Renew_New_Auto] [varchar] (50)
      ,[Consecutive_Auto_Renewals] [int]
      ,[Number_of_SubsequentRenewals] [int]
--go

update Act_Pricing.dbo.Policy_Renewals
set
Renew_New_Auto = pt.typedesc
from Act_Pricing.dbo.Policy_Renewals PS
left join AccessPhlyEom.dbo.policy pol
on pol.policynumber = PS.policynumber
left join AccessPHLYEOM.dbo.pathtype pt
on pt.[type] = pol.pathtype
--go

update Act_Pricing.dbo.Policy_Renewals
set
New_Renew_Automatic_Prior_Policy = pt.typedesc
from Act_Pricing.dbo.Policy_Renewals PS
left join AccessPhlyEom.dbo.policy pol
on pol.policynumber = PS.prior_policynumber
left join AccessPHLYEOM.dbo.pathtype pt
on pt.[type] = pol.pathtype
--go

update Act_Pricing.dbo.Policy_Renewals
set
New_Renew_Automatic_Prior_Policy_2 = pt.typedesc
from Act_Pricing.dbo.Policy_Renewals PS
left join AccessPhlyEom.dbo.policy pol
on pol.policynumber = PS.prior_policynumber_2
left join AccessPHLYEOM.dbo.pathtype pt
on pt.[type] = pol.pathtype
--go

update Act_Pricing.dbo.Policy_Renewals
set
New_Renew_Automatic_Prior_Policy_3 = pt.typedesc
from Act_Pricing.dbo.Policy_Renewals PS
left join AccessPhlyEom.dbo.policy pol
on pol.policynumber = PS.prior_policynumber_3
left join AccessPHLYEOM.dbo.pathtype pt
on pt.[type] = pol.pathtype
--go

update Act_Pricing.dbo.Policy_Renewals
set
New_Renew_Automatic_Prior_Policy_4 = pt.typedesc
from Act_Pricing.dbo.Policy_Renewals PS
left join AccessPhlyEom.dbo.policy pol
on pol.policynumber = PS.prior_policynumber_4
left join AccessPHLYEOM.dbo.pathtype pt
on pt.[type] = pol.pathtype
--go

update Act_Pricing.dbo.Policy_Renewals
set
New_Renew_Automatic_Prior_Policy_5 = pt.typedesc
from Act_Pricing.dbo.Policy_Renewals PS
left join AccessPhlyEom.dbo.policy pol
on pol.policynumber = PS.prior_policynumber_5
left join AccessPHLYEOM.dbo.pathtype pt
on pt.[type] = pol.pathtype
--go

update Act_Pricing.dbo.Policy_Renewals
set
Consecutive_Auto_Renewals = (case
	when Renew_New_Auto <> ''Automatic Renewal'' then 0
	when Renew_New_Auto = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy <> ''Automatic Renewal''
	then 1
	when Renew_New_Auto = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_2 <> ''Automatic Renewal''
	then 2
	when Renew_New_Auto = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_2 = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_3 <> ''Automatic Renewal''
	then 3
	when Renew_New_Auto = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_2 = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_3 = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_4 <> ''Automatic Renewal''
	then 4
	when Renew_New_Auto = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_2 = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_3 = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_4 = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_5 <> ''Automatic Renewal''
	then 5
	when Renew_New_Auto = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_2 = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_3 = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_4 = ''Automatic Renewal''
		and New_Renew_Automatic_Prior_Policy_5 = ''Automatic Renewal''
	then 6
	else null
	end),
	
Number_of_SubsequentRenewals = (case
	when Renew_New_Auto = ''New'' then 0
	when Renew_New_Auto <> ''New''
		and New_Renew_Automatic_Prior_Policy = ''New''
	then 1
	when Renew_New_Auto <> ''New''
		and New_Renew_Automatic_Prior_Policy <> ''New''
		and New_Renew_Automatic_Prior_Policy_2 = ''New''
	then 2
	when Renew_New_Auto <> ''New''
		and New_Renew_Automatic_Prior_Policy <> ''New''
		and New_Renew_Automatic_Prior_Policy_2 <> ''New''
		and New_Renew_Automatic_Prior_Policy_3 = ''New''
	then 3
	when Renew_New_Auto <> ''New''
		and New_Renew_Automatic_Prior_Policy <> ''New''
		and New_Renew_Automatic_Prior_Policy_2 <> ''New''
		and New_Renew_Automatic_Prior_Policy_3 <> ''New''
		and New_Renew_Automatic_Prior_Policy_4 = ''New''
	then 4
	when Renew_New_Auto <> ''New''
		and New_Renew_Automatic_Prior_Policy <> ''New''
		and New_Renew_Automatic_Prior_Policy_2 <> ''New''
		and New_Renew_Automatic_Prior_Policy_3 <> ''New''
		and New_Renew_Automatic_Prior_Policy_4 <> ''New''
		and New_Renew_Automatic_Prior_Policy_5 = ''New''
	then 5
	when Renew_New_Auto <> ''New''
		and New_Renew_Automatic_Prior_Policy <> ''New''
		and New_Renew_Automatic_Prior_Policy_2 <> ''New''
		and New_Renew_Automatic_Prior_Policy_3 <> ''New''
		and New_Renew_Automatic_Prior_Policy_4 <> ''New''
		and New_Renew_Automatic_Prior_Policy_5 <> ''New''
	then 6
	else null
	end)	
from Act_Pricing.dbo.Policy_Renewals TR


-- Build AQS temp table
select 
		lpolnum as policynumber,
		PolicyID = max(PolicyID)
	into #Policy_Policyid_AQS
	from (
		select 
				p.lpolnum,
				PolicyID
			from pi_AQS_Policy_PROD.dbo.POLPOLMFL as p with (nolock)
			where p.NEXPNUM = 0
			group by 
				p.LPOLNUM,
				policyid
			) as temp1
	group by 
		lpolnum

-- Build RS temp table
select 
		policynum as policynumber,
		PolicySK = max(PolicySK)
	into #Policy_Policyid_RS
	from (
		select 
				p.policynum,
				PolicySK
			from Rapidsure.dbo.policy as p with (nolock)
			group by 
				p.policynum,
				PolicySK
			) as temp1
	group by 
		policynum

-- Build APPS temp table
select 
		policynumber,
		currentwrittenpremium = sum(currentwrittenpremium)
	into #Policy_APPS_Premium
	from AccessPhlyEom.dbo.premiumsummary with (nolock)
	group by 
		policynumber

-- Bulid Temporary NewRenewalAuto Table  Added 4/9/2013
--SELECT distinct
--	pt.PathID AS IDNum,
--	NewRenewalAutoV2 =
--		Case	WHEN act.PathCode = 374 
--					THEN ''Express Renewal''
--				WHEN act.PathCode = 375 
--					THEN ''Convenience Renewal''
--				ELSE NULL 
--				END
--into	#NewRenewalAuto
--FROM	PolicyPathID_Daily.dbo.PathTransaction pt WITH (NOLOCK)
--  LEFT JOIN PolicyPathID_Daily.dbo.LogEntry le WITH (NOLOCK) 
--	ON le.TransactionID = pt.TransactionID
--  LEFT JOIN PolicyPathID_Daily.dbo.Workflowstep wf WITH (NOLOCK) 
--	ON wf.WorkflowStepID = le.WorkflowstepID
--  LEFT JOIN PolicyPathID_Daily.dbo.Action act WITH (NOLOCK) 
--	ON act.ActionID = wf.ActionID
--WHERE
--  act.PathCode between 374 and 375

-- Changed to add additional data detail on 6/26/2013
SELECT distinct
	pt.PathID AS IDNum,
	NewRenewalAutoV2 = ISNULL(
		Case	WHEN act.PathCode = 374 
					THEN ''Express Renewal''
				WHEN act.PathCode = 375 
					THEN ''Convenience Renewal''
				ELSE NULL 
				END,
				trantype.transactiontypedesc)
into	#NewRenewalAuto
FROM	PolicyPathID_Daily.dbo.PathTransaction pt WITH (NOLOCK)
  LEFT JOIN PolicyPathID_Daily.dbo.LogEntry le WITH (NOLOCK) 
	ON le.TransactionID = pt.TransactionID
  LEFT JOIN PolicyPathID_Daily.dbo.Workflowstep wf WITH (NOLOCK) 
	ON wf.WorkflowStepID = le.WorkflowstepID
  LEFT JOIN PolicyPathID_Daily.dbo.Action act WITH (NOLOCK) 
	ON act.ActionID = wf.ActionID
  Left join PolicyPathID_Daily.dbo.TransactionType trantype with (nolock)  
	ON trantype.TransactionTypeID = pt.TransactionTypeID
WHERE trantype.pathcode IN (1,5,6)	-- NEW, RENEWAL, AUTO RENEWAL ONLY

-- Build Path Info temp table
SELECT 
		a.idnum,
		at.accountnumber as leadID,
		polsnap.policynumber,
		s.expiringpolicynumber, 
		sta.statusdesc3,
		Policynumber_or_PATHID = isnull(polsnap.policynumber,a.idnum),
		-- Account Info
		polsnap.accountnumber,
		na.busname as accountname,
		r.regioncode,
		rd.regiondesc,
		PICProducer = LTRIM(RTRIM(ProducerEntity.LastName)) 
			+ CASE 
				WHEN LTRIM(RTRIM(ProducerEntity.FirstName)) <> '''' 
					THEN '', '' + LTRIM(RTRIM(ProducerEntity.FirstName)) 
				ELSE '''' 
					END,
		Agencyentity.Company AS PrimaryProducer,
		AgencyType.Description AS PrimaryProducerType,
		Agency.AgencyNumber as PrimaryProducerNumber,
		program.pathcode as program,
		program.ProgramName as programdesc,
		BusinessClass.Description as BusinessClassDesc,
		SourceDetail.SourceDetailName as Source_Detail_Name,
		source.SourceName as Source_Name, --Added 3/06/2013
		-- Policy Info
		pol.PolicyID,
		rs.ratingsourcecode,
		case 
			when rs.ratingsourcecode = ''AQSV3'' 
				then Ratesys_AQS.policyid 
			when rs.ratingsourcecode = ''RS'' 
				then Ratesys_RS.policySK
		else null
			end
		as RatingSystemID,
		co.CompanyCode,
		und.lastname 
			+ case 
				when und.lastname =''AUTOMATIC HOUSE'' 
					then '''' 
				when und.lastname =''AUTOMATIC RENEWAL'' 
					then '''' 
				else '', '' 
					end 
			+ ISNULL(und.firstname,'''')AS underwriterName,
		asstUnd.lastname + case when asstUnd.lastname =''AUTOMATIC HOUSE'' then '''' 
                                    when asstUnd.lastname =''AUTOMATIC RENEWAL'' then '''' 
                                    else '', '' 
                              end 
                        + ISNULL(asstUnd.firstname,'''')AS AsstUnderwriterName,  --Added 3/06/2013                  
		aear.lastname + case when aear.lastname =''AUTOMATIC HOUSE'' then '''' 
                                    when aear.lastname =''AUTOMATIC RENEWAL'' then '''' 
                                    else '', '' 
                              end 
                        + ISNULL(aear.firstname,'''')AS AccountExecRepName,     --Added 3/06/2013	
		dv.DivisionName,
		product.productline,
		product.productcode,
		product.productdesc,
		product.productshortdesc,
		product.producttype,
		producttype.ProductTypeName,
		ProdmixRptmix.prodmixname,
		ProdmixRptmix.reportmixname,
		Productgroup.Product_group,
		trantype.transactiontypedesc as NewRenewalAuto,
		polsnap.effectivedate,
			MONTH(polsnap.effectivedate) AS effectiveMonth,
			YEAR(polsnap.effectivedate) AS effectiveYear,
			YEAR(polsnap.effectivedate)*100+MONTH(polsnap.effectivedate) AS effectiveYearMonth,
		polsnap.expirationdate,
			MONTH(polsnap.expirationdate) AS expirationMonth,
			YEAR(polsnap.expirationdate) AS expirationYear,
			YEAR(polsnap.expirationdate)*100+MONTH(polsnap.expirationdate) AS expirationYearMonth,
		Insd_State = InsuredState.StateCode,
		Insd_City = LTRIM(RTRIM(InsuredAddr.City)),
		Cty.county as Insd_County,
		Insd_Zip = InsuredAddr.Zip,								
		Insd_Address1 = LTRIM(RTRIM(InsuredAddr.Line1)),
		-- Dates and Premium
		c.contactDate,
		d.contactpremium,
		polsnap.createddatetime,
		MAX(SubmissionDate_min) AS submissionDate_min,
		MAX(SubmissionDate_max) AS submissionDate_max,
		submissionPremium = 
			CASE 
				WHEN trantype.pathcode = 5 
					THEN s.referencepremium 
				ELSE s.expiredpremiumamount 
					END,
		MAX(DeclinedSubDate_min) AS declinedSubmissionDate_min,
		MAX(DeclinedSubDate_max) AS declinedSubmissionDate_max,
		declinedSubmissionPremium = 
			CASE 
				WHEN trantype.pathcode = 5 
					THEN s.referencepremium 
				ELSE s.expiredpremiumamount 
				END,
		MAX(QuoteIssuedDate_min) AS quoteIssuedDate_min,
		MAX(QuoteIssuedDate_max) AS quoteIssuedDate_max,
		s.quotedpremiumamount as quotedpremium,
		MAX(DeclinedQuoteDate_min) AS declinedQuoteDate_min,
		MAX(DeclinedQuoteDate_max) AS declinedQuoteDate_max,
		s.quotedpremiumamount AS declinedQuotePremium,
		MAX(BoundDate_min) AS boundDate_min,
		MAX(BoundDate_max) AS boundDate_max,
		polsnap.estimatedpremium AS boundPremium,
		prem.FinalAccountingPremium AS FinalAccountingPremium,
		APPS_PS.currentwrittenpremium as APPS_PS_Currentwrittenpremium,
		pol.prevpolicynumber,
		Renewals.prior_policynumber_2,
		Renewals.prior_policynumber_3,
		Renewals.prior_policynumber_4,
		Renewals.prior_policynumber_5,	
		Renewals.prior_policynumber_6,
		Renewals.prior_policynumber_7,
		Renewals.prior_policynumber_8,
		Renewals.Number_of_Renewals,
		Renewals.Consecutive_Auto_Renewals,	
		Renewals.Number_of_SubsequentRenewals,
		SIC.SIC AS SICCode, --Added 3/06/2013
		SIC.SICDesc, --Added 3/06/2013
		siccode.divisiondesc   as SICDivisionDesc,--Added 3/06/2013
		siccode.majorgroupdesc as SICMajorGroupDesc,--Added 3/06/2013
		siccode.industrydesc   as SICIndustryDesc,--Added 3/06/2013
		CASE WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 03) THEN ''AUTO''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 05) THEN ''ENVIRONMENTAL''    
            WHEN (gbl.departmentMainCode = 12 and gbl.DepartmentSubCode = 03) THEN ''NPC''    
            WHEN (gbl.departmentMainCode = 09 and  gbl.DepartmentSubCode = 09) THEN ''SPEC. PROP''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 10) THEN ''SPORTS & REC''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 07) THEN ''HABITATIONAL''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 06) THEN ''CLD''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 08) THEN ''HUMAN SVCS.''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 04) THEN ''PUBLIC SVCS.''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 01) THEN ''MGMT & PROF''    
            WHEN (gbl.departmentMainCode = 09 and gbl.departmentSubCode = 11) THEN ''Surety Lines''  
            ELSE ''CORP. UW.''
       END as  UnderwriterGroup,		--Added 3/06/2013
       NRA.NewRenewalAutoV2	-- New Field Added 4/9/2013
	into #PATH_INFO_ONLY
	FROM (
		SELECT 
				idnum,
				SubmissionDate_min = 
					CASE 
						WHEN TranState = 2 
							THEN MIN(TranDate) 
						ELSE '''' 
							END,
				SubmissionDate_max = 
					CASE 
						WHEN TranState = 2 
							THEN MAX(TranDate) 
						ELSE '''' 
							END,
				DeclinedSubDate_min = 
					CASE 
						WHEN TranState = 3 
							THEN MIN(TranDate) 
						ELSE '''' 
							END,
				DeclinedSubDate_max = 
					CASE 
						WHEN TranState = 3 
							THEN MAX(TranDate) 
						ELSE '''' 
							END,
				QuoteIssuedDate_min = 
					CASE 
						WHEN TranState = 4 
							THEN MIN(TranDate) 
						ELSE '''' 
							END,
				QuoteIssuedDate_max = 
					CASE 
						WHEN TranState = 4 
							THEN MAX(TranDate) 
						ELSE '''' 
							END,
				DeclinedQuoteDate_min = 
					CASE 
						WHEN TranState = 5 
							THEN MIN(TranDate) 
						ELSE '''' 
							END,
				DeclinedQuoteDate_max = 
					CASE 
						WHEN TranState = 5 
							THEN MAX(TranDate) 
						ELSE '''' 
							END,
				BoundDate_min = 
					CASE 
						WHEN TranState = 6 
							THEN MIN(TranDate) 
						ELSE '''' 
							END,
				BoundDate_max = 
					CASE 
						WHEN TranState = 6 
							THEN MAX(TranDate) 
						ELSE '''' 
							END
				FROM (
					select 
						idnum = pathtran.PathID,  
						TranState = 
							CASE 
								WHEN (trantype.pathCode = 5 AND action.PathCode in (3,4,114))
									OR (trantype.pathCode in (1,6) AND action.pathcode in (1,2,34,35,117,118))
									THEN 2
								WHEN action.PathCode IN (10,143) 
									THEN 3	-- Submission Declined, Mutual Declination
								WHEN TranState.TransactionStateName = ''Quote Issued'' 
									OR action.PathCode IN (11,12,13,88,164,165) 
									THEN 4	-- Quoted State
								WHEN action.PathCode = 14 
									THEN 5	-- Quote Declined
								WHEN TranState.TransactionStateName = ''Bound'' OR action.PathCode IN (17,18,160) 
									THEN 6	-- Bound State
									end,								
						TranDate = le.CreatedDateTime
							from pathnet2.dbo.LogEntry le
								left join pathnet2.dbo.PATHtransaction pathtran with (nolock)
									on pathtran.transactionid = le.transactionid
								left join pathnet2.dbo.WorkFlowStep ws with (nolock)
									on ws.WorkflowStepID = le.WorkflowStepID
								left join pathnet2.dbo.TransactionState transtate with (nolock)
									on transtate.TransactionStateID = ws.TransactionStateID
								left join pathnet2.dbo.Action action with (nolock)
									on action.ActionID = ws.ActionID
								left join pathnet2.dbo.TransactionType trantype with (nolock)
									on trantype.TransactionTypeID = pathtran.TransactionTypeID
								where 
									(transtate.TransactionStateName in (''Bound'', ''Issued'')
									OR action.PathCode in (1,2,3,4,10,11,12,13,14,17,18,34,
									35,88,114,117,118,143,160,164,165))
								group by 
									le.CreatedDateTime,
									TranState.TransactionStateName,
									pathtran.PathID,
									trantype.pathCode,
									action.pathcode 
				) b
				group by idnum,transtate
	) a
	left join pathnet2.dbo.pathtransaction pathtran with (nolock)
		on pathtran.pathid = a.idnum
	left join pathnet2.dbo.PolicySnapshot polsnap with (nolock)
		on polsnap.transactionid = pathtran.transactionid
	left join pathnet2.dbo.ratingsource rs with (nolock)
		ON polsnap.RatingSourceID = rs.RatingSourceID
	left join pathnet2.dbo.EntityAddress as InsuredAddr WITH (NOLOCK) 
		ON polsnap.InsuredEntityID = InsuredAddr.EntityID 
		AND InsuredAddr.IsPrimary = 1 
	left join pathnet2.dbo.State as InsuredState WITH (NOLOCK) 
		ON InsuredAddr.State = InsuredState.StateID
	left join Act_Definitions.dbo.US_Zip_Dominant_County_State Cty  with (nolock) --Used to use: State_County_City_ZIP_PopDen Cty
		on Cty.ZIP = left(InsuredAddr.Zip,5)
		and Cty.[State] = InsuredState.statecode
	left join pathnet2.dbo.businessclass businessclass with (nolock)
		on businessclass.businessclassid = polsnap.BusinessClassID
	left join pathnet2.dbo.EntitySourceDetail sourcedetail with (nolock)  --Added 3/06/2013
		on sourcedetail.SourceDetailID = polsnap.SourceDetailID		
	left join pathnet2.dbo.EntitySource source with (nolock) --Added 3/06/2013
		on source.SourceID = polsnap.SourceID
	left join pathnet2.dbo.Entity as ProducerEntity WITH (NOLOCK) 
		ON polsnap.PrimaryProducerEntityID = ProducerEntity.EntityID
	left join pathnet2.dbo.Company co with (nolock)
		on co.EntityID = polsnap.companyentityid
	left Join pathnet2.dbo.Product Product with (nolock)
		on Product.productID = polsnap.ProductID 
	left join pathnet2.dbo.producttype producttype with (nolock)
		on producttype.Pathcode = product.producttype
	left join accessphlyeom.dbo.policy pol with (nolock)
		on pol.policynumber = polsnap.policynumber
	left join accessphlyeom.dbo.status sta 
		on pol.policystatus = sta.statuscode
		and sta.statustype = ''POL''
	left join AccessPhlyEom.dbo.product APPS_product with (nolock)
		on APPS_product.productcode = pol.productcode
	left join AccessPhlyEom.dbo.division dv with (nolock)
		on APPS_product.DivisionID = dv.DivisionID
	left join AMPSDB.dbo.AMP2prodMixRptMixView ProdmixRptmix with (nolock)
		on ProdmixRptmix.Product = product.productcode
	left join Act_Definitions.dbo.product_groups_MIPS productgroup with (nolock)
		on productgroup.productcode = product.productcode
	left join pathnet2.dbo.Entity Und with (nolock)
		on Und.EntityID = PolSnap.UnderwriterEntityID
	left join PathNet2.dbo.Entity asstUnd		--Added 3/06/2013
      on asstUnd.EntityID = PolSnap.AssistantUnderwriterEntityID
	left join PathNet2.dbo.Entity aear			--Added 3/06/2013
      on aear.EntityID = PolSnap.AEorAREntityID		
	left join pathnet2.dbo.region r with (nolock)
		on r.regionid = polsnap.regionid
	left join accessphlyeom.dbo.region rd with (nolock)
		on rd.regioncode = r.regioncode
	left join pathnet2.dbo.Program program with (nolock)
		on program.programid = polsnap.programid
	left join pathnet2.dbo.TransactionType trantype with (nolock)
		on trantype.TransactionTypeID = pathtran.TransactionTypeID
	left join accessphlyeom.dbo.accountlead at with (nolock)
		on  at.accountid = pathtran.accountid
	LEFT JOIN AccessPHLYEOM.dbo.nameaddress na with (nolock)
		on at.accountaddrid = na.addrid
	left join pathnet2.dbo.submission s with (nolock)
		on s.transactionid = pathtran.transactionid
	left join pathnet2.dbo.Agency Agency with (nolock)
		on agency.AgencyEntityID = polsnap.AgencyEntityID
	left join pathnet2.dbo.Entity AgencyEntity with (nolock)
		on AgencyEntity.EntityID = agency.AgencyEntityID
	left join pathnet2.dbo.EntitySubTypes AgencyType with (nolock)
		on AgencyType.EntitySubTypeID = AgencyEntity.EntitySubTypeID
	left join pathnet2.dbo.SIC SIC WITH (NOLOCK)  --Added 3/06/2013 
		on SIC.SICID = polsnap.SICID
	left join Act_Definitions.dbo.SICCodesOrderbySICCode siccode with (nolock) --Added 3/06/2013
      on siccode.sic = SIC.SIC+''000''		
    left join pathnet2.dbo.Employee emp with (nolock)
        on emp.EntityID = polsnap.UnderwriterEntityID
    left join PHLYDBP013.wired.dbo.gbldirectory gbl with (nolock)
        on gbl.personID = emp.pathCode
	left join #Policy_Policyid_AQS RateSys_AQS with (nolock)
		on Ratesys_AQS.policynumber = polsnap.policynumber
	left join #Policy_Policyid_RS RateSys_RS with (nolock)
		on Ratesys_RS.policynumber = polsnap.policynumber
	LEFT JOIN 
		(SELECT
				al.accountnumber as leadsid,
				MIN(ac.calldate) AS contactdate		-- GET CONTACT DATE FROM CTS CALL TABLE
			FROM accessphlyeom.dbo.accountlead al with (nolock)
			left join pathnet2.dbo.accountcall ac with (nolock)
				on ac.accountid = al.accountid	-- TAKING EARLIEST CALL FOR LEAD
			GROUP BY 
				al.accountnumber
		) c	
		ON at.accountnumber = c.leadsid 
		AND at.accountnumber <> ''''
	LEFT JOIN 
		(SELECT 
				acc.AccountNumber as leadsid,
				prod.productcode as coverage,
				MAX(tp.premiumamount) AS contactPremium
			FROM pathnet2.dbo.targetproduct tp with (nolock)
			inner join pathnet2.dbo.Product prod with (nolock)
				on prod.ProductID = tp.ProductID
			inner join accessphlyeom.dbo.Accountlead acc with (nolock)
				on acc.accountid = tp.accountID
			GROUP BY acc.AccountNumber,prod.productcode
		) d 
		on at.accountnumber = d.leadsid 
		and d.coverage = product.productcode
	LEFT JOIN 
		(SELECT 
				policynumber, 
				sum(writtenpremium) AS FinalAccountingPremium	-- GET FINAL APPS ACCOUNTING PREMIUM
			FROM accessphlyeom.dbo.premiumstat with (nolock)  -- INCLUDING ENDORSEMENTS
			GROUP BY 
				policynumber
		) prem 
		ON polsnap.policynumber = prem.policynumber 
		AND polsnap.policynumber <> ''''
	LEFT JOIN #Policy_APPS_Premium APPS_PS with (nolock)
		on APPS_PS.policynumber = polsnap.PolicyNumber
	LEFT JOIN Act_Pricing.dbo.Policy_Renewals Renewals with (nolock)
		on renewals.policynumber = polsnap.policynumber
	left join #NewRenewalAuto NRA                  -- Added 4/9/2013
		on NRA.IDNum = a.idnum	                 
	WHERE trantype.pathcode IN (1,5,6)	-- NEW, RENEWAL, AUTO RENEWAL ONLY
		AND YEAR(polsnap.effectivedate) >= YEAR(DATEADD(yy,-7,GETDATE()))
	group by 
		a.idnum,
		at.accountnumber,
		polsnap.policynumber,
		s.expiringpolicynumber, 
		sta.statusdesc3,
		-- Account Info
		polsnap.accountnumber,
		na.busname,
		r.regioncode,
		rd.regiondesc,
		ProducerEntity.LastName,
		ProducerEntity.FirstName,
		Agencyentity.Company,
		AgencyType.Description,
		Agency.AgencyNumber,
		program.pathcode,
		program.ProgramName,
		BusinessClass.Description,
		SourceDetail.SourceDetailName,
		source.SourceName, --Added 3/06/2013 
		-- Policy Info	
		pol.PolicyID,
		rs.ratingsourcecode,
		Ratesys_AQS.policyid,
		Ratesys_RS.policySK,
		co.CompanyCode,
		und.lastname,
		und.firstname,
		asstUnd.lastname,	--Added 3/06/2013
		asstUnd.firstname,	--Added 3/06/2013
		aear.lastname,		--Added 3/06/2013
		aear.firstname,		--Added 3/06/2013
		dv.DivisionName,
		product.productline,
		product.productcode,
		product.productdesc,
		product.productshortdesc,
		product.producttype,
		producttype.ProductTypeName,
		ProdmixRptmix.prodmixname,
		ProdmixRptmix.reportmixname,
		Productgroup.Product_group,
		trantype.transactiontypedesc,
		polsnap.effectivedate,
		polsnap.expirationdate,
		InsuredState.StateCode,
		InsuredAddr.City,
		Cty.county,
		InsuredAddr.Zip,
		InsuredAddr.Line1,
		-- Dates and Premium
		c.contactDate,
		d.contactpremium,
		polsnap.createddatetime,
		trantype.pathcode,
		s.referencepremium,
		s.ExpiredPremiumAmount,
		s.quotedpremiumamount,
		s.quotedpremiumamount,
		polsnap.estimatedpremium,
		prem.FinalAccountingPremium,
		APPS_PS.currentwrittenpremium,
		pol.prevpolicynumber,
		Renewals.prior_policynumber_2,
		Renewals.prior_policynumber_3,
		Renewals.prior_policynumber_4,
		Renewals.prior_policynumber_5,
		Renewals.prior_policynumber_6,
		Renewals.prior_policynumber_7,
		Renewals.prior_policynumber_8,
		Renewals.Number_of_Renewals,
		Renewals.Consecutive_Auto_Renewals,	
		Renewals.Number_of_SubsequentRenewals,
		SIC.SIC,--Added 3/06/2013
		SIC.SICDesc,--Added 3/06/2013
		siccode.divisiondesc,--Added 3/06/2013
		siccode.majorgroupdesc,--Added 3/06/2013
		siccode.industrydesc,--Added 3/06/2013
		gbl.departmentMainCode,--Added 3/06/2013
		gbl.DepartmentSubCode,--Added 3/06/2013
		NRA.NewRenewalAutoV2           -- added 4/9/2013

-- Update Path Info temp table
update 
		#PATH_INFO_ONLY
	set	divisionname = dv.divisionName
	from #PATH_INFO_ONLY pol with (nolock)
	left join AccessPhlyEom.dbo.product APPS_product with (nolock)
		on APPS_product.productcode = pol.productcode
	left join AccessPhlyEom.dbo.division dv with (nolock)
		on APPS_product.DivisionID = dv.DivisionID
	where pol.DivisionName is null

-- Build APPS Only Policies temp table
select 
		policynumber,
		accountnumber
	into #APPS_Only_Policies
	from (
		select
				pol.policynumber,
				pol.accountnumber,
				PPI.policynumber as PATH_policynumber
			from AccessPhlyEom.dbo.policy pol with (nolock)
			left join #PATH_INFO_ONLY PPI with (nolock)
				on Pol.policynumber = PPI.policynumber
				and Pol.accountnumber = PPI.accountnumber
			where  YEAR(pol.effectivedate) >= YEAR(DATEADD(yy,-7,GETDATE()))
			group by 
				pol.policynumber,
				pol.accountnumber,
				PPI.policynumber
		) as temp1
		where PATH_policynumber is null
		group by 
			policynumber,
			accountnumber

-- Build Policy Snap (Source Detail) temp table
select
		policynumber,
		PSS.CreatedDateTime as createdDatetime,
		SD.SourceDetailName as SourceDetailName
	into #PolicySnap_SD
	from PathNet2.dbo.PolicySnapshot PSS with (nolock)
	left join PathNet2.dbo.entitysourcedetail SD with (nolock)
		on SD.SourceDetailID = PSS.SourceDetailID
	group by
		policynumber,
		PSS.CreatedDateTime,
		SD.sourcedetailName

-- Build Policy Snap 2 (Source Detail) temp table
select
		temp1.policynumber,
		max_createddatetime,
		SD.sourcedetailName
	into #PolicySnap_SD2
	from (
	select 
			policynumber,
			max_createddatetime = MAX(createddatetime)
		from #PolicySnap_SD with (nolock)
		group by 
			policynumber
	) as temp1
	left join #PolicySnap_SD SD with (nolock)
		on sd.policynumber = temp1.policynumber
		and sd.createddatetime = temp1.max_createddatetime

/* Source Name */							--Added 3/06/2013
--drop table #PolicySnap_SN
select
	policynumber,
	PSS.CreatedDateTime as createdDatetime,
	SN.SourceName as Source_Name
into #PolicySnap_SN
from PathNet2.dbo.PolicySnapshot PSS
left join PathNet2.dbo.EntitySource SN
  on SN.SourceID = PSS.SourceID
group by
	policynumber,
	PSS.CreatedDateTime,
	SN.SourceName
--go

--drop table #PolicySnap_SN2 					--Added 3/06/2013
select
	temp1.policynumber,
	max_createddatetime,
	SN.Source_Name
into #PolicySnap_SN2
from (
select 
	policynumber,
	max_createddatetime = MAX(createddatetime)
from #PolicySnap_SN
group by 
	policynumber
) as temp1
left join #PolicySnap_SN SN
on SN.policynumber = temp1.policynumber
	and SN.createddatetime = temp1.max_createddatetime
--go

-- Build PIC Producer temp table
select 
		APPS.policynumber,
		isnull(max(prod_EMP.ProducerCode),
		max(prod_RVPRM.ProducerCode)) as producercode
	into #PIC_Producer
	from #APPS_Only_Policies APPS with (nolock)
	left join AccessPHLYEOM.dbo.PolicyProducer Polprod with (nolock)
		on Polprod.Policynumber = APPS.Policynumber 
		and year(Polprod.effectivedate) > 2002
		and Polprod.Commissiontypecode = ''WA''
		and polprod.primaryind = ''N''
	left join AccessPhlyEom.dbo.producer prod_EMP with (nolock)
		on Polprod.producercode = prod_EMP.producercode
		and prod_EMP.producertypecode = (''02'')
	left join AccessPhlyEom.dbo.producer prod_RVPRM with (nolock)
		on Polprod.producercode = prod_RVPRM.producercode
		and prod_RVPRM.producertypecode = (''01'')
	group by 
		APPS.policynumber

-- Build APPS Only Policies 2 temp table
SELECT 
		idnum = null,
		leadID = APPS.accountnumber,
		APPS.policynumber,
		cast(null as varchar(20)) as expiringpolicynumber,
		sta.statusdesc3, 
		Policynumber_or_PATHID = APPS.policynumber,
		APPS.accountnumber,
		ltrim(rtrim(acct_na.busname)) as accountname,
		pol.regioncode,
		reg.regiondesc,
		ltrim(rtrim(PIC_Prod_name.lastname))+'', ''+ltrim(rtrim(PIC_Prod_name.firstname)) as PICProducer,
		ltrim(rtrim(prod_na.busname)) AS PrimaryProducer,
		prodtype.producertypedesc AS PrimaryProducerType,
		pol.PrimaryProducerCode as PrimaryProducerNumber,
		programcode as program,
		program.ProgramName as programdesc,
		BusinessClass.Description as BusinessClassDesc,
		SD.SourceDetailName as Source_Detail_Name,
		SN.Source_Name, --Added 3/06/2013
		pol.policyid,
		pol.ratingsourcecode,
			case 
				when pol.ratingsourcecode = ''AQSV3'' 
					then Ratesys_AQS.policyid 
				when pol.ratingsourcecode = ''RS'' 
					then Ratesys_RS.policySK
				else null
					end
			as RatingSystemID,
		pol.CompanyCode,
		ltrim(rtrim(und.lastname)) + case when und.lastname =''AUTOMATIC HOUSE'' then '''' when und.lastname =''AUTOMATIC RENEWAL'' then '''' else '', '' end + isnull(ltrim(rtrim(und.firstname)),'''') as underwriterName,
		CAST('''' as varchar(150))  as AsstUnderwriterName,--Added 3/06/2013
		ltrim(rtrim(aear.lastname)) + case when aear.lastname =''AUTOMATIC HOUSE'' then '''' when aear.lastname =''AUTOMATIC RENEWAL'' then '''' else '', '' end + isnull(ltrim(rtrim(aear.firstname)),'''') as AccountExecRepName,  --Added 3/06/2013
		dv.DivisionName,
		product.productline,
		product.productcode,
		product.productdesc,
		product.productshortdesc,
		product.producttype,
		producttype.ProductTypeName,
		ProdmixRptmix.prodmixname,
		ProdmixRptmix.reportmixname,
		Productgroup.Product_group,
		PT2.TransactionTypeDesc as NewRenewalAuto,
		pol.effectivedate,
			MONTH(pol.effectivedate) AS effectiveMonth,
			YEAR(pol.effectivedate) AS effectiveYear,
			YEAR(pol.effectivedate)*100+MONTH(pol.effectivedate) AS effectiveYearMonth,
		pol.expirationdate,	
			MONTH(pol.expirationdate) AS expirationMonth,
			YEAR(pol.expirationdate) AS expirationYear,
			YEAR(pol.expirationdate)*100+MONTH(pol.expirationdate) AS expirationYearMonth,
		Insd_State = Ins_na.StateCode,
		Insd_City = LTRIM(RTRIM(Ins_na.City)),
		Insd_County = Cty.County,
		Insd_Zip = Ins_na.Zip,							
		Insd_Address1 = LTRIM(RTRIM(Ins_na.address1)),
		-- Dates and Premium
		contactDate = null,
		contactpremium = null,
		createddatetime = null,
		submissionDate_min = null,
		submissionDate_max = null,
		submissionPremium = null,
		declinedSubmissionDate_min = null,
		declinedSubmissionDate_max = null,
		declinedSubmissionPremium = null,
		quoteIssuedDate_min = null,
		quoteIssuedDate_max = null,
		quotedpremium = null,
		declinedQuoteDate_min = null,
		declinedQuoteDate_max = null,
		declinedQuotePremium = null,
		boundDate_min = null,
		boundDate_max = null,
		boundPremium = null,
		FinalAccountingPremium = null,
		APPS_PS.currentwrittenpremium as APPS_PS_Currentwrittenpremium,
		pol.prevpolicynumber,
		Renewals.prior_policynumber_2,
		Renewals.prior_policynumber_3,
		Renewals.prior_policynumber_4,
		Renewals.prior_policynumber_5,
		Renewals.prior_policynumber_6,
		Renewals.prior_policynumber_7,
		Renewals.prior_policynumber_8,
		Renewals.Number_of_Renewals,
		Renewals.Consecutive_Auto_Renewals,	
		Renewals.Number_of_SubsequentRenewals,
		pol.SICCode, --Added 3/06/2013
		SIC.SICDesc,--Added 3/06/2013
		siccode.divisiondesc as SICDivisionDesc,--Added 3/06/2013
		siccode.majorgroupdesc as SICMajorGroupDesc,--Added 3/06/2013
		siccode.industrydesc as SICIndustryDesc,--Added 3/06/2013
		CASE WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 03) THEN ''AUTO''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 05) THEN ''ENVIRONMENTAL''    
            WHEN (gbl.departmentMainCode = 12 and gbl.DepartmentSubCode = 03) THEN ''NPC''    
            WHEN (gbl.departmentMainCode = 09 and  gbl.DepartmentSubCode = 09) THEN ''SPEC. PROP''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 10) THEN ''SPORTS & REC''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 07) THEN ''HABITATIONAL''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 06) THEN ''CLD''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 08) THEN ''HUMAN SVCS.''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 04) THEN ''PUBLIC SVCS.''    
            WHEN (gbl.departmentMainCode = 09 and gbl.DepartmentSubCode = 01) THEN ''MGMT & PROF''    
            WHEN (gbl.departmentMainCode = 09 and gbl.departmentSubCode = 11) THEN ''Surety Lines''  
            ELSE ''CORP. UW.''
       END as  UnderwriterGroup,--Added 3/06/2013
       NewRenewalAutoV2 = convert(varchar(50),null)       -- added 4/9/2013
	into #APPS_Only_Policies_2
	from #APPS_Only_Policies APPS with (nolock)
	left join accessphlyeom.dbo.AccountLead acctlead with (nolock)
		on acctlead.accountnumber = APPS.accountnumber
	left join accessphlyeom.dbo.nameaddress acct_na with (nolock)
		on acct_na.addrid = acctlead.accountaddrid
	left join accessphlyeom.dbo.policy pol with (nolock)
		on pol.policynumber = APPS.policynumber
	left join accessphlyeom.dbo.status sta 
		on pol.policystatus = sta.statuscode
		and sta.statustype = ''POL''	
	left join accessphlyeom.dbo.region reg with (nolock)
		on reg.regioncode = pol.regioncode
	left join pathnet2.dbo.Program program with (nolock)
		on program.PathCode = pol.programcode
	left join pathnet2.dbo.ratingsource rs with (nolock)
		ON pol.RatingSourcecode = rs.RatingSourcecode
	left join pathnet2.dbo.businessclass businessclass with (nolock)
		on businessclass.businessclassid = pol.BusinessClassID
	left join Accessphlyeom.dbo.GBLEmployee Und with (nolock)
		on Und.personid = pol.underwriterPID
	left join Accessphlyeom.dbo.GBLEmployee aear with (nolock) --Added 3/06/2013
		on aear.personid = pol.aeorarpid			
	left join AccessPHLYEOM.dbo.pathtype pt with (nolock)
		on pt.[type] = pol.pathtype
	left join [PathNet2].[dbo].[TransactionType] pt2 with (nolock)
		on pt2.pathCode = pt.type
	LEFT join AccessPhlyEom.dbo.nameaddress Ins_na with (nolock)
		on Ins_na.addrid = pol.insuredaddrid
	left join AccessPhlyEom.dbo.product APPS_product with (nolock)
		on APPS_product.productcode = pol.productcode
	left join AMPSDB.dbo.AMP2prodMixRptMixView ProdmixRptmix with (nolock)
		on ProdmixRptmix.Product = pol.productcode
	left join Act_Definitions.dbo.product_groups_MIPS productgroup with (nolock)
		on productgroup.productcode = pol.productcode
	left Join pathnet2.dbo.Product Product with (nolock)
		on Product.productcode = pol.Productcode
	left join pathnet2.dbo.producttype producttype with (nolock)
		on producttype.Pathcode = product.producttype
	left join AccessPhlyEom.dbo.division dv with (nolock)
		on APPS_product.DivisionID = dv.DivisionID
	left join Act_Pricing.dbo.Policy_Renewals Renewals with (nolock)
		on renewals.policynumber = APPS.policynumber
	left join #Policy_Policyid_AQS RateSys_AQS with (nolock)
		on Ratesys_AQS.policynumber = APPS.policynumber
	left join #Policy_Policyid_RS RateSys_RS with (nolock)
		on Ratesys_RS.policynumber = APPS.policynumber
	left join #Policy_APPS_Premium	APPS_PS with (nolock)
		on APPS_PS.policynumber = APPS.PolicyNumber
	left join #PolicySnap_SD2 SD with (nolock)
		on SD.policynumber = APPS.policynumber
	left join #PolicySnap_SN2 SN with (nolock)  --Added 3/06/2013          
        on SN.policynumber = APPS.policynumber	
	left join AccessPhlyEom.dbo.producer prod with (nolock)
		on prod.producercode = pol.PrimaryProducerCode
	left join AccessPhlyEom.dbo.producertype prodtype with (nolock)
		on prodtype.producertypecode = prod.producertypecode
	left join AccessPhlyEom.dbo.nameaddress prod_na with (nolock)
		on prod_na.addrid = prod.produceraddrid
	left join #PIC_Producer PIC_prod_num with (nolock)
		on PIC_prod_num.policynumber = APPS.policynumber
	left join AccessPhlyEom.dbo.producer PIC_prod with (nolock)
		on PIC_prod.producercode = pic_prod_num.producercode
	left join pathnet2.dbo.Agency    PIC_Prod_ProdEntityID with (nolock)
		on PIC_Prod_ProdEntityID.AgencyEntityID = PIC_prod.AgencyEntityID
	left join pathnet2.dbo.Employee  PIC_Prod_PersID with (nolock)
		on PIC_Prod_PersID.entityid = PIC_Prod_ProdEntityID.ProducerEntityID
	left join AccessPhlyEom.dbo.GBLemployee PIC_Prod_name with (nolock)
		on PIC_Prod_name.personid = PIC_Prod_PersID.pathCode
	left join AccessPhlyEom.dbo.nameaddress PIC_prod_na with (nolock)
		on PIC_prod_na.addrid = PIC_prod.produceraddrid
	left join Act_Definitions.dbo.US_Zip_Dominant_County_State Cty with (nolock)  --Used to use State_County_City_ZIP_PopDen Cty			
		on Cty.ZIP = left(ltrim(Ins_na.Zip),5)
	
	left join AccessPhlyEom.dbo.SIC sic with (nolock) --Added 3/06/2013  
            on sic.sic = left(ltrim(pol.siccode),4)           
	left join Act_Definitions.dbo.SICCodesOrderbySICCode siccode with (nolock)--Added 3/06/2013
      on siccode.sic = case when len(pol.siccode)=7 then pol.siccode
                                                else pol.siccode+''000'' end	
   	left join PHLYDBP013.wired.dbo.gbldirectory gbl with (nolock)
      on gbl.personID = pol.underwriterpid                                            
                                             	
if exists (select * from Act_Detailed_Experience.dbo.sysobjects where name = ''Policy_PATHID_Information_work'')
   drop table Act_Detailed_Experience.dbo.Policy_PATHID_Information_work

-- Build Policy PathId table
select
		* ,
		Insured_Years = convert(int,NULL),
		Policy_Premium_Level_Marketing = convert(float,NULL),
		Account_PY_Premium_Level_Marketing = convert(float,NULL),
		Policy_Premium_Level = convert(float,NULL),
		Account_PY_Premium_Level = convert(float,NULL),
		Insured_Years_Range = convert(varchar(50),NULL),
		Written_Premium_Range = convert(varchar(50),NULL),
		Account_Premium_Range = convert(varchar(50),NULL),
		SLD_BusinessType = convert(char(100),NULL),
		SLD_Occurrence_Limit = convert(int,NULL),
		SLD_NumOfEmployees = convert(int,NULL),
		Account_ProductType_P = convert(char(1),NULL),
		Account_ProductType_S = convert(char(1),NULL),
		Account_ProductType_U = convert(char(1),NULL),
		Account_ProductType_O = convert(char(1),NULL),
		Account_ProductType_A = convert(char(1),NULL),
		Account_ProductType_L = convert(char(1),NULL),
		Account_ProductType_ALL = convert(varchar(11),NULL),
		Account_ProductType_ALL_Desc = convert(varchar(100),NULL),
		Policy_FF_Cov_DO = convert(varchar(5),NULL),
		Policy_FF_Cov_EPL = convert(varchar(5),NULL),
		Policy_FF_Cov_Fid = convert(varchar(10),NULL),
		Policy_FF_Cov_WPV = convert(varchar(20),NULL),
		Policy_FF_Cov_Internet = convert(varchar(10),NULL),
		FF_Cov_ALL = convert(varchar(100),NULL),
		Policy_PV_Cov_DO = convert(varchar(5),NULL),
		Policy_PV_Cov_EPL = convert(varchar(5),NULL),
		Policy_PV_Cov_Fid = convert(varchar(10),NULL),
		Policy_PV_Cov_Other = convert(varchar(10),NULL),
		PV_Cov_ALL = convert(varchar(50),NULL),
		prevpolicy_premium = convert(float,NULL),
		policy_premium_2 = convert(float,NULL),
		policy_premium_3 = convert(float,NULL),
		policy_premium_4 = convert(float,NULL),
		policy_premium_5 = convert(float,NULL),
		policy_premium_6 = convert(float,NULL),
		policy_premium_7 = convert(float,NULL),
		policy_premium_8 = convert(float,NULL),
		prevpolicy_Effectivedate = convert(datetime,NULL),
		policy_Effectivedate_2 = convert(datetime,NULL),
		policy_Effectivedate_3 = convert(datetime,NULL),
		policy_Effectivedate_4 = convert(datetime,NULL),
		policy_Effectivedate_5 = convert(datetime,NULL),
		policy_Effectivedate_6 = convert(datetime,NULL),
		policy_Effectivedate_7 = convert(datetime,NULL),
		policy_Effectivedate_8 = convert(datetime,NULL),
		prevpolicy_Expirationdate = convert(datetime,NULL),
		policy_Expirationdate_2 = convert(datetime,NULL),
		policy_Expirationdate_3 = convert(datetime,NULL),
		policy_Expirationdate_4 = convert(datetime,NULL),
		policy_Expirationdate_5 = convert(datetime,NULL),
		policy_Expirationdate_6 = convert(datetime,NULL),
		policy_Expirationdate_7 = convert(datetime,NULL),
		policy_Expirationdate_8 = convert(datetime,NULL),
		Yr_MM_30_60_days = convert(int,NULL),
		Yr_MM_60_90_days = convert(int,NULL),
		Yr_MM_90_120_days = convert(int,NULL),
		Loss_max_YRMM = convert(int,NULL),
		Accountstatistic_LossRatio = convert(float,NULL),
		EarnedPremium_Acct_CurrEval = convert(float,NULL),
		Incurred_LossALAE_Acct_CurrEval = convert(float,NULL),
		Incurred_LossRatio_Acct_CurrEval = convert(float,NULL),	
		Incurred_LossRatio_Acct_CurrEval_Range = convert(varchar(50),NULL),
		EarnedPremium_Acct_Div_CurrEval = convert(float,NULL),
		Incurred_LossALAE_Acct_Div_CurrEval = convert(float,NULL),
		Incurred_LossRatio_Acct_Div_CurrEval = convert(float,NULL),	
		Incurred_LossRatio_Acct_Div_CurrEval_Range = convert(varchar(50),NULL),
		EarnedPremium_Acct_Div_Prod_CurrEval = convert(float,NULL),
		Incurred_LossALAE_Acct_Div_Prod_CurrEval = convert(float,NULL),
		Incurred_LossRatio_Acct_Div_Prod_CurrEval = convert(float,NULL),	
		Incurred_LossRatio_Acct_Div_Prod_CurrEval_Range = convert(varchar(50),NULL),
		EarnedPremium_Acct_60_90 = convert(float,NULL),
		Incurred_LossALAE_Acct_60_90 = convert(float,NULL),
		Incurred_LossRatio_Acct_60_90 = convert(float,NULL),	
		Incurred_LossRatio_Acct_60_90_Range = convert(varchar(50),NULL),
		EarnedPremium_Acct_Div_60_90 = convert(float,NULL),
		Incurred_LossALAE_Acct_Div_60_90 = convert(float,NULL),
		Incurred_LossRatio_Acct_Div_60_90 = convert(float,NULL),	
		Incurred_LossRatio_Acct_Div_60_90_Range = convert(varchar(50),NULL),
		EarnedPremium_Acct_Div_Prod_60_90 = convert(float,NULL),
		Incurred_LossALAE_Acct_Div_Prod_60_90 = convert(float,NULL),
		Incurred_LossRatio_Acct_Div_Prod_60_90 = convert(float,NULL),	
		Incurred_LossRatio_Acct_Div_Prod_60_90_Range = convert(varchar(50),NULL),
		EarnedPremium_Acct_90_120 = convert(float,NULL),
		Incurred_LossALAE_Acct_90_120 = convert(float,NULL),
		Incurred_LossRatio_Acct_90_120 = convert(float,NULL),	
		Incurred_LossRatio_Acct_90_120_Range = convert(varchar(50),NULL),
		EarnedPremium_Acct_Div_90_120 = convert(float,NULL),
		Incurred_LossALAE_Acct_Div_90_120 = convert(float,NULL),
		Incurred_LossRatio_Acct_Div_90_120 = convert(float,NULL),	
		Incurred_LossRatio_Acct_Div_90_120_Range = convert(varchar(50),NULL),
		EarnedPremium_Acct_Div_Prod_90_120 = convert(float,NULL),
		Incurred_LossALAE_Acct_Div_Prod_90_120 = convert(float,NULL),
		Incurred_LossRatio_Acct_Div_Prod_90_120 = convert(float,NULL),	
		Incurred_LossRatio_Acct_Div_Prod_90_120_Range = convert(varchar(50),NULL),
		EarnedPremium_Acct_5UWYr_CurrEval = convert(float,NULL),
		Incurred_LossALAE_Acct_5UWYr_CurrEval = convert(float,NULL),
		Incurred_LossRatio_Acct_5UWYr_CurrEval = convert(float,NULL),	
		Incurred_LossRatio_Acct_5UWYr_CurrEval_Range = convert(varchar(50),NULL),
		Incurred_LossRatio_Acct_5UWYr_CurrEval_Range_PriorPol = convert(varchar(50),NULL),
		EarnedPremium_Pol_5Yr_Div_60_90 = convert(float,NULL),
		Incurred_LossALAE_Pol_5Yr_Div_60_90 = convert(float,NULL),
		Incurred_LossRatio_Pol_5Yr_Div_60_90 = convert(float,NULL),	
		Incurred_LossRatio_Pol_5Yr_Div_60_90_Range = convert(varchar(50),NULL),
		Incurred_LossRatio_Pol_5Yr_Div_60_90_Range_PriorPol = convert(varchar(50),NULL),
		Policy_Judgment_Mod_nonUC = convert(float,NULL),
		Policy_Judgment_Mod_UC = convert(float,NULL),
		Policy_Judgment_Mod_GL = convert(float,NULL),
		Policy_Judgment_Mod_Automobile = convert(float,NULL),
		Policy_Percent_Monitored = convert(float,NULL),
		AccountDiv_Judgment_Mod_nonUC = convert(float,NULL),
		AccountDiv_Judgment_Mod_UC = convert(float,NULL),
		AccountDiv_Percent_Monitored = convert(float,NULL),
		AccountDiv_Judgment_Mod_NonUC_Range = convert(varchar(50),NULL),
		AccountDiv_Judgment_Mod_UC_Range = convert(varchar(50),NULL),
		Policy_Judgment_Mod_GL_Range = convert(varchar(50),NULL),
		Policy_Judgment_Mod_Automobile_Range = convert(varchar(50),NULL)
	into Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	from (
		select
				* 
			from #PATH_INFO_ONLY with (nolock)
			union
			select
					* 
				from #APPS_Only_Policies_2 with (nolock)
	) as temp1

-- Update Policy PathId table
UPDATE
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET	
			declinedSubmissionDate_min = b.trandate,
			declinedSubmissionDate_max = b.trandate,
			declinedSubmissionPremium = a.submissionPremium
	FROM Act_Detailed_Experience.dbo.Policy_PATHID_Information_work a with (nolock), 
	(select 
			pathtran.PathID as idnum,  
			min(le.CreatedDateTime) as Trandate
		from pathnet2.dbo.LogEntry le with (nolock)
		left join pathnet2.dbo.PATHtransaction pathtran with (nolock)
			on pathtran.transactionid = le.transactionid
		left join pathnet2.dbo.WorkFlowStep ws with (nolock)
			on ws.WorkflowStepID = le.WorkflowStepID
		left join pathnet2.dbo.TransactionState transtate with (nolock)
			on transtate.TransactionStateID = ws.TransactionStateID
		left join pathnet2.dbo.Action action with (nolock)
			on action.ActionID = ws.ActionID
		left join pathnet2.dbo.TransactionType trantype with (nolock)
			on trantype.TransactionTypeID = pathtran.TransactionTypeID
		where 
			action.PathCode = 31
		group by 
			pathtran.pathid
	) b
	WHERE a.idnum = b.idnum
		AND (submissionDate_min <> ''1900-01-01 00:00:00.000''
		OR submissionDate_max <> ''1900-01-01 00:00:00.000'')
		AND quoteIssueddate_min = ''1900-01-01 00:00:00.000''
		AND quoteIssueddate_max = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - If quoted, admin close out assigned to decline quote
UPDATE
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET 
		declinedQuoteDate_min = b.trandate,
		declinedQuoteDate_max = b.trandate,
		declinedQuotePremium = a.quotedPremium
	FROM Act_Detailed_Experience.dbo.Policy_PATHID_Information_work a with (nolock), 
	(Select 
		pathtran.PathID as idnum,  
		min(le.CreatedDateTime) as Trandate
	from pathnet2.dbo.LogEntry le with (nolock)
	left join pathnet2.dbo.PATHtransaction pathtran with (nolock)
		on pathtran.transactionid = le.transactionid
	left join pathnet2.dbo.WorkFlowStep ws with (nolock)
		on ws.WorkflowStepID = le.WorkflowStepID
	left join pathnet2.dbo.TransactionState transtate with (nolock)
		on transtate.TransactionStateID = ws.TransactionStateID
	left join pathnet2.dbo.Action action with (nolock)
		on action.ActionID = ws.ActionID
	left join pathnet2.dbo.TransactionType trantype with (nolock)
		on trantype.TransactionTypeID = pathtran.TransactionTypeID
	where 
		action.PathCode = 31
	group by 
		pathtran.pathid
	) b
	WHERE a.idnum = b.idnum
		AND (quoteIssueddate_min <> ''1900-01-01 00:00:00.000''
		OR quoteIssueddate_max <> ''1900-01-01 00:00:00.000'')
		AND bounddate_min = ''1900-01-01 00:00:00.000''
		AND bounddate_max = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - If never quoted, handle as a declination of business
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET declinedSubmissionDate_min = b.trandate,
		declinedSubmissionDate_max = b.trandate,
		declinedSubmissionPremium = a.submissionPremium
	FROM Act_Detailed_Experience.dbo.Policy_PATHID_Information_work a with (nolock),
	(Select 
			pathtran.PathID as idnum,  
			min(le.CreatedDateTime) as Trandate
		from pathnet2.dbo.LogEntry le with (nolock)
		left join pathnet2.dbo.PATHtransaction pathtran with (nolock)
			on pathtran.transactionid = le.transactionid
		left join pathnet2.dbo.WorkFlowStep ws with (nolock)
			on ws.WorkflowStepID = le.WorkflowStepID
		left join pathnet2.dbo.TransactionState transtate with (nolock)
			on transtate.TransactionStateID = ws.TransactionStateID
		left join pathnet2.dbo.Action action with (nolock)
			on action.ActionID = ws.ActionID
		left join pathnet2.dbo.TransactionType trantype with (nolock)
			on trantype.TransactionTypeID = pathtran.TransactionTypeID
		where 
			action.PathCode = 16
		group by 
			pathtran.pathid
	) b
	WHERE a.idnum = b.idnum
		AND (submissionDate_min <> ''1900-01-01 00:00:00.000''
		OR submissionDate_max <> ''1900-01-01 00:00:00.000'')
		AND declinedSubmissionDate_min  = ''1900-01-01 00:00:00.000''
		AND declinedSubmissionDate_max  = ''1900-01-01 00:00:00.000''
		AND quoteIssuedDate_min = ''1900-01-01 00:00:00.000''
		AND quoteIssuedDate_max = ''1900-01-01 00:00:00.000''
		AND boundDate_min = ''1900-01-01 00:00:00.000''
		AND boundDate_max = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - If quoted, handle as a declined quote
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET declinedQuoteDate_min = b.trandate,
		declinedQuoteDate_max = b.trandate,
		declinedQuotePremium = a.quotedPremium
	FROM Act_Detailed_Experience.dbo.Policy_PATHID_Information_work a with (nolock),
	(Select 
			pathtran.PathID as idnum,  
			min(le.CreatedDateTime) as Trandate
	from pathnet2.dbo.LogEntry le with (nolock)
	left join pathnet2.dbo.PATHtransaction pathtran with (nolock)
		on pathtran.transactionid = le.transactionid
	left join pathnet2.dbo.WorkFlowStep ws with (nolock)
		on ws.WorkflowStepID = le.WorkflowStepID
	left join pathnet2.dbo.TransactionState transtate with (nolock)
		on transtate.TransactionStateID = ws.TransactionStateID
	left join pathnet2.dbo.Action action with (nolock)
		on action.ActionID = ws.ActionID
	left join pathnet2.dbo.TransactionType trantype with (nolock)
		on trantype.TransactionTypeID = pathtran.TransactionTypeID
	where 
		action.PathCode = 16
	group by 
		pathtran.pathid
	) b
	WHERE a.idnum = b.idnum
		AND (quoteIssuedDate_min <> ''1900-01-01 00:00:00.000''
		OR quoteIssuedDate_max <> ''1900-01-01 00:00:00.000'')
		AND declinedQuoteDate_min = ''1900-01-01 00:00:00.000''
		AND declinedQuoteDate_max = ''1900-01-01 00:00:00.000''
		AND boundDate_min = ''1900-01-01 00:00:00.000''
		AND boundDate_max = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET contactPremium = NULL 
	WHERE contactDate = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET submissionPremium = NULL 
	WHERE submissionDate_min = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET submissionPremium = NULL 
	WHERE submissionDate_max = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET declinedsubmissionPremium = NULL 
	WHERE declinedSubmissionDate_min = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET declinedsubmissionPremium = NULL 
	WHERE declinedSubmissionDate_max = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET quotedPremium = NULL
	WHERE quoteIssuedDate_min = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET quotedPremium = NULL
	WHERE quoteIssuedDate_max = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET declinedQuotePremium = NULL
	WHERE declinedQuoteDate_min = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET declinedQuotePremium = NULL
	WHERE declinedQuoteDate_max = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET boundPremium = NULL
	WHERE boundDate_min = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Make Path premium null if accociated action did not occur
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET boundPremium = NULL
	WHERE boundDate_max = ''1900-01-01 00:00:00.000''

-- Update Policy PathId table - Update expiration date
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET expirationdate =
		(select 
				max(expirationdate)
			from accessphlyeom.dbo.policy pol with (nolock)
			where PPI.policynumber = Pol.policynumber)
	from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work PPI
	WHERE policynumber is not null

-- Update Policy PathId table - Update expiration date
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET expirationMonth = MONTH(expirationdate),
		expirationYear = YEAR(expirationdate),
		expirationYearMonth = YEAR(expirationdate)*100+MONTH(expirationdate)
	WHERE policynumber is not null

-- Update Policy PathId table - Update source detail name
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET Source_Detail_Name = SD.SourceDetailName
	from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work PPI with (nolock)
	left join #PolicySnap_SD2 SD with (nolock)
		on SD.policynumber = PPI.policynumber
	WHERE Source_Detail_Name is null

-- Update Policy PathId table - Update source name 		--Added 3/06/2013
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET Source_Name = SN.Source_Name
	from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work PPI with (nolock)
	left join #PolicySnap_SN2 SN with (nolock)
		on SN.policynumber = PPI.policynumber
	WHERE PPI.Source_Name is null		

-- Update Policy PathId table - Update new fields
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET Insured_Years = 1 
		+ Number_of_Renewals
		+ Number_of_SubsequentRenewals,
		Policy_Premium_Level_Marketing = COALESCE(
			APPS_PS_Currentwrittenpremium,
			FinalAccountingPremium,
			boundPremium,
			quotedpremium,
			submissionPremium),
		Account_PY_Premium_Level_Marketing = 
		(Select 
				sum(COALESCE(
					PPI2.APPS_PS_Currentwrittenpremium,
					PPI2.FinalAccountingPremium,
					PPI2.boundPremium,
					PPI2.quotedpremium,
					PPI2.submissionPremium))
			from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work PPI2 with (nolock)
			where PPI2.accountnumber = PPI.accountnumber
				and PPI2.EffectiveYear = PPI.EffectiveYear),
		Policy_Premium_Level = APPS_PS_Currentwrittenpremium,
		Account_PY_Premium_Level = 
		(Select 
				sum(PPI3.APPS_PS_Currentwrittenpremium)
			from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work PPI3 with (nolock)
			where PPI3.accountnumber = PPI.accountnumber
				and PPI3.EffectiveYear = PPI.EffectiveYear)
		from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work PPI with (nolock)

-- Update Policy PathId table - Update new fields
UPDATE 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	SET Insured_Years_Range = 
			(case	
				when Insured_Years is null or Insured_Years = 0 
					then ''a: No data''
				when Insured_Years = 1 
					then ''b: 1 yr''
				when Insured_Years <= 3 
					then ''c: 2 to 3 yrs''
				when Insured_Years <= 5 
					then ''d: 4 to 5 yrs''
				when Insured_Years <= 8 
					then ''e: 6 to 8 yrs''
				else ''f: over 8 yrs''
					end),
		Written_Premium_Range = 
			(case 
				when policynumber is null 
					then 
						(Case 
							when Policy_Premium_Level_Marketing is Null 
								then ''a: no data''
							when Policy_Premium_Level_Marketing = 0 
								then ''a: no data''
							when Policy_Premium_Level_Marketing < 5000 
								then ''b: less than $5k''
							when Policy_Premium_Level_Marketing <= 20000 
								then ''c: $5k to $20k''
							when Policy_Premium_Level_Marketing <= 50000 
								then ''d: $20k to $50k''
							when Policy_Premium_Level_Marketing  <= 100000 
								then ''e: $50k to $100k''
							else ''f: over $100k'' 
								end)
				else 
					(case
						when Policy_Premium_Level is Null 
							then ''a: no data''
						when Policy_Premium_Level = 0 
							then ''a: no data''
						when Policy_Premium_Level < 5000 
							then ''b: less than $5k''
						when Policy_Premium_Level <= 20000 
							then ''c: $5k to $20k''
						when Policy_Premium_Level <= 50000 
							then ''d: $20k to $50k''
						when Policy_Premium_Level  <= 100000 
							then ''e: $50k to $100k''
						else ''f: over $100k'' 
							end)
					end),
		Account_Premium_Range = 
			(case 
				when policynumber is null 
					then 
						(Case 
							when Account_PY_Premium_Level_Marketing is null 
								then ''a: no data''
							when Account_PY_Premium_Level_Marketing < 20000 
								then ''b: less than $20k''
							when Account_PY_Premium_Level_Marketing < 50000 
								then ''c: $20k to $50k''
							when Account_PY_Premium_Level_Marketing < 100000 
								then ''d: $50k to $100k''
							when Account_PY_Premium_Level_Marketing < 250000 
								then ''e: $100k to $250k''
							when Account_PY_Premium_Level_Marketing < 500000 
								then ''f: $250k to $500k''
							else ''g: over $500k'' 
								end)
				else 
					(case
						when Account_PY_Premium_Level is null 
							then ''a: no data''
						when Account_PY_Premium_Level < 20000 
							then ''b: less than $20k''
						when Account_PY_Premium_Level < 50000 
							then ''c: $20k to $50k''
						when Account_PY_Premium_Level < 100000 
							then ''d: $50k to $100k''
						when Account_PY_Premium_Level < 250000 
							then ''e: $100k to $250k''
						when Account_PY_Premium_Level < 500000 
							then ''f: $250k to $500k''
						else ''g: over $500k'' 
							end)
					end)

-- Update Policy PathId table - Update new fields
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set SLD_BusinessType = 
			(case
				when productcode = ''FF'' 
					then FFPOL.TrimBusiness_Type
				when productcode = ''PV'' 
					then PVPOL.PVCD_Business_Type
				when productcode = ''AE'' 
					then AEPOL.AE_Accountant_Type
				when productcode = ''CL'' 
					then CLPOL.CL_BusinessType
				else null
					end),
		SLD_Occurrence_Limit = 
			(case
				when productcode = ''FF'' 
					then isnull(isnull(FF_DO_Limit,FF_EPL_Limit_int),0)
				when productcode = ''PV'' 
					then isnull(isnull(PVCD_PVDO_Limit,PVCD_PVEPL_Limit),0)
				when productcode = ''AE'' 
					then CONVERT(int,
						isnull(replace(replace(replace(substring(ltrim(rtrim(AE_Limit)
							),1,charindex(''/'',ltrim(rtrim(AE_Limit)))),'','',''''),''$'',''''),''/'',''''),''''))
				when productcode = ''CL'' 
					then convert(float,isnull(replace(ltrim(rtrim(CL_Occ_Limit)),'','',''''),''''))
				else null
					end),
		SLD_NumOfEmployees = 
			(case
				when productcode = ''FF'' 
					then ISNULL(FF_EPL_Num_of_Employees,0)
				when productcode = ''PV'' 
					then ISNULL(PVCD_PVEPL_Num_of_Employees,0)
				when productcode = ''AE'' 
					then isnull(AEPOL.AE_Num_of_Accountants,0)
				else null
					end)
	from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work POL with (nolock)
	left join Act_detailed_experience.dbo.Latest_Policy_Information_PVCD_view_1 PVPOL with (nolock)
		on PVPOL.policynumber = POL.policynumber
	left join Act_detailed_experience.dbo.Latest_Policy_information_FF_View_1 FFPOL with (nolock)
		on FFPOL.policynumber = POL.policynumber
	left join Act_detailed_experience.dbo.Latest_Policy_information_CL_View_1 CLPOL with (nolock)
		on CLPOL.policynumber = POL.policynumber
	left join Act_detailed_experience.dbo.Latest_Policy_Information_AE_View_1 AEPOL with (nolock)
		on AEPOL.policynumber = POL.policynumber
	where DivisionName = ''SL''

-- Build Account product type temp table
select
		accountnumber,
		effectiveYear,
		max
			(case 
				when producttype=''P'' 
					then producttype 
				else null 
					end) as Account_ProductType_P,
		max
			(case 
				when producttype=''S'' 
					then producttype 
				else null 
					end) as Account_ProductType_S,
		max
			(case 
				when producttype=''U'' 
					then producttype 
				else null 
					end) as Account_ProductType_U,
		max	
			(case 
				when producttype=''O'' 
					then producttype 
				else null 
					end) as Account_ProductType_O,
		max
			(case 
				when producttype=''A'' 
					then producttype 
				else null 
					end) as Account_ProductType_A,
		max
			(case 
				when producttype=''L'' 
					then producttype 
				else null 
					end) as Account_ProductType_L
	into #Acct_Producttype
	from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work with (nolock)
	group by 
		accountnumber,
		effectiveYear

-- Update Policy PathId table - Update new fields
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set Account_ProductType_P = ProdType.Account_ProductType_P,                               
		Account_ProductType_S = ProdType.Account_ProductType_S,
		Account_ProductType_U = ProdType.Account_ProductType_U,
		Account_ProductType_O = ProdType.Account_ProductType_O,
		Account_ProductType_A = ProdType.Account_ProductType_A,
		Account_ProductType_L = ProdType.Account_ProductType_L
	from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work PATHID with (nolock)
	left join #Acct_Producttype ProdType with (nolock)
		on ProdType.accountnumber = PATHID.accountnumber
		and ProdType.effectiveyear = PATHID.effectiveyear

-- Update Policy PathId table - Update new fields
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set Account_ProductType_ALL = RTRIM(
			case 
				when Account_ProductType_P is null 
					then ''''
				else (Account_ProductType_P + ''_'') 
					end 
			+ case
				when Account_ProductType_S is null 
					then '''' 
				else (Account_ProductType_S + ''_'') 
					end
			+ case 
				when Account_ProductType_U is null 
					then '''' 
				else (Account_ProductType_U + ''_'') 
					end
			+ case 
				when Account_ProductType_O is null 
					then '''' 
				else (Account_ProductType_O + ''_'') 
					end
			+ case 
				when Account_ProductType_A is null 
					then '''' 
				else (Account_ProductType_A + ''_'') 
					end
			+ case 
				when Account_ProductType_L is null 
					then '''' 
				else Account_ProductType_L 
					end),
		Account_ProductType_ALL_Desc =  RTRIM(
			case 
				when Account_ProductType_P is null 
					then ''''
				else ''Package, '' 
					end 
			+ case 
				when Account_ProductType_S is null 
					then '''' 
				else ''Specialty, '' 
					end
			+ case
				when Account_ProductType_U is null 
					then '''' 
				else ''Umbrella, '' 
					end
			+ case 
				when Account_ProductType_O is null 
					then '''' 
				else ''BOP, '' 
					end
			+ case 
				when Account_ProductType_A is null 
					then '''' 
				else ''Auto, '' 
					end
			+ case 
				when Account_ProductType_L is null 
					then '''' 
				else ''Leasing'' 
					end)

-- Update Policy PathId table - Update new fields
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set Account_ProductType_ALL = 
		left(Account_ProductType_ALL,len(Account_ProductType_ALL)-1)
	where right(Account_ProductType_ALL,1) = ''_''

-- Update Policy PathId table - Update new fields
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set Account_ProductType_ALL_Desc = 
		left(Account_ProductType_ALL_Desc,len(Account_ProductType_ALL_Desc)-1)
	where right(Account_ProductType_ALL_Desc,1) = '',''

-- Build Policy coverage FF temp table
Select
		policynumber,
	case 
		when SUM
			(case 
				when coveragecode = ''FLEXI1'' 
					then currentwrittenpremium 
				else 0 
					end) > 0 
			then ''D&O'' 
		else null 
			end as Policy_FF_Cov_DO,
	case 
		when sum
			(case 
				when coveragecode = ''FLEXI2'' 
					then currentwrittenpremium 
				else 0 
					end) > 0 
			then ''EPL'' 
		else null 
			end as Policy_FF_Cov_EPL,
	case 
		when sum
			(case 
				when coveragecode = ''FLEXI3'' 
					then currentwrittenpremium 
				else 0 
					end) > 0 
			then ''Fiduciary'' 
		else null 
			end as Policy_FF_Cov_Fid,
	case
		when sum
			(case 
				when coveragecode = ''FLEXI4'' 
					then currentwrittenpremium 
				else 0 
					end) > 0 
			then ''Workplace Violence'' 
		else null 
			end as Policy_FF_Cov_WPV,
	case 
		when sum
			(case 
				when coveragecode = ''FLEXI5'' 
					then currentwrittenpremium 
				else 0 
					end) > 0 
			then ''Internet'' 
		else null 
			end as Policy_FF_Cov_Internet
	into #Pol_Coverage_FF
	from AccessPHLYEOM.dbo.premiumsummary with (nolock)
	where coveragecode in (''FLEXI1'',''FLEXI2'',''FLEXI3'',''FLEXI4'',''FLEXI5'')
	group by 
		policynumber

-- Update Policy PathId table - Update Policy coverage FF
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set	Policy_FF_Cov_DO = PolCovFF.Policy_FF_Cov_DO,                               
		Policy_FF_Cov_EPL = PolCovFF.Policy_FF_Cov_EPL,
		Policy_FF_Cov_Fid = PolCovFF.Policy_FF_Cov_Fid,
		Policy_FF_Cov_WPV = PolCovFF.Policy_FF_Cov_WPV,
		Policy_FF_Cov_Internet = PolCovFF.Policy_FF_Cov_Internet
	from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work PATHID with (nolock)
	left join #Pol_Coverage_FF PolCovFF with (nolock)
		on PolCovFF.policynumber = PATHID.policynumber
		and PATHID.productcode = ''FF''

-- Update Policy PathId table - Update Policy coverage FF
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set FF_Cov_ALL = RTRIM
		(case 
			when productcode = ''FF'' 
				then
					(case 
						when Policy_FF_Cov_DO is null 
							then ''''
						else (rtrim(Policy_FF_Cov_DO) + ''_'') 
							end 
							+ case 
								when Policy_FF_Cov_EPL is null 
									then '''' 
								else (rtrim(Policy_FF_Cov_EPL) + ''_'') 
									end
									+ case 
										when Policy_FF_Cov_Fid is null 
											then '''' 
										else (rtrim(Policy_FF_Cov_Fid) + ''_'') 
											end
											+ case 
												when Policy_FF_Cov_WPV is null 
													then '''' 
												else (rtrim(Policy_FF_Cov_WPV) + ''_'') 
													end
													+ case 
														when Policy_FF_Cov_Internet is null 
															then '''' 
														else (rtrim(Policy_FF_Cov_Internet) + ''_'') 
															end) 
			else null 
				end)

-- Update Policy PathId table - Update Policy coverage FF
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set FF_Cov_ALL = left(FF_Cov_ALL,len(FF_Cov_ALL)-1) 
	where right(FF_Cov_ALL,1) = ''_''	and productcode = ''FF''				

-- Build Policy coverage PV temp table		
select
		policynumber,
	case 
		when SUM
			(case 
				when coveragecode = ''GLBI1'' 
					then currentwrittenpremium 
				else 0 
					end) > 0 
			then ''D&O'' 
		else null 
			end as Policy_PV_Cov_DO,
	case 
		when sum
			(case 
				when coveragecode = ''GLBI2'' 
					then currentwrittenpremium 
				else 0 
					end) > 0 
			then ''EPL'' 
		else null 
			end as Policy_PV_Cov_EPL,
	case 
		when sum
			(case 
				when coveragecode = ''GLBI3'' 
					then currentwrittenpremium 
				else 0 
					end) > 0 
			then ''Fiduciary'' 
		else null 
			end as Policy_PV_Cov_Fid,
	case 
		when sum
			(case 
				when coveragecode = ''GLBI4'' 
					then currentwrittenpremium 
				else 0 
					end) > 0 
			then ''Other'' 
		else null 
			end as Policy_PV_Cov_Other
	into #Pol_Coverage_PV
	from AccessPHLYEOM.dbo.premiumsummary with (nolock)
	where coveragecode in (''GLBI1'',''GLBI2'',''GLBI3'',''GLBI4'')
	group by 
		policynumber

-- Update Policy PathId table - Update Policy coverage PV
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set Policy_PV_Cov_DO = PolCovPV.Policy_PV_Cov_DO,                               
		Policy_PV_Cov_EPL = PolCovPV.Policy_PV_Cov_EPL,
		Policy_PV_Cov_Fid = PolCovPV.Policy_PV_Cov_Fid,
		Policy_PV_Cov_Other = PolCovPV.Policy_PV_Cov_Other
	from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work PATHID with (nolock)
	left join #Pol_Coverage_PV PolCovPV with (nolock)
		on PolCovPV.policynumber = PATHID.policynumber
		and PATHID.productcode = ''PV''

-- Update Policy PathId table - Update Policy coverage all
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set PV_Cov_ALL = 
			RTRIM
				(case 
					when productcode = ''PV'' 
						then
							(case 
								when Policy_PV_Cov_DO is null 
									then ''''
								else 
									(rtrim(Policy_PV_Cov_DO) + ''_'') 
									end 
							+ case 
								when Policy_PV_Cov_EPL is null 
									then '''' 
								else 
									(rtrim(Policy_PV_Cov_EPL) + ''_'') 
									end
							+ case 
								when Policy_PV_Cov_Fid is null 
									then '''' 
								else 
									(rtrim(Policy_PV_Cov_Fid) + ''_'') 
									end
							+ case 
								when Policy_PV_Cov_Other is null 
									then '''' 
								else 
									(rtrim(Policy_PV_Cov_Other) + ''_'') 
									end)
					else null 
						end)

-- Update Policy PathId table - Update Policy coverage all
Update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set PV_Cov_ALL = left(PV_Cov_ALL,
		len(PV_Cov_ALL)-1)
	where right(PV_Cov_ALL,1) = ''_'' and productcode = ''PV''

---- Build Dupe Policy or Path ID Temp Table
--SELECT A.Policynumber_or_PATHID AS Policynumber_or_PATHID_x
--INTO #DupePathID
--FROM Act_Detailed_Experience.dbo.Policy_PATHID_Information_work A with (nolock)
--GROUP BY A.Policynumber_or_PATHID
--HAVING COUNT(*)>1



------ Pull in Prior Product Code
--SELECT A.idnum
--,A.policynumber
--,A.Policynumber_or_PATHID
--,A.productcode AS CurrentProductCode
--,COALESCE(C.ProductCode,D.ProductCode,A.ProductCode) AS PriorProductCode
--INTO #DupePathID2
--FROM Act_Detailed_Experience.dbo.Policy_PATHID_Information_work A with (index(IX_productcode))
--INNER JOIN #DupePathID B
--ON B.Policynumber_or_PATHID_x = A.Policynumber_or_PATHID
--LEFT JOIN Act_Detailed_Experience.dbo.Policy_PATHID_Information_work C with (nolock)
--ON C.policynumber = A.expiringpolicynumber
--LEFT JOIN Act_Detailed_Experience.dbo.Policy_PATHID_Information_work D with (nolock)
--ON D.policynumber = A.prevpolicynumber


------ Pull in max idnum for the Product that matches the prior product
--select
--    A.Policynumber_or_PATHID as Policynumber_or_PATHID_x, 
--    MAX(A.idnum) as MaxIDNum  
--into #DupeMaxPathIDperProd
--from #DupePathID2 A
--WHERE CurrentProductCode = PriorProductCode
--GROUP BY A.Policynumber_or_PATHID

---- Update Policy PathId table - remove duplicates
--update 
--	Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
--set policynumber = NULL,
--    Policynumber_or_PATHID = idnum
--from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work ppi  with (nolock)
--join #DupeMaxPathIDperProd MaxIdNum with (nolock)
--    on ppi.Policynumber_or_PATHID = MaxIdNum.Policynumber_or_PATHID_x
--where isnull(idnum, 0) != MaxIdNum.MaxIDNum
--go

--drop table #DupeMaxPathID_Check
select
            Policynumber_or_PATHID as Policynumber_or_PATHID_x, 
            MAX(idnum) as MaxIDNum  
      into #DupeMaxPathID_Check
      from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work with (nolock)
      group by 
            Policynumber_or_PATHID
      having 
            COUNT(*)>1

-- Update Policy PathId table - remove duplicates
update 
            Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
      set policynumber = NULL,
            Policynumber_or_PATHID = idnum
      from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work ppi  with (nolock)
      join #DupeMaxPathID_Check A with (nolock)
            on ppi.Policynumber_or_PATHID = A.Policynumber_or_PATHID_x
      where isnull(idnum, 0) != A.MaxIDNum



-- Build Dupe Policy table for County caused duplicates 
select 
		Policynumber_or_PATHID as Policynumber_or_PATHID_x, 
		TopCounty = max(Insd_County)
	into #DupeTopCounty
	from 
		(select
			Policynumber_or_PATHID, 
			Insd_County
			from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work with (nolock)
			group by 
				Policynumber_or_PATHID, Insd_County
		) as temp1
	group by 
		Policynumber_or_PATHID
	having COUNT(*)>1

-- Update Policy PathId table - remove duplicates
update 
		Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
	set policynumber = NULL,
		Policynumber_or_PATHID = idnum
	from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work ppi with (nolock)
	join #DupeTopCounty DupeTopCounty with (nolock)
		on ppi.Policynumber_or_PATHID = DupeTopCounty.Policynumber_or_PATHID_x
	where Insd_County != DupeTopCounty.TopCounty


Alter table Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
add
      [NationalParentAgencyYN] [varchar]	(50)
      ,[GroupParentAgencyYN] [varchar]		(50)
      ,[GroupParentAgencyNumber] [varchar]	(50)
      ,[GroupParentAgencyName] [varchar]	(250)
      ,[NationalParentAgencyNumber] [varchar] (50)
      ,[NationalParentAgencyName] [varchar] (250)
      ,[Insd_ZipCode_3] [varchar] (3) 
      ,[Insd_ZipCode_5] [varchar] (5)
      
--go
 
UPDATE Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
SET
 
NationalParentAgencyYN = case when NationalParents.ParentEntityID is not null then ''Y''
            when NationalParentChildren.ChildEntityID is not null then ''N''
            else null end,
            
GroupParentAgencyYN = case when GroupParents.ParentEntityID is not null then ''Y''
            when GroupParentChildren.ChildEntityID is not null then ''N''
            else null end,          
            
GroupParentAgencyNumber = case when GroupParents.ParentEntityID is not null 
            then PrimaryProducerNumber else GroupParentChildren.AgencyNumber end,
GroupParentAgencyName = case when GroupParents.ParentEntityID is not null 
            then PrimaryProducer else GroupParentChildren.Company end,
 
NationalParentAgencyNumber = case when NationalParents.ParentEntityID is not null 
            then PrimaryProducerNumber else NationalParentChildren.AgencyNumber end,
NationalParentAgencyName = case when NationalParents.ParentEntityID is not null 
            then PrimaryProducer else NationalParentChildren.Company end
 
FROM Act_Detailed_Experience.dbo.Policy_PATHID_Information_work pathid
 
join pathnet2.dbo.Agency Agency 
      on agency.AgencyNumber = pathid.PrimaryProducerNumber
 
outer apply
(
      select distinct eer.ParentEntityID
      FROM pathnet2.dbo.EntityEntityRelation  eer
      INNER JOIN pathnet2.dbo.RoleSubType rst on rst.RoleSubTypeID = eer.RoleSubTypeID
      WHERE rst.Description = ''National Child Agency''
      AND eer.IsActive = 1
      and eer.ParentEntityID = Agency.AgencyEntityID
) NationalParents 
 
outer apply
(
      select distinct eer.ParentEntityID, a.AgencyNumber, e.Company, eer.ChildEntityID
      FROM pathnet2.dbo.EntityEntityRelation eer
      INNER JOIN pathnet2.dbo.RoleSubType rst on rst.RoleSubTypeID = eer.RoleSubTypeID
      join pathnet2.dbo.Agency a on a.AgencyEntityID = eer.ParentEntityID
      join pathnet2.dbo.Entity e on e.EntityID = a.AgencyEntityID
      WHERE rst.Description = ''National Child Agency''
      AND eer.IsActive = 1
      and eer.ChildEntityID = Agency.AgencyEntityID
) NationalParentChildren 
 
outer apply
(
      select distinct eer.ParentEntityID
      FROM pathnet2.dbo.EntityEntityRelation eer
      INNER JOIN pathnet2.dbo.RoleSubType rst on rst.RoleSubTypeID = eer.RoleSubTypeID
      WHERE rst.Description = ''Child Agency''
      AND eer.IsActive = 1
      AND eer.ParentEntityID = Agency.AgencyEntityID
) GroupParents 
 
outer apply
(
      select distinct eer.ParentEntityID, a.AgencyNumber, e.Company, eer.ChildEntityID
      FROM pathnet2.dbo.EntityEntityRelation eer
      INNER JOIN pathnet2.dbo.RoleSubType rst on rst.RoleSubTypeID = eer.RoleSubTypeID
      join pathnet2.dbo.Agency a on a.AgencyEntityID = eer.ParentEntityID
      join pathnet2.dbo.Entity e on e.EntityID = a.AgencyEntityID
      WHERE rst.Description = ''Child Agency''
      AND eer.IsActive = 1
      AND eer.ChildEntityID = Agency.AgencyEntityID
) GroupParentChildren
 
--go

            
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
set 
       Insd_ZipCode_3 = LEFT(LTRIM(PATHID.Insd_Zip),3),
       Insd_ZipCode_5 = LEFT(LTRIM(PATHID.Insd_Zip),5)
                                                
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work PATHID
--go

if exists (select 1 from sys.tables
           where name = ''Policy_PATHID_Information_work_hold'')
   drop table Act_Detailed_Experience.dbo.Policy_PATHID_Information_work_hold
   
exec sp_rename ''Policy_PATHID_Information_work'', ''Policy_PATHID_Information_work_hold''

CREATE NONCLUSTERED INDEX [idx_src_polpath] ON Policy_PATHID_Information_work_hold(Policynumber_or_PATHID ASC )
WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [idx_src_Expdte] ON Policy_PATHID_Information_work_hold(expirationdate DESC )
WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
 

CREATE TABLE Act_Detailed_Experience.[dbo].[Policy_PATHID_Information_work]
(
[idnum] [int] NULL,
[leadID] [int] NULL,
[policynumber] [varchar](15) NULL,
[expiringpolicynumber] [varchar](20) NULL,
[statusdesc3] [varchar](50) NULL,
[Policynumber_or_PATHID] [varchar](15) NULL,
[accountnumber] [int] NULL,
[accountname] [varchar](100) NULL,
[regioncode] [varchar](2) NULL,
[regiondesc] [varchar](50) NULL,
[PICProducer] [varchar](102) NULL,
[PrimaryProducer] [varchar](250) NULL,
[PrimaryProducerType] [varchar](100) NULL,
[PrimaryProducerNumber] [int] NULL,
[program] [varchar](4) NULL,
[programdesc] [varchar](50) NULL,
[BusinessClassDesc] [varchar](75) NULL,
[Source_Detail_Name] [varchar](50) NULL,
[Source_Name] [varchar](50) NULL,
[PolicyID] [uniqueidentifier] NULL,
[ratingsourcecode] [varchar](10) NULL,
[RatingSystemID] [bigint] NULL,
[CompanyCode] [varchar](2) NULL,
[underwriterName] [varchar](102) NULL,
[AsstUnderwriterName] [varchar](150) NULL,
[AccountExecRepName] [varchar](102) NULL,
[DivisionName] [varchar](50) NULL,
[productline] [char](2) NULL,
[productcode] [varchar](2) NULL,
[productdesc] [varchar](50) NULL,
[productshortdesc] [varchar](15) NULL,
[producttype] [char](1) NULL,
[ProductTypeName] [varchar](50) NULL,
[prodmixname] [varchar](50) NULL,
[reportmixname] [varchar](30) NULL,
[Product_group] [nvarchar](255) NULL,
[NewRenewalAuto] [varchar](50) NULL,
[effectivedate] [datetime] NULL,
[effectiveMonth] [int] NULL,
[effectiveYear] [int] NULL,
[effectiveYearMonth] [int] NULL,
[expirationdate] [datetime] NULL,
[expirationMonth] [int] NULL,
[expirationYear] [int] NULL,
[expirationYearMonth] [int] NULL,
[Insd_State] [varchar](2) NULL,
[Insd_City] [varchar](50) NULL,
[Insd_County] [varchar](60) NULL,
[Insd_Zip] [varchar](10) NULL,
[Insd_Address1] [varchar](100) NULL,
[contactDate] [datetime] NULL,
[contactpremium] [decimal](18, 2) NULL,
[createddatetime] [datetime] NULL,
[submissionDate_min] [datetime] NULL,
[submissionDate_max] [datetime] NULL,
[submissionPremium] [decimal](18, 2) NULL,
[declinedSubmissionDate_min] [datetime] NULL,
[declinedSubmissionDate_max] [datetime] NULL,
[declinedSubmissionPremium] [decimal](18, 2) NULL,
[quoteIssuedDate_min] [datetime] NULL,
[quoteIssuedDate_max] [datetime] NULL,
[quotedpremium] [decimal](18, 2) NULL,
[declinedQuoteDate_min] [datetime] NULL,
[declinedQuoteDate_max] [datetime] NULL,
[declinedQuotePremium] [decimal](18, 2) NULL,
[boundDate_min] [datetime] NULL,
[boundDate_max] [datetime] NULL,
[boundPremium] [decimal](15, 2) NULL,
[FinalAccountingPremium] [decimal](38, 2) NULL,
[APPS_PS_Currentwrittenpremium] [decimal](38, 2) NULL,
[prevpolicynumber] [varchar](15) NULL,
[prior_policynumber_2] [varchar](15) NULL,
[prior_policynumber_3] [varchar](15) NULL,
[prior_policynumber_4] [varchar](15) NULL,
[prior_policynumber_5] [varchar](15) NULL,
[prior_policynumber_6] [varchar](15) NULL,
[prior_policynumber_7] [varchar](15) NULL,
[prior_policynumber_8] [varchar](15) NULL,
[Number_of_Renewals] [int] NULL,
[Consecutive_Auto_Renewals] [int] NULL,
[Number_of_SubsequentRenewals] [int] NULL,
[SICCode] [varchar](7) NULL,
[SICDesc] [varchar](255) NULL,
[SICDivisionDesc] [nvarchar](255) NULL,
[SICMajorGroupDesc] [nvarchar](255) NULL,
[SICIndustryDesc] [nvarchar](255) NULL,
[UnderwriterGroup] [varchar](13) NOT NULL,
[NewRenewalAutoV2] [varchar](50) NULL,
[Insured_Years] [int] NULL,
[Policy_Premium_Level_Marketing] [float] NULL,
[Account_PY_Premium_Level_Marketing] [float] NULL,
[Policy_Premium_Level] [float] NULL,
[Account_PY_Premium_Level] [float] NULL,
[Insured_Years_Range] [varchar](50) NULL,
[Written_Premium_Range] [varchar](50) NULL,
[Account_Premium_Range] [varchar](50) NULL,
[SLD_BusinessType] [char](100) NULL,
[SLD_Occurrence_Limit] [int] NULL,
[SLD_NumOfEmployees] [int] NULL,
[Account_ProductType_P] [char](1) NULL,
[Account_ProductType_S] [char](1) NULL,
[Account_ProductType_U] [char](1) NULL,
[Account_ProductType_O] [char](1) NULL,
[Account_ProductType_A] [char](1) NULL,
[Account_ProductType_L] [char](1) NULL,
[Account_ProductType_ALL] [varchar](11) NULL,
[Account_ProductType_ALL_Desc] [varchar](100) NULL,
[Policy_FF_Cov_DO] [varchar](5) NULL,
[Policy_FF_Cov_EPL] [varchar](5) NULL,
[Policy_FF_Cov_Fid] [varchar](10) NULL,
[Policy_FF_Cov_WPV] [varchar](20) NULL,
[Policy_FF_Cov_Internet] [varchar](10) NULL,
[FF_Cov_ALL] [varchar](100) NULL,
[Policy_PV_Cov_DO] [varchar](5) NULL,
[Policy_PV_Cov_EPL] [varchar](5) NULL,
[Policy_PV_Cov_Fid] [varchar](10) NULL,
[Policy_PV_Cov_Other] [varchar](10) NULL,
[PV_Cov_ALL] [varchar](50) NULL,
[prevpolicy_premium] [float] NULL,
[policy_premium_2] [float] NULL,
[policy_premium_3] [float] NULL,
[policy_premium_4] [float] NULL,
[policy_premium_5] [float] NULL,
[policy_premium_6] [float] NULL,
[policy_premium_7] [float] NULL,
[policy_premium_8] [float] NULL,
[prevpolicy_Effectivedate] [datetime] NULL,
[policy_Effectivedate_2] [datetime] NULL,
[policy_Effectivedate_3] [datetime] NULL,
[policy_Effectivedate_4] [datetime] NULL,
[policy_Effectivedate_5] [datetime] NULL,
[policy_Effectivedate_6] [datetime] NULL,
[policy_Effectivedate_7] [datetime] NULL,
[policy_Effectivedate_8] [datetime] NULL,
[prevpolicy_Expirationdate] [datetime] NULL,
[policy_Expirationdate_2] [datetime] NULL,
[policy_Expirationdate_3] [datetime] NULL,
[policy_Expirationdate_4] [datetime] NULL,
[policy_Expirationdate_5] [datetime] NULL,
[policy_Expirationdate_6] [datetime] NULL,
[policy_Expirationdate_7] [datetime] NULL,
[policy_Expirationdate_8] [datetime] NULL,
[Yr_MM_30_60_days] [int] NULL,
[Yr_MM_60_90_days] [int] NULL,
[Yr_MM_90_120_days] [int] NULL,
[Loss_max_YRMM] [int] NULL,
[Accountstatistic_LossRatio] [float] NULL,
[EarnedPremium_Acct_CurrEval] [float] NULL,
[Incurred_LossALAE_Acct_CurrEval] [float] NULL,
[Incurred_LossRatio_Acct_CurrEval] [float] NULL,
[Incurred_LossRatio_Acct_CurrEval_Range] [varchar](50) NULL,
[EarnedPremium_Acct_Div_CurrEval] [float] NULL,
[Incurred_LossALAE_Acct_Div_CurrEval] [float] NULL,
[Incurred_LossRatio_Acct_Div_CurrEval] [float] NULL,
[Incurred_LossRatio_Acct_Div_CurrEval_Range] [varchar](50) NULL,
[EarnedPremium_Acct_Div_Prod_CurrEval] [float] NULL,
[Incurred_LossALAE_Acct_Div_Prod_CurrEval] [float] NULL,
[Incurred_LossRatio_Acct_Div_Prod_CurrEval] [float] NULL,
[Incurred_LossRatio_Acct_Div_Prod_CurrEval_Range] [varchar](50) NULL,
[EarnedPremium_Acct_60_90] [float] NULL,
[Incurred_LossALAE_Acct_60_90] [float] NULL,
[Incurred_LossRatio_Acct_60_90] [float] NULL,
[Incurred_LossRatio_Acct_60_90_Range] [varchar](50) NULL,
[EarnedPremium_Acct_Div_60_90] [float] NULL,
[Incurred_LossALAE_Acct_Div_60_90] [float] NULL,
[Incurred_LossRatio_Acct_Div_60_90] [float] NULL,
[Incurred_LossRatio_Acct_Div_60_90_Range] [varchar](50) NULL,
[EarnedPremium_Acct_Div_Prod_60_90] [float] NULL,
[Incurred_LossALAE_Acct_Div_Prod_60_90] [float] NULL,
[Incurred_LossRatio_Acct_Div_Prod_60_90] [float] NULL,
[Incurred_LossRatio_Acct_Div_Prod_60_90_Range] [varchar](50) NULL,
[EarnedPremium_Acct_90_120] [float] NULL,
[Incurred_LossALAE_Acct_90_120] [float] NULL,
[Incurred_LossRatio_Acct_90_120] [float] NULL,
[Incurred_LossRatio_Acct_90_120_Range] [varchar](50) NULL,
[EarnedPremium_Acct_Div_90_120] [float] NULL,
[Incurred_LossALAE_Acct_Div_90_120] [float] NULL,
[Incurred_LossRatio_Acct_Div_90_120] [float] NULL,
[Incurred_LossRatio_Acct_Div_90_120_Range] [varchar](50) NULL,
[EarnedPremium_Acct_Div_Prod_90_120] [float] NULL,
[Incurred_LossALAE_Acct_Div_Prod_90_120] [float] NULL,
[Incurred_LossRatio_Acct_Div_Prod_90_120] [float] NULL,
[Incurred_LossRatio_Acct_Div_Prod_90_120_Range] [varchar](50) NULL,
[EarnedPremium_Acct_5UWYr_CurrEval] [float] NULL,
[Incurred_LossALAE_Acct_5UWYr_CurrEval] [float] NULL,
[Incurred_LossRatio_Acct_5UWYr_CurrEval] [float] NULL,
[Incurred_LossRatio_Acct_5UWYr_CurrEval_Range] [varchar](50) NULL,
[Incurred_LossRatio_Acct_5UWYr_CurrEval_Range_PriorPol] [varchar](50) NULL,
[EarnedPremium_Pol_5Yr_Div_60_90] [float] NULL,
[Incurred_LossALAE_Pol_5Yr_Div_60_90] [float] NULL,
[Incurred_LossRatio_Pol_5Yr_Div_60_90] [float] NULL,
[Incurred_LossRatio_Pol_5Yr_Div_60_90_Range] [varchar](50) NULL,
[Incurred_LossRatio_Pol_5Yr_Div_60_90_Range_PriorPol] [varchar](50) NULL,
[Policy_Judgment_Mod_nonUC] [float] NULL,
[Policy_Judgment_Mod_UC] [float] NULL,
[Policy_Judgment_Mod_GL] [float] NULL,
[Policy_Judgment_Mod_Automobile] [float] NULL,
[Policy_Percent_Monitored] [float] NULL,
[AccountDiv_Judgment_Mod_nonUC] [float] NULL,
[AccountDiv_Judgment_Mod_UC] [float] NULL,
[AccountDiv_Percent_Monitored] [float] NULL,
[AccountDiv_Judgment_Mod_NonUC_Range] [varchar](50) NULL,
[AccountDiv_Judgment_Mod_UC_Range] [varchar](50) NULL,
[Policy_Judgment_Mod_GL_Range] [varchar](50) NULL,
[Policy_Judgment_Mod_Automobile_Range] [varchar](50) NULL,
[NationalParentAgencyYN] [varchar](50) NULL,
[GroupParentAgencyYN] [varchar](50) NULL,
[GroupParentAgencyNumber] [varchar](50) NULL,
[GroupParentAgencyName] [varchar](250) NULL,
[NationalParentAgencyNumber] [varchar](50) NULL,
[NationalParentAgencyName] [varchar](250) NULL,
[Insd_ZipCode_3] [varchar](3) NULL,
[Insd_ZipCode_5] [varchar](5) NULL
) ON [PRIMARY]

-- Create the daily table 
;WITH CTE AS
(
      Select ROW_NUMBER() OVER(PARTITION BY Policynumber_or_PATHID ORDER BY expirationdate desc) as RN,*
      From Policy_PATHID_Information_work_hold
)
insert into Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
SELECT 
	   [idnum]
      ,[leadID]
      ,[policynumber]
      ,[expiringpolicynumber]
      ,[statusdesc3]
      ,[Policynumber_or_PATHID]
      ,[accountnumber]
      ,[accountname]
      ,[regioncode]
      ,[regiondesc]
      ,[PICProducer]
      ,[PrimaryProducer]
      ,[PrimaryProducerType]
      ,[PrimaryProducerNumber]
      ,[program]
      ,[programdesc]
      ,[BusinessClassDesc]
      ,[Source_Detail_Name]
      ,[Source_Name]
      ,[PolicyID]
      ,[ratingsourcecode]
      ,[RatingSystemID]
      ,[CompanyCode]
      ,[underwriterName]
      ,[AsstUnderwriterName]
      ,[AccountExecRepName]
      ,[DivisionName]
      ,[productline]
      ,[productcode]
      ,[productdesc]
      ,[productshortdesc]
      ,[producttype]
      ,[ProductTypeName]
      ,[prodmixname]
      ,[reportmixname]
      ,[Product_group]
      ,[NewRenewalAuto]
      ,[effectivedate]
      ,[effectiveMonth]
      ,[effectiveYear]
      ,[effectiveYearMonth]
      ,[expirationdate]
      ,[expirationMonth]
      ,[expirationYear]
      ,[expirationYearMonth]
      ,[Insd_State]
      ,[Insd_City]
      ,[Insd_County]
      ,[Insd_Zip]
      ,[Insd_Address1]
      ,[contactDate]
      ,[contactpremium]
      ,[createddatetime]
      ,[submissionDate_min]
      ,[submissionDate_max]
      ,[submissionPremium]
      ,[declinedSubmissionDate_min]
      ,[declinedSubmissionDate_max]
      ,[declinedSubmissionPremium]
      ,[quoteIssuedDate_min]
      ,[quoteIssuedDate_max]
      ,[quotedpremium]
      ,[declinedQuoteDate_min]
      ,[declinedQuoteDate_max]
      ,[declinedQuotePremium]
      ,[boundDate_min]
      ,[boundDate_max]
      ,[boundPremium]
      ,[FinalAccountingPremium]
      ,[APPS_PS_Currentwrittenpremium]
      ,[prevpolicynumber]
      ,[prior_policynumber_2]
      ,[prior_policynumber_3]
      ,[prior_policynumber_4]
      ,[prior_policynumber_5]
      ,[prior_policynumber_6]
      ,[prior_policynumber_7]
      ,[prior_policynumber_8]
      ,[Number_of_Renewals]
      ,[Consecutive_Auto_Renewals]
      ,[Number_of_SubsequentRenewals]
      ,[SICCode]
      ,[SICDesc]
      ,[SICDivisionDesc]
      ,[SICMajorGroupDesc]
      ,[SICIndustryDesc]
      ,[UnderwriterGroup]
      ,[NewRenewalAutoV2]
      ,[Insured_Years]
      ,[Policy_Premium_Level_Marketing]
      ,[Account_PY_Premium_Level_Marketing]
      ,[Policy_Premium_Level]
      ,[Account_PY_Premium_Level]
      ,[Insured_Years_Range]
      ,[Written_Premium_Range]
      ,[Account_Premium_Range]
      ,[SLD_BusinessType]
      ,[SLD_Occurrence_Limit]
      ,[SLD_NumOfEmployees]
      ,[Account_ProductType_P]
      ,[Account_ProductType_S]
      ,[Account_ProductType_U]
      ,[Account_ProductType_O]
      ,[Account_ProductType_A]
      ,[Account_ProductType_L]
      ,[Account_ProductType_ALL]
      ,[Account_ProductType_ALL_Desc]
      ,[Policy_FF_Cov_DO]
      ,[Policy_FF_Cov_EPL]
      ,[Policy_FF_Cov_Fid]
      ,[Policy_FF_Cov_WPV]
      ,[Policy_FF_Cov_Internet]
      ,[FF_Cov_ALL]
      ,[Policy_PV_Cov_DO]
      ,[Policy_PV_Cov_EPL]
      ,[Policy_PV_Cov_Fid]
      ,[Policy_PV_Cov_Other]
      ,[PV_Cov_ALL]
      ,[prevpolicy_premium]
      ,[policy_premium_2]
      ,[policy_premium_3]
      ,[policy_premium_4]
      ,[policy_premium_5]
      ,[policy_premium_6]
      ,[policy_premium_7]
      ,[policy_premium_8]
      ,[prevpolicy_Effectivedate]
      ,[policy_Effectivedate_2]
      ,[policy_Effectivedate_3]
      ,[policy_Effectivedate_4]
      ,[policy_Effectivedate_5]
      ,[policy_Effectivedate_6]
      ,[policy_Effectivedate_7]
      ,[policy_Effectivedate_8]
      ,[prevpolicy_Expirationdate]
      ,[policy_Expirationdate_2]
      ,[policy_Expirationdate_3]
      ,[policy_Expirationdate_4]
      ,[policy_Expirationdate_5]
      ,[policy_Expirationdate_6]
      ,[policy_Expirationdate_7]
      ,[policy_Expirationdate_8]
      ,[Yr_MM_30_60_days]
      ,[Yr_MM_60_90_days]
      ,[Yr_MM_90_120_days]
      ,[Loss_max_YRMM]
      ,[Accountstatistic_LossRatio]
      ,[EarnedPremium_Acct_CurrEval]
      ,[Incurred_LossALAE_Acct_CurrEval]
      ,[Incurred_LossRatio_Acct_CurrEval]
      ,[Incurred_LossRatio_Acct_CurrEval_Range]
      ,[EarnedPremium_Acct_Div_CurrEval]
      ,[Incurred_LossALAE_Acct_Div_CurrEval]
      ,[Incurred_LossRatio_Acct_Div_CurrEval]
      ,[Incurred_LossRatio_Acct_Div_CurrEval_Range]
      ,[EarnedPremium_Acct_Div_Prod_CurrEval]
      ,[Incurred_LossALAE_Acct_Div_Prod_CurrEval]
      ,[Incurred_LossRatio_Acct_Div_Prod_CurrEval]
      ,[Incurred_LossRatio_Acct_Div_Prod_CurrEval_Range]
      ,[EarnedPremium_Acct_60_90]
      ,[Incurred_LossALAE_Acct_60_90]
      ,[Incurred_LossRatio_Acct_60_90]
      ,[Incurred_LossRatio_Acct_60_90_Range]
      ,[EarnedPremium_Acct_Div_60_90]
      ,[Incurred_LossALAE_Acct_Div_60_90]
      ,[Incurred_LossRatio_Acct_Div_60_90]
      ,[Incurred_LossRatio_Acct_Div_60_90_Range]
      ,[EarnedPremium_Acct_Div_Prod_60_90]
      ,[Incurred_LossALAE_Acct_Div_Prod_60_90]
      ,[Incurred_LossRatio_Acct_Div_Prod_60_90]
      ,[Incurred_LossRatio_Acct_Div_Prod_60_90_Range]
      ,[EarnedPremium_Acct_90_120]
      ,[Incurred_LossALAE_Acct_90_120]
      ,[Incurred_LossRatio_Acct_90_120]
      ,[Incurred_LossRatio_Acct_90_120_Range]
      ,[EarnedPremium_Acct_Div_90_120]
      ,[Incurred_LossALAE_Acct_Div_90_120]
      ,[Incurred_LossRatio_Acct_Div_90_120]
      ,[Incurred_LossRatio_Acct_Div_90_120_Range]
      ,[EarnedPremium_Acct_Div_Prod_90_120]
      ,[Incurred_LossALAE_Acct_Div_Prod_90_120]
      ,[Incurred_LossRatio_Acct_Div_Prod_90_120]
      ,[Incurred_LossRatio_Acct_Div_Prod_90_120_Range]
      ,[EarnedPremium_Acct_5UWYr_CurrEval]
      ,[Incurred_LossALAE_Acct_5UWYr_CurrEval]
      ,[Incurred_LossRatio_Acct_5UWYr_CurrEval]
      ,[Incurred_LossRatio_Acct_5UWYr_CurrEval_Range]
      ,[Incurred_LossRatio_Acct_5UWYr_CurrEval_Range_PriorPol]
      ,[EarnedPremium_Pol_5Yr_Div_60_90]
      ,[Incurred_LossALAE_Pol_5Yr_Div_60_90]
      ,[Incurred_LossRatio_Pol_5Yr_Div_60_90]
      ,[Incurred_LossRatio_Pol_5Yr_Div_60_90_Range]
      ,[Incurred_LossRatio_Pol_5Yr_Div_60_90_Range_PriorPol]
      ,[Policy_Judgment_Mod_nonUC]
      ,[Policy_Judgment_Mod_UC]
      ,[Policy_Judgment_Mod_GL]
      ,[Policy_Judgment_Mod_Automobile]
      ,[Policy_Percent_Monitored]
      ,[AccountDiv_Judgment_Mod_nonUC]
      ,[AccountDiv_Judgment_Mod_UC]
      ,[AccountDiv_Percent_Monitored]
      ,[AccountDiv_Judgment_Mod_NonUC_Range]
      ,[AccountDiv_Judgment_Mod_UC_Range]
      ,[Policy_Judgment_Mod_GL_Range]
      ,[Policy_Judgment_Mod_Automobile_Range]
      ,[NationalParentAgencyYN]
      ,[GroupParentAgencyYN]
      ,[GroupParentAgencyNumber]
      ,[GroupParentAgencyName]
      ,[NationalParentAgencyNumber]
      ,[NationalParentAgencyName]
      ,[Insd_ZipCode_3]
      ,[Insd_ZipCode_5]
FROM CTE 
WHERE RN = 1

-- Create IX_idnum Index
if not exists 
	(select	1 
		from sys.indexes 
		where name = ''IX_idnum''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_idnum
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work 
			(idnum)

-- Create IX_Policynumber Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_Policynumber''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_Policynumber
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work 
			(Policynumber)

-- Create IX_Policynumber_or_PATHID Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_Policynumber_or_PATHID''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_Policynumber_or_PATHID
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work 
			(Policynumber_or_PATHID)

-- Create IX_reportmixname Index
if not exists 
	(select 1
		from sys.indexes 
		where name = ''IX_reportmixname''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_reportmixname 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(reportmixname)

-- Create IX_prodmixname Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_prodmixname''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_prodmixname 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(prodmixname)

-- Create IX_Product_group Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_Product_group''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_Product_group 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(Product_group)

-- Create IX_ProductTypeName Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_ProductTypeName''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_ProductTypeName 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(ProductTypeName)

-- Create IX_productcode Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_productcode''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_productcode 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(productcode)

-- Create IX_CompanyCode Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_CompanyCode''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_CompanyCode
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(CompanyCode)

-- Create IX_DivisionName Index
if not exists 
	(select 1
		from sys.indexes 
		where name = ''IX_DivisionName''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_DivisionName
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(DivisionName)

-- Create IX_regiondesc Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_regiondesc''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_regiondesc
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(regiondesc)

-- Create IX_PrimaryProducer Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_PrimaryProducer''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_PrimaryProducer 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(PrimaryProducer)

-- Create IX_PICProducer
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_PICProducer''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_PICProducer 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(PICProducer)

-- Create IX_underwriterName Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_underwriterName''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_underwriterName
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(underwriterName)

-- Create IX_UnderwriterGroup Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_UnderwriterGroup''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_UnderwriterGroup
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(UnderwriterGroup)

-- Create IX_AsstUnderwriterName Index
if not exists 
      (select 1 
            from sys.indexes 
            where name = ''IX_AsstUnderwriterName''
                  and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
      create index IX_AsstUnderwriterName
            on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
                  (AsstUnderwriterName)--Added 3/06/2013
 
 -- Create IX_AccountExecRepName Index
if not exists 
      (select 1 
            from sys.indexes 
            where name = ''IX_AccountExecRepName''
                  and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
      create index IX_AccountExecRepName
            on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
                  (AccountExecRepName)    --Added 3/06/2013



-- Create IX_program Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_program''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_program 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(program)

-- Create IX_BusinessClassDesc Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_BusinessClassDesc''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_BusinessClassDesc 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(BusinessClassDesc)

-- Create IX_Source_Detail_Name Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_Source_Detail_Name''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_Source_Detail_Name 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(Source_Detail_Name)

-- Create IX_Source_Name Index
if not exists 
      (select 1 
            from sys.indexes 
            where name = ''IX_Source_Name''
                  and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
      create index IX_Source_Name 
            on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
                  (Source_Name)

-- Create IX_Written_Premium_Range
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_Written_Premium_Range''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_Written_Premium_Range
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(Written_Premium_Range)

-- Create IX_Account_Premium_Range Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_Account_Premium_Range''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_Account_Premium_Range
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(Account_Premium_Range)

-- Create IX_NewRenewalAuto Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_NewRenewalAuto''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_NewRenewalAuto
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(NewRenewalAuto)

-- Create IX_accountnumber Index
if not exists
	(select 1 
		from sys.indexes 
		where name = ''IX_accountnumber''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_accountnumber 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(accountnumber)

-- Create IX_accountname Index
if not exists 
	(select 1 
		from sys.indexes 
		where name = ''IX_accountname''
			and   object_id = object_id(''Act_Detailed_Experience.dbo.Policy_PATHID_Information_work''))
	create index IX_accountname 
		on Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
			(accountname)

-- Build Dupe Policy or Path ID Temp Table
SELECT A.Policynumber_or_PATHID AS Policynumber_or_PATHID_x
INTO #DupePathID
FROM Act_Detailed_Experience.dbo.Policy_PATHID_Information_work A with (nolock)
GROUP BY A.Policynumber_or_PATHID
HAVING COUNT(*)>1



---- Pull in Prior Product Code
SELECT A.idnum
,A.policynumber
,A.Policynumber_or_PATHID
,A.productcode AS CurrentProductCode
,COALESCE(C.ProductCode,D.ProductCode,A.ProductCode) AS PriorProductCode
INTO #DupePathID2
FROM Act_Detailed_Experience.dbo.Policy_PATHID_Information_work A with (index(IX_productcode))
INNER JOIN #DupePathID B
ON B.Policynumber_or_PATHID_x = A.Policynumber_or_PATHID
LEFT JOIN Act_Detailed_Experience.dbo.Policy_PATHID_Information_work C with (nolock)
ON C.policynumber = A.expiringpolicynumber
LEFT JOIN Act_Detailed_Experience.dbo.Policy_PATHID_Information_work D with (nolock)
ON D.policynumber = A.prevpolicynumber


---- Pull in max idnum for the Product that matches the prior product
select
    A.Policynumber_or_PATHID as Policynumber_or_PATHID_x, 
    MAX(A.idnum) as MaxIDNum  
into #DupeMaxPathIDperProd
from #DupePathID2 A
WHERE CurrentProductCode = PriorProductCode
GROUP BY A.Policynumber_or_PATHID

-- Update Policy PathId table - remove duplicates
update 
	Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
set policynumber = NULL,
    Policynumber_or_PATHID = idnum
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work ppi  with (nolock)
join #DupeMaxPathIDperProd MaxIdNum with (nolock)
    on ppi.Policynumber_or_PATHID = MaxIdNum.Policynumber_or_PATHID_x
where isnull(idnum, 0) != MaxIdNum.MaxIDNum

--drop table #Policy_Policyid_AQS
--drop table #Policy_Policyid_RS
--drop table #Policy_APPS_Premium
--drop table #PATH_INFO_ONLY
--drop table #APPS_Only_Policies
--drop table #PolicySnap_SD
--drop table #PolicySnap_SD2
--drop table #PolicySnap_SN
--drop table #PolicySnap_SN2
--drop table #PIC_Producer
--drop table #APPS_Only_Policies_2
--drop table #Acct_Producttype
--drop table #Pol_Coverage_FF
--drop table #Pol_Coverage_PV
--drop table #DupePathID
--drop table #DupePathID2
--drop table #DupeMaxPathIDperProd
--drop table #DupeTopCounty






' 
END
GO
