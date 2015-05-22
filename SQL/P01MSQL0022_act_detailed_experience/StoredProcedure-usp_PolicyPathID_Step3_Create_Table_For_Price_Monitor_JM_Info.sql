IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PolicyPathID_Step3_Create_Table_For_Price_Monitor_JM_Info]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PolicyPathID_Step3_Create_Table_For_Price_Monitor_JM_Info]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PolicyPathID_Step3_Create_Table_For_Price_Monitor_JM_Info]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE procedure [dbo].[usp_PolicyPathID_Step3_Create_Table_For_Price_Monitor_JM_Info]

as

-- Policy PathId Monthly Step 3
-- FootPrints Ticket #59691
-- Erik Godfrey
-- 7/16/2012

if exists (select 1 from sys.tables
           where name = ''Policy_PATHID_Information_JudgmtMod_work'')
   drop table Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work

select 
	accountnumber,
	DivisionName,
	policynumber,
	effectiveYear,
	currentwrittenpremium = convert(float,NULL),
	policy_Reporting_Premium = convert(float,NULL),
	policy_Percent_Monitored = convert(float,NULL),
	policy_Judgment_Premium_NonUC = convert(float,NULL),
	policy_Judgment_StandardPremium_NonUC = convert(float,NULL),
	policy_Judgment_Mod_NonUC = convert(float,NULL),
	policy_Judgment_Premium_UC = convert(float,NULL),
	policy_Judgment_StandardPremium_UC = convert(float,NULL),
	policy_Judgment_Mod_UC = convert(float,NULL),
	policy_Judgment_Premium_GL = convert(float,NULL),
	policy_Judgment_StandardPremium_GL = convert(float,NULL),
	policy_Judgment_Mod_GL = convert(float,NULL),
	policy_Judgment_Premium_Automobile = convert(float,NULL),
	policy_Judgment_StandardPremium_Automobile = convert(float,NULL),
	policy_Judgment_Mod_Automobile = convert(float,NULL),
	AccountDiv_Reporting_Premium = convert(float,NULL),
	AccountDiv_Percent_Monitored = convert(float,NULL),
	AccountDiv_Judgment_Premium_NonUC = convert(float,NULL),
	AccountDiv_Judgment_StandardPremium_NonUC = convert(float,NULL),
	AccountDiv_Judgment_Mod_NonUC = convert(float,NULL),
	AccountDiv_Judgment_Premium_UC = convert(float,NULL),
	AccountDiv_Judgment_StandardPremium_UC = convert(float,NULL),
	AccountDiv_Judgment_Mod_UC = convert(float,NULL),
	AccountDiv_Judgment_Mod_NonUC_Range = convert(varchar(50),NULL),
	AccountDiv_Judgment_Mod_UC_Range = convert(varchar(50),NULL),
	policy_Judgment_Mod_GL_Range = convert(varchar(50),NULL),
	policy_Judgment_Mod_Automobile_Range = convert(varchar(50),NULL)
into Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work with (nolock)
where policynumber is not null
group by
	accountnumber,
	DivisionName,
	policynumber,
	effectiveYear

select 
	accountnumber,
	policynumber,
	div.DivisionName,
	currentwrittenpremium = SUM(currentwrittenpremium)
into #policy_premium
from AccessPhlyEom.dbo.premiumsummary PS with (nolock)
left join AccessPhlyEom.dbo.product Prod with (nolock)
on Prod.productcode = PS.productcode
left join AccessPhlyEom.dbo.Division Div with (nolock)
on Div.DivisionID = prod.DivisionID
group by
	accountnumber,
	policynumber,
	div.DivisionName

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work
set currentwrittenpremium = PS.currentwrittenpremium
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work JM with (nolock)
left join #policy_premium PS with (nolock)
on PS.policynumber = JM.policynumber

select account_number,
       DivisionName,
       policy_number,
       EffectiveYear,
       Reporting_Premium = sum(Curr_MIPS_WP),
       Monitored_Premium_NonUC = sum(Monitored_Premium_NonUC),
       Monitored_StandardPremium_NonUC = sum(Monitored_StandardPremium_NonUC),
       Monitored_Premium_UC = sum(Monitored_Premium_UC),
       Monitored_StandardPremium_UC = sum(Monitored_StandardPremium_UC),
       Monitored_Premium_GL = sum(Monitored_Premium_GL),
       Monitored_StandardPremium_GL = sum(Monitored_StandardPremium_GL),
       Monitored_Premium_Automobile = sum(Monitored_Premium_Automobile),
       Monitored_StandardPremium_Automobile = sum(Monitored_StandardPremium_Automobile)
