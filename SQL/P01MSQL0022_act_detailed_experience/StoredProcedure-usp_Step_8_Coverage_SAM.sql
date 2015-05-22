IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_SAM]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_8_Coverage_SAM]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_8_Coverage_SAM]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'






CREATE procedure [dbo].[usp_Step_8_Coverage_SAM] as 

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

/* Step 1 */

/* changed PICPFN01.aqs to PICPFN01.aqs. */

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work 
set 
SAM_Exclusion_from_CG_21_46 = ISNULL( 
		-- V3 
		(select Form = (
			select distinct bd.bdtnumber
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
			where l.dat_bdtid = bd.bdtid)
		from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  DISTINCT BD2.bdtid
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''%CG%21%46%'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and forms.LFRMNUM LIKE ''CG%21%46%'')
	)),
SAM_Form_PI_SS_2 = ISNULL( 
		-- V3 
		(select top 1 Form = (
			select distinct bd.bdtnumber
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
			where l.dat_bdtid = bd.bdtid)
		from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  DISTINCT BD2.bdtid
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-SS-2 %'' or BD2.bdtNumber LIKE ''PI-SS-2'')
		),
		-- V2 
		((select top 1 forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and forms.LFRMNUM LIKE ''PISS2%''
		       and forms.LFRMDES LIKE ''ABUSE%''
	))),
SAM_Form_PI_SO_008 = ISNULL( 
		-- V3 
		(select top 1 Form = (
			select distinct bd.bdtnumber
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
			where l.dat_bdtid = bd.bdtid)
		from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  DISTINCT BD2.bdtid
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-SO-008%'' and BD2.bdtNumber <> ''PI-SO-008D'')
		),
		-- V2 
		((select top 1 forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and forms.LFRMNUM LIKE ''PISO008%''
		       and forms.LFRMNUM <> ''PISO008D''
	))),
SAM_Form_PI_SO_007 = ISNULL( 
		-- V3 
		(select top 1 Form = (
			select distinct bd.bdtnumber
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
			where l.dat_bdtid = bd.bdtid)
		from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  DISTINCT BD2.bdtid
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-SO-007%'' and BD2.bdtNumber <> ''PI-SO-007D'')
		),
		-- V2 
		((select top 1 forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and forms.LFRMNUM LIKE ''PISO007%''
		       and forms.LFRMNUM <> ''PISO007D''
	))),
SAM_Form_PI_HF_11 = ISNULL( 
		-- V3 
		(select top 1 Form = (
			select distinct bd.bdtnumber
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
			where l.dat_bdtid = bd.bdtid)
		from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  DISTINCT BD2.bdtid
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-HF-11%'' and BD2.bdtNumber <> ''PI-HF-11D'')
		),
		-- V2 
		((select top 1 forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and forms.LFRMNUM LIKE ''PIHF11%''
		       and forms.LFRMNUM <> ''PIHF11D''
	))),
SAM_Form_PI_CAM_003 = ISNULL( 
		-- V3 
		(select top 1 Form = (
			select distinct bd.bdtnumber
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
			where l.dat_bdtid = bd.bdtid)
		from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  DISTINCT BD2.bdtid
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-CAM-003%'' and BD2.bdtNumber <> ''PI-CAM-003D'')
		),
		-- V2 
		((select top 1 forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and forms.LFRMNUM LIKE ''PICAM003%''
		       and forms.LFRMNUM <> ''PICAM003D''
	)))
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work PS




