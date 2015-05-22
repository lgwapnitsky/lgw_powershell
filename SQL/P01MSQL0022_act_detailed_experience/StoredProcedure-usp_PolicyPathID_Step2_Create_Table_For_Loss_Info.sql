IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PolicyPathID_Step2_Create_Table_For_Loss_Info]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PolicyPathID_Step2_Create_Table_For_Loss_Info]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PolicyPathID_Step2_Create_Table_For_Loss_Info]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure usp_PolicyPathID_Step2_Create_Table_For_Loss_Info

as

-- Policy PathId Monthly Step 2
-- FootPrints Ticket #59691
-- Erik Godfrey
-- 7/16/2012

if exists (select 1 from sys.tables
           where name = ''Policy_PATHID_Information_LossRatios_work'')
   drop table Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work

select 
	accountnumber,
	DivisionName,
	policynumber,
	productcode,
	prevpolicynumber,
	prior_policynumber_2,
	prior_policynumber_3,
	prior_policynumber_4,
	prior_policynumber_5,
	prior_policynumber_6,
	prior_policynumber_7,
	prior_policynumber_8,
	policy_premium = convert(float,NULL),
	prevpolicy_premium = convert(float,NULL),
	policy_premium_2 = convert(float,NULL),
	policy_premium_3 = convert(float,NULL),
	policy_premium_4 = convert(float,NULL),
	policy_premium_5 = convert(float,NULL),
	policy_premium_6 = convert(float,NULL),
	policy_premium_7 = convert(float,NULL),
	policy_premium_8 = convert(float,NULL),
	Effectivedate = convert(datetime,NULL),
	prevpolicy_Effectivedate = convert(datetime,NULL),
	policy_Effectivedate_2 = convert(datetime,NULL),
	policy_Effectivedate_3 = convert(datetime,NULL),
	policy_Effectivedate_4 = convert(datetime,NULL),
	policy_Effectivedate_5 = convert(datetime,NULL),
	policy_Effectivedate_6 = convert(datetime,NULL),
	policy_Effectivedate_7 = convert(datetime,NULL),
	policy_Effectivedate_8 = convert(datetime,NULL),
	Expirationdate = convert(datetime,NULL),
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
	Incurred_LossRatio_Pol_5Yr_Div_60_90_Range_PriorPol = convert(varchar(50),NULL)
into Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work with (nolock)
where policynumber is not null
group by
	accountnumber,
	DivisionName,
	policynumber,
	productcode,
	prevpolicynumber,
	prior_policynumber_2,
	prior_policynumber_3,
	prior_policynumber_4,
	prior_policynumber_5,
	prior_policynumber_6,
	prior_policynumber_7,
	prior_policynumber_8

select 
	accountnumber,
	policynumber,
	div.DivisionName,
	PS.productcode,
	Effectivedate = MIN(PS.policyeffectivedate),
	ExpirationDate = MAX(PS.policyexpirationdate),
	currentearnedpremium = SUM(currentearnedpremium)
into #policy_premium
from AccessPhlyEom.dbo.premiumsummary PS with (nolock)
left join AccessPhlyEom.dbo.product Prod with (nolock)
on Prod.productcode = PS.productcode
left join AccessPhlyEom.dbo.Division Div with (nolock)
on Div.DivisionID = prod.DivisionID
group by
	accountnumber,
	policynumber,
	div.DivisionName,
	PS.productcode

select 
	accountnumber,
	currentearnedpremium = SUM(currentearnedpremium)
into #Account_premium_AllYears
from #policy_premium with (nolock)
group by
	accountnumber

select 
	accountnumber,
	divisionname,
	currentearnedpremium = SUM(currentearnedpremium)
into #Account_premium_AllYears_byDiv
from #policy_premium with (nolock)
group by
	accountnumber,
	divisionname

select 
	accountnumber,
	divisionname,
	productcode,
	currentearnedpremium = SUM(currentearnedpremium)
into #Account_premium_AllYears_byDiv_byProd
from #policy_premium with (nolock)
group by
	accountnumber,
	divisionname,
	productcode

update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set policy_premium = curr.currentearnedpremium,
    prevpolicy_premium = prev.currentearnedpremium,
    policy_premium_2 = prev_2.currentearnedpremium,
    policy_premium_3 = prev_3.currentearnedpremium,
    policy_premium_4 = prev_4.currentearnedpremium,
    policy_premium_5 = prev_5.currentearnedpremium,
    policy_premium_6 = prev_6.currentearnedpremium,
    policy_premium_7 = prev_7.currentearnedpremium,
    policy_premium_8 = prev_8.currentearnedpremium
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Policy_Premium Curr with (nolock)
on Curr.policynumber = LI.policynumber
left join #Policy_Premium Prev with (nolock)
on Prev.policynumber = LI.prevpolicynumber
left join #Policy_Premium Prev_2 with (nolock)
on Prev_2.policynumber = LI.prior_policynumber_2
left join #Policy_Premium Prev_3 with (nolock)
on Prev_3.policynumber = LI.prior_policynumber_3
left join #Policy_Premium Prev_4 with (nolock)
on Prev_4.policynumber = LI.prior_policynumber_4
left join #Policy_Premium Prev_5 with (nolock)
on Prev_5.policynumber = LI.prior_policynumber_5
left join #Policy_Premium Prev_6 with (nolock)
on Prev_6.policynumber = LI.prior_policynumber_6
left join #Policy_Premium Prev_7 with (nolock)
on Prev_7.policynumber = LI.prior_policynumber_7
left join #Policy_Premium Prev_8 with (nolock)
on Prev_8.policynumber = LI.prior_policynumber_8

