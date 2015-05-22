IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_RRHR_All_Policies_Price_Monitor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_RRHR_All_Policies_Price_Monitor]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_RRHR_All_Policies_Price_Monitor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Procedure usp_RRHR_All_Policies_Price_Monitor as 


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[RRHR_All_Policies_Price_Monitor_work]'') AND type in (N''U''))
DROP TABLE [dbo].[RRHR_All_Policies_Price_Monitor_work]

CREATE TABLE [dbo].[RRHR_All_Policies_Price_Monitor_work](
	[policynumber] [varchar](15) NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[Standard_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Standard_Premium_Curr] [float] NULL,
	[Standard_Curr_MIPS_WP_GL] [float] NULL,
	[Standard_Curr_MIPS_WP_FA] [float] NULL,
	[Standard_Curr_MIPS_WP_FA_UC] [float] NULL,
	[Standard_Curr_MIPS_WP_FA_NonUC] [float] NULL,
	[Standard_Premium_Curr_GL] [float] NULL,
	[Standard_Premium_Curr_FA] [float] NULL,
	[Standard_Premium_Curr_FA_UC] [float] NULL,
	[Standard_Premium_Curr_FA_NonUC] [float] NULL,
	[Renewal_RCPrem_total] [float] NULL,
	[Renewal_RCPrem_GL] [float] NULL,
	[Renewal_RCPrem_FA] [float] NULL,
	[Renewal_RCPrem_FA_UC] [float] NULL,
	[Renewal_RCPrem_FA_NonUC] [float] NULL,
	[Prior_PolTerm_WP_total] [float] NULL,
	[Prior_PolTerm_WP_GL] [float] NULL,
	[Prior_PolTerm_WP_FA] [float] NULL,
	[Prior_PolTerm_WP_FA_UC] [float] NULL,
	[Prior_PolTerm_WP_FA_NonUC] [float] NULL,
	[Price_Monitor_Std_Cov_Grp_Monitored] [float] NULL,
	[Price_Monitor_Std_Cov_Grp_Monitored_range] [varchar](255) NULL
)

insert into RRHR_All_Policies_Price_Monitor_work(
policynumber,
currentwrittenpremium,
Standard_Curr_MIPS_WP,
Standard_Premium_Curr)
select 
	policynumber, 
	sum(currentwrittenpremium) as currentwrittenpremium, 
	sum(Standard_Curr_MIPS_WP) as Standard_Curr_MIPS_WP,
	sum(Standard_Premium_Curr) as Standard_Premium_Curr
from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work
--where coverage_group in (''EPL'',''D&O'') and policynumber <> ''PHSD107401''
group by policynumber;


--------------------------------------------------------------------------





