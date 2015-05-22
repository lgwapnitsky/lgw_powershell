IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14_Endorsement_PVCD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_14_Endorsement_PVCD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14_Endorsement_PVCD]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'











CREATE procedure [dbo].[usp_Step_14_Endorsement_PVCD] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

/* Endorsements */

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
set

	PVCD_Amendment_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-42''
					or BD2.bdtNumber like ''PI-PRD-08''
					or BD2.bdtNumber like ''PI-PRD-7''
					or BD2.bdtNumber like ''PI-PRD-10''
					or BD2.bdtNumber like ''PI-PRD-9'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-42''
					or forms.LFRMNUM like ''PI-PRD-08''
					or forms.LFRMNUM like ''PI-PRD-7''
					or forms.LFRMNUM like ''PI-PRD-10''
					or forms.LFRMNUM like ''PI-PRD-9'')
	))), 

	PVCD_Partnership_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-80''
					or BD2.bdtNumber like ''PI-PRD-81''
					or BD2.bdtNumber like ''PI-PRD-082'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-80''
					or forms.LFRMNUM like ''PI-PRD-81''
					or forms.LFRMNUM like ''PI-PRD-082'')
	))), 

	PVCD_ProPak_Elite72_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-72 NH''
					or BD2.bdtNumber like ''PI-PRD-72''
					or BD2.bdtNumber like ''PI-PRD-72 VA'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-72 NH''
					or forms.LFRMNUM like ''PI-PRD-72''
					or forms.LFRMNUM like ''PI-PRD-72 VA'')
	))), 

	PVCD_ProPak_Elite73_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-73 OK''
					or BD2.bdtNumber like ''PI-PRD-73'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-73 OK''
					or forms.LFRMNUM like ''PI-PRD-73'')
	))), 

	PVCD_ProPak_Elite_Vermont7273_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-72/73'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-72/73'')
	))), 
	PVCD_Circumstance_Exclusion_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-55''
					or BD2.bdtNumber like ''PI-PRD-56'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-55''
					or forms.LFRMNUM like ''PI-PRD-56'')
	))), 
	PVCD_Professional_Services_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-25''
					or BD2.bdtNumber like ''PI-PRD-5a''
					or BD2.bdtNumber like ''PI-PRD-5'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-25''
					or forms.LFRMNUM like ''PI-PRD-5a''
					or forms.LFRMNUM like ''PI-PRD-5'')
	))), 
	PVCD_BullsEye_ProPak_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-89''
					or BD2.bdtNumber like ''PI-PRD-89 VA'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-89''
					or forms.LFRMNUM like ''PI-PRD-89 VA'')
	))), 
	PVCD_Sexual_Abuse_Exclusion_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-58''
					or BD2.bdtNumber like ''PI-PRD-58A''
					or BD2.bdtNumber like ''PI-PRD-58-TX'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-58''
					or forms.LFRMNUM like ''PI-PRD-58A''
					or forms.LFRMNUM like ''PI-PRD-58-TX'')
	))), 
	PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-88'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-88'')
	))), 
	PVCD_Amend_of_ExclusionK_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-85'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-85'')
	))), 
	PVCD_Amend_of_Severability_Provision_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-83'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-83'')
	))), 
	PVCD_Third_Party_Exclusion_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-43'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-43'')
	))), 
	PVCD_Punitive_Exclusion_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-26'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-26'')
	))), 
	PVCD_Medical_Malpractice_Exclusion_End_Y_N  = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-63'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-63'')
	))), 
	PVCD_Insurance_EO_Exclusion_End_Y_N  = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-29'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-29'')
	))), 
	PVCD_Full_Securities_Exclusion_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-28'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-28'')
	))), 
	PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-30'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-30'')
	))), 
	PVCD_Bankruptcy_Exclusion_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-32'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-32'')
	))), 
	PVCD_Shareholder_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-20'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-20'')
	))), 
	PVCD_Past_Acts_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-22'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-22'')
	))), 
	PVCD_No_Liab_Retent_Waiver_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-19'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-19'')
	))), 
	PVCD_Manuscript_Endorsement_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-MANU-1'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-MANU-1'')
	))), 
	PVCD_Election_ERP_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-17'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-17'')
	))), 
	PVCD_Delete_Consent_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-15'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-15'')
	))), 
	PVCD_Damages_Only_Retention_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-18'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-18'')
	))), 
	PVCD_Class_Action_Sublimit_SubRetention_End_Y_N = ISNULL( 
		-- V3 
		(select max(bd.bdtnumber)
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
		join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
			on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  (BD2.bdtid)
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI-PRD-842'')
		),
		-- V2 
		((select forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''PI-PRD-842'')
	))) 

from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)






' 
END
GO