into #PM_JudgmentMod
from (select *,
	         Monitored_Premium_nonUC = (case when Coverage_id not like ''UC%''
                                             then Curr_MIPS_WP
                                             else 0
                                        end),
	         Monitored_StandardPremium_nonUC = (case when Coverage_id not like ''UC%''
                                                     then Standard_Premium_Curr
                                                     else 0
                                                end),
	         Monitored_Premium_UC = (case when Coverage_id like ''UC%''
                                          then Curr_MIPS_WP
                                          else 0
                                     end),
	         Monitored_StandardPremium_UC = (case when Coverage_id like ''UC%''
		                                          then Standard_Premium_Curr
		                                          else 0
		                                     end),
	         Monitored_Premium_GL = (case when Coverage_id = ''GLBI''
                                          and  producttypename <> ''Umbrella''
                                          then Curr_MIPS_WP
                                          else 0
                                     end),
	         Monitored_StandardPremium_GL = (case when Coverage_id = ''GLBI''
                                                  and  producttypename <> ''Umbrella''
                                                  then Standard_Premium_Curr
                                                  else 0
                                             end),
	         Monitored_Premium_Automobile = (case when Coverage_id in (''BI'',''COLL'',''OTC'')
                                                  then Curr_MIPS_WP
                                                  else 0
                                             end),
	         Monitored_StandardPremium_Automobile = (case when Coverage_id in (''BI'',''COLL'',''OTC'')
                                                          then Standard_Premium_Curr
                                                          else 0
                                                     end)
      from (select pm.accountnumber as account_number,
                   div.DivisionName,
                   pm.PolicyNumber as policy_number,
                   pm.ProductCode,
                   producttype.ProductTypeName,
                   year(pm.PolicyEffectiveDate) as EffectiveYear,
                   pm.CoverageGroup as coverage_Group,
                   pm.CoverageCode as Coverage_id,
                   Curr_MIPS_WP = sum(pm.Reporting_Current_Written_Premium_Standard_Reportable),
                   Standard_Premium_Curr = sum(pm.Reporting_Standard_Premium_Current_Reportable)
            from PriceMonitorSystem.dbo.PriceMonitorReporting_SummarizedLegacy pm with (nolock)
            left outer join AccessPHLYEOM.dbo.product prod with (nolock)
            on  prod.productcode = pm.ProductCode
            left outer join AccessPhlyEOM.dbo.Division div with (nolock)
            on  div.DivisionID = prod.DivisionID
            left outer join PathNet2.dbo.Product product with (nolock)
            on  product.productcode = pm.ProductCode
            left outer join PathNet2.dbo.producttype producttype with (nolock)
            on  producttype.Pathcode = product.producttype
            group by pm.accountnumber,
                     div.DivisionName,
                     pm.PolicyNumber,
                     pm.ProductCode,
                     producttype.ProductTypeName,
                     year(pm.PolicyEffectiveDate),
                     pm.CoverageGroup,
                     pm.CoverageCode) as temp1
      ) as temp2
group by account_number,
         DivisionName,
         policy_number,
         EffectiveYear

