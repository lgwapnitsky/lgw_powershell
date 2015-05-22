IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14_Endorsement_MOLL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_14_Endorsement_MOLL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14_Endorsement_MOLL]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'








CREATE Procedure [dbo].[usp_Step_14_Endorsement_MOLL] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
set 
Endorsement_MOLL = ISNULL( 
		-- V3 
		(select distinct top 1 (
			select distinct top 1 bd.bdtnumber
			from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD
			where l.dat_bdtid = bd.bdtid
			)
		from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT  DISTINCT BD2.bdtid
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''%PI-MA-007%'')
		),'''')
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS
where productcode = ''MD''

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work 
set 
Endorsement_MOLL_YN = (case
	when Endorsement_MOLL is not null then ''Y'' else ''N'' end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS
where productcode = ''MD''



----------------------------------------------------------------------



update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)




' 
END
GO
