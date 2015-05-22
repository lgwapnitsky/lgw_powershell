IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYRecordsToProcess_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYRecordsToProcess_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYRecordsToProcess_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE                   proc dbo.INT_GetGRUNDYRecordsToProcess_BOR 
as

SET NOCOUNT ON

BEGIN TRANSACTION

update arch_grundy_policy set RecordStatus=''2'' where RecordStatus=''1'' 
and ((upper(trans_code) like ''%NEW%'') or (upper(trans_code) like ''%REN%''))

update arch_grundy_schedule set RecordStatus=''2'' where RecordStatus=''1''

COMMIT TRANSACTION

select agp.*, ags.* from arch_grundy_policy agp 
left outer join 
(select * from arch_grundy_schedule ags1 
where ags1.RecordStatus = ''2'' 
and ltrim(rtrim(ags1.CAR_01))<>'''' 
and (upper(ltrim(rtrim(ags1.VIN_SER_01))))<>''SEE SCHEDULE'' 
and ags1.CAR_01 is not null 
and not (
(ltrim(rtrim(year_01)))='''' and 
(ltrim(rtrim(make_01)))='''' and 
(ltrim(rtrim(type_01)))='''' and 
(ltrim(rtrim(vin_ser_01)))=''''
)
-- and ags1.VIN_SER_01 is not null --COMMENTED SINCE VIN CAN BE NULL FROM GRUNDY
) ags 
on agp.POLICY_NUM = ags.POLICY_NUM and agp.INCEPT_DATE = ags.EFFECT_DATE 
 and agp.transdate = ags.transdate
where agp.RecordStatus = ''2''  
order by agp.POLICY_NUM for xml auto -- ,xmldata


BEGIN TRANSACTION

update arch_grundy_policy set RecordStatus=''3'' where RecordStatus=''2'' 
and ((upper(trans_code) like ''%NEW%'') or (upper(trans_code) like ''%REN%''))

update arch_grundy_schedule set RecordStatus=''3'' where RecordStatus=''2''

COMMIT TRANSACTION


' 
END
GO
