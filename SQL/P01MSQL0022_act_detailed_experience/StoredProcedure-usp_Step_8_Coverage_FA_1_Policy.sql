IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_FA_1_Policy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_8_Coverage_FA_1_Policy]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_FA_1_Policy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'












CREATE procedure [dbo].[usp_Step_8_Coverage_FA_1_Policy] as 

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_ALL_POLICIES_FireAllied_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work 

CREATE TABLE dbo.Policy_Information_ALL_POLICIES_FireAllied_work (
	[policynumber] [varchar](15) NULL,
	[FA_Number_of_Locations] [int] NULL,
	[FA_Number_of_Buildings] [int] NULL,
	[FA_Building_Exposure] [float] NULL,
	[FA_Contents_Exposure] [float] NULL,
	[FA_Business_Interuption_Exposure] [float] NULL,
	[FA_Extra_Expense_Exposure] [float] NULL,
	[TIV] [float] NULL,
	[FA_Building_Prem] [float] NULL,
	[FA_Contents_Prem] [float] NULL,
	[FA_Deductible] [varchar](50) NULL,
	[constr_Code_1_Exposure] [float] NULL,
	[constr_Code_2_Exposure] [float] NULL,
	[constr_Code_3_Exposure] [float] NULL,
	[constr_Code_4_Exposure] [float] NULL,
	[constr_Code_5_Exposure] [float] NULL,
	[constr_Code_6_Exposure] [float] NULL,
	[constr_Code_7_Exposure] [float] NULL,
	[constr_Code_8_Exposure] [float] NULL,
	[constr_Code_9_Exposure] [float] NULL,
	[constr_Code_10_Exposure] [float] NULL,
	[protect_class_1_Exposure] [float] NULL,
	[protect_class_2_Exposure] [float] NULL,
	[protect_class_3_Exposure] [float] NULL,
	[protect_class_4_Exposure] [float] NULL,
	[protect_class_5_Exposure] [float] NULL,
	[protect_class_6_Exposure] [float] NULL,
	[protect_class_7_Exposure] [float] NULL,
	[protect_class_8_Exposure] [float] NULL,
	[protect_class_9_Exposure] [float] NULL,
	[protect_class_10_Exposure] [float] NULL,
	[Population_Density_Zone_Metro_Exposure] [float] NULL,
	[Population_Density_Zone_Urban_Exposure] [float] NULL,
	[Population_Density_Zone_Suburban_Exposure] [float] NULL,
	[Population_Density_Zone_SemiSuburban_Exposure] [float] NULL,
	[Population_Density_Zone_Rural_Exposure] [float] NULL,
	[Hail_A_Exposure] [float] NULL,
	[Hail_B_Exposure] [float] NULL,
	[Hail_C_Exposure] [float] NULL,
	[Hail_D_Exposure] [float] NULL,
	[Hail_E_Exposure] [float] NULL,
	[Hail_F_Exposure] [float] NULL,
	[Hail_G_Exposure] [float] NULL,
	[Hail_H_Exposure] [float] NULL,
	[TIV_Range] [varchar](50) NULL,
	[FA_Avg_TIV_per_BLD] [float] NULL,
	[FA_Avg_Bld_Rate] [float] NULL,
	[FA_Avg_Cts_Rate] [float] NULL,
	[FA_Deductible_to_TIV] [float] NULL,
	[term_factor] [float] NULL,
	[FA_Deductible_to_TIV_Range] [varchar](50) NULL,
	[FA_Avg_Bld_Rate_rd2] [float] NULL,
	[FA_Avg_Bld_Rate_Range] [varchar](50) NULL,
	[FA_Avg_Cts_Rate_Range] [varchar](50) NULL,
	[FA_Avg_TIV_per_BLD_Range] [varchar](50) NULL,
	[FA_Constr_code_Tot_Exposure] [float] NULL,
	[FA_Constr_Code_Max_Exposure] [float] NULL,
	[FA_Constr_Code_Dominant] [varchar](50) NULL,
	[FA_Constr_Code_Dominant_Percent] [float] NULL,
	[FA_Constr_Code_Dominant_NAME] [varchar](50) NULL,
	[Property_Coverage_Form] [varchar](2550) NULL,
	[FA_protect_class_Tot_Exposure] [float] NULL,
	[FA_protect_class_Max_Exposure] [float] NULL,
	[FA_protect_class_Dominant] [varchar](50) NULL,
	[FA_protect_class_Dominant_Percent] [float] NULL,
	[ZIP_Pop_Density_Tot_Exposure] [float] NULL,
	[ZIP_Pop_Density_Max_Exposure] [float] NULL,
	[ZIP_Pop_Density_Dominant] [varchar](15) NULL,
	[ZIP_Pop_Density_Dominant_Percent] [float] NULL,
	[FA_Hail_Tot_Exposure] [float] NULL,
	[FA_Hail_Max_Exposure] [float] NULL,
	[FA_Hail_Dominant] [varchar](25) NULL,
	[FA_Hail_Dominant_Percent] [float] NULL
	)

