IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14_Endorsement_GLDX]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_14_Endorsement_GLDX]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14_Endorsement_GLDX]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'









CREATE Procedure [dbo].[usp_Step_14_Endorsement_GLDX] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
set 
Endorsement_GLDX = ISNULL( 
		-- V3 
		(select 
			Form = (
				select distinct max(bd.bdtnumber)
				from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
				where bd.bdtid in
					(	select distinct l.dat_bdtid
						from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
						WHERE l.nexpnum = 0 
							and l.PolicyID = PS.PolicyID
							and l.dat_bdtid IN (
								SELECT DISTINCT BD2.bdtid
								FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
								where BD2.bdtNumber LIKE ''%PI-GLD%''
									or BD2.bdtNumber LIKE ''%PI-AS-009%''
									or BD2.bdtNumber LIKE ''%PI-CO-6%''
									or BD2.bdtNumber LIKE ''%PI-CAM-002%''
									or BD2.bdtNumber LIKE ''%PI-RO-012%''
									or BD2.bdtNumber LIKE ''%PI-NP-003%''))
					)
		),
		-- V2 
		((select distinct max(forms.lfrmnum)
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and (forms.LFRMNUM LIKE ''%PINP003%''
					or forms.LFRMNUM LIKE ''%PIAS009%''))
	))
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS

----------------------------------------------------------------------

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
set 
Endorsement_GLDX_YN = (case 
	when Endorsement_GLDX is null 
	then ''N'' 
	else ''Y'' 
	end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)




' 
END
GO
