IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYEndorsementsToProcess_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYEndorsementsToProcess_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYEndorsementsToProcess_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/****** Object:  Stored Procedure dbo.INT_GetGRUNDYEndorsementsToProcess_BOR    Script Date: 8/30/2006 2:04:50 PM ******/




































CREATE                               proc dbo.INT_GetGRUNDYEndorsementsToProcess_BOR 
as

SET NOCOUNT ON


BEGIN TRANSACTION

update arch_grundy_policy set RecordStatus=''2'' where RecordStatus=''1'' 
and not ((upper(trans_code) like ''%NEW%'') or (upper(trans_code) like ''%REN%''))

update arch_grundy_coverage set RecordStatus=''2'' where RecordStatus=''1''

update arch_grundy_vehicle set RecordStatus=''2'' where RecordStatus=''1''

update arch_grundy_losspay set RecordStatus=''2'' where RecordStatus=''1''

COMMIT TRANSACTION


select agpend.*,agc.*,agv.*,agl.* from 
(select * from arch_grundy_policy where RecordStatus=''2'' and (not ((upper(trans_code) like ''%NEW%'') or (upper(trans_code) like ''%REN%''))) 
--TESTING SHOULD REMOVE AFTER TESTING
--
--and RecordStatus = ''6'' 
--
) agpend 
left outer join 
 (select * from arch_grundy_coverage where (CHANGE_ADD=''B'' or CHANGE_ADD=''D'' or CHANGE_ADD=''I'' or CHANGE_LIA=''X'') and (RecordStatus = ''2'')) agc 
 on agc.POLICY_NUM = agpend.POLICY_NUM and agpend.VEH_EFF_DT=agc.EFFECT_DATE and agpend.ISSUE_DATE=agc.DATE_ISSUE 
 and agpend.TRANSDATE=agc.TRANSDATE
left outer join 
 (select * from arch_grundy_vehicle where  RecordStatus = ''2'' and (ltrim(rtrim(CODE_01)))<>'''' and CODE_01 is not null
) agv
 on agpend.POLICY_NUM = agv.POLICY_NUM and agpend.VEH_EFF_DT=agv.EFFECT_DATE and agpend.ISSUE_DATE=agv.DATE_ISSUE  
 and agpend.TRANSDATE=agv.TRANSDATE
left outer join 
 (select * from arch_grundy_losspay where  RecordStatus = ''2'') agl
 on agpend.POLICY_NUM = agl.POLICY_NUM and agpend.VEH_EFF_DT=agl.EFFECT_DAT and agpend.ISSUE_DATE=agl.DATE_ISSUE
 and agpend.TRANSDATE=agl.TRANSDATE

order by agpend.POLICY_NUM for xml auto
--, xmldata



BEGIN TRANSACTION

update arch_grundy_policy set RecordStatus=''3'' where RecordStatus=''2'' 
and not ((upper(trans_code) like ''%NEW%'') or (upper(trans_code) like ''%REN%''))

update arch_grundy_coverage set RecordStatus=''3'' where RecordStatus=''2''

update arch_grundy_vehicle set RecordStatus=''3'' where RecordStatus=''2''

update arch_grundy_losspay set RecordStatus=''3'' where RecordStatus=''2''

COMMIT TRANSACTION





















' 
END
GO