insert into Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work
(policynumber)
Select policynumber 
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
group by policynumber


update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work
set
FA_Number_of_Locations = Prop.FA_Number_of_Locations,
FA_Number_of_Buildings = Prop.FA_Number_of_Buildings,
FA_Building_Exposure = Prop.FA_Building_Exposure,
FA_Contents_Exposure = Prop.FA_Contents_Exposure,
FA_Business_Interuption_Exposure = Prop.FA_Business_Interuption_Exposure,
FA_Extra_Expense_Exposure = Prop.FA_Extra_Expense_Exposure,
TIV = Prop.TIV,
FA_Building_Prem = Prop.FA_Building_Prem,
FA_Contents_Prem = Prop.FA_Contents_Prem,
FA_Deductible = Prop.FA_Deductible,
Constr_Code_1_Exposure = Prop.Constr_Code_1_Exposure,
Constr_Code_2_Exposure = Prop.Constr_Code_2_Exposure,
Constr_Code_3_Exposure = Prop.Constr_Code_3_Exposure,
Constr_Code_4_Exposure = Prop.Constr_Code_4_Exposure,
Constr_Code_5_Exposure = Prop.Constr_Code_5_Exposure,
Constr_Code_6_Exposure = Prop.Constr_Code_6_Exposure,
Constr_Code_7_Exposure = Prop.Constr_Code_7_Exposure,
Constr_Code_8_Exposure = Prop.Constr_Code_8_Exposure,
Constr_Code_9_Exposure = Prop.Constr_Code_9_Exposure,
Constr_Code_10_Exposure = Prop.Constr_Code_10_Exposure,
Protect_Class_1_Exposure = Prop.Protect_Class_1_Exposure,
Protect_Class_2_Exposure = Prop.Protect_Class_2_Exposure,
Protect_Class_3_Exposure = Prop.Protect_Class_3_Exposure,
Protect_Class_4_Exposure = Prop.Protect_Class_4_Exposure,
Protect_Class_5_Exposure = Prop.Protect_Class_5_Exposure,
Protect_Class_6_Exposure = Prop.Protect_Class_6_Exposure,
Protect_Class_7_Exposure = Prop.Protect_Class_7_Exposure,
Protect_Class_8_Exposure = Prop.Protect_Class_8_Exposure,
Protect_Class_9_Exposure = Prop.Protect_Class_9_Exposure,
Protect_Class_10_Exposure = Prop.Protect_Class_10_Exposure,
Population_Density_Zone_Metro_Exposure = Prop.Population_Density_Zone_Metro_Exposure,
Population_Density_Zone_Urban_Exposure = Prop.Population_Density_Zone_Urban_Exposure,
Population_Density_Zone_Suburban_Exposure = Prop.Population_Density_Zone_Suburban_Exposure,
Population_Density_Zone_SemiSuburban_Exposure = Prop.Population_Density_Zone_SemiSuburban_Exposure,
Population_Density_Zone_Rural_Exposure = Prop.Population_Density_Zone_Rural_Exposure,
Hail_A_Exposure = Prop.Hail_A_Exposure,
Hail_B_Exposure = Prop.Hail_B_Exposure,
Hail_C_Exposure = Prop.Hail_C_Exposure,
Hail_D_Exposure = Prop.Hail_D_Exposure,
Hail_E_Exposure = Prop.Hail_E_Exposure,
Hail_F_Exposure = Prop.Hail_F_Exposure,
Hail_G_Exposure = Prop.Hail_G_Exposure,
Hail_H_Exposure = Prop.Hail_H_Exposure,
term_factor = Pol.term_factor,
Property_Coverage_Form = Pol.Property_Coverage_Form
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS
left join Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work POL
on PS.policynumber = POL.policynumber
left join (select
     prop1.policy_number,
count(Prop1.location) as FA_Number_of_Locations,
count(Prop1.building) as FA_Number_of_Buildings,
sum(Prop1.FA_Building_Exposure) as FA_Building_Exposure,
sum(Prop1.FA_Contents_Exposure) as FA_Contents_Exposure,
sum(Prop1.FA_Business_Interuption_Exposure) as FA_Business_Interuption_Exposure,
sum(Prop1.FA_Extra_Expense_Exposure) as FA_Extra_Expense_Exposure,
sum(Prop1.TIV) as TIV,
    sum(isnull(AB_BG2_AQS_Premium,0) +
                 isnull(AB_SCoL_AQS_Premium,0) +
                 isnull(FB_AQS_Premium,0) +
                 isnull(UCAB_AQS_Premium,0)) as  FA_Building_Prem,
     sum(isnull(AC_BG2_AQS_Premium,0) +
                 isnull(AC_SCoL_AQS_Premium,0) +
                 isnull(FC_AQS_Premium,0) +
                 isnull(UCAC_AQS_Premium,0)) as FA_Contents_Prem,
     max(FA_Deductible) as FA_Deductible,
sum(constr_Code_1_Exposure) as Constr_Code_1_Exposure,
sum(constr_Code_2_Exposure) as Constr_Code_2_Exposure,
sum(constr_Code_3_Exposure) as Constr_Code_3_Exposure,
sum(constr_Code_4_Exposure) as Constr_Code_4_Exposure,
sum(constr_Code_5_Exposure) as Constr_Code_5_Exposure,
sum(constr_Code_6_Exposure) as Constr_Code_6_Exposure,
sum(constr_Code_7_Exposure) as Constr_Code_7_Exposure,
sum(constr_Code_8_Exposure) as Constr_Code_8_Exposure,
sum(constr_Code_9_Exposure) as Constr_Code_9_Exposure,
sum(constr_Code_10_Exposure) as Constr_Code_10_Exposure,
sum(Protect_Class_1_Exposure) as Protect_Class_1_Exposure,
sum(Protect_Class_2_Exposure) as Protect_Class_2_Exposure,
sum(Protect_Class_3_Exposure) as Protect_Class_3_Exposure,
sum(Protect_Class_4_Exposure) as Protect_Class_4_Exposure,
sum(Protect_Class_5_Exposure) as Protect_Class_5_Exposure,
sum(Protect_Class_6_Exposure) as Protect_Class_6_Exposure,
sum(Protect_Class_7_Exposure) as Protect_Class_7_Exposure,
sum(Protect_Class_8_Exposure) as Protect_Class_8_Exposure,
sum(Protect_Class_9_Exposure) as Protect_Class_9_Exposure,
sum(Protect_Class_10_Exposure) as Protect_Class_10_Exposure,
sum(Population_Density_Zone_Metro_Exposure) as Population_Density_Zone_Metro_Exposure,
sum(Population_Density_Zone_Urban_Exposure) as Population_Density_Zone_Urban_Exposure,
sum(Population_Density_Zone_Suburban_Exposure) as Population_Density_Zone_Suburban_Exposure,
sum(Population_Density_Zone_SemiSuburban_Exposure) as Population_Density_Zone_SemiSuburban_Exposure,
sum(Population_Density_Zone_Rural_Exposure) as Population_Density_Zone_Rural_Exposure,
sum(Hail_A_Exposure) as Hail_A_Exposure,
sum(Hail_B_Exposure) as Hail_B_Exposure,
sum(Hail_C_Exposure) as Hail_C_Exposure,
sum(Hail_D_Exposure) as Hail_D_Exposure,
sum(Hail_E_Exposure) as Hail_E_Exposure,
sum(Hail_F_Exposure) as Hail_F_Exposure,
sum(Hail_G_Exposure) as Hail_G_Exposure,
sum(Hail_H_Exposure) as Hail_H_Exposure
     from Act_Detailed_Experience.dbo.BuildingRates_Property_Exposure Prop1
     group by 
     Prop1.policy_number) as Prop