--select
--	account_number,
--	DivisionName,
--	policy_number,
--	EffectiveYear,
----	productcode,
----	ProductTypeName,
--	Reporting_Premium = SUM(Curr_MIPS_WP),
--	Monitored_Premium_NonUC = SUM(Monitored_Premium_NonUC),
--	Monitored_StandardPremium_NonUC = SUM(Monitored_StandardPremium_NonUC),
--	Monitored_Premium_UC = SUM(Monitored_Premium_UC),
--	Monitored_StandardPremium_UC = SUM(Monitored_StandardPremium_UC),
--	Monitored_Premium_GL = SUM(Monitored_Premium_GL),
--	Monitored_StandardPremium_GL = SUM(Monitored_StandardPremium_GL),
--	Monitored_Premium_Automobile = SUM(Monitored_Premium_Automobile),
--	Monitored_StandardPremium_Automobile = SUM(Monitored_StandardPremium_Automobile)
--into #PM_JudgmentMod
--from (
--select *,
--	Monitored_Premium_nonUC = (case
--		when Standard_Reportable_YN = ''Y''
--			and Coverage_id not like ''UC%''
--		then Curr_MIPS_WP
--		else 0
--		end),
--	Monitored_StandardPremium_nonUC = (case
--		when Standard_Reportable_YN = ''Y''
--			and Coverage_id not like ''UC%''
--		then Standard_Premium_Curr
--		else 0
--		end),
--	Monitored_Premium_UC = (case
--		when Standard_Reportable_YN = ''Y''
--			and Coverage_id like ''UC%''
--		then Curr_MIPS_WP
--		else 0
--		end),
--	Monitored_StandardPremium_UC = (case
--		when Standard_Reportable_YN = ''Y''
--			and Coverage_id like ''UC%''
--		then Standard_Premium_Curr
--		else 0
--		end),
--	Monitored_Premium_GL = (case
--		when Standard_Reportable_YN = ''Y''
--			and Coverage_id = ''GLBI''
--			and producttypename <> ''Umbrella''
--		then Curr_MIPS_WP
--		else 0
--		end),
--	Monitored_StandardPremium_GL = (case
--		when Standard_Reportable_YN = ''Y''
--			and Coverage_id = ''GLBI''
--			and producttypename <> ''Umbrella''
--		then Standard_Premium_Curr
--		else 0
--		end),
--	Monitored_Premium_Automobile = (case
--		when Standard_Reportable_YN = ''Y''
--			and Coverage_id in (''BI'',''COLL'',''OTC'')
--		then Curr_MIPS_WP
--		else 0
--		end),
--	Monitored_StandardPremium_Automobile = (case
--		when Standard_Reportable_YN = ''Y''
--			and Coverage_id in (''BI'',''COLL'',''OTC'')
--		then Standard_Premium_Curr
--		else 0
--		end)
--from (
--select
--	account_number,
--	DivisionName = Div.DivisionName,
--	policy_number,
--	product as productcode,
--	producttype.ProductTypeName,
--	year(Curr_Policy_Effective_Date) as EffectiveYear,
--	coverage_Group,
--	Coverage_id,
--	Standard_Reportable_YN,
--	Curr_MIPS_WP = SUM(Curr_MIPS_WP),
--	Standard_Premium_Curr = SUM(Standard_Premium_Curr)
----from Pricemonitor.dbo.Price_Monitor_Detailed_Reporting PM with (nolock)
--from PriceMonitorLegacy.dbo.Price_Monitor_Detailed_Reporting PM with (nolock)
--left join AccessPhlyEom.dbo.product prod with (nolock)
--	on prod.productcode = PM.product
--left join AccessPhlyEom.dbo.Division Div with (nolock)
--	on Div.DivisionID = prod.DivisionID
--left Join pathnet2.dbo.Product Product  with (nolock)
--	on Product.productcode = PM.Product
--left join pathnet2.dbo.producttype producttype with (nolock)
--	on producttype.Pathcode = product.producttype
--group by
--	account_number,
--	Div.DivisionName,
--	producttype.ProductTypeName,
--	policy_number,
--	year(Curr_Policy_Effective_Date),
--	Standard_Reportable_YN,
--	coverage_Group,
--	Coverage_id,
--	product
--) as temp1
--) as temp2
--group by
--	account_number,
--	DivisionName,
--	policy_number,
--	EffectiveYear

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work
set policy_Reporting_Premium = JM.Reporting_Premium,
    policy_Judgment_Premium_NonUC = JM.Monitored_Premium_NonUC,
    policy_Judgment_StandardPremium_NonUC = JM.Monitored_StandardPremium_NonUC,
    policy_Judgment_Premium_UC = JM.Monitored_Premium_UC,
    policy_Judgment_StandardPremium_UC = JM.Monitored_StandardPremium_UC,
    policy_Judgment_Premium_GL = JM.Monitored_Premium_GL,
    policy_Judgment_StandardPremium_GL = JM.Monitored_StandardPremium_GL,
    policy_Judgment_Premium_Automobile = JM.Monitored_Premium_Automobile,
    policy_Judgment_StandardPremium_Automobile = JM.Monitored_StandardPremium_Automobile
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work TR with (nolock)
left join #PM_JudgmentMod JM with (nolock)
on JM.policy_number = TR.policynumber

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work
set
Policy_Percent_Monitored = (case
	when policy_Reporting_Premium = 0 or policy_Reporting_Premium is null then null
	else (policy_Judgment_Premium_nonUC + policy_Judgment_Premium_UC) 
		/ policy_Reporting_Premium
	end),
