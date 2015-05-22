IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_7_Policy_Product_State_CoverageGroup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_7_Policy_Product_State_CoverageGroup]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_7_Policy_Product_State_CoverageGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




















CREATE procedure [dbo].[usp_Step_7_Policy_Product_State_CoverageGroup] as 

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

/* Step 1 Create Base Price Monitor Table  Last run time 12 minutes */

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Product_State_Coverage_Data_ALL_POLICIES_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work

CREATE TABLE dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work (
	[policynumber] [varchar](15) NULL,
	[Productcode] [varchar](50) NULL,
	[statecode] [varchar](2) NULL,
	[coverage_group] [varchar](50) NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[FA_Frost_State] [varchar](50) NULL,
	[Renewal_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Reporting_Premium_After_Rate_Change_GrossExpense] [float] NULL,
	[Reporting_Premium_Before_Rate_Change_GrossExpense] [float] NULL,
	[Prior_MIPS_PolTerm_WP] [float] NULL,
	[Standard_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Standard_Premium_Curr] [float] NULL,
	--[Benchmark_Curr_MIPS_WP] [decimal](38, 2) NULL,
	--[Benchmark_NormPrem] [float] NULL,
	--[Benchmark_Curr_Exposure] [float] NULL,
	[Price_Monitor_Standard_CovGrp_GL_Monitored] [float] NULL,
	[Price_Monitor_Standard_Portion_of_CovGrp_GL_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Portion_of_All_Cov_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Changes_of_All_Cov_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Portion_of_Cov_Grp_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Changes_of_Cov_Grp_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Portion_of_CovGrp_St_Class_Monitored] [float] NULL,
	[Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored] [float] NULL,
	[Price_Monitor_Standard_Portion_of_All_Cov_Monitored] [float] NULL,
	[Price_Monitor_Standard_Changes_of_All_Cov_Monitored] [float] NULL,
	[Price_Monitor_Standard_Portion_of_Cov_Grp_Monitored] [float] NULL,
	[Price_Monitor_Standard_Cov_Grp_Monitored] [float] NULL,
	[Price_Monitor_Benchmark_Rate] [float] NULL,
	[Price_Monitor_Benchmark_CW_for_Class] [float] NULL,
	[Price_Monitor_Standard_CovGrp_GL_Monitored_range] [varchar](255) NULL,
	[Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range] [varchar](255) NULL,
	[Price_Monitor_Standard_Cov_Grp_Monitored_range] [varchar](255) NULL,
	[Price_Monitor_Benchmark_Rate_to_CW_range] [varchar](255) NULL,
	[GL_Territory_Dominant] [varchar](3) NULL,
	[GL_Territory_Dominant_Percent] [float] NULL,
	[GL_Dom_Terr_Description] [varchar](200) NULL,
	[GL_Dom_Region_in_State] [varchar](50) NULL
) 

insert into Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work
(	policynumber,
	Productcode,
	statecode,
	coverage_group,
	currentwrittenpremium)
select
	policynumber,
	Productcode,
	statecode,
	coverage_group,
	sum(currentwrittenpremium) as currentwrittenpremium
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work PS
group by 
	policynumber,
	Productcode,
	statecode,
	coverage_group

select 
PolicyNumber,
StateCode,
CoverageGroup = (case 
	when PM.CoverageCode = ''GLBI'' 
		and ProductCode in (''AE'',
			''AI'',
			''CL'',
			''DM'',
			''EL'',
			''EO'',
			''EW'',
			''FT'',
			''HP'',
			''IE'',
			''LE'',
			''MC'',
			''PL'',
			''SB'')
		then ''E&O'' 
		when PM.CoverageCode = ''GLBI'' 
			and ProductCode in (''AC'',
				''AM'',
				''AU'',
				''BE'',
				''BU'',
				''CM'',
				''CR'',
				''CU'',
				''DU'',
				''EM'',
				''EU'',
				''FE'',
				''FM'',
				''FT'',
				''GM'',
				''GU'',
				''HU'',
				''IU'',
				''LU'',
				''ML'',
				''MM'',
				''MR'',
				''MU'',
				''NM'',
				''NU'',
				''OU'',
				''PD'',
				''PE'',
				''RM'',
				''RR'',
				''RU'',
				''SM'',
				''SU'',
				''TU'',
				''TV'',
				''UA'',
				''UB'',
				''UD'',
				''UE'',
				''UF'',
				''UG'',
				''UH'',
				''UI'',
				''UK'',
				''UL'',
				''UN'',
				''UP'',
				''UR'',
				''UT'',
				''UU'',
				''UV'',
				''UW'',
				''VM'',
				''VU'',
				''YU'')
		then ''Umbrella'' 
		else CG.Coverage_Group2
			
		end),
