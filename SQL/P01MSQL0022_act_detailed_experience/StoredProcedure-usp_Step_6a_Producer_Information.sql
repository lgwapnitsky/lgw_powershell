IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_6a_Producer_Information]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_6a_Producer_Information]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_6a_Producer_Information]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'








CREATE procedure [dbo].[usp_Step_6a_Producer_Information] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

/* Producer Information */

/* Step 1 */




update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
set 
PIC_Producer_code = (
	select 
      max(polprod.ProducerCode) as producercode
from  AccessPHLYEOM.dbo.PolicyProducer Polprod
left join AccessPhlyEom.dbo.producer prod
on Polprod.producercode = prod.producercode
where prod.producertypecode in (''01'',''02'')
and Polprod.Policynumber = PS.Policynumber 
      and year(Polprod.effectivedate) > 2002
      and Polprod.Commissiontypecode = ''WA''
      and polprod.primaryind = ''N''
),
PIC_commission_pct = (
	select max(convert(float,polprod.commissionpct))
from  AccessPHLYEOM.dbo.PolicyProducer Polprod
left join AccessPhlyEom.dbo.producer prod
on Polprod.producercode = prod.producercode
where prod.producertypecode in (''01'',''02'')
and Polprod.Policynumber = PS.Policynumber 
      and year(Polprod.effectivedate) > 2002
      and Polprod.Commissiontypecode = ''WA''
      and polprod.primaryind = ''N''),
Primary_Producer_code = (
	select distinct polprod.ProducerCode
	from AccessPHLYEOM.dbo.PolicyProducer Polprod
	where Polprod.Policynumber = PS.Policynumber 
		and year(Polprod.effectivedate) > 2002
		and Polprod.Commissiontypecode = ''WA''
		and polprod.primaryind = ''Y''
		and Polprod.effectivedate != Polprod.expirationdate
		and Polprod.createdate = (
			select max(polprod2.createdate)
			from AccessPHLYEOM.dbo.PolicyProducer Polprod2
			where PS.policynumber = polprod2.policynumber
				and year(Polprod.effectivedate) > 2002
				and Polprod.Commissiontypecode = ''WA''
				and polprod2.primaryind = ''Y''
				and polprod2.ProducerCode is not NULL)),
Primary_commission_pct = (
	select distinct convert(float,polprod.commissionpct)
	from AccessPHLYEOM.dbo.PolicyProducer Polprod
	where Polprod.Policynumber = PS.Policynumber 
		and year(Polprod.effectivedate) > 2002
		and Polprod.Commissiontypecode = ''WA''
		and polprod.primaryind = ''Y''
		and Polprod.effectivedate != Polprod.expirationdate
		and Polprod.createdate = (
			select max(polprod2.createdate)
			from AccessPHLYEOM.dbo.PolicyProducer Polprod2
			where PS.policynumber = polprod2.policynumber
				and year(Polprod.effectivedate) > 2002
				and Polprod.Commissiontypecode = ''WA''
				and polprod2.primaryind = ''Y''
				and polprod2.commissionpct is not NULL))


from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS




--------------------------------------------------------------------------------------
/* Step2 */


update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
set 
PIC_commission_pct= (Case
		when PIC_commission_pct > 1.00
		then PIC_commission_pct*.01
		else PIC_commission_pct
		end),
Primary_commission_pct= (Case
		when Primary_commission_pct > 1.00
		then Primary_commission_pct*.01
		else Primary_commission_pct
		end),
PIC_Producer_Type = (
	select distinct producertypedesc
	from accessphlyeom.dbo.producertype PT
	where PT.Producertypecode = (
		select distinct Prod.Producertypecode
		from AccessPHLYEOM.dbo.Producer Prod
		where prod.producercode = PS.PIC_Producer_code)
	),
Primary_Producer_Type = (
	select distinct producertypedesc
	from accessphlyeom.dbo.producertype PT
	where PT.Producertypecode = (
		select distinct Prod.Producertypecode
		from AccessPHLYEOM.dbo.Producer Prod
		where prod.producercode = PS.Primary_Producer_code)
	),
PIC_Producer = (
	select busname 
	from accessphlyeom.dbo.nameaddress na
	where na.addrid = (
		select distinct produceraddrid
		from accessphlyeom.dbo.producer P
		where PS.PIC_Producer_code = P.producercode)),
Primary_Producer = (
	select busname 
	from accessphlyeom.dbo.nameaddress na
	where na.addrid = (
		select distinct produceraddrid
		from accessphlyeom.dbo.producer P
		where PS.Primary_Producer_code = P.producercode))
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS




--------------------------------------------------------------------------------------
/* Step 3 */

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
set 
Commission_pct = isnull(PIC_Commission_pct,0) + isnull(Primary_Commission_pct,0)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS


----------------------------------------------------------------

declare @InforceDate as [datetime]
set @InforceDate = (select InforceDate from Detailed_Experience_Parameters)

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
set 
Count_of_Account_Numbers = (select count(accountnumber) 
	from 
		(select distinct 
		primary_producer,
		accountnumber
		from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
		where policyeffectivedate < @InforceDate
			and policyexpirationdate > @InforceDate
		group by primary_producer, accountnumber) as temp1
	where temp1.primary_producer = ps.primary_producer)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work ps

----------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
set 
	Count_of_Account_Numbers_Range = (case 
		when Count_of_Account_Numbers is null then ''a: no data''
		when Count_of_Account_Numbers = 0  then ''b: zero''
		when Count_of_Account_Numbers < 5 then ''c: 1 to 5''
		when Count_of_Account_Numbers < 25 then ''d: 5 to 25''
		else ''e: over 25'' 
		end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work ps



update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)




' 
END
GO