-------------------------------------------------------------------------------
/* Step 2 */

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work 
set 
	SAM_PI_SS_2_OCC_Limit = (case 
		when SAM_Form_PI_SS_2 is not null
		then isnull((
			select max(AQS.lsubdes1)
			from PI_AQS_POLICY_PROD.dbo.SPCCOVMFL AQS
			where AQS.policyid = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde in(''ABU'',''SS2'',''SAM'')),
			(
			select max(AQS.lsubdes1)
			from PICPFN01.aqs.MSSNM1SPCCOV AQS
			where AQS.kstokey = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde in(''ABU'',''SS2'',''SAM'')))
		else NULL
		end),
	SAM_PI_SS_2_Agg_Limit = (case 
		when SAM_Form_PI_SS_2 is not null
		then isnull((
			select max(AQS.lsubdes2)
			from PI_AQS_POLICY_PROD.dbo.SPCCOVMFL AQS
			where AQS.policyid = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde in(''ABU'',''SS2'',''SAM'')),
			(
			select max(AQS.lsubdes2)
			from PICPFN01.aqs.MSSNM1SPCCOV AQS
			where AQS.kstokey = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde in(''ABU'',''SS2'',''SAM'')))
		else NULL
		end),
	SAM_PI_SO_008_OCC_Limit = (case 
		when SAM_Form_PI_SO_008 is not null
		then isnull((
			select distinct AQS.LMSCDES2
			from PI_AQS_POLICY_PROD.dbo.BOPCOVMFL AQS
			where AQS.policyid = PS.policyid
				and nexpnum = 0
				and AQS.LPGMTYP = ''SAM''),
			(
			select distinct AQS.LMSCDES2
			from PICPFN01.aqs.MSSNM1BOPCOV AQS
			where AQS.kstokey = PS.policyid
				and nexpnum = 0
				and AQS.LPGMTYP = ''SAM''))
		else NULL
		end),
	SAM_PI_SO_008_Agg_Limit = (case 
		when SAM_Form_PI_SO_008 is not null
		then isnull((
			select distinct AQS.LMSCDES3
			from PI_AQS_POLICY_PROD.dbo.BOPCOVMFL AQS
			where AQS.policyid = PS.policyid
				and nexpnum = 0
				and AQS.LPGMTYP = ''SAM''),
			(
			select distinct AQS.LMSCDES3
			from PICPFN01.aqs.MSSNM1BOPCOV AQS
			where AQS.kstokey = PS.policyid
				and nexpnum = 0
				and AQS.LPGMTYP = ''SAM''))
		else NULL
		end),
	SAM_PI_SO_007_OCC_Limit = (case 
		when SAM_Form_PI_SO_007 is not null
		then isnull((
			select distinct AQS.LMSCDES2
			from PI_AQS_POLICY_PROD.dbo.BOPCOVMFL AQS
			where AQS.policyid = PS.policyid
				and nexpnum = 0
				and AQS.LPGMTYP = ''SAM''),
			(
			select distinct AQS.LMSCDES2
			from PICPFN01.aqs.MSSNM1BOPCOV AQS
			where AQS.kstokey = PS.policyid
				and nexpnum = 0
				and AQS.LPGMTYP = ''SAM''))
		else NULL
		end),
	SAM_PI_SO_007_Agg_Limit = (case 
		when SAM_Form_PI_SO_007 is not null
		then isnull((
			select distinct AQS.LMSCDES3
			from PI_AQS_POLICY_PROD.dbo.BOPCOVMFL AQS
			where AQS.policyid = PS.policyid
				and nexpnum = 0
				and AQS.LPGMTYP = ''SAM''),
			(
			select distinct AQS.LMSCDES3
			from PICPFN01.aqs.MSSNM1BOPCOV AQS
			where AQS.kstokey = PS.policyid
				and nexpnum = 0
				and AQS.LPGMTYP = ''SAM''))
		else NULL
		end),
	SAM_PI_HF_11_OCC_Limit = (case 
		when SAM_Form_PI_HF_11 is not null
		then isnull((
			select max(AQS.lsubdes1)
			from PI_AQS_POLICY_PROD.dbo.SPCCOVMFL AQS
			where AQS.policyid = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde = ''HF11''),
			(
			select max(AQS.lsubdes1)
			from PICPFN01.aqs.MSSNM1SPCCOV AQS
			where AQS.kstokey = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde = ''HF11''))
		else NULL
		end),
	SAM_PI_HF_11_Agg_Limit = (case 
		when SAM_Form_PI_HF_11 is not null
		then isnull((
			select max(AQS.lsubdes2)
			from PI_AQS_POLICY_PROD.dbo.SPCCOVMFL AQS
			where AQS.policyid = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde = ''HF11''),
			(
			select max(AQS.lsubdes2)
			from PICPFN01.aqs.MSSNM1SPCCOV AQS
			where AQS.kstokey = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde = ''HF11''))
		else NULL
		end),
	SAM_PI_CAM_003_OCC_Limit = (case 
		when SAM_Form_PI_CAM_003 is not null
		then isnull((
			select max(AQS.lsubdes1)
			from PI_AQS_POLICY_PROD.dbo.SPCCOVMFL AQS
			where AQS.policyid = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde in(''ABU'',''SS2'',''SAM'')),
			(
			select max(AQS.lsubdes1)
			from PICPFN01.aqs.MSSNM1SPCCOV AQS
			where AQS.kstokey = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde in(''ABU'',''SS2'',''SAM'')))
		else NULL
		end),
	SAM_PI_CAM_003_Agg_Limit = (case 
		when SAM_Form_PI_CAM_003 is not null
		then isnull((
			select max(AQS.lsubdes2)
			from PI_AQS_POLICY_PROD.dbo.SPCCOVMFL AQS
			where AQS.policyid = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde in(''ABU'',''SS2'',''SAM'')),
			(
			select max(AQS.lsubdes2)
			from PICPFN01.aqs.MSSNM1SPCCOV AQS
			where AQS.kstokey = PS.policyid
				and nexpnum = 0
				and AQS.LLOB = ''LIA''
				and AQS.Lcovtypcde in(''ABU'',''SS2'',''SAM'')))
		else NULL
		end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work PS


-------------------------------------------------------------------------------


/* Step 3 */



update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work 
set 
SAM_Form = (case
	When SAM_Form_PI_SO_008 is not null then SAM_Form_PI_SO_008
	When SAM_Form_PI_SO_007 is not null then SAM_Form_PI_SO_007
	When SAM_Form_PI_HF_11 is not null then SAM_Form_PI_HF_11
	When SAM_Form_PI_CAM_003 is not null then SAM_Form_PI_CAM_003
	When SAM_Form_PI_SS_2 is not null then SAM_Form_PI_SS_2
	else SAM_Exclusion_from_CG_21_46
	end),
SAM_OCC_Limit = (case
	When SAM_Form_PI_SO_008 is not null then SAM_PI_SO_008_OCC_Limit
	When SAM_Form_PI_SO_007 is not null then SAM_PI_SO_007_OCC_Limit
	When SAM_Form_PI_HF_11 is not null then SAM_PI_HF_11_OCC_Limit
	When SAM_Form_PI_CAM_003 is not null then SAM_PI_CAM_003_OCC_Limit
	else SAM_PI_SS_2_OCC_Limit
	end),
SAM_Agg_Limit = (case
	When SAM_Form_PI_SO_008 is not null then SAM_PI_SO_008_Agg_Limit
	When SAM_Form_PI_SO_007 is not null then SAM_PI_SO_007_Agg_Limit
	When SAM_Form_PI_HF_11 is not null then SAM_PI_HF_11_Agg_Limit
	When SAM_Form_PI_CAM_003 is not null then SAM_PI_CAM_003_Agg_Limit
	else SAM_PI_SS_2_Agg_Limit
	end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work PS


update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work
set 
SAM_Form_Group = (case
	When SAM_Form like ''PI%SO%008%'' then ''PI-SO-008''
	When SAM_Form like ''PI%SO%007%'' then ''PI-SO-007''
	When SAM_Form like ''PI%HF%11%'' then ''PI-HF-11''
	When SAM_Form like ''PI%CAM%003%'' then ''PI-CAM-003''
	When SAM_Form like ''PI%SS%2%'' then ''PI-SS-2''
	When SAM_Form like ''%CG%21%46%'' then ''CG-21-46''
	else SAM_Form
	end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_GL_work PS


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)



' 
END
GO