update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set Effectivedate = curr.Effectivedate,
    prevpolicy_Effectivedate = prev.Effectivedate,
    policy_Effectivedate_2 = prev_2.Effectivedate,
    policy_Effectivedate_3 = prev_3.Effectivedate,
    policy_Effectivedate_4 = prev_4.Effectivedate,
    policy_Effectivedate_5 = prev_5.Effectivedate,
    policy_Effectivedate_6 = prev_6.Effectivedate,
    policy_Effectivedate_7 = prev_7.Effectivedate,
    policy_Effectivedate_8 = prev_8.Effectivedate,
    Expirationdate = curr.Expirationdate,
    prevpolicy_Expirationdate = prev.Expirationdate,
    policy_Expirationdate_2 = prev_2.Expirationdate,
    policy_Expirationdate_3 = prev_3.Expirationdate,
    policy_Expirationdate_4 = prev_4.Expirationdate,
    policy_Expirationdate_5 = prev_5.Expirationdate,
    policy_Expirationdate_6 = prev_6.Expirationdate,
    policy_Expirationdate_7 = prev_7.Expirationdate,
    policy_Expirationdate_8 = prev_8.Expirationdate
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_work Curr with (nolock)
on Curr.policynumber = LI.policynumber
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_work Prev with (nolock)
on Prev.policynumber = LI.prevpolicynumber
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_work Prev_2 with (nolock)
on Prev_2.policynumber = LI.prior_policynumber_2
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_work Prev_3 with (nolock)
on Prev_3.policynumber = LI.prior_policynumber_3
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_work Prev_4 with (nolock)
on Prev_4.policynumber = LI.prior_policynumber_4
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_work Prev_5 with (nolock)
on Prev_5.policynumber = LI.prior_policynumber_5
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_work Prev_6 with (nolock)
on Prev_6.policynumber = LI.prior_policynumber_6
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_work Prev_7 with (nolock)
on Prev_7.policynumber = LI.prior_policynumber_7
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_work Prev_8 with (nolock)
on Prev_8.policynumber = LI.prior_policynumber_8

select
	accountnumber,
	policynumber,
	div.DivisionName,	
	temp2.productcode,
	acct_year,
	acct_mm,
	acct_YRMM = acct_year*100+Acct_mm,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE),
	Case_Reserve = sum(Case_Reserve),
	Paid_Loss_ALAE = sum(Paid_Loss_ALAE),
	Reported_Claim = sum(Reported_Claim),
	Open_Claim = SUM(Open_Claim),
	Closed_wo_Pay = SUM(Closed_wo_Pay),
	Closed_with_Pay = SUM(Closed_with_Pay)
into #Loss_Datamart_Info_ALLEval
from (
select
	claim_number,
	accountnumber,
	policynumber,
	temp1.productcode,
	acct_year,
	acct_mm,
	acct_YRMM = acct_year*100+Acct_mm,
	Incurred_Loss_ALAE,
	Case_Reserve,
	Paid_Loss_ALAE,
	Reported_Claim = 1,
	Open_Claim = (Case when Case_Reserve > 0 then 1 else 0 end),
	Closed_wo_Pay = (Case when Incurred_Loss_ALAE = 0 then 1 else 0 end),
	Closed_with_Pay = (Case when Paid_Loss_ALAE > 0 and Case_Reserve = 0 then 1 else 0 end)
from (
	select 
		claim_number,
		account_number as accountnumber,
		policy_number as policynumber,
		Product as productcode,
		acct_year,
		acct_mm,
		Incurred_Loss_ALAE = sum(tot_Case+tot_CLAE+tot_PdLoss+tot_PdLAE+tot_salv+tot_subro),
		Case_Reserve = sum(tot_Case+tot_CLAE),
		Paid_Loss_ALAE = sum(tot_PdLoss+tot_PdLAE+tot_salv+tot_subro)
	from Losshistory.dbo.loss_datamart ld with (nolock)
	group by 
		claim_number, 
		account_number,
		policy_number,
		product, 
		acct_year, 
		acct_mm
	) as temp1
)as temp2
left join AccessPhlyEom.dbo.product Prod with (nolock)
on Prod.productcode = temp2.productcode
left join AccessPhlyEom.dbo.Division Div with (nolock)
on Div.DivisionID = prod.DivisionID
group by 
	accountnumber,
	policynumber,
	temp2.productcode,
	Div.DivisionName,
	acct_year,
	acct_mm

select 
	MAX(acct_YRMM) as Loss_YR_MM_Eval
into #Loss_max_YRMM
from #Loss_Datamart_Info_ALLEval with (nolock)

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Yr_MM_30_60_days = CYM_30_60.Calendar_Year_Month,
	Yr_MM_60_90_days = CYM_60_90.Calendar_Year_Month,
	Yr_MM_90_120_days = CYM_90_120.Calendar_Year_Month,
	Loss_max_YRMM = Eval.Loss_YR_MM_Eval
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join Act_Definitions.dbo.Cal_yr_MM_QTR_Fiscal CYM with (nolock)
on CYM.Calendar_Year_Month = YEAR(expirationdate)*100+MONTH(expirationdate)
left join Act_Definitions.dbo.Cal_yr_MM_QTR_Fiscal CYM_30_60 with (nolock)
on CYM_30_60.Yr_MM_Index = CYM.Yr_MM_Index-1
left join Act_Definitions.dbo.Cal_yr_MM_QTR_Fiscal CYM_60_90 with (nolock)
on CYM_60_90.Yr_MM_Index = CYM.Yr_MM_Index-2
left join Act_Definitions.dbo.Cal_yr_MM_QTR_Fiscal CYM_90_120 with (nolock)
on CYM_90_120.Yr_MM_Index = CYM.Yr_MM_Index-3
left join #Loss_max_YRMM Eval with (nolock)
on Eval.Loss_YR_MM_Eval is not null

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Yr_MM_30_60_days = case 
		when Yr_MM_30_60_days > Loss_max_YRMM 
		then Loss_max_YRMM 
		else Yr_MM_30_60_days 
		end,
	Yr_MM_60_90_days = case 
		when Yr_MM_60_90_days > Loss_max_YRMM 
		then Loss_max_YRMM 
		else Yr_MM_60_90_days 
		end,
	Yr_MM_90_120_days = case 
		when Yr_MM_90_120_days > Loss_max_YRMM 
		then Loss_max_YRMM 
		else Yr_MM_90_120_days 
		end

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Accountstatistic_LossRatio = AcctStat.LossRatio
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join AccessPhlyEom.dbo.AccountStatistics acctstat with (nolock)
on acctstat.accountnumber = LI.accountnumber

-- Build table of premiums that would have earned prior to evaluation point
select
	prem.Accountnumber,
	currentearnedpremium = SUM(currentearnedpremium)
into #Premium_Acct_CurrEval
from #Policy_Premium prem with (nolock)
group by 
	prem.Accountnumber

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Acct_CurrEval = prem.currentearnedpremium
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Acct_CurrEval Prem with (nolock)
on prem.Accountnumber = LI.accountnumber

