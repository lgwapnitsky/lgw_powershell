IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14_Endorsement_HS009_HS013]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_14_Endorsement_HS009_HS013]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14_Endorsement_HS009_HS013]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[usp_Step_14_Endorsement_HS009_HS013]

as

-- Revision #1
-- FootPrints Ticket #62874
-- Revisor:	Erik Godfrey
-- Revision Date: 11/8/2012
-- Revision Description: Add Endorsement HS014, HS003, and HS003D

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
set 
Endorsement_HS_009 = ISNULL(
		-- V3 
		(select distinct top 1 Form = (
			select distinct bd.bdtnumber
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
			where l.dat_bdtid = bd.bdtid)
		from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  DISTINCT BD2.bdtid
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''%HS%009%'')
		),
		-- V2 
		((select distinct forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and forms.LFRMNUM LIKE ''HS%009%''))
	),
Endorsement_HS_013 = ISNULL( 
		-- V3 
		(select Form = (
			select distinct bd.bdtnumber
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
--			where bd.bdtnumber like ''%013%''
			where l.dat_bdtid = bd.bdtid)
		from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  DISTINCT BD2.bdtid
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''%HS%013%'')
		),
		-- V2 
		((select distinct forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and forms.LFRMNUM LIKE ''HS%013%'')
	)),
Endorsement_HS_014 = ISNULL( 
            -- V3 
            (select Form = (
                  select distinct bd.bdtnumber
                  from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
--                where bd.bdtnumber like ''%013%''
                  where l.dat_bdtid = bd.bdtid)
            from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
            WHERE l.nexpnum = 0 
                  and l.PolicyID = PS.PolicyID
                  and l.dat_bdtid IN (
                        SELECT  DISTINCT BD2.bdtid
                        FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
                        where BD2.bdtNumber LIKE ''%HS%014%'')
            ),
            -- V2 
            ((select distinct forms.lfrmnum
            from PICPFN01.aqs.MSSNM1POLFMB as forms
              where forms.KSTOKEY = PS.PolicyID
                   and forms.NEXPNUM = 0
                   and forms.LFRMNUM LIKE ''HS%014%'')
      )),
    Endorsement_HS_003 = ISNULL( 
            -- V3 
            (select distinct top 1 Form = (
                  select distinct bd.bdtnumber
                  from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD with (nolock)
--                where bd.bdtnumber like ''%013%''
                  where l.dat_bdtid = bd.bdtid)
            from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l with (nolock)
            WHERE l.nexpnum = 0 
                  and l.PolicyID = PS.PolicyID
                  and l.dat_bdtid IN (
                        SELECT  DISTINCT BD2.bdtid
                        FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2 with (nolock)
                        where BD2.bdtNumber LIKE ''%HS%003%''
                        and   BD2.bdtNumber not like ''%HS%003D%'')
            ),
            -- V2 
            ((select distinct forms.lfrmnum
            from PICPFN01.aqs.MSSNM1POLFMB as forms with (nolock)
              where forms.KSTOKEY = PS.PolicyID
                   and forms.NEXPNUM = 0
                   and forms.LFRMNUM LIKE ''HS%003%''
                   and forms.LFRMNUM not like ''HS%003D%'')
      )),
    Endorsement_HS_003D = ISNULL( 
            -- V3 
            (select distinct top 1 Form = (
                  select distinct bd.bdtnumber
                  from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD with (nolock)
--                where bd.bdtnumber like ''%013%''
                  where l.dat_bdtid = bd.bdtid)
            from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l with (nolock)
            WHERE l.nexpnum = 0 
                  and l.PolicyID = PS.PolicyID
                  and l.dat_bdtid IN (
                        SELECT  DISTINCT BD2.bdtid
                        FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2 with (nolock)
                        where BD2.bdtNumber LIKE ''%HS%003D%'')
            ),
            -- V2 
            ((select distinct forms.lfrmnum
            from PICPFN01.aqs.MSSNM1POLFMB as forms with (nolock)
              where forms.KSTOKEY = PS.PolicyID
                   and forms.NEXPNUM = 0
                   and forms.LFRMNUM LIKE ''HS%003D%'')
      )),
	Endorsement_HS_004 = ISNULL(
            -- V3 
            (select distinct top 1 Form = (
                  select distinct bd.bdtnumber
                  from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
                  where l.dat_bdtid = bd.bdtid)
            from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
            WHERE l.nexpnum = 0 
                  and l.PolicyID = PS.PolicyID
                  and l.dat_bdtid IN (
                        SELECT  DISTINCT BD2.bdtid
                        FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
                        where BD2.bdtNumber LIKE ''%HS%004%'')
            ),
            -- V2 
            ((select distinct forms.lfrmnum
            from PICPFN01.aqs.MSSNM1POLFMB as forms
              where forms.KSTOKEY = PS.PolicyID
                   and forms.NEXPNUM = 0
                   and forms.LFRMNUM LIKE ''HS%004%''))
      ),
      
      Endorsement_CG0001=
              (select distinct bd.bdtnumber
              from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
              join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl  l
              on
              l.dat_bdtid = bd.bdtid
              and l.nexpnum = 0 
              and l.PolicyID = PS.PolicyID
              and BD.bdtNumber=''CG0001''
              ),

      Endorsement_CG0002=
              (select distinct bd.bdtnumber
              from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
              join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl  l
              on
              l.dat_bdtid = bd.bdtid
              and l.nexpnum = 0 
              and l.PolicyID = PS.PolicyID
              and BD.bdtNumber=''CG0002''
              )              
      
	--Endorsement_HS_004 = ISNULL(
 --           -- V3 
 --           (select top 1 Form = (
 --                 select top 1 bd.bdtnumber
 --                 from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
 --                 where l.dat_bdtid = bd.bdtid)
 --           from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
 --           WHERE l.nexpnum = 0 
 --                 and l.PolicyID = PS.PolicyID
 --                 and l.dat_bdtid IN (
 --                       SELECT  BD2.bdtid
 --                       FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
 --                       where BD2.bdtNumber LIKE ''%HS%004%'')
 --           ),
 --           -- V2 
 --           ((select top 1 forms.lfrmnum
 --           from PICPFN01.aqs.MSSNM1POLFMB as forms
 --             where forms.KSTOKEY = PS.PolicyID
 --                  and forms.NEXPNUM = 0
 --                  and forms.LFRMNUM LIKE ''HS%004%''))
 --     )
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

' 
END
GO
