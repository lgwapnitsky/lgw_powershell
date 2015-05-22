IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_GL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_8_Coverage_GL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_GL]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'













CREATE procedure [dbo].[usp_Step_8_Coverage_GL] as 

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_ALL_POLICIES_GL_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work

CREATE TABLE dbo.Policy_Information_ALL_POLICIES_GL_work (
	[policynumber] [varchar](15) NULL,
	[policyid] [int] NULL,
	[GL_Occurrence_Limit] [float] NULL,
	[GL_Aggregate_Limit] [float] NULL,
	[GL_Deductible] [varchar](12) NULL,
	[GLDX_Indicator] [varchar](10) NULL,
	[SAM_Exclusion_from_CG_21_46] [varchar](50) NULL,
	[SAM_Form_PI_SS_2] [varchar](50) NULL,
	[SAM_Form_PI_SO_008] [varchar](50) NULL,
	[SAM_Form_PI_SO_007] [varchar](50) NULL,
	[SAM_Form_PI_HF_11] [varchar](50) NULL,
	[SAM_Form_PI_CAM_003] [varchar](50) NULL,
	[SAM_PI_SS_2_OCC_Limit] [varchar](50) NULL,
	[SAM_PI_SS_2_Agg_Limit] [varchar](50) NULL,
	[SAM_PI_SO_008_OCC_Limit] [varchar](50) NULL,
	[SAM_PI_SO_008_Agg_Limit] [varchar](50) NULL,
	[SAM_PI_SO_007_OCC_Limit] [varchar](50) NULL,
	[SAM_PI_SO_007_Agg_Limit] [varchar](50) NULL,
	[SAM_PI_HF_11_OCC_Limit] [varchar](50) NULL,
	[SAM_PI_HF_11_Agg_Limit] [varchar](50) NULL,
	[SAM_PI_CAM_003_OCC_Limit] [varchar](50) NULL,
	[SAM_PI_CAM_003_Agg_Limit] [varchar](50) NULL,
	[SAM_Form] [varchar](50) NULL,
	[SAM_OCC_Limit] [varchar](50) NULL,
	[SAM_Agg_Limit] [varchar](50) NULL,
	[SAM_Form_Group] [varchar](50) NULL
)


insert into Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work
(policynumber, policyid)
Select policynumber, policyid
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
group by policynumber, policyid

select policynumber, MAX(OccuranceLimit) Occurance_Limit, max(AggregateLimit) Aggregate_Limit, max(Deductible) Deduct_INDV
into #temp_AQS
from PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA AQS
where subline = 334
and SnapShotType=''E''
group by policynumber

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work
set 
GL_Occurrence_Limit = aqs.Occurance_Limit,
GL_Aggregate_Limit = aqs.Aggregate_Limit,
GL_Deductible = aqs.Deduct_INDV
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work PS
join #temp_AQS aqs on PS.policynumber=aqs.policynumber

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work
set 
GLDX_Indicator = (case 
	when exists (
		select 1
		from accessphlyeom.dbo.premiumsummary prem
		where ps.policynumber = prem.policynumber
			and prem.coveragecode like ''%GLDX%'') 
	then ''Y'' 
	else ''N'' 
	end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work PS

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)




' 
END
GO