with PriceMonitor_Info(
	policynumber,
	Standard_Curr_MIPS_WP,
	Standard_Curr_MIPS_WP_GL,
	Standard_Curr_MIPS_WP_FA,
	Standard_Curr_MIPS_WP_FA_UC,
	Standard_Curr_MIPS_WP_FA_NonUC,

	Standard_Premium_Curr,
	Standard_Premium_Curr_GL,
	Standard_Premium_Curr_FA,
	Standard_Premium_Curr_FA_UC,
	Standard_Premium_Curr_FA_NonUC,
	Renewal_RCPrem_total,
	Renewal_RCPrem_GL,
	Renewal_RCPrem_FA,
	Renewal_RCPrem_FA_UC,
	Renewal_RCPrem_FA_NonUC,
	Prior_PolTerm_WP_total,
	Prior_PolTerm_WP_GL,
	Prior_PolTerm_WP_FA,
	Prior_PolTerm_WP_FA_UC,
	Prior_PolTerm_WP_FA_NonUC
) as (
select 
	policynumber,
	Standard_Curr_MIPS_WP = sum(POL2.Standard_Curr_MIPS_WP),
	Standard_Curr_MIPS_WP_GL = sum(POL2.Standard_Curr_MIPS_WP_GL),
	Standard_Curr_MIPS_WP_FA = sum(POL2.Standard_Curr_MIPS_WP_FA),
	Standard_Curr_MIPS_WP_FA_UC = sum(POL2.Standard_Curr_MIPS_WP_FA_UC),
	Standard_Curr_MIPS_WP_FA_NonUC = sum(POL2.Standard_Curr_MIPS_WP_FA_NonUC),

	Standard_Premium_Curr = sum(POL2.Standard_Premium_Curr),
	Standard_Premium_Curr_GL = sum(POL2.Standard_Premium_Curr_GL),
	Standard_Premium_Curr_FA = sum(POL2.Standard_Premium_Curr_FA),
	Standard_Premium_Curr_FA_UC = sum(POL2.Standard_Premium_Curr_FA_UC),
	Standard_Premium_Curr_FA_NonUC = sum(POL2.Standard_Premium_Curr_FA_NonUC),

	Renewal_RCPrem_total = sum(POL2.Renewal_RCPrem_total),
	Renewal_RCPrem_GL = sum(POL2.Renewal_RCPrem_GL),
	Renewal_RCPrem_FA = sum(POL2.Renewal_RCPrem_FA),
	Renewal_RCPrem_FA_UC = sum(POL2.Renewal_RCPrem_FA_UC),
	Renewal_RCPrem_FA_NonUC = sum(POL2.Renewal_RCPrem_FA_NonUC),

	Prior_PolTerm_WP_total = sum(POL2.Prior_PolTerm_WP_total),
	Prior_PolTerm_WP_GL = sum(POL2.Prior_PolTerm_WP_GL),
	Prior_PolTerm_WP_FA = sum(POL2.Prior_PolTerm_WP_FA),
	Prior_PolTerm_WP_FA_UC = sum(POL2.Prior_PolTerm_WP_FA_UC),
	Prior_PolTerm_WP_FA_NonUC = sum(POL2.Prior_PolTerm_WP_FA_NonUC)
from (
select
	PPSC.policynumber,
	PPSC.Coverage_group,
	Standard_Curr_MIPS_WP = sum(PPSC.Standard_Curr_MIPS_WP),
	Standard_Curr_MIPS_WP_GL = (case
		when PPSC.coverage_group = ''GL''
		then sum(PPSC.Standard_Curr_MIPS_WP)
		else 0
		end),
	Standard_Curr_MIPS_WP_FA = (case
		when PPSC.coverage_group = ''Fire & Allied''
		then sum(PPSC.Standard_Curr_MIPS_WP)
		else 0
		end),
	Standard_Curr_MIPS_WP_FA_UC = (case
		when PPSC.coverage_group = ''Fire & Allied''
			and POL.property_coverage_form = ''UC''
		then sum(PPSC.Standard_Curr_MIPS_WP)
		else 0
		end),
	Standard_Curr_MIPS_WP_FA_NonUC = (case
		when PPSC.coverage_group = ''Fire & Allied''
			and POL.property_coverage_form <> ''UC''
		then sum(PPSC.Standard_Curr_MIPS_WP)
		else 0
		end),
	Standard_Premium_Curr = sum(PPSC.Standard_Premium_Curr),
	Standard_Premium_Curr_GL = (case
		when PPSC.coverage_group = ''GL''
		then sum(PPSC.Standard_Premium_Curr)
		else 0
		end),
	Standard_Premium_Curr_FA = (case
		when PPSC.coverage_group = ''Fire & Allied''
		then sum(PPSC.Standard_Premium_Curr)
		else 0
		end),
	Standard_Premium_Curr_FA_UC = (case
		when PPSC.coverage_group = ''Fire & Allied''
			and POL.property_coverage_form = ''UC''
		then sum(PPSC.Standard_Premium_Curr)
		else 0
		end),
	Standard_Premium_Curr_FA_NonUC  = (case
		when PPSC.coverage_group = ''Fire & Allied''
			and POL.property_coverage_form <> ''UC''
		then sum(PPSC.Standard_Premium_Curr)
		else 0
		end),
	Renewal_RCPrem_total = sum(PPSC.Renewal_calc_RateChangePrem_onExpiringTermPrem),
	Renewal_RCPrem_GL = (case
		when PPSC.coverage_group in (''GL'',''Professional'')
		then sum(PPSC.Renewal_calc_RateChangePrem_onExpiringTermPrem)
		else 0
		end),
	Renewal_RCPrem_FA  = (case
		when PPSC.coverage_group = ''Fire & Allied''
		then sum(PPSC.Renewal_calc_RateChangePrem_onExpiringTermPrem)
		else 0
		end),
	Renewal_RCPrem_FA_UC = (case
		when PPSC.coverage_group = ''Fire & Allied''
			and POL.property_coverage_form = ''UC''
		then sum(PPSC.Renewal_calc_RateChangePrem_onExpiringTermPrem)
		else 0
		end),
	Renewal_RCPrem_FA_NonUC = (case
		when PPSC.coverage_group = ''Fire & Allied''
			and POL.property_coverage_form <> ''UC''
		then sum(PPSC.Renewal_calc_RateChangePrem_onExpiringTermPrem)
		else 0
		end),
	Prior_PolTerm_WP_total = sum(PPSC.Prior_MIPS_PolTerm_WP),
	Prior_PolTerm_WP_GL  = (case
		when PPSC.coverage_group in (''GL'',''Professional'')
		then sum(PPSC.Prior_MIPS_PolTerm_WP)
		else 0
		end),
	Prior_PolTerm_WP_FA = (case
		when PPSC.coverage_group = ''Fire & Allied''
		then sum(PPSC.Prior_MIPS_PolTerm_WP)
		else 0
		end),
	Prior_PolTerm_WP_FA_UC = (case
		when PPSC.coverage_group = ''Fire & Allied''
			and POL.property_coverage_form = ''UC''
		then sum(PPSC.Prior_MIPS_PolTerm_WP)
		else 0
		end),
	Prior_PolTerm_WP_FA_NonUC = (case
		when PPSC.coverage_group = ''Fire & Allied''
			and POL.property_coverage_form <> ''UC''
		then sum(PPSC.Prior_MIPS_PolTerm_WP)
		else 0
		end)
--select * 
from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work PPSC
left join Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work POL
on POL.policynumber = PPSC.policynumber
group by 
	PPSC.policynumber, 
	PPSC.coverage_group, 
	POL.property_coverage_form
) as POL2
group by policynumber
)
update Act_Detailed_Experience.dbo.RRHR_All_Policies_Price_Monitor_work
set 
	Standard_Curr_MIPS_WP = POL3.Standard_Curr_MIPS_WP,
	Standard_Curr_MIPS_WP_GL = POL3.Standard_Curr_MIPS_WP_GL,
	Standard_Curr_MIPS_WP_FA = POL3.Standard_Curr_MIPS_WP_FA,
	Standard_Curr_MIPS_WP_FA_UC = POL3.Standard_Curr_MIPS_WP_FA_UC,
	Standard_Curr_MIPS_WP_FA_NonUC = POL3.Standard_Curr_MIPS_WP_FA_NonUC,

	Standard_Premium_Curr = POL3.Standard_Premium_Curr,
	Standard_Premium_Curr_GL = POL3.Standard_Premium_Curr_GL,
	Standard_Premium_Curr_FA = POL3.Standard_Premium_Curr_FA,
	Standard_Premium_Curr_FA_UC = POL3.Standard_Premium_Curr_FA_UC,
	Standard_Premium_Curr_FA_NonUC = POL3.Standard_Premium_Curr_FA_NonUC,

	Renewal_RCPrem_total = POL3.Renewal_RCPrem_total,
	Renewal_RCPrem_GL = POL3.Renewal_RCPrem_GL,
	Renewal_RCPrem_FA = POL3.Renewal_RCPrem_FA,
	Renewal_RCPrem_FA_UC = POL3.Renewal_RCPrem_FA_UC,
	Renewal_RCPrem_FA_NonUC = POL3.Renewal_RCPrem_FA_NonUC,

	Prior_PolTerm_WP_total = POL3.Prior_PolTerm_WP_total,
	Prior_PolTerm_WP_GL = POL3.Prior_PolTerm_WP_GL,
	Prior_PolTerm_WP_FA = POL3.Prior_PolTerm_WP_FA,
	Prior_PolTerm_WP_FA_UC = POL3.Prior_PolTerm_WP_FA_UC,
	Prior_PolTerm_WP_FA_NonUC = POL3.Prior_PolTerm_WP_FA_NonUC