Policy_Judgment_Mod_nonUC = (case 
	when policy_Judgment_StandardPremium_nonUC = 0 
		or policy_Judgment_StandardPremium_nonUC is null
	then null
	else policy_Judgment_Premium_nonUC / policy_Judgment_StandardPremium_nonUC
	end),
Policy_Judgment_Mod_UC = (case 
	when policy_Judgment_StandardPremium_UC = 0 
		or policy_Judgment_StandardPremium_UC is null
	then null
	else policy_Judgment_Premium_UC / policy_Judgment_StandardPremium_UC
	end),
Policy_Judgment_Mod_GL = (case 
	when policy_Judgment_StandardPremium_GL = 0 
		or policy_Judgment_StandardPremium_GL is null
	then null
	else policy_Judgment_Premium_GL / policy_Judgment_StandardPremium_GL
	end),
Policy_Judgment_Mod_Automobile = (case 
	when policy_Judgment_StandardPremium_Automobile = 0 
		or policy_Judgment_StandardPremium_Automobile is null
	then null
	else policy_Judgment_Premium_Automobile / policy_Judgment_StandardPremium_Automobile
	end)
;

-- Create Account Level mods
with #PM_JudgmentMod_AcctDiv (
	account_number,
	DivisionName,
	effectiveyear,
	Reporting_Premium,
	Monitored_Premium_NonUC,
	Monitored_StandardPremium_NonUC,
	Monitored_Premium_UC,
	Monitored_StandardPremium_UC
) as (
select
	account_number,
	DivisionName,
	effectiveyear,
	Reporting_Premium = SUM(Reporting_Premium),
	Monitored_Premium_NonUC = SUM(Monitored_Premium_NonUC),
	Monitored_StandardPremium_NonUC = SUM(Monitored_StandardPremium_NonUC),
	Monitored_Premium_UC = SUM(Monitored_Premium_UC),
	Monitored_StandardPremium_UC = SUM(Monitored_StandardPremium_UC)
from #PM_JudgmentMod with (nolock)
group by 
	account_number,
	DivisionName,
	effectiveyear
)
Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work
set
	AccountDiv_Reporting_Premium = AD.Reporting_Premium,
	AccountDiv_Judgment_Premium_NonUC = AD.Monitored_Premium_NonUC,
	AccountDiv_Judgment_StandardPremium_NonUC = AD.Monitored_StandardPremium_NonUC,
	AccountDiv_Judgment_Premium_UC = AD.Monitored_Premium_UC,
	AccountDiv_Judgment_StandardPremium_UC = AD.Monitored_StandardPremium_UC
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work TR with (nolock)
left join #PM_JudgmentMod_AcctDiv AD with (nolock)
on AD.account_number = TR.accountnumber
	and AD.divisionname = TR.divisionname
	and AD.effectiveyear = TR.effectiveyear

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work
set
AccountDiv_Percent_Monitored = (case
	when AccountDiv_Reporting_Premium = 0 or AccountDiv_Reporting_Premium is null then null
	else (AccountDiv_Judgment_Premium_nonUC + AccountDiv_Judgment_Premium_UC) 
		/ AccountDiv_Reporting_Premium
	end),
AccountDiv_Judgment_Mod_nonUC = (case 
	when AccountDiv_Judgment_StandardPremium_nonUC = 0 
		or AccountDiv_Judgment_StandardPremium_nonUC is null
	then null
	else AccountDiv_Judgment_Premium_nonUC / AccountDiv_Judgment_StandardPremium_nonUC
	end),
