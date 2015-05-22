IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PolicyPathID_Step4_Create_Table_For_Policy_Endorsements]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PolicyPathID_Step4_Create_Table_For_Policy_Endorsements]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PolicyPathID_Step4_Create_Table_For_Policy_Endorsements]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure usp_PolicyPathID_Step4_Create_Table_For_Policy_Endorsements

as

-- Policy PathId Monthly Step 4
-- FootPrints Ticket #59691
-- Erik Godfrey
-- 7/16/2012

if exists (select 1 from sys.tables
           where name = ''Policy_Forms_Information_work'')
drop table Act_Detailed_Experience.dbo.Policy_Forms_Information_work

select
	pol.idnum,
	pol.policynumber,
	pol.Policynumber_or_PATHID,
	pol.ratingsourcecode,
	pol.RatingSystemID,
	att.dat_bdtId as FormID,
	bd.bdtNumber as Form_Number,
	bd.bdtDesc as Form_Desc,
	bd.bdt_typId as Form_Type
into Act_Detailed_Experience.dbo.Policy_Forms_Information_work
from Act_Detailed_Experience.dbo.Policy_PATHID_Information_work pol with (nolock)
left join PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as att with (nolock)
on att.PolicyId = pol.RatingSystemID
	and att.NEXPNUM = 0
left join PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument as BD with (nolock)
on att.dat_bdtid = bd.bdtid
join (select bdtid, bdtDesc, bdt_typId
      from PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument as BD with (nolock)
      join Act_Detailed_Experience.dbo.Policy_Forms_Information_List final with (nolock)
      on bd.bdtNumber = final.Form_Number
      and bd.bdtDesc = final.Form_Desc
      where bd.bdt_typId = 1
      and bdtNumber not like ''%BELL%''
      and bdtNumber not in (''PP 0701'',''IL0017'',''IL0021'')
) as policy_forms
on att.dat_bdtid = policy_forms.bdtid
where bd.bdt_typId = 1
	and bdtNumber not like ''%BELL%''
	and bdtNumber not in (''PP 0701'',''IL0017'',''IL0021'')
group by 
	pol.idnum,
	pol.policynumber,
	pol.Policynumber_or_PATHID,
	pol.ratingsourcecode,
	pol.RatingSystemID,
	att.dat_bdtId,
	bd.bdtNumber,
	bd.bdtDesc,
	bd.bdt_typId
' 
END
GO
