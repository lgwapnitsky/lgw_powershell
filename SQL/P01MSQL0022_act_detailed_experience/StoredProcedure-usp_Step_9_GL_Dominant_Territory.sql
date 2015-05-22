IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_9_GL_Dominant_Territory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_9_GL_Dominant_Territory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_9_GL_Dominant_Territory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'








CREATE PROCEDURE [dbo].[usp_Step_9_GL_Dominant_Territory] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

/* Determine dominant territory for a policy and state */

/* This was originally Step 12; moved to step 9 because it has to run before step 10a. -- David Hayes, 4/26/10 */

/* Step 1 */
/* Build table with premiums by policy, state, territory */
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[GL_Dominant_Territory_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.GL_Dominant_Territory_work

CREATE TABLE Act_Detailed_Experience.dbo.GL_Dominant_Territory_work (
	[policynumber] [varchar](15) NOT NULL,
	[statecode] [varchar](2) NOT NULL,
	[sublinecode] [int] NOT NULL,
	[territory] [varchar](3) NOT NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[GL_Territory_Max_Premium] [decimal](10, 2) NULL,
	[GL_Territory_Dominant] [varchar](3) NULL,
	[GL_Territory_Dominant_percent] [float] NULL,
	[GL_Dom_Terr_Description] [varchar](200) NULL,
	[GL_Dom_Region_in_State] [varchar](50) NULL
)

insert into Act_Detailed_Experience.dbo.GL_Dominant_Territory_work
(policynumber,
statecode,
sublinecode,
territory,
currentwrittenpremium)
select
policynumber,
statecode,
sublinecode,
territory,
sum(currentwrittenpremium) as currentwrittenpremium
from accessphlyeom.dbo.premiumsummary PS
where sublinecode = 334
	and acctngyear >= 2004
	and territory <> ''999'' 
	and territory is not null
	and isnumeric(territory)=1
	and classcode not in (
''44444'',
''68707'', -- WAREHOUSES PRIVATE NOT-FOR-PROFIT ONLY
''49452'', -- VACANT LAND NOT-FOR-PROFIT ONLY
''49451'', -- VACANT LAND OTHER THAN NOT-FOR-PROFIT
''68607'', --	VACANT BUILDINGS - NOT FACTORIES NOT-FOR-PROFIT ONLY
''68606'', --	VACANT BUILDINGS - NOT FACTORIES OTHER THAN NOT-FOR-PROFIT
''68604'', --	VACANT BUILDINGS - FACTORIES
''99938'' --	WAREHOUSES
)
/*
classcode in
''11039'',
''16881'',
''18438'',
''40075'',
''41422'',
''41650'',
''41668'',
''41670'',
''41678'',
''41715'',
''41716'',
''44277'',
''44428'',
''44434'',
''44438'',
''44440'',
''45450'',
''46427'',
''46622'',
''46700'',
''47367'',
''47469'',
''47471'',
''47474'',
''47476'',
''47478'',
''48441'',
''48558'',
''48600'',
''48925'',
''49185'',
''49870'',
''60010'',
''61000'',
''61216'',
''61218'',
''61225'',
''61226'',
''61227'',
''63010'',
''63011'',
''67017'',
''67511'',
''67513'',
''68707'',
''91340'',
''91341'',
''91342'',
''96816'',
''97047'')
*/
group by
	policynumber,
	statecode,
	sublinecode,
	territory




--------------------------------------------------------------------------
/* Step 2 */
/* Determine largest non-zero premium */

update Act_Detailed_Experience.dbo.GL_Dominant_Territory_work
set
GL_Territory_Max_Premium = (
	select max(DT2.currentwrittenpremium)
	from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT2
	where DT.policynumber = DT2.policynumber
		and DT.Statecode = DT2.statecode
		and DT2.territory <> ''999''
		and DT2.territory is not null)
from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT

--Make non-zero
update Act_Detailed_Experience.dbo.GL_Dominant_Territory_work
set
GL_Territory_Max_Premium = (case
	when GL_Territory_Max_Premium < 0 then 0 else GL_Territory_Max_Premium end)
from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT


--------------------------------------------------------------------------
/* Step 3 */
/* Determine Dominant Territory */

update Act_Detailed_Experience.dbo.GL_Dominant_Territory_work
set
GL_Territory_Dominant = (
	select distinct top 1 DT2.Territory
	from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT2
	where DT.policynumber = DT2.policynumber
		and DT.Statecode = DT2.statecode
		and DT2.territory <> ''999''
		and DT2.territory is not null
		and DT2.currentwrittenpremium = DT2.GL_Territory_Max_Premium)
from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT


--------------------------------------------------------------------------
/* Step 4 */
/* Calculate percent of permium in Dominant Territory */


update Act_Detailed_Experience.dbo.GL_Dominant_Territory_work
set
GL_Territory_Dominant_percent = (
	(select sum(currentwrittenpremium)
	from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT2
	where DT.policynumber = DT2.policynumber
		and DT.Statecode = DT2.statecode
		and DT2.territory = DT2.GL_Territory_Dominant)
	/ 
	isnull((select sum(DT2.currentwrittenpremium)+.01
	from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT2
	where DT.policynumber = DT2.policynumber
		and DT.Statecode = DT2.statecode
		and DT2.territory <> ''999''
		and DT2.territory is not null
		and DT2.currentwrittenpremium >= 0.0),.01))
from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT




--------------------------------------------------------------------------
/* Step 5 */
/* Assign descriptions */

update Act_Detailed_Experience.dbo.GL_Dominant_Territory_work
set
GL_Dom_Terr_description = (
	select def.state + ''_'' + Def.Terr_Description
	from Act_Definitions.dbo.GL_Terr_Def Def
	where DT.Statecode = Def.state
		and Def.Territory_Int = (DT.GL_Territory_Dominant*1)),
GL_Dom_Region_in_State = (
	select def.state + ''_'' + Def.Region_in_State
	from Act_Definitions.dbo.GL_Terr_Def Def
	where DT.Statecode = Def.state
		and Def.Territory_Int = (DT.GL_Territory_Dominant*1))
from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT



--------------------------------------------------------------------------
/* Step 6 */
/* Add data to Premiumsummary table */

update Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work
set 
GL_Territory_Dominant = (
	select distinct DT.GL_Territory_Dominant
	from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT
	where PS.policynumber = DT.Policynumber
		and PS.statecode = DT.Statecode),
GL_Territory_Dominant_percent = (
	select distinct DT.GL_Territory_Dominant_percent
	from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT
	where PS.policynumber = DT.Policynumber
		and PS.statecode = DT.Statecode),
GL_Dom_Terr_description = (
	select distinct DT.GL_Dom_Terr_description
	from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT
	where PS.policynumber = DT.Policynumber
		and PS.statecode = DT.Statecode),
GL_Dom_Region_in_State = (
	select distinct DT.GL_Dom_Region_in_State
	from Act_Detailed_Experience.dbo.GL_Dominant_Territory_work DT
	where PS.policynumber = DT.Policynumber
		and PS.statecode = DT.Statecode)
from Act_Detailed_Experience.dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_work PS


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)


' 
END
GO
