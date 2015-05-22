IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_20_Producer_Info_Premium_15_Months]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_20_Producer_Info_Premium_15_Months]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_20_Producer_Info_Premium_15_Months]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[usp_Step_20_Producer_Info_Premium_15_Months] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters);

/* Step 1 */

WITH a(policynumber,Commission_pct) AS (
	SELECT 
		policynumber,
		MAX(Commission_pct) as Commission_pct 
	from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work POL 
	with (nolock)
	WHERE Commission_pct is not null
	GROUP BY
	policynumber
)
UPDATE act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work
SET 
Commission_pct = a.Commission_pct
FROM act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work ps 
with (nolock)
INNER JOIN a
ON ps.policynumber = a.policynumber


--------------------------------------------------------------------------------------
/* Step 2 */


UPDATE act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work
SET 
Commission_dollars = Commission_pct * currentwrittenpremium,
Commission_Premiums = (Case 
	when Commission_pct is not null 
	then currentwrittenpremium 
	else 0.0 
	end)
FROM act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work ps 

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)



' 
END
GO