-- Pull loss data at detail needed
select
	Accountnumber,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Acct
from #Loss_Datamart_Info_ALLEval Losses with (nolock)
left join #Loss_max_YRMM Eval with (nolock)
on Eval.Loss_YR_MM_Eval is not null
where Eval.Loss_YR_MM_Eval = acct_YRMM
group by 
	Accountnumber,
	acct_YRMM

-- Calculations
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Acct_CurrEval = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Acct_CurrEval = case
		when EarnedPremium_Acct_CurrEval is null 
			or EarnedPremium_Acct_CurrEval = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Acct_CurrEval 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Acct Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and losses.acct_YRMM = LI.Loss_max_YRMM

-- Set Ranges
update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Acct_CurrEval_Range = (Case
            when Incurred_LossRatio_Acct_CurrEval is null then ''a: no data''
            when Incurred_LossRatio_Acct_CurrEval = 0.0 then ''b: zero''
            when Incurred_LossRatio_Acct_CurrEval < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Acct_CurrEval < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Acct_CurrEval < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Acct_CurrEval < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Acct_CurrEval < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Acct_CurrEval < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Acct_CurrEval < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

-- Build table of premiums
select
	prem.Accountnumber,
	divisionname,
	currentearnedpremium = SUM(currentearnedpremium)
into #Premium_Acct_Div_CurrEval
from #Policy_Premium prem with (nolock)
group by 
	prem.Accountnumber,
	divisionname

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Acct_Div_CurrEval = prem.currentearnedpremium
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Acct_Div_CurrEval Prem with (nolock)
on prem.Accountnumber = LI.accountnumber
	and prem.divisionname = LI.divisionname

-- Pull loss data at detail needed
select
	Accountnumber,
	divisionname,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Acct_Div
from #Loss_Datamart_Info_ALLEval Losses with (nolock)
left join #Loss_max_YRMM Eval with (nolock)
on Eval.Loss_YR_MM_Eval is not null
where Eval.Loss_YR_MM_Eval = acct_YRMM
group by 
	Accountnumber,
	divisionname,
	acct_YRMM

-- Calculations
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Acct_Div_CurrEval = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Acct_Div_CurrEval = case
		when EarnedPremium_Acct_Div_CurrEval is null 
			or EarnedPremium_Acct_Div_CurrEval = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Acct_Div_CurrEval 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Acct_Div Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and Losses.divisionname = LI.divisionname
	and losses.acct_YRMM = LI.Loss_max_YRMM

-- Set Ranges
update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Acct_Div_CurrEval_Range = (Case
            when Incurred_LossRatio_Acct_Div_CurrEval is null then ''a: no data''
            when Incurred_LossRatio_Acct_Div_CurrEval = 0.0 then ''b: zero''
            when Incurred_LossRatio_Acct_Div_CurrEval < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Acct_Div_CurrEval < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Acct_Div_CurrEval < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Acct_Div_CurrEval < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Acct_Div_CurrEval < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Acct_Div_CurrEval < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Acct_Div_CurrEval < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

-- Build table of premiums
select
	prem.Accountnumber,
	divisionname,
	productcode,
	currentearnedpremium = SUM(currentearnedpremium)
into #Premium_Acct_Div_Prod_CurrEval
from #Policy_Premium prem with (nolock)
group by 
	prem.Accountnumber,
	divisionname,
	productcode

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Acct_Div_Prod_CurrEval = prem.currentearnedpremium
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Acct_Div_Prod_CurrEval Prem with (nolock)
on prem.Accountnumber = LI.accountnumber
	and prem.divisionname = LI.divisionname
	and prem.productcode = LI.productcode
where LI.policynumber is not null

-- Pull loss data at detail needed
select
	Accountnumber,
	divisionname,
	productcode,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Acct_Div_Prod
from #Loss_Datamart_Info_ALLEval Losses with (nolock)
left join #Loss_max_YRMM Eval with (nolock)
on Eval.Loss_YR_MM_Eval is not null
where Eval.Loss_YR_MM_Eval = acct_YRMM
group by 
	Accountnumber,
	divisionname,
	productcode,
	acct_YRMM

-- Calculations
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Acct_Div_Prod_CurrEval = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Acct_Div_Prod_CurrEval = case
		when EarnedPremium_Acct_Div_Prod_CurrEval is null 
			or EarnedPremium_Acct_Div_Prod_CurrEval = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Acct_Div_Prod_CurrEval 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Acct_Div_Prod Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and Losses.divisionname = LI.divisionname
	and Losses.productcode = LI.productcode
	and losses.acct_YRMM = LI.Loss_max_YRMM

-- Set Ranges
update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Acct_Div_Prod_CurrEval_Range = (Case
            when Incurred_LossRatio_Acct_Div_Prod_CurrEval is null then ''a: no data''
            when Incurred_LossRatio_Acct_Div_Prod_CurrEval = 0.0 then ''b: zero''
            when Incurred_LossRatio_Acct_Div_Prod_CurrEval < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Acct_Div_Prod_CurrEval < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Acct_Div_Prod_CurrEval < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Acct_Div_Prod_CurrEval < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Acct_Div_Prod_CurrEval < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Acct_Div_Prod_CurrEval < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Acct_Div_Prod_CurrEval < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

-- Build table of premiums that would have earned prior to evaluation point
select
	prem.Accountnumber,
	currentearnedpremium = SUM(currentearnedpremium)
into #Premium_Acct_60_90
from #Policy_Premium prem with (nolock)
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
on prem.accountnumber = LI.accountnumber
	and prem.policynumber = LI.policynumber
	and prem.effectivedate < LI.expirationdate - 62  -- reflects timeframe
group by 
	prem.Accountnumber

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Acct_60_90 = 
		prem.currentearnedpremium
		- case
			when YEAR(expirationdate)*100+MONTH(expirationdate) > Loss_max_YRMM
			then 0
			else policy_premium * (2/12)
			end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Acct_60_90 Prem with (nolock)
on prem.Accountnumber = LI.accountnumber

-- Pull loss data at detail needed
select
	Accountnumber,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Acct2
from #Loss_Datamart_Info_ALLEval Losses with (nolock)
group by 
	Accountnumber,
	acct_YRMM

-- Calculations
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Acct_60_90 = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Acct_60_90 = case
		when EarnedPremium_Acct_60_90 is null 
			or EarnedPremium_Acct_60_90 = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Acct_60_90 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Acct2 Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and losses.acct_YRMM = LI.Yr_MM_60_90_days

-- Set Ranges
update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Acct_60_90_Range = (Case
            when Incurred_LossRatio_Acct_60_90 is null then ''a: no data''
            when Incurred_LossRatio_Acct_60_90 = 0.0 then ''b: zero''
            when Incurred_LossRatio_Acct_60_90 < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Acct_60_90 < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Acct_60_90 < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Acct_60_90 < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Acct_60_90 < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Acct_60_90 < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Acct_60_90 < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

-- Build table of premiums that would have earned prior to evaluation point
select
	prem.Accountnumber,
	prem.divisionname,
	currentearnedpremium = SUM(currentearnedpremium)
into #Premium_Acct_Div_60_90
from #Policy_Premium prem with (nolock)
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
on prem.accountnumber = LI.accountnumber
	and prem.policynumber = LI.policynumber
	and prem.effectivedate < LI.expirationdate - 62  -- reflects timeframe
group by 
	prem.Accountnumber,
	prem.divisionname

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Acct_Div_60_90 = 
		prem.currentearnedpremium
		- case
			when YEAR(expirationdate)*100+MONTH(expirationdate) > Loss_max_YRMM
			then 0
			else policy_premium * (2/12)
			end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Acct_Div_60_90 Prem with (nolock)
on prem.Accountnumber = LI.accountnumber
	and prem.divisionname = LI.divisionname

-- Pull loss data at detail needed
select
	Accountnumber,
	divisionname,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Acct_Div2
from #Loss_Datamart_Info_ALLEval Losses with (nolock)
group by 
	Accountnumber,
	divisionname,
	acct_YRMM

-- Calculations
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Acct_Div_60_90 = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Acct_Div_60_90 = case
		when EarnedPremium_Acct_Div_60_90 is null 
			or EarnedPremium_Acct_Div_60_90 = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Acct_Div_60_90 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Acct_Div2 Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and losses.divisionname = LI.divisionname
	and losses.acct_YRMM = LI.Yr_MM_60_90_days

-- Set Ranges
update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Acct_Div_60_90_Range = (Case
            when Incurred_LossRatio_Acct_Div_60_90 is null then ''a: no data''
            when Incurred_LossRatio_Acct_Div_60_90 = 0.0 then ''b: zero''
            when Incurred_LossRatio_Acct_Div_60_90 < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Acct_Div_60_90 < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Acct_Div_60_90 < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Acct_Div_60_90 < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Acct_Div_60_90 < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Acct_Div_60_90 < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Acct_Div_60_90 < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

-- Build table of premiums that would have earned prior to evaluation point
select
	prem.Accountnumber,
	prem.divisionname,
	prem.productcode,
	currentearnedpremium = SUM(currentearnedpremium)
into #Premium_Acct_Div_Prod_60_90
from #Policy_Premium prem with (nolock)
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
on prem.accountnumber = LI.accountnumber
	and prem.policynumber = LI.policynumber
	and prem.effectivedate < LI.expirationdate - 62  -- reflects timeframe
group by 
	prem.Accountnumber,
	prem.divisionname,
	prem.productcode

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Acct_Div_Prod_60_90 = 
		prem.currentearnedpremium
		- case
			when YEAR(expirationdate)*100+MONTH(expirationdate) > Loss_max_YRMM
			then 0
			else policy_premium * (2/12)
			end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Acct_Div_Prod_60_90 Prem with (nolock)
on prem.Accountnumber = LI.accountnumber
	and prem.divisionname = LI.divisionname
	and prem.productcode = LI.productcode

-- Pull loss data at detail needed
select
	Accountnumber,
	divisionname,
	productcode,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Acct_Div_Prod2
from #Loss_Datamart_Info_ALLEval Losses with (nolock)
group by 
	Accountnumber,
	divisionname,
	productcode,
	acct_YRMM

-- Calculations
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Acct_Div_Prod_60_90 = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Acct_Div_Prod_60_90 = case
		when EarnedPremium_Acct_Div_Prod_60_90 is null 
			or EarnedPremium_Acct_Div_Prod_60_90 = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Acct_Div_Prod_60_90 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Acct_Div_Prod2 Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and losses.divisionname = LI.divisionname
	and losses.productcode = LI.productcode
	and losses.acct_YRMM = LI.Yr_MM_60_90_days

-- Set Ranges
update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Acct_Div_Prod_60_90_Range = (Case
            when Incurred_LossRatio_Acct_Div_Prod_60_90 is null then ''a: no data''
            when Incurred_LossRatio_Acct_Div_Prod_60_90 = 0.0 then ''b: zero''
            when Incurred_LossRatio_Acct_Div_Prod_60_90 < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Acct_Div_Prod_60_90 < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Acct_Div_Prod_60_90 < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Acct_Div_Prod_60_90 < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Acct_Div_Prod_60_90 < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Acct_Div_Prod_60_90 < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Acct_Div_Prod_60_90 < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

-- Build table of premiums that would have earned prior to evaluation point
select
	prem.Accountnumber,
	currentearnedpremium = SUM(currentearnedpremium)
into #Premium_Acct_90_120
from #Policy_Premium prem with (nolock)
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
on prem.accountnumber = LI.accountnumber
	and prem.policynumber = LI.policynumber
	and prem.effectivedate < LI.expirationdate - 92  -- reflects timeframe
group by 
	prem.Accountnumber

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Acct_90_120 = 
		prem.currentearnedpremium
		- case
			when YEAR(expirationdate)*100+MONTH(expirationdate) > Loss_max_YRMM
			then 0
			else policy_premium * (3/12)
			end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Acct_90_120 Prem with (nolock)
on prem.Accountnumber = LI.accountnumber

-- Pull loss data at detail needed
select
	Accountnumber,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Acct3
from #Loss_Datamart_Info_ALLEval Losses with (nolock)
group by 
	Accountnumber,
	acct_YRMM

-- Calculations
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Acct_90_120 = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Acct_90_120 = case
		when EarnedPremium_Acct_90_120 is null 
			or EarnedPremium_Acct_90_120 = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Acct_90_120 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Acct3 Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and losses.acct_YRMM = LI.Yr_MM_90_120_days

-- Set Ranges
update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Acct_90_120_Range = (Case
            when Incurred_LossRatio_Acct_90_120 is null then ''a: no data''
            when Incurred_LossRatio_Acct_90_120 = 0.0 then ''b: zero''
            when Incurred_LossRatio_Acct_90_120 < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Acct_90_120 < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Acct_90_120 < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Acct_90_120 < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Acct_90_120 < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Acct_90_120 < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Acct_90_120 < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

-- Build table of premiums that would have earned prior to evaluation point
select
	prem.Accountnumber,
	prem.divisionname,
	currentearnedpremium = SUM(currentearnedpremium)
into #Premium_Acct_Div_90_120
from #Policy_Premium prem with (nolock)
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
on prem.accountnumber = LI.accountnumber
	and prem.policynumber = LI.policynumber
	and prem.effectivedate < LI.expirationdate - 92  -- reflects timeframe
group by 
	prem.Accountnumber,
	prem.divisionname

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Acct_Div_90_120 = 
		prem.currentearnedpremium
		- case
			when YEAR(expirationdate)*100+MONTH(expirationdate) > Loss_max_YRMM
			then 0
			else policy_premium * (3/12)
			end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Acct_Div_90_120 Prem with (nolock)
on prem.Accountnumber = LI.accountnumber
	and prem.divisionname = LI.divisionname

-- Pull loss data at detail needed
select
	Accountnumber,
	divisionname,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Acct_Div3
from #Loss_Datamart_Info_ALLEval Losses with (nolock)
group by 
	Accountnumber,
	divisionname,
	acct_YRMM

-- Calculations
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Acct_Div_90_120 = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Acct_Div_90_120 = case
		when EarnedPremium_Acct_Div_90_120 is null 
			or EarnedPremium_Acct_Div_90_120 = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Acct_Div_90_120 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Acct_Div3 Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and losses.divisionname = LI.divisionname
	and losses.acct_YRMM = LI.Yr_MM_90_120_days

-- Set Ranges
update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Acct_Div_90_120_Range = (Case
            when Incurred_LossRatio_Acct_Div_90_120 is null then ''a: no data''
            when Incurred_LossRatio_Acct_Div_90_120 = 0.0 then ''b: zero''
            when Incurred_LossRatio_Acct_Div_90_120 < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Acct_Div_90_120 < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Acct_Div_90_120 < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Acct_Div_90_120 < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Acct_Div_90_120 < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Acct_Div_90_120 < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Acct_Div_90_120 < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

-- Build table of premiums that would have earned prior to evaluation point
select
	prem.Accountnumber,
	prem.divisionname,
	prem.productcode,
	currentearnedpremium = SUM(currentearnedpremium)
into #Premium_Acct_Div_Prod_90_120
from #Policy_Premium prem with (nolock)
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
on prem.accountnumber = LI.accountnumber
	and prem.policynumber = LI.policynumber
	and prem.effectivedate < LI.expirationdate - 92  -- reflects timeframe
group by 
	prem.Accountnumber,
	prem.divisionname,
	prem.productcode

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Acct_Div_Prod_90_120 = 
		prem.currentearnedpremium
		- case
			when YEAR(expirationdate)*100+MONTH(expirationdate) > Loss_max_YRMM
			then 0
			else policy_premium * (3/12)
			end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Acct_Div_Prod_90_120 Prem with (nolock)
on prem.Accountnumber = LI.accountnumber
	and prem.divisionname = LI.divisionname
	and prem.productcode = LI.productcode

-- Pull loss data at detail needed
select
	Accountnumber,
	divisionname,
	productcode,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Acct_Div_Prod3
from #Loss_Datamart_Info_ALLEval Losses with (nolock)
group by 
	Accountnumber,
	divisionname,
	productcode,
	acct_YRMM

-- Calculations
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Acct_Div_Prod_90_120 = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Acct_Div_Prod_90_120 = case
		when EarnedPremium_Acct_Div_Prod_90_120 is null 
			or EarnedPremium_Acct_Div_Prod_90_120 = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Acct_Div_Prod_90_120 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Acct_Div_Prod3 Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and losses.divisionname = LI.divisionname
	and losses.productcode = LI.productcode
	and losses.acct_YRMM = LI.Yr_MM_90_120_days

-- Set Ranges
update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Acct_Div_Prod_90_120_Range = (Case
            when Incurred_LossRatio_Acct_Div_Prod_90_120 is null then ''a: no data''
            when Incurred_LossRatio_Acct_Div_Prod_90_120 = 0.0 then ''b: zero''
            when Incurred_LossRatio_Acct_Div_Prod_90_120 < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Acct_Div_Prod_90_120 < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Acct_Div_Prod_90_120 < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Acct_Div_Prod_90_120 < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Acct_Div_Prod_90_120 < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Acct_Div_Prod_90_120 < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Acct_Div_Prod_90_120 < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

-- Build table of premiums that would have earned prior to evaluation point
select
	prem.Accountnumber,
	currentearnedpremium = SUM(currentearnedpremium)
into #Premium_Acct_5UWYr_CurrEval
from #Policy_Premium prem with (nolock)
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
on prem.accountnumber = LI.accountnumber
	and prem.policynumber = LI.policynumber
where year(prem.expirationdate)*100 +MONTH(prem.expirationdate) > LI.Loss_max_YRMM - 400
group by 
	prem.Accountnumber

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Acct_5UWYr_CurrEval = prem.currentearnedpremium
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Acct_5UWYr_CurrEval Prem with (nolock)
on prem.Accountnumber = LI.accountnumber

-- Pull loss data at detail needed
select
	losses.Accountnumber,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Acct4
from #Loss_Datamart_Info_ALLEval Losses with (nolock)
left join #Loss_max_YRMM Eval with (nolock)
on Eval.Loss_YR_MM_Eval is not null
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
on losses.Accountnumber = LI.accountnumber
	and losses.policynumber = LI.policynumber
where Eval.Loss_YR_MM_Eval = acct_YRMM
	and year(LI.expirationdate)*100 +MONTH(LI.expirationdate) > Eval.Loss_YR_MM_Eval - 400
group by 
	losses.Accountnumber,
	acct_YRMM

-- Calculations
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Acct_5UWYr_CurrEval = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Acct_5UWYr_CurrEval = case
		when EarnedPremium_Acct_5UWYr_CurrEval is null 
			or EarnedPremium_Acct_5UWYr_CurrEval = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Acct_5UWYr_CurrEval 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Acct4 Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and losses.acct_YRMM = LI.Loss_max_YRMM

-- Set Ranges
update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Acct_5UWYr_CurrEval_Range = (Case
            when Incurred_LossRatio_Acct_5UWYr_CurrEval is null then ''a: no data''
            when Incurred_LossRatio_Acct_5UWYr_CurrEval = 0.0 then ''b: zero''
            when Incurred_LossRatio_Acct_5UWYr_CurrEval < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Acct_5UWYr_CurrEval < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Acct_5UWYr_CurrEval < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Acct_5UWYr_CurrEval < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Acct_5UWYr_CurrEval < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Acct_5UWYr_CurrEval < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Acct_5UWYr_CurrEval < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

select
	accountnumber,
	policynumber,
	divisionname,
	earnedpremium = 
		sum(policy_premium 
			* case  
				when YEAR(expirationdate)*100+MONTH(expirationdate) > Loss_max_YRMM
				then 1
				else (10/12)
				end
		+ isnull(prevpolicy_premium,0)
		+ isnull(policy_premium_2,0)
		+ isnull(policy_premium_3,0)
		+ case when expirationdate - 5 *365 > policy_Expirationdate_4 then 0 else isnull(policy_premium_4,0) end
		+ case when expirationdate - 5 *365 > policy_Expirationdate_5 then 0 else isnull(policy_premium_5,0) end
		+ case when expirationdate - 5 *365 > policy_Expirationdate_6 then 0 else isnull(policy_premium_6,0) end
		+ case when expirationdate - 5 *365 > policy_Expirationdate_7 then 0 else isnull(policy_premium_7,0) end
		+ case when expirationdate - 5 *365 > policy_Expirationdate_8 then 0 else isnull(policy_premium_8,0) end
		)
into #Premium_Info_Pol_5Yr_Div_60_90
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work with (nolock)
where policynumber is not null
group by
	accountnumber,
	policynumber,
	divisionname

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	EarnedPremium_Pol_5Yr_Div_60_90 = premium.earnedpremium
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Premium_Info_Pol_5Yr_Div_60_90 premium with (nolock)
on 	premium.accountnumber = LI.accountnumber
	and premium.policynumber = LI.policynumber
	and premium.divisionname = LI.divisionname

select
	Accountnumber,
	policynumber,
	divisionname,
	acct_YRMM,
	Incurred_Loss_ALAE = SUM(Incurred_Loss_ALAE)
into #Loss_Info_Pol_Div
from #Loss_Datamart_Info_ALLEval with (nolock)
where policynumber is not null
group by 
	accountnumber,
	policynumber,
	divisionname,
	acct_YRMM

select
	LI.accountnumber,
	LI.policynumber,
	LI.divisionname,
	Incurred_Loss_ALAE = 
		isnull(Losses_Curr.Incurred_Loss_ALAE,0)
		+ isnull(Losses_Prior.Incurred_Loss_ALAE,0)
		+ isnull(Losses_Prior_2.Incurred_Loss_ALAE,0)
		+ isnull(Losses_Prior_3.Incurred_Loss_ALAE,0)
		+ isnull(case when expirationdate - 5 *365 > policy_Expirationdate_4 then 0 else Losses_Prior_4.Incurred_Loss_ALAE end,0)
		+ isnull(case when expirationdate - 5 *365 > policy_Expirationdate_5 then 0 else Losses_Prior_5.Incurred_Loss_ALAE end,0)
		+ isnull(case when expirationdate - 5 *365 > policy_Expirationdate_6 then 0 else Losses_Prior_6.Incurred_Loss_ALAE end,0)
		+ isnull(case when expirationdate - 5 *365 > policy_Expirationdate_7 then 0 else Losses_Prior_7.Incurred_Loss_ALAE end,0)
		+ isnull(case when expirationdate - 5 *365 > policy_Expirationdate_8 then 0 else Losses_Prior_8.Incurred_Loss_ALAE end,0)
into #Loss_Info_Pol_5Yr_Div_60_90
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Pol_Div Losses_Curr with (nolock)
on Losses_Curr.accountnumber = LI.accountnumber
	and Losses_Curr.policynumber = LI.policynumber
	and Losses_Curr.divisionname = LI.divisionname
	and losses_curr.acct_YRMM = LI.Yr_MM_60_90_days
left join #Loss_Info_Pol_Div Losses_Prior with (nolock)
on Losses_Prior.accountnumber = LI.accountnumber
	and Losses_Prior.policynumber = LI.prevpolicynumber
	and Losses_Prior.divisionname = LI.divisionname
	and losses_prior.acct_YRMM = LI.Yr_MM_60_90_days
left join #Loss_Info_Pol_Div Losses_Prior_2 with (nolock)
on Losses_Prior_2.accountnumber = LI.accountnumber
	and Losses_Prior_2.policynumber = LI.prior_policynumber_2
	and Losses_Prior_2.divisionname = LI.divisionname
	and losses_prior_2.acct_YRMM = LI.Yr_MM_60_90_days
left join #Loss_Info_Pol_Div Losses_Prior_3 with (nolock)
on Losses_Prior_3.accountnumber = LI.accountnumber
	and Losses_Prior_3.policynumber = LI.prior_policynumber_3
	and Losses_Prior_3.divisionname = LI.divisionname
	and losses_prior_3.acct_YRMM = LI.Yr_MM_60_90_days
left join #Loss_Info_Pol_Div Losses_Prior_4 with (nolock)
on Losses_Prior_4.accountnumber = LI.accountnumber
	and Losses_Prior_4.policynumber = LI.prior_policynumber_4
	and Losses_Prior_4.divisionname = LI.divisionname
	and losses_prior_4.acct_YRMM = LI.Yr_MM_60_90_days
left join #Loss_Info_Pol_Div Losses_Prior_5 with (nolock)
on Losses_Prior_5.accountnumber = LI.accountnumber
	and Losses_Prior_5.policynumber = LI.prior_policynumber_5
	and Losses_Prior_5.divisionname = LI.divisionname
	and losses_prior_5.acct_YRMM = LI.Yr_MM_60_90_days
left join #Loss_Info_Pol_Div Losses_Prior_6 with (nolock)
on Losses_Prior_6.accountnumber = LI.accountnumber
	and Losses_Prior_6.policynumber = LI.prior_policynumber_6
	and Losses_Prior_6.divisionname = LI.divisionname
	and losses_prior_6.acct_YRMM = LI.Yr_MM_60_90_days
left join #Loss_Info_Pol_Div Losses_Prior_7 with (nolock)
on Losses_Prior_7.accountnumber = LI.accountnumber
	and Losses_Prior_7.policynumber = LI.prior_policynumber_7
	and Losses_Prior_7.divisionname = LI.divisionname
	and losses_prior_7.acct_YRMM = LI.Yr_MM_60_90_days
left join #Loss_Info_Pol_Div Losses_Prior_8 with (nolock)
on Losses_Prior_8.accountnumber = LI.accountnumber
	and Losses_Prior_8.policynumber = LI.prior_policynumber_8
	and Losses_Prior_8.divisionname = LI.divisionname
	and losses_prior_8.acct_YRMM = LI.Yr_MM_60_90_days
where li.policynumber is not null

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set
	Incurred_LossALAE_Pol_5Yr_Div_60_90 = Losses.Incurred_Loss_ALAE,
	Incurred_LossRatio_Pol_5Yr_Div_60_90 = case
		when EarnedPremium_Pol_5Yr_Div_60_90 is null 
			or EarnedPremium_Pol_5Yr_Div_60_90 = 0
		then null
		else
			isnull(Losses.Incurred_Loss_ALAE,0)
			/
			EarnedPremium_Pol_5Yr_Div_60_90 
		end
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LI with (nolock)
left join #Loss_Info_Pol_5Yr_Div_60_90 Losses with (nolock)
on Losses.accountnumber = LI.accountnumber
	and Losses.policynumber = LI.policynumber
	and Losses.divisionname = LI.divisionname

update Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work
set 
Incurred_LossRatio_Pol_5Yr_Div_60_90_Range = (Case
            when Incurred_LossRatio_Pol_5Yr_Div_60_90 is null then ''a: no data''
            when Incurred_LossRatio_Pol_5Yr_Div_60_90 = 0.0 then ''b: zero''
            when Incurred_LossRatio_Pol_5Yr_Div_60_90 < 0.1 then ''c: 0% to 10%''
            when Incurred_LossRatio_Pol_5Yr_Div_60_90 < 0.4 then ''d: 10% to 40%''
            when Incurred_LossRatio_Pol_5Yr_Div_60_90 < 0.5 then ''e: 40% to 50%''
            when Incurred_LossRatio_Pol_5Yr_Div_60_90 < 0.65 then ''f: 50% to 65%''
            when Incurred_LossRatio_Pol_5Yr_Div_60_90 < 0.85 then ''g: 65% to 85%''
            when Incurred_LossRatio_Pol_5Yr_Div_60_90 < 1.0 then ''h: 85% to 100%''
            when Incurred_LossRatio_Pol_5Yr_Div_60_90 < 1.25 then ''i: 100% to 125%''
            else ''j: over 125%'' 
            end)

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
set
	prevpolicy_premium = LR.prevpolicy_premium
	,policy_premium_2 = LR.policy_premium_2
	,policy_premium_3 = LR.policy_premium_3
	,policy_premium_4 = LR.policy_premium_4
	,policy_premium_5 = LR.policy_premium_5
	,policy_premium_6 = LR.policy_premium_6
	,policy_premium_7 = LR.policy_premium_7
	,policy_premium_8 = LR.policy_premium_8
	,prevpolicy_Effectivedate = LR.prevpolicy_Effectivedate
	,policy_Effectivedate_2 = LR.policy_Effectivedate_2
	,policy_Effectivedate_3 = LR.policy_Effectivedate_3
	,policy_Effectivedate_4 = LR.policy_Effectivedate_4
	,policy_Effectivedate_5 = LR.policy_Effectivedate_5
	,policy_Effectivedate_6 = LR.policy_Effectivedate_6
	,policy_Effectivedate_7 = LR.policy_Effectivedate_7
	,policy_Effectivedate_8 = LR.policy_Effectivedate_8
	,prevpolicy_Expirationdate = LR.prevpolicy_Expirationdate
	,policy_Expirationdate_2 = LR.policy_Expirationdate_2
	,policy_Expirationdate_3 = LR.policy_Expirationdate_3
	,policy_Expirationdate_4 = LR.policy_Expirationdate_4
	,policy_Expirationdate_5 = LR.policy_Expirationdate_5
	,policy_Expirationdate_6 = LR.policy_Expirationdate_6
	,policy_Expirationdate_7 = LR.policy_Expirationdate_7
	,policy_Expirationdate_8 = LR.policy_Expirationdate_8
	,Yr_MM_30_60_days = LR.Yr_MM_30_60_days
	,Yr_MM_60_90_days = LR.Yr_MM_60_90_days
	,Yr_MM_90_120_days = LR.Yr_MM_90_120_days
	,Loss_max_YRMM = LR.Loss_max_YRMM
	,Accountstatistic_LossRatio = LR.Accountstatistic_LossRatio
	,EarnedPremium_Acct_CurrEval = LR.EarnedPremium_Acct_CurrEval
	,Incurred_LossALAE_Acct_CurrEval = LR.Incurred_LossALAE_Acct_CurrEval
	,Incurred_LossRatio_Acct_CurrEval = LR.Incurred_LossRatio_Acct_CurrEval
	,Incurred_LossRatio_Acct_CurrEval_Range = LR.Incurred_LossRatio_Acct_CurrEval_Range
	,EarnedPremium_Acct_Div_CurrEval = LR.EarnedPremium_Acct_Div_CurrEval
	,Incurred_LossALAE_Acct_Div_CurrEval = LR.Incurred_LossALAE_Acct_Div_CurrEval
	,Incurred_LossRatio_Acct_Div_CurrEval = LR.Incurred_LossRatio_Acct_Div_CurrEval
	,Incurred_LossRatio_Acct_Div_CurrEval_Range = LR.Incurred_LossRatio_Acct_Div_CurrEval_Range
	,EarnedPremium_Acct_Div_Prod_CurrEval = LR.EarnedPremium_Acct_Div_Prod_CurrEval
	,Incurred_LossALAE_Acct_Div_Prod_CurrEval = LR.Incurred_LossALAE_Acct_Div_Prod_CurrEval
	,Incurred_LossRatio_Acct_Div_Prod_CurrEval = LR.Incurred_LossRatio_Acct_Div_Prod_CurrEval
	,Incurred_LossRatio_Acct_Div_Prod_CurrEval_Range = LR.Incurred_LossRatio_Acct_Div_Prod_CurrEval_Range
	,EarnedPremium_Acct_60_90 = LR.EarnedPremium_Acct_60_90
	,Incurred_LossALAE_Acct_60_90 = LR.Incurred_LossALAE_Acct_60_90
	,Incurred_LossRatio_Acct_60_90 = LR.Incurred_LossRatio_Acct_60_90
	,Incurred_LossRatio_Acct_60_90_Range = LR.Incurred_LossRatio_Acct_60_90_Range
	,EarnedPremium_Acct_Div_60_90 = LR.EarnedPremium_Acct_Div_60_90
	,Incurred_LossALAE_Acct_Div_60_90 = LR.Incurred_LossALAE_Acct_Div_60_90
	,Incurred_LossRatio_Acct_Div_60_90 = LR.Incurred_LossRatio_Acct_Div_60_90	
	,Incurred_LossRatio_Acct_Div_60_90_Range = LR.Incurred_LossRatio_Acct_Div_60_90_Range
	,EarnedPremium_Acct_Div_Prod_60_90 = LR.EarnedPremium_Acct_Div_Prod_60_90
	,Incurred_LossALAE_Acct_Div_Prod_60_90 = LR.Incurred_LossALAE_Acct_Div_Prod_60_90
	,Incurred_LossRatio_Acct_Div_Prod_60_90 = LR.Incurred_LossRatio_Acct_Div_Prod_60_90
	,Incurred_LossRatio_Acct_Div_Prod_60_90_Range = LR.Incurred_LossRatio_Acct_Div_Prod_60_90_Range
	,EarnedPremium_Acct_90_120 = LR.EarnedPremium_Acct_90_120
	,Incurred_LossALAE_Acct_90_120 = LR.Incurred_LossALAE_Acct_90_120
	,Incurred_LossRatio_Acct_90_120 = LR.Incurred_LossRatio_Acct_90_120
	,Incurred_LossRatio_Acct_90_120_Range = LR.Incurred_LossRatio_Acct_90_120_Range
	,EarnedPremium_Acct_Div_90_120 = LR.EarnedPremium_Acct_Div_90_120
	,Incurred_LossALAE_Acct_Div_90_120 = LR.Incurred_LossALAE_Acct_Div_90_120
	,Incurred_LossRatio_Acct_Div_90_120 = LR.Incurred_LossRatio_Acct_Div_90_120
	,Incurred_LossRatio_Acct_Div_90_120_Range = LR.Incurred_LossRatio_Acct_Div_90_120_Range
	,EarnedPremium_Acct_Div_Prod_90_120 = LR.EarnedPremium_Acct_Div_Prod_90_120
	,Incurred_LossALAE_Acct_Div_Prod_90_120 = LR.Incurred_LossALAE_Acct_Div_Prod_90_120
	,Incurred_LossRatio_Acct_Div_Prod_90_120 = LR.Incurred_LossRatio_Acct_Div_Prod_90_120	
	,Incurred_LossRatio_Acct_Div_Prod_90_120_Range = LR.Incurred_LossRatio_Acct_Div_Prod_90_120_Range
	,EarnedPremium_Acct_5UWYr_CurrEval = LR.EarnedPremium_Acct_5UWYr_CurrEval
	,Incurred_LossALAE_Acct_5UWYr_CurrEval = LR.Incurred_LossALAE_Acct_5UWYr_CurrEval
	,Incurred_LossRatio_Acct_5UWYr_CurrEval = LR.Incurred_LossRatio_Acct_5UWYr_CurrEval
	,Incurred_LossRatio_Acct_5UWYr_CurrEval_Range = LR.Incurred_LossRatio_Acct_5UWYr_CurrEval_Range
	,Incurred_LossRatio_Acct_5UWYr_CurrEval_Range_PriorPol = LR.Incurred_LossRatio_Acct_5UWYr_CurrEval_Range_PriorPol
	,EarnedPremium_Pol_5Yr_Div_60_90 = LR.EarnedPremium_Pol_5Yr_Div_60_90
	,Incurred_LossALAE_Pol_5Yr_Div_60_90 = LR.Incurred_LossALAE_Pol_5Yr_Div_60_90
	,Incurred_LossRatio_Pol_5Yr_Div_60_90 = LR.Incurred_LossRatio_Pol_5Yr_Div_60_90
	,Incurred_LossRatio_Pol_5Yr_Div_60_90_Range = LR.Incurred_LossRatio_Pol_5Yr_Div_60_90_Range
	,Incurred_LossRatio_Pol_5Yr_Div_60_90_Range_PriorPol = LR.Incurred_LossRatio_Pol_5Yr_Div_60_90_Range_PriorPol
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work TR with (nolock)
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_work LR with (nolock)
on LR.policynumber = TR.policynumber

drop table #policy_premium
drop table #Account_premium_AllYears
drop table #Account_premium_AllYears_byDiv
drop table #Account_premium_AllYears_byDiv_byProd
drop table #Loss_Datamart_Info_ALLEval
drop table #Loss_max_YRMM
drop table #Premium_Acct_CurrEval
drop table #Loss_Info_Acct
drop table #Loss_Info_Acct3
drop table #Loss_Info_Acct4
drop table #Premium_Acct_Div_CurrEval
drop table #Loss_Info_Acct_Div
drop table #Loss_Info_Acct_Div2
drop table #Loss_Info_Acct_Div3
drop table #Premium_Acct_Div_Prod_CurrEval
drop table #Loss_Info_Acct_Div_Prod
drop table #Loss_Info_Acct_Div_Prod2
drop table #Loss_Info_Acct_Div_Prod3
drop table #Premium_Acct_60_90
drop table #Premium_Acct_Div_60_90
drop table #Premium_Acct_Div_Prod_60_90
drop table #Premium_Acct_90_120
drop table #Premium_Acct_Div_90_120
drop table #Premium_Acct_Div_Prod_90_120
drop table #Premium_Acct_5UWYr_CurrEval
drop table #Premium_Info_Pol_5Yr_Div_60_90
drop table #Loss_Info_Pol_Div
drop table #Loss_Info_Pol_5Yr_Div_60_90
' 
END
GO
