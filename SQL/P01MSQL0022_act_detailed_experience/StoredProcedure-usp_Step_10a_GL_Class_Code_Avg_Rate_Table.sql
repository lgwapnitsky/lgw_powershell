IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_10a_GL_Class_Code_Avg_Rate_Table]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_10a_GL_Class_Code_Avg_Rate_Table]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_10a_GL_Class_Code_Avg_Rate_Table]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'










CREATE Procedure [dbo].[usp_Step_10a_GL_Class_Code_Avg_Rate_Table] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[GL_Class_Code_Avg_Rate_ALL_POLICIES_work]'') AND type in (N''U''))
DROP TABLE Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work;

Create table dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work(
	[Policy_Number] [varchar](15) NULL,
	[Effective_Date] [datetime] NULL,
	[Expiration_Date] [datetime] NULL,
	[State] [char](2) NULL,
	[Territory] [int] NULL,
	[Class_Code] [varchar](5) NULL,
	[Premium] [float] NULL,
	[Exposure] [float] NULL,
	[Exposure_Adj_Fac] [varchar](23) NULL,
	[Exposure_Adj_Type] [varchar](13) NULL,
	[Exposure_Base] [varchar](13) NULL,
	GL_Territory_Dominant [varchar](3),
	GL_Dom_Terr_Description [varchar](175),
	GL_Dom_Region_in_State [varchar](30),
	Product [varchar](2),
	Class_Description [varchar](175),
	Avg_Rate [float],
	Avg_Rate_Range [varchar](50))

insert into dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work
(	Policy_Number,
	Effective_Date,
	Expiration_Date,
	State,
	Territory,
	Class_Code,
	Premium,
	Exposure,
	Exposure_Adj_Fac,
	Exposure_Adj_Type,
	Exposure_Base)
SELECT
	PolicyNumber,
	isnull(InsurableEffectiveDate, PolicyEffectiveDate)  as Effective_Date,
	isnull(InsurableExpirationDate, PolicyExpirationDate) as Expiration_Date,
	PremiumState,
	Territory,
	ClassCode,
	sum(Premium) as Premium,
	sum(EXPOSURE) as Exposure,
	ExposureAdjustmentFactor,
	ExposureAdjustmentType,
	ExposureBase
FROM PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA AQS
WHERE Subline = 334
	and year(PolicyExpirationDate) > 2004
	and SnapShotType=''E''
GROUP BY
	PolicyNumber,
	isnull(InsurableEffectiveDate, PolicyEffectiveDate),
	isnull(InsurableExpirationDate, PolicyExpirationDate),
	PremiumState,
	Territory,
	ClassCode,
	ExposureAdjustmentFactor,
	ExposureAdjustmentType,
	ExposureBase


UPDATE Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work
SET
	GL_Territory_Dominant = GLDT.GL_Territory_Dominant,
	GL_Dom_Terr_Description = GLDT.GL_Dom_Terr_Description,
	GL_Dom_Region_in_State = GLDT.GL_Dom_Region_in_State
FROM Act_Detailed_Experience.dbo.GL_Dominant_Territory_work GLDT
WHERE Policy_Number = policynumber
	and State = statecode


UPDATE Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work
SET
	GL_Territory_Dominant = Territory
FROM Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work
WHERE GL_Territory_Dominant is null
/*and Class_Code in
(''44444'',
''68707'', -- WAREHOUSES PRIVATE NOT-FOR-PROFIT ONLY
''49452'', -- VACANT LAND NOT-FOR-PROFIT ONLY
''49451'', -- VACANT LAND OTHER THAN NOT-FOR-PROFIT
''68607'', --	VACANT BUILDINGS - NOT FACTORIES NOT-FOR-PROFIT ONLY
''68606'', --	VACANT BUILDINGS - NOT FACTORIES OTHER THAN NOT-FOR-PROFIT
''68604'', --	VACANT BUILDINGS - FACTORIES
''99938'')
*/


UPDATE Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work
SET
GL_Dom_Terr_description = (
	select def.state + ''_'' + Def.Terr_Description
	from Act_Definitions.dbo.GL_Terr_Def Def
	where DT.State = Def.state
		and Def.Territory_Int = (DT.GL_Territory_Dominant*1)),
GL_Dom_Region_in_State = (
	select def.state + ''_'' + Def.Region_in_State
	from Act_Definitions.dbo.GL_Terr_Def Def
	where DT.State = Def.state
		and Def.Territory_Int = (DT.GL_Territory_Dominant*1))
FROM Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work DT
WHERE GL_Dom_Terr_description is null
and GL_Dom_Region_in_State is null
/*and Class_Code in
(''44444'',
''68707'', -- WAREHOUSES PRIVATE NOT-FOR-PROFIT ONLY
''49452'', -- VACANT LAND NOT-FOR-PROFIT ONLY
''49451'', -- VACANT LAND OTHER THAN NOT-FOR-PROFIT
''68607'', --	VACANT BUILDINGS - NOT FACTORIES NOT-FOR-PROFIT ONLY
''68606'', --	VACANT BUILDINGS - NOT FACTORIES OTHER THAN NOT-FOR-PROFIT
''68604'', --	VACANT BUILDINGS - FACTORIES
''99938'')
*/
UPDATE Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work
SET
	Product = Productcode
FROM accessphlyeom.dbo.policy
WHERE Policy_Number = policynumber

UPDATE Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work
SET
	Class_Description = Description
FROM Act_Definitions.dbo.GL_Class_Codes CC
WHERE Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work.Class_Code = CC.Class_Code

UPDATE Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work
SET
Avg_Rate = CASE
	WHEN Exposure = 0 THEN -1
	ELSE Premium / Exposure * Exposure_Adj_Fac END

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)





' 
END
GO