on PS.policynumber = Prop.Policy_number





-------------------------------------------------------------------------------------------

/*Last run time 40 seconds*/
update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work
set
FA_Avg_TIV_per_BLD = (case 
	when isnull(FA_Number_of_Buildings,0) = 0 then 0.0
	else isnull(TIV,0) / FA_Number_of_Buildings
	end),
TIV_Range = (case
	when TIV = 0 or TIV is null then ''a: no data''
	when TIV <= 100000 then ''b: TIV < $100k''
	when TIV <= 400000 then ''c: $100k to $400k''
	when TIV <= 800000 then ''d: $400k to $800k''
	when TIV <= 2000000 then ''e: $800k to $2M''
	when TIV > 2000000 then ''f: TIV > $2M''
	else ''a: no data''
	end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS





---------------------------------------------------------------------------------

/*Last run time approx 45 seconds*/
update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work 
set
	FA_Avg_Bld_Rate = (case 
		when isnull(FA_Building_Exposure,0) * term_factor = 0 then 0.0
		else (FA_Building_Prem * 100) / (isnull(FA_Building_Exposure,0)* term_factor)
		end),
	FA_Avg_Cts_Rate = (case 
		when isnull(FA_Contents_Exposure,0) * term_factor = 0 then 0.0
		else (FA_Contents_Prem * 100) / (isnull(FA_Contents_Exposure,0)* term_factor)
		end),
	FA_Deductible_to_TIV = (case 
		when isnull(FA_Deductible,0)*isnull(FA_Avg_TIV_per_BLD,0) = 0 
		then 0.0
		else FA_Deductible / FA_Avg_TIV_per_BLD
		end)		
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS 





------------------------------------------------------------------------------

/*Last run time 40 seconds*/
update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work
set
FA_Deductible_to_TIV_Range = (case
	when FA_Deductible_to_TIV is null then ''a: no data''
	when FA_Deductible_to_TIV <= .005 then ''b: < 0.5%''
	when FA_Deductible_to_TIV <= .01 then ''c: 0.5% to 1%''
	when FA_Deductible_to_TIV <= .03 then ''d: 1% to 3%''
	when FA_Deductible_to_TIV > .03 then ''f: > 3%''
	else ''a: no data''
	end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS


------------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work 
set 
	FA_Avg_BLD_Rate_rd2 = round(FA_Avg_BLD_Rate,2),
	FA_Avg_Bld_Rate_Range = (case
		when FA_Avg_BLD_Rate is Null then ''a: No Data''
		when FA_Avg_BLD_Rate = 0 then ''a: No Data''
		when FA_Avg_BLD_Rate < 0.100 then ''b: Below 0.10''
		when FA_Avg_BLD_Rate <= .200 then ''c: 0.10 to 0.20''
		when FA_Avg_BLD_Rate <= .300 then ''d: 0.20 to 0.30''
		when FA_Avg_BLD_Rate <= 1 then ''e: 0.30 to 1.00''
		else ''f: more than 1.000''
		end),
	FA_Avg_Cts_Rate_Range = (case 
		when FA_Avg_CTS_Rate is Null then ''a: No Data''
		when FA_Avg_CTS_Rate = 0 then ''a: No Data''
		when FA_Avg_CTS_Rate < 0.100 then ''b: Below 0.10''
		when FA_Avg_CTS_Rate <= .200 then ''c: 0.10 to 0.20''
		when FA_Avg_CTS_Rate <= .300 then ''d: 0.20 to 0.30''
		when FA_Avg_CTS_Rate <= 1 then ''e: 0.30 to 1.00''
		else ''f: more than 1.000''
		end),
	FA_Avg_TIV_per_BLD_Range = (case 
		when FA_Avg_TIV_per_BLD is Null then ''a: No Data''
		when FA_Avg_TIV_per_BLD = 0 then ''a: No Data''
		when FA_Avg_TIV_per_BLD < 100000 then ''b: Below 100k''
		when FA_Avg_TIV_per_BLD <= 250000 then ''c: 100k to 250k''
		when FA_Avg_TIV_per_BLD <= 500000 then ''d: 250k to 500k''
		when FA_Avg_TIV_per_BLD <= 1000000 then ''e: 500k to 1M''
		when FA_Avg_TIV_per_BLD <= 2000000 then ''f: 1M to 2M''
		when FA_Avg_TIV_per_BLD <= 10000000 then ''g: 2M to 10M''
		else ''h: more than 10M''
		end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS 






-----------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work 
set 
	FA_Constr_code_Tot_Exposure = (isnull(constr_Code_1_Exposure,0)
		+ isnull(constr_Code_2_Exposure,0) + isnull(constr_Code_3_Exposure,0)
		+ isnull(constr_Code_4_Exposure,0) + isnull(constr_Code_5_Exposure,0)
		+ isnull(constr_Code_6_Exposure,0) + isnull(constr_Code_7_Exposure,0) 
		+ isnull(constr_Code_8_Exposure,0) + isnull(constr_Code_9_Exposure,0)
		+ isnull(constr_Code_10_Exposure,0)),
	FA_Constr_Code_Max_Exposure =  dbo.max_list ( dbo.max_list (
		constr_Code_1_Exposure, constr_Code_2_Exposure, constr_Code_3_Exposure,
		constr_Code_4_Exposure, constr_Code_5_Exposure, constr_Code_6_Exposure,
		constr_Code_7_Exposure, constr_Code_8_Exposure, constr_Code_9_Exposure),
		constr_Code_10_Exposure, 
		NULL,NULL,NULL,NULL,NULL,NULL,NULL)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS 





------------------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work 
set 
	FA_Constr_Code_Dominant = (case
		when FA_Constr_code_Tot_Exposure is null or FA_Constr_code_Tot_Exposure = 0 then null
		when constr_Code_1_Exposure = FA_Constr_Code_Max_Exposure then 1
		when constr_Code_2_Exposure = FA_Constr_Code_Max_Exposure then 2
		when constr_Code_3_Exposure = FA_Constr_Code_Max_Exposure then 3
		when constr_Code_4_Exposure = FA_Constr_Code_Max_Exposure then 4
		when constr_Code_5_Exposure = FA_Constr_Code_Max_Exposure then 5
		when constr_Code_6_Exposure = FA_Constr_Code_Max_Exposure then 6
		when constr_Code_7_Exposure = FA_Constr_Code_Max_Exposure then 7
		when constr_Code_8_Exposure = FA_Constr_Code_Max_Exposure then 8
		when constr_Code_9_Exposure = FA_Constr_Code_Max_Exposure then 9
		when constr_Code_10_Exposure = FA_Constr_Code_Max_Exposure then 10
		else null end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS 





-------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work 
set 
	FA_Constr_Code_Dominant_Percent = (case
		when FA_Constr_Code_Dominant is null then null
		when FA_Constr_Code_Dominant = 1 then constr_Code_1_Exposure / FA_Constr_code_Tot_Exposure
		when FA_Constr_Code_Dominant = 2 then constr_Code_2_Exposure / FA_Constr_code_Tot_Exposure
		when FA_Constr_Code_Dominant = 3 then constr_Code_3_Exposure / FA_Constr_code_Tot_Exposure
		when FA_Constr_Code_Dominant = 4 then constr_Code_4_Exposure / FA_Constr_code_Tot_Exposure
		when FA_Constr_Code_Dominant = 5 then constr_Code_5_Exposure / FA_Constr_code_Tot_Exposure
		when FA_Constr_Code_Dominant = 6 then constr_Code_6_Exposure / FA_Constr_code_Tot_Exposure
		when FA_Constr_Code_Dominant = 7 then constr_Code_7_Exposure / FA_Constr_code_Tot_Exposure
		when FA_Constr_Code_Dominant = 8 then constr_Code_8_Exposure / FA_Constr_code_Tot_Exposure
		when FA_Constr_Code_Dominant = 9 then constr_Code_9_Exposure / FA_Constr_code_Tot_Exposure
		when FA_Constr_Code_Dominant = 10 then constr_Code_10_Exposure / FA_Constr_code_Tot_Exposure
		else null end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS 



-------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work
set
	FA_Constr_Code_Dominant_NAME = (case
		when Property_Coverage_Form = ''ISO'' then
			(case
				when FA_Constr_Code_Dominant = 1 then ''Frame''
				when FA_Constr_Code_Dominant = 2 then ''Joisted Masonry''
				when FA_Constr_Code_Dominant = 3 then ''Heavy Timber Joisted Masonry''
				when FA_Constr_Code_Dominant = 4 then ''Non-Combustible''
				when FA_Constr_Code_Dominant = 5 then ''Superior Non-Combustible''
				when FA_Constr_Code_Dominant = 6 then ''Masonry Non-Combustible''
				when FA_Constr_Code_Dominant = 7 then ''Superior Masonry Non-Combustible''
				when FA_Constr_Code_Dominant = 8 then ''Modified Fire Resistive''
				when FA_Constr_Code_Dominant = 9 then ''Fire Resistive''
				when FA_Constr_Code_Dominant = 10 then ''Not Applicable''
				else null end)
		when Property_Coverage_Form = ''UC'' then
			(case
				when FA_Constr_Code_Dominant = 1 then ''Frame''
				when FA_Constr_Code_Dominant = 2 then ''Joisted Masonry''
				when FA_Constr_Code_Dominant = 3 then ''Non-Combustible''
				when FA_Constr_Code_Dominant = 4 then ''Masonry Non-Combustible''
				when FA_Constr_Code_Dominant = 5 then ''Modified Fire Resistive''
				when FA_Constr_Code_Dominant = 6 then ''Fire Resistive''
				else null end)
		else null end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work



---------------------------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work 
set 
	FA_protect_class_Tot_Exposure = (isnull(protect_class_1_Exposure,0)
		+ isnull(protect_class_2_Exposure,0) + isnull(protect_class_3_Exposure,0)
		+ isnull(protect_class_4_Exposure,0) + isnull(protect_class_5_Exposure,0)
		+ isnull(protect_class_6_Exposure,0) + isnull(protect_class_7_Exposure,0) 
		+ isnull(protect_class_8_Exposure,0) + isnull(protect_class_9_Exposure,0)
		+ isnull(protect_class_10_Exposure,0)),
	FA_protect_class_Max_Exposure =  dbo.max_list ( dbo.max_list (
		protect_class_1_Exposure, protect_class_2_Exposure, protect_class_3_Exposure,
		protect_class_4_Exposure, protect_class_5_Exposure, protect_class_6_Exposure,
		protect_class_7_Exposure, protect_class_8_Exposure, protect_class_9_Exposure),
		protect_class_10_Exposure, 
		NULL,NULL,NULL,NULL,NULL,NULL,NULL)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS 





------------------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work 
set 
	FA_protect_class_Dominant = (case
		when FA_protect_class_Tot_Exposure is null or FA_protect_class_Tot_Exposure = 0 then null
		when protect_class_1_Exposure = FA_protect_class_Max_Exposure then 1
		when protect_class_2_Exposure = FA_protect_class_Max_Exposure then 2
		when protect_class_3_Exposure = FA_protect_class_Max_Exposure then 3
		when protect_class_4_Exposure = FA_protect_class_Max_Exposure then 4
		when protect_class_5_Exposure = FA_protect_class_Max_Exposure then 5
		when protect_class_6_Exposure = FA_protect_class_Max_Exposure then 6
		when protect_class_7_Exposure = FA_protect_class_Max_Exposure then 7
		when protect_class_8_Exposure = FA_protect_class_Max_Exposure then 8
		when protect_class_9_Exposure = FA_protect_class_Max_Exposure then 9
		when protect_class_10_Exposure = FA_protect_class_Max_Exposure then 10
		else null end) 
		from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS


update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work 
set 		
	FA_protect_class_Dominant_Percent = (case
		when FA_protect_class_Dominant is null then null
		when FA_protect_class_Dominant = 1 then protect_class_1_Exposure / FA_protect_class_Tot_Exposure
		when FA_protect_class_Dominant = 2 then protect_class_2_Exposure / FA_protect_class_Tot_Exposure
		when FA_protect_class_Dominant = 3 then protect_class_3_Exposure / FA_protect_class_Tot_Exposure
		when FA_protect_class_Dominant = 4 then protect_class_4_Exposure / FA_protect_class_Tot_Exposure
		when FA_protect_class_Dominant = 5 then protect_class_5_Exposure / FA_protect_class_Tot_Exposure
		when FA_protect_class_Dominant = 6 then protect_class_6_Exposure / FA_protect_class_Tot_Exposure
		when FA_protect_class_Dominant = 7 then protect_class_7_Exposure / FA_protect_class_Tot_Exposure
		when FA_protect_class_Dominant = 8 then protect_class_8_Exposure / FA_protect_class_Tot_Exposure
		when FA_protect_class_Dominant = 9 then protect_class_9_Exposure / FA_protect_class_Tot_Exposure
		when FA_protect_class_Dominant = 10 then protect_class_10_Exposure / FA_protect_class_Tot_Exposure
		else null end)
		from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work PS




---------------------------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  
set 
	ZIP_Pop_Density_Tot_Exposure = (isnull(Population_Density_Zone_Metro_Exposure,0)
		+ isnull(Population_Density_Zone_Urban_Exposure,0) + isnull(Population_Density_Zone_Suburban_Exposure,0)
		+ isnull(Population_Density_Zone_SemiSuburban_Exposure,0) + isnull(Population_Density_Zone_Rural_Exposure,0)),
	ZIP_Pop_Density_Max_Exposure =  dbo.max_list ( 
		Population_Density_Zone_Metro_Exposure, Population_Density_Zone_Urban_Exposure, Population_Density_Zone_Suburban_Exposure,
		Population_Density_Zone_SemiSuburban_Exposure, Population_Density_Zone_Rural_Exposure, 
		NULL,NULL,NULL,NULL)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  PS 





------------------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  
set 
	ZIP_Pop_Density_Dominant = (case
		when ZIP_Pop_Density_Max_Exposure is null or ZIP_Pop_Density_Max_Exposure = 0 then null
		when Population_Density_Zone_Metro_Exposure = ZIP_Pop_Density_Max_Exposure then ''Metro''
		when Population_Density_Zone_Urban_Exposure = ZIP_Pop_Density_Max_Exposure then ''Urban''
		when Population_Density_Zone_Suburban_Exposure = ZIP_Pop_Density_Max_Exposure then ''Suburban''
		when Population_Density_Zone_SemiSuburban_Exposure = ZIP_Pop_Density_Max_Exposure then ''SemiSuburban''
		when Population_Density_Zone_Rural_Exposure = ZIP_Pop_Density_Max_Exposure then ''Rural''
		else null end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  PS

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  
set 
	ZIP_Pop_Density_Dominant_Percent = (case
		when ZIP_Pop_Density_Dominant is null or isnull(FA_protect_class_Tot_Exposure,0) = 0 then null
		when ZIP_Pop_Density_Dominant = ''Metro'' then Population_Density_Zone_Metro_Exposure / FA_protect_class_Tot_Exposure
		when ZIP_Pop_Density_Dominant = ''Urban'' then Population_Density_Zone_Urban_Exposure / FA_protect_class_Tot_Exposure
		when ZIP_Pop_Density_Dominant = ''Suburban'' then Population_Density_Zone_Suburban_Exposure / FA_protect_class_Tot_Exposure
		when ZIP_Pop_Density_Dominant = ''SemiSuburban'' then Population_Density_Zone_SemiSuburban_Exposure / FA_protect_class_Tot_Exposure
		when ZIP_Pop_Density_Dominant = ''Rural'' then Population_Density_Zone_Rural_Exposure / FA_protect_class_Tot_Exposure
		else null end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  PS


-------------------------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  
set 
	FA_Hail_Tot_Exposure = (isnull(Hail_A_Exposure,0)
		+ isnull(Hail_B_Exposure,0) + isnull(Hail_C_Exposure,0)
		+ isnull(Hail_D_Exposure,0) + isnull(Hail_E_Exposure,0)
		+ isnull(Hail_F_Exposure,0) + isnull(Hail_G_Exposure,0) 
		+ isnull(Hail_H_Exposure,0)),
	FA_Hail_Max_Exposure =  dbo.max_list (
		Hail_A_Exposure, Hail_B_Exposure, Hail_C_Exposure,
		Hail_D_Exposure, Hail_E_Exposure, Hail_F_Exposure,
		Hail_G_Exposure, Hail_H_Exposure, 
		NULL)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  PS 



------------------------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  
set 
	FA_Hail_Dominant = (case
		when FA_Hail_Tot_Exposure is null or FA_Hail_Tot_Exposure = 0 then null
		when Hail_A_Exposure = FA_Hail_Max_Exposure then ''A: 5.0 + per year''
		when Hail_B_Exposure = FA_Hail_Max_Exposure then ''B: [2.75, 5.0) per year''
		when Hail_C_Exposure = FA_Hail_Max_Exposure then ''C: [2.0, 2.75) per year''
		when Hail_D_Exposure = FA_Hail_Max_Exposure then ''D: [1.5, 2.0) per year''
		when Hail_E_Exposure = FA_Hail_Max_Exposure then ''E: [1.0, 1.5) per year''
		when Hail_F_Exposure = FA_Hail_Max_Exposure then ''F: [0.5, 1.0) per year''
		when Hail_G_Exposure = FA_Hail_Max_Exposure then ''G: [0.1, 0.5) per year''
		when Hail_H_Exposure = FA_Hail_Max_Exposure then ''H: < 0.1 per year''
		else null end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  PS


update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  
set 
	FA_Hail_Dominant_Percent = (case
		when FA_Hail_Dominant is null or isnull(FA_Hail_Tot_Exposure,0) = 0 then null
		when FA_Hail_Dominant = ''A: 5.0 + per year'' then Hail_A_Exposure / FA_Hail_Tot_Exposure
		when FA_Hail_Dominant = ''B: [2.75, 5.0) per year'' then Hail_B_Exposure / FA_Hail_Tot_Exposure
		when FA_Hail_Dominant = ''C: [2.0, 2.75) per year'' then Hail_C_Exposure / FA_Hail_Tot_Exposure
		when FA_Hail_Dominant = ''D: [1.5, 2.0) per year'' then Hail_D_Exposure / FA_Hail_Tot_Exposure
		when FA_Hail_Dominant = ''E: [1.0, 1.5) per year'' then Hail_E_Exposure / FA_Hail_Tot_Exposure
		when FA_Hail_Dominant = ''F: [0.5, 1.0) per year'' then Hail_F_Exposure / FA_Hail_Tot_Exposure
		when FA_Hail_Dominant = ''G: [0.1, 0.5) per year'' then Hail_G_Exposure / FA_Hail_Tot_Exposure
		when FA_Hail_Dominant = ''H: < 0.1 per year'' then Hail_H_Exposure / FA_Hail_Tot_Exposure
		else null end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work  PS

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)




' 
END
GO