from Act_Detailed_Experience.dbo.RRHR_All_Policies_Price_Monitor_work RRHR
left join PriceMonitor_Info POL3
on pol3.policynumber = RRHR.policynumber


/*
select * from Act_Detailed_Experience.dbo.RRHR_All_Policies_Price_Monitor_work RRHR
where policynumber = ''PHPK561548''

--select * 
from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work PPSC
where policynumber = ''PHPK561548''
select *  from PriceMonitor.dbo.Price_Monitor_Detailed_Reporting
where policy_number = ''PHPK561548''


select * from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work 
where policynumber = ''PHPK390529''
*/
 
update Act_Detailed_Experience.dbo.RRHR_All_Policies_Price_Monitor_work
set 
Price_Monitor_Std_Cov_Grp_Monitored = (case 
	when Standard_Premium_Curr = 0 or Standard_Premium_Curr is null 
	then null
	else currentwrittenpremium/Standard_Premium_Curr
	end)
from Act_Detailed_Experience.dbo.RRHR_All_Policies_Price_Monitor_work
 



update Act_Detailed_Experience.dbo.RRHR_All_Policies_Price_Monitor_work
set 
Price_Monitor_Std_Cov_Grp_Monitored_range = 
		(Case when Price_Monitor_Std_Cov_Grp_Monitored >= .95
				or Price_Monitor_Std_Cov_Grp_Monitored <= 1.05
			then (Case
				when Price_Monitor_Std_Cov_Grp_Monitored is NULL then ''a: No Data''
				when Price_Monitor_Std_Cov_Grp_Monitored < .80 then ''b: <.80 Judgment Mod''
				when Price_Monitor_Std_Cov_Grp_Monitored < .95 then ''c: .80 to .95 Judgment Mod''
				when Price_Monitor_Std_Cov_Grp_Monitored < 1.05 then ''d: .95 to 1.05 Judgment Mod''
				when Price_Monitor_Std_Cov_Grp_Monitored < 1.20 then ''e: 1.05 to 1.20 Judgment Mod''
				else ''f: 1.20 or more Judgment Mod''
				end)
			else ''a: No Data'' end)
from Act_Detailed_Experience.dbo.RRHR_All_Policies_Price_Monitor_work

/*
select * from Act_Detailed_Experience.dbo.RRHR_All_Policies_Price_Monitor_work
where policynumber = ''PHPK605268''

select * 
from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work
where policynumber = ''PHPK605268'' and coverage_group = ''Fire & Allied''


select * 
from PriceMonitor.dbo.Price_Monitor_Detailed_Reporting_test
where Policy_number = ''PHPK605268'' and coverage_group = ''Fire & Allied''

select * from pricemonitor.dbo.PRICE_MONITOR_DATA_CUM_UC_BUILDING_test_exposure
where policy_number = ''PHPK614477''

*/
' 
END
GO