ProductCode,
Reporting_Premium_After_Rate_Change_GrossExpense = sum(Reporting_Premium_After_Rate_Change_GrossExpense),
Reporting_Premium_Before_Rate_Change_GrossExpense = sum(Reporting_Premium_Before_Rate_Change_GrossExpense),
Renewal_Curr_MIPS_WP		= sum(Reporting_Current_Written_Premium_Renewal_Reportable),
Prior_MIPS_PolTerm_WP		= sum(Reporting_Premium_Before_Rate_Change_GrossExpense),
Standard_Curr_MIPS_WP		= sum(Reporting_Current_Written_Premium_Standard_Reportable),
Standard_Premium_Curr		= sum(Reporting_Standard_Premium_Current_Reportable)

-------------------------------------
--Benchmark_Curr_MIPS_WP,
--Benchmark_NormPrem,
--Benchmark_Curr_Exposure
--------------------------------------------------
into #Price_Monitor_Detailed_Reporting 
from PriceMonitorSystem.dbo.PriceMonitorReporting_SummarizedLegacy  PM
left outer join  Act_Definitions.dbo.Coverage_Groups CG with (nolock)
on CG.Coveragecode = pm.CoverageCode
group by 
PolicyNumber,
StateCode,
(case 
	when PM.CoverageCode = ''GLBI'' 
		and ProductCode in (''AE'',
			''AI'',
			''CL'',
			''DM'',
			''EL'',
			''EO'',
			''EW'',
			''FT'',
			''HP'',
			''IE'',
			''LE'',
			''MC'',
			''PL'',
			''SB'')
		then ''E&O'' 
		when PM.CoverageCode = ''GLBI'' 
			and ProductCode in (''AC'',
				''AM'',
				''AU'',
				''BE'',
				''BU'',
				''CM'',
				''CR'',
				''CU'',
				''DU'',
				''EM'',
				''EU'',
				''FE'',
				''FM'',
				''FT'',
				''GM'',
				''GU'',
				''HU'',
				''IU'',
				''LU'',
				''ML'',
				''MM'',
				''MR'',
				''MU'',
				''NM'',
				''NU'',
				''OU'',
				''PD'',
				''PE'',
				''RM'',
				''RR'',
				''RU'',
				''SM'',
				''SU'',
				''TU'',
				''TV'',
				''UA'',
				''UB'',
				''UD'',
				''UE'',
				''UF'',
				''UG'',
				''UH'',
				''UI'',
				''UK'',
				''UL'',
				''UN'',
				''UP'',
				''UR'',
				''UT'',
				''UU'',
				''UV'',
				''UW'',
				''VM'',
				''VU'',
				''YU'')
		then ''Umbrella'' 
		else CG.Coverage_Group2
			
		end),
ProductCode



/*************** Step 2 ******************/
/* Add Price Monitor Data */

update Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work
set 
	FA_Frost_State = (case
		when PS.statecode in (
			''ME'',''NH'',''VT'',''MA'',''CT'',''RI'',
			''MI'',''MN'',''WI'',''ND'',''MT'',''ID'',
			''IA'',''SD'',''NE'',''WY'',
			''NY'',''NJ'',''PA'',''OH'',''IN'',''IL'')
		then ''Frost''
		else ''Non-Frost''
		end),
	Renewal_Curr_MIPS_WP = pm.Renewal_Curr_MIPS_WP, 
	Reporting_Premium_After_Rate_Change_GrossExpense = pm.Reporting_Premium_After_Rate_Change_GrossExpense,
    Reporting_Premium_Before_Rate_Change_GrossExpense = pm.Reporting_Premium_Before_Rate_Change_GrossExpense,
	Prior_MIPS_PolTerm_WP = pm.Prior_MIPS_PolTerm_WP,
	Standard_Curr_MIPS_WP = pm.Standard_Curr_MIPS_WP,
	Standard_Premium_Curr = pm.Standard_Premium_Curr
	--,Benchmark_Curr_MIPS_WP = (
	--	select Benchmark_Curr_MIPS_WP
	--	from #Price_Monitor_Detailed_Reporting PM
	--	where PS.policynumber = PM.policy_number
	--		and PS.statecode = PM.premium_state
	--		and PS.Coverage_Group = PM.Coverage_Group
	--		and PS.productcode = PM.product),
	--Benchmark_NormPrem = (
	--	select Benchmark_NormPrem
	--	from #Price_Monitor_Detailed_Reporting PM
	--	where PS.policynumber = PM.policy_number
	--		and PS.statecode = PM.premium_state
	--		and PS.Coverage_Group = PM.Coverage_Group
	--		and PS.productcode = PM.product),
	--Benchmark_Curr_Exposure = (
	--	select Benchmark_Curr_Exposure
	--	from #Price_Monitor_Detailed_Reporting PM
	--	where PS.policynumber = PM.policy_number
	--		and PS.statecode = PM.premium_state
	--		and PS.Coverage_Group = PM.Coverage_Group
	--		and PS.productcode = PM.product)
from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work PS
left outer join #Price_Monitor_Detailed_Reporting PM
		on PS.policynumber = PM.PolicyNumber
			and PS.statecode = PM.StateCode
			and PS.Coverage_Group = PM.CoverageGroup
			and PS.productcode = PM.ProductCode


/*************** Step 3 ******************/
/* Add Additional Price Monitor Data */

update Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  
set 
	Price_Monitor_Renewal_Portion_of_All_Cov_Monitored = (Case 
		when (
			select Sum(currentwrittenpremium) 
			from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
			where PS.Policynumber = Rep1.Policynumber) <> 0
		then (
			select sum(Renewal_Curr_MIPS_WP)/sum(currentwrittenpremium)
			from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
			where PS.Policynumber = Rep1.Policynumber)
		end),
	Price_Monitor_Renewal_Changes_of_All_Cov_Monitored =
		(case when (select sum(Reporting_Premium_Before_Rate_Change_GrossExpense) from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber) <> 0
			then (select sum(Reporting_Premium_After_Rate_Change_GrossExpense)/sum(Reporting_Premium_Before_Rate_Change_GrossExpense)-1
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber)
			end),		
	Price_Monitor_Renewal_Portion_of_Cov_Grp_Monitored =
		(Case when (select Sum(currentwrittenpremium) from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber and PS.Coverage_Group = Rep1.Coverage_Group) <> 0
			then (select sum(Renewal_Curr_MIPS_WP)/sum(currentwrittenpremium)
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber and PS.Coverage_Group = Rep1.Coverage_Group)
			end),
	Price_Monitor_Renewal_Changes_of_Cov_Grp_Monitored =
		(case when (select sum(Reporting_Premium_Before_Rate_Change_GrossExpense) from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber and PS.Coverage_Group = Rep1.Coverage_Group) <> 0
			then (select sum(Reporting_Premium_After_Rate_Change_GrossExpense)/sum(Reporting_Premium_Before_Rate_Change_GrossExpense)-1
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber and PS.Coverage_Group = Rep1.Coverage_Group)
			end),		
	Price_Monitor_Renewal_Portion_of_CovGrp_St_Class_Monitored =
		(Case when (select Sum(currentwrittenpremium) from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber and PS.Coverage_Group = Rep1.Coverage_Group
					and PS.statecode = Rep1.statecode /*and PS.Class_code = Rep1.Class_code*/) <> 0
			then (select sum(Renewal_Curr_MIPS_WP)/sum(currentwrittenpremium)
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber and PS.Coverage_Group = Rep1.Coverage_Group
					and PS.statecode = Rep1.statecode /*and PS.Class_code = Rep1.Class_code*/)
			end),
	Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored =
		(case when (select sum(Reporting_Premium_Before_Rate_Change_GrossExpense) from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber and PS.Coverage_Group = Rep1.Coverage_Group
					and PS.statecode = Rep1.statecode /*and PS.Class_code = Rep1.Class_code*/) <> 0
			then (select sum(Reporting_Premium_After_Rate_Change_GrossExpense)/sum(Reporting_Premium_Before_Rate_Change_GrossExpense)-1
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber and PS.Coverage_Group = Rep1.Coverage_Group
					and PS.statecode = Rep1.statecode /*and PS.Class_code = Rep1.Class_code*/)
			end),		
	Price_Monitor_Standard_Portion_of_All_Cov_Monitored =
		(Case when (select Sum(currentwrittenpremium) from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber) <> 0
			then (select sum(Standard_Curr_MIPS_WP)/sum(currentwrittenpremium)
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber)
			end),
	Price_Monitor_Standard_Changes_of_All_Cov_Monitored =
		(case when (select sum(Standard_Curr_MIPS_WP) from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber) <> 0
			then (select sum(Standard_Premium_Curr)/sum(Standard_Curr_MIPS_WP)
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber)
			end),	
	Price_Monitor_Standard_Portion_of_Cov_Grp_Monitored = (Case 
		when (select Sum(Standard_Curr_MIPS_WP) 
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and PS.Coverage_Group = Rep1.Coverage_Group) <> 0
			and (select Sum(currentwrittenpremium) 
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and PS.Coverage_Group = Rep1.Coverage_Group) <> 0
		then (select sum(Standard_Curr_MIPS_WP)/sum(currentwrittenpremium)
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber and PS.Coverage_Group = Rep1.Coverage_Group)
		end),
	Price_Monitor_Standard_Cov_Grp_Monitored = (case 
		when (select sum(Standard_Curr_MIPS_WP) 
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and PS.Coverage_Group = Rep1.Coverage_Group) <> 0
			and (select Sum(Standard_Premium_Curr) 
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and PS.Coverage_Group = Rep1.Coverage_Group) <> 0
		then (select sum(Standard_Curr_MIPS_WP) / sum(Standard_Premium_Curr)
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and PS.Coverage_Group = Rep1.Coverage_Group)
		end),		
	Price_Monitor_Standard_Portion_of_CovGrp_GL_Monitored = (Case 
		when (select sum(Standard_Curr_MIPS_WP) 
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and Rep1.Coverage_Group = ''GL'') <> 0
			and (select Sum(currentwrittenpremium) 
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and Rep1.Coverage_Group = ''GL'') <> 0
		then (select sum(Standard_Curr_MIPS_WP)/sum(currentwrittenpremium)
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and Rep1.Coverage_Group = ''GL'')
		end),
	Price_Monitor_Standard_CovGrp_GL_Monitored = (case 
		when (select sum(Standard_Curr_MIPS_WP) 
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and Rep1.Coverage_Group = ''GL'') <> 0
			and (select Sum(Standard_Premium_Curr) 
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and Rep1.Coverage_Group = ''GL'') <> 0
		then (select sum(Standard_Curr_MIPS_WP) / sum(Standard_Premium_Curr)
				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
				where PS.Policynumber = Rep1.Policynumber 
					and Rep1.Coverage_Group = ''GL'')
		end)
		--,
	--Price_Monitor_Benchmark_Rate =  (case when Benchmark_Curr_Exposure <> 0.0
	--						and Benchmark_Curr_Exposure is not Null
	--					then (Benchmark_NormPrem / Benchmark_Curr_Exposure)
	--					else 0.0
	--					end),
	--Price_Monitor_Benchmark_CW_for_Class =
	--	(case when (select sum(Benchmark_Curr_Exposure) 
	--				from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
	--				where PS.Policynumber = Rep1.Policynumber 
	--					and PS.Coverage_Group = Rep1.Coverage_Group
	--					/*and PS.Class_Code = Rep1.Class_Code*/
	--				) <> 0
	--		then (select sum(Benchmark_NormPrem)/sum(Benchmark_Curr_Exposure)
	--			from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  Rep1
	--			where PS.Policynumber = Rep1.Policynumber 
	--				and PS.Coverage_Group = Rep1.Coverage_Group
	--				/*and PS.Class_Code = Rep1.Class_Code*/)
	--		end)
from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  PS



------------------------------------------------------------------------------------------


/************** Step 4 ****************/ 
/************ Build Ranges ************/

update Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work 
set

	Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored_range = 
		(Case when Price_Monitor_Renewal_Portion_of_CovGrp_St_Class_Monitored >= .95
				or Price_Monitor_Renewal_Portion_of_CovGrp_St_Class_Monitored <= 1.05
			then (Case
				when Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored is NULL then ''a: No Data''
				when Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored < -.20 then ''b: <-20% Rate Change''
				when Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored < -.10 then ''c: -20% to -10% Rate Change''
				when Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored < -.05 then ''d: -10% to -5% Rate Change''
				when Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored < 0 then ''e: -5% to 0% Rate Change''
				when Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored < .05 then ''f: 0% to +5% Rate Change''
				when Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored < .10 then ''g: +5% to +10% Rate Change''
				when Price_Monitor_Renewal_Changes_of_CovGrp_St_Class_Monitored < .20 then ''h: +10% to +20% Rate Change''
				else ''i: +20% or more Rate Change''
				end)
			else ''a: No Data'' end),

	Price_Monitor_Standard_Cov_Grp_Monitored_range = 
		(Case when Price_Monitor_Standard_Portion_of_Cov_Grp_Monitored >= .95
				or Price_Monitor_Standard_Portion_of_Cov_Grp_Monitored <= 1.05
			then (Case
				when Price_Monitor_Standard_Cov_Grp_Monitored is NULL then ''a: No Data''
				when Price_Monitor_Standard_Cov_Grp_Monitored < .80 then ''b: <.80 Judgment Mod''
				when Price_Monitor_Standard_Cov_Grp_Monitored < .95 then ''c: .80 to .95 Judgment Mod''
				when Price_Monitor_Standard_Cov_Grp_Monitored < 1.05 then ''d: .95 to 1.05 Judgment Mod''
				when Price_Monitor_Standard_Cov_Grp_Monitored < 1.20 then ''e: 1.05 to 1.20 Judgment Mod''
				else ''f: 1.20 or more Judgment Mod''
				end)
			else ''a: No Data'' end),

	Price_Monitor_Standard_CovGrp_GL_Monitored_range = 
		(Case when Price_Monitor_Standard_Portion_of_CovGrp_GL_Monitored >= .95
				or Price_Monitor_Standard_Portion_of_CovGrp_GL_Monitored <= 1.05
			then (Case
				when Price_Monitor_Standard_CovGrp_GL_Monitored is NULL then ''a: No Data''
				when Price_Monitor_Standard_CovGrp_GL_Monitored < .80 then ''b: <.80 Judgment Mod''
				when Price_Monitor_Standard_CovGrp_GL_Monitored < .95 then ''c: .80 to .95 Judgment Mod''
				when Price_Monitor_Standard_CovGrp_GL_Monitored < 1.05 then ''d: .95 to 1.05 Judgment Mod''
				when Price_Monitor_Standard_CovGrp_GL_Monitored < 1.20 then ''e: 1.05 to 1.20 Judgment Mod''
				else ''f: 1.20 or more Judgment Mod''
				end)
			else ''a: No Data'' end) 

	--,Price_Monitor_Benchmark_Rate_to_CW_range = 
	--	(Case when Price_Monitor_Benchmark_Rate is not Null 
	--			and Price_Monitor_Benchmark_CW_for_Class is not Null
	--			and Price_Monitor_Benchmark_CW_for_Class <> 0.0
	--		then (Case
	--			when Price_Monitor_Benchmark_Rate / Price_Monitor_Benchmark_CW_for_Class  is NULL then ''a: No Data''
	--			when Price_Monitor_Benchmark_Rate / Price_Monitor_Benchmark_CW_for_Class < .80 then ''b: <.80 of CW BM Rate''
	--			when Price_Monitor_Benchmark_Rate / Price_Monitor_Benchmark_CW_for_Class < -.05 then ''c: .80 to .95 of CW BM Rate''
	--			when Price_Monitor_Benchmark_Rate / Price_Monitor_Benchmark_CW_for_Class < .05 then ''d: .95 to 1.05 of CW BM Rate''
	--			when Price_Monitor_Benchmark_Rate / Price_Monitor_Benchmark_CW_for_Class < .25 then ''e: 1.05 to 1.20 of CW BM Rate''
	--			else ''f: 1.20 or more of CW BM Rate''
	--			end)
	--		else ''a: No Data'' end)

from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work  PS


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)








' 
END
GO
