IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_21_Coverage_FA_2_Premium_15_Months]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_21_Coverage_FA_2_Premium_15_Months]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_21_Coverage_FA_2_Premium_15_Months]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[usp_Step_21_Coverage_FA_2_Premium_15_Months]
as 

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters);

/* Step 1 */

with #FireAllied_Info(
	policynumber,
	FA_Number_of_Buildings,
	FA_Number_of_Locations,
	TIV,
	Term_Factor
) as (
select 
	policynumber,
	FA_Number_of_Buildings = max(FA_Number_of_Buildings),
	FA_Number_of_Locations = max(FA_Number_of_Locations),
	TIV = max(TIV),
	Term_Factor = max(Term_Factor)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_FireAllied_work POL
group by policynumber
)
update act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work
set 
FA_Number_of_Buildings = POL.FA_Number_of_Buildings,
FA_Number_of_Locations = POL.FA_Number_of_Locations,
TIV = POL.TIV,
Term_Factor = POL.Term_Factor
from act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work PS
left join #FireAllied_Info POL
on POL.policynumber = PS.policynumber;

-------------------------------------------------------------------------------------


WITH earned(policynumber,Written_Premium_Policy_FireAllied) AS (
	SELECT 
		policynumber,
		sum(B.currentwrittenpremium) as Written_Premium_Policy_FireAllied 
	from act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work B 
	with (nolock)
	WHERE coverage_group = ''Fire & Allied''
	GROUP BY
	policynumber
)
UPDATE act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work
SET 
Written_Premium_Policy_FireAllied = earned.Written_Premium_Policy_FireAllied
FROM act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work ps 
with (nolock)
INNER JOIN earned
ON ps.policynumber = earned.policynumber
where coverage_group = ''Fire & Allied'';


-------------------------------------------------------------------------------------



update act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
set 
Earned_Buildings = (case 
		when PS.currentearnedpremium is not null and PS.currentearnedpremium > 0 
			and Written_Premium_Policy_FireAllied > 0
		then (convert(numeric,FA_Number_of_Buildings) * convert(numeric,Term_factor)) 
			* convert(numeric,currentearnedpremium) / Written_Premium_Policy_FireAllied
		else NULL 
		end),
Earned_Locations = (case 
		when PS.currentearnedpremium is not null and PS.currentearnedpremium > 0 
			and Written_Premium_Policy_FireAllied > 0
		then (convert(numeric,FA_Number_of_Locations) * convert(numeric,Term_Factor) 
			* convert(numeric,currentearnedpremium) / Written_Premium_Policy_FireAllied)
		else NULL 
		end),
Earned_TIV = (case 
		when PS.currentearnedpremium is not null and PS.currentearnedpremium > 0 
			and Written_Premium_Policy_FireAllied > 0
		then round(convert(numeric,TIV) * convert(numeric,Term_Factor) 
--			* convert(numeric, currentearnedpremium)  
			* convert(numeric,currentearnedpremium) / written_Premium_Policy_FireAllied,2)
		else NULL 
		end)
from act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work PS 
where coverage_group = ''Fire & Allied'';


-------------------------------------------------------------------------------------

WITH earned(Policynumber,Earned_Buildings,Earned_Locations,Earned_TIV)
AS (
	SELECT 
		Policynumber,
		sum(A.Earned_Buildings) as Earned_Buildings,
		sum(A.Earned_Locations) as Earned_Locations,
		sum(A.Earned_TIV) as Earned_TIV
	from act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work A 
		where A.coverage_reporting_group = ''Fire & Allied''
	GROUP BY
		Policynumber
)
UPDATE act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
SET
	Earned_Buildings_Total = a.Earned_Buildings,
	Earned_Locations_Total =  a.Earned_Locations,
	Earned_TIV_Total = a.Earned_TIV
FROM act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work PS
inner join earned a
on A.Policynumber = PS.policynumber
where coverage_group = ''Fire & Allied''


-------------------------------------------------------------------------------------
/* Realign TIV */
update act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
set 
Earned_Buildings = (case
	when PS.Earned_Buildings is not null and PS.Earned_Buildings > 0.0
	then (case 
		when Earned_Buildings_Total > (FA_Number_of_Buildings * Term_Factor)
		then (FA_Number_of_Buildings * Term_Factor 
			* PS.Earned_Buildings / Earned_Buildings_Total)
		else PS.Earned_Buildings
		end)
	else PS.Earned_Buildings
	end),
Earned_Locations = (case
	when Earned_Locations is not null and Earned_Locations > 0.0
	then (case 
		when Earned_Locations_Total > (FA_Number_of_Locations * Term_Factor)
		then (FA_Number_of_Locations * Term_Factor 
			* PS.Earned_Locations / Earned_Locations_Total)
		else PS.Earned_Locations
		end)
	else PS.Earned_Locations
	end),
Earned_TIV = (case
	when PS.Earned_TIV is not null and PS.Earned_TIV > 0.0
	then (case 
		when Earned_TIV_Total > (TIV * Term_Factor)
		then (TIV * Term_Factor * PS.Earned_TIV / Earned_TIV_Total)
		else PS.Earned_TIV
		end)
	else PS.Earned_TIV
	end)
from act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work PS
where coverage_group = ''Fire & Allied''


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)



' 
END
GO
