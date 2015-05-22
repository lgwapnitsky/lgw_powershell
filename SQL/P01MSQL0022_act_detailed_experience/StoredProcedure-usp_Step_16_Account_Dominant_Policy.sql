IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_16_Account_Dominant_Policy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_16_Account_Dominant_Policy]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_16_Account_Dominant_Policy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'






CREATE PROCEDURE [dbo].[usp_Step_16_Account_Dominant_Policy] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

Declare @Last_Reporting_Year_Month as int
set @Last_Reporting_Year_Month = (select Last_Reporting_Year*100+Last_Reporting_Month from Detailed_Experience_Parameters);
/*(
		select top 1 Last_Reporting_Year*100+Last_Reporting_Month
		from Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary
		where Last_Reporting_Year is not null and Last_Reporting_Month is not null)
*/
with Account_Prem(Accountnumber,currentwrittenpremium)
as (
	select 
		PS1.accountnumber,
		sum(currentwrittenpremium) as currentwrittenpremium
	from accessphlyeom.dbo.premiumsummary PS1
	where PS1.acctngyear*100+PS1.acctngmonth > @Last_Reporting_Year_Month - 100
		and PS1.acctngyear*100+PS1.acctngmonth <= @Last_Reporting_Year_Month
	group by accountnumber
)
update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
set 
Account_Premium_latest_year = AP.currentwrittenpremium
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  POL
left outer join Account_Prem AP
on AP.accountnumber = Pol.Accountnumber


------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
set 
Account_Premium_range = (case 
		when Account_Premium_latest_year is null then ''a: no data''
		when Account_Premium_latest_year < 100000 then ''b: less than $100k''
		when Account_Premium_latest_year < 250000 then ''c: $100k to $250k''
		when Account_Premium_latest_year < 500000 then ''d: $250k to $500k''
		else ''e: over $500k'' 
		end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS


------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  
set 
Account_written_premium_for_product = (
	select distinct sum(PSy.written_premium_policy)
	from (
		select distinct 
			PSx.policynumber,
			written_premium_policy = max(PSx.written_premium_policy)
		from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PSx
		where PSx.accountnumber = PS.accountnumber
			and PSx.Productcode = PS.Productcode
			and PS.Latest_PY = ''Latest PY'' 
		group by PSx.policynumber) as PSy
	)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS
where Latest_PY = ''Latest PY'' 


------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  
set 
Account_written_premium_for_product_max = (
	select max(PSx.Account_written_premium_for_product)
	from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PSx
	where PSx.accountnumber = PS.accountnumber
			and PSx.Latest_PY = ''Latest PY'')
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS
where Latest_PY = ''Latest PY'' 



--------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  
set 
Account_Dominant_Product = (
	select top 1 PSy.productcode
	from (
		select distinct PSx.Productcode
		from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PSx
		where PSx.accountnumber = PS.accountnumber
			and PSx.Account_written_premium_for_product = PSx.Account_written_premium_for_product_max
		) as PSy
	)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS
where PS.Latest_PY = ''Latest PY'' 

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  
set 
Account_Dominant_Product = (
		select max(Account_Dominant_Product)
		from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PSx
		where PSx.accountnumber = PS.accountnumber)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS
where Account_Dominant_Product is null 

--------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  
set 
Account_Dominant_Product_Group = (
	select PG.Product_Group
	from Act_definitions.dbo.Product_Groups_MIPS PG
	where Account_dominant_Product = PG.MIPS_Product)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS

--------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  
set 
Account_Dominant_Product_policy_premium_max = (
	select max(PSx.written_premium_policy)
	from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PSx
	where PSx.accountnumber = PS.accountnumber
		and PSx.Account_Dominant_Product = PSx.productcode
		and PSx.Latest_PY = ''Latest PY'' )
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS
where PS.Latest_PY = ''Latest PY'' 


--------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  
set 
Account_Dominant_Policy = (
	select top 1 PSy.policynumber
	from (
		select distinct PSx.policynumber
		from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PSx
		where PSx.accountnumber = PS.accountnumber
			and PSx.Account_Dominant_Product_policy_premium_max = PSx.written_premium_policy
		) as PSy
	)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS
where PS.Latest_PY = ''Latest PY'' 


------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  
set 
Dominant_Policy_max_effdate = (
		select max(PS1.policyeffectivedate)
		from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS1
		where PS.Account_Dominant_Policy = PS1.Policynumber)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS
where PS.Latest_PY = ''Latest PY'';


------------------------------------------------------------------
 
select AccountNumber,
max(Dominant_Policy_max_effdate) Dominant_Policy_max_effdate into #temp_acct_num
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
group by AccountNumber

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
set 
-- Review accounts that are renewing in 6 months - review 4th qtr accounts in 4th qtr
-- Need effective date from dominant policy to place account
Review_quarter = (case
	when month(max_date.Dominant_Policy_max_effdate) < 4 then 3
	when month(max_date.Dominant_Policy_max_effdate) < 7 then 4
	when month(max_date.Dominant_Policy_max_effdate) < 10 then 1
	else 2
	end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work  PS
join #temp_acct_num max_date on max_date.AccountNumber=PS.accountnumber
 

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)


' 
END
GO