AccountDiv_Judgment_Mod_UC = (case 
	when AccountDiv_Judgment_StandardPremium_UC = 0 
		or AccountDiv_Judgment_StandardPremium_UC is null
	then null
	else AccountDiv_Judgment_Premium_UC / AccountDiv_Judgment_StandardPremium_UC
	end)

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work
set
AccountDiv_Judgment_Mod_NonUC_Range = (Case
	when AccountDiv_Judgment_Mod_NonUC is NULL then ''a: No Data''
	when AccountDiv_Judgment_Mod_NonUC < .70 then ''b: <.70''
	when AccountDiv_Judgment_Mod_NonUC < .80 then ''c: .70 to .80''
	when AccountDiv_Judgment_Mod_NonUC < .95 then ''d: .80 to .95''
	when AccountDiv_Judgment_Mod_NonUC < 1.05 then ''e: .95 to 1.05''
	when AccountDiv_Judgment_Mod_NonUC < 1.20 then ''f: 1.05 to 1.20''
	else ''g: 1.20 or more''
	end),
AccountDiv_Judgment_Mod_UC_Range = (Case
	when AccountDiv_Judgment_Mod_UC is NULL then ''a: No Data''
	when AccountDiv_Judgment_Mod_UC < 2.0 then ''b: < 2.0''
	when AccountDiv_Judgment_Mod_UC < 2.5 then ''c: 2.0 to 2.5''
	when AccountDiv_Judgment_Mod_UC < 3.0 then ''d: 2.5 to 3.0''
	when AccountDiv_Judgment_Mod_UC < 3.5 then ''e: 3.0 to 3.5''
	when AccountDiv_Judgment_Mod_UC < 4.0 then ''f: 3.5 to 4.0''
	else ''g: 4.0 or more''
	end),
Policy_Judgment_Mod_GL_Range = (Case
	when Policy_Judgment_Mod_GL is NULL then ''a: No Data''
	when Policy_Judgment_Mod_GL < .70 then ''b: <.70''
	when Policy_Judgment_Mod_GL < .80 then ''c: .70 to .80''
	when Policy_Judgment_Mod_GL < .95 then ''d: .80 to .95''
	when Policy_Judgment_Mod_GL < 1.05 then ''e: .95 to 1.05''
	when Policy_Judgment_Mod_GL < 1.20 then ''f: 1.05 to 1.20''
	else ''g: 1.20 or more''
	end),
Policy_Judgment_Mod_Automobile_Range = (Case
	when Policy_Judgment_Mod_Automobile is NULL then ''a: No Data''
	when Policy_Judgment_Mod_Automobile < .70 then ''b: <.70''
	when Policy_Judgment_Mod_Automobile < .80 then ''c: .70 to .80''
	when Policy_Judgment_Mod_Automobile < .95 then ''d: .80 to .95''
	when Policy_Judgment_Mod_Automobile < 1.05 then ''e: .95 to 1.05''
	when Policy_Judgment_Mod_Automobile < 1.20 then ''f: 1.05 to 1.20''
	else ''g: 1.20 or more''
	end)

Update Act_Detailed_Experience.dbo.Policy_PATHID_Information_work
set Policy_Percent_Monitored = LI.Policy_Percent_Monitored,
    Policy_Judgment_Mod_nonUC = LI.Policy_Judgment_Mod_nonUC,
    Policy_Judgment_Mod_UC = LI.Policy_Judgment_Mod_UC,
    Policy_Judgment_Mod_GL = LI.Policy_Judgment_Mod_GL,
    Policy_Judgment_Mod_Automobile = LI.Policy_Judgment_Mod_Automobile,
    Policy_Judgment_Mod_GL_Range = LI.Policy_Judgment_Mod_GL_Range,
    Policy_Judgment_Mod_Automobile_Range = LI.Policy_Judgment_Mod_Automobile_Range,
    AccountDiv_Percent_Monitored = LI.AccountDiv_Percent_Monitored,
    AccountDiv_Judgment_Mod_nonUC = LI.AccountDiv_Judgment_Mod_nonUC,
    AccountDiv_Judgment_Mod_UC = LI.AccountDiv_Judgment_Mod_UC,
    AccountDiv_Judgment_Mod_NonUC_Range = LI.AccountDiv_Judgment_Mod_NonUC_Range,
    AccountDiv_Judgment_Mod_UC_Range = LI.AccountDiv_Judgment_Mod_UC_Range
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work TR with (nolock)
left join Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_work LI with (nolock)
on li.policynumber = TR.policynumber

drop table #policy_premium
drop table #PM_JudgmentMod


' 
END
GO
