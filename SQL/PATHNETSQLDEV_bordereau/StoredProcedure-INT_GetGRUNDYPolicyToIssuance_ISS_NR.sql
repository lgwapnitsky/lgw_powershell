IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_NR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_NR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_NR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE            proc [dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_NR]
as
select
  1 as POLGEN_PRODUCTTYPE, 
  dbo.INT_GetAccountViaPolicy_BOR (agp.policy_num) as POLGEN_ACCOUNT,
  ''GRUNDY'' as POLGEN_COMPANYCODE,
  1 as POLGEN_COMPANYCODEID,
  agp.GRUNDY_Policy_ID as POLGEN_POLICYIDKEY,
  agp.TRANSDATE as POLGEN_TRANSMISSIONDATE,
  agp.STATE_CD as POLGEN_STATE_CD,
  agp.INCEPT_DATE as POLGEN_INCEPT_DATE,
  agp.EXP_DATE as POLGEN_EXP_DATE,
  dbo.INT_GetProcDocGrpVIATrans_BOR(agp.trans_code) as POLGEN_PROCDOCGRP,
  agp.trans_code as POLGEN_PROCDOCGRPSOURCE,
  ''   '' as POLGEN_ENDORSESEQNUM,
  dbo.INT_DetermineReprint_BOR(agp.trans_code) as POLGEN_REPRINT,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''Full_Name'',1,1) as POLGEN_PRODUCER_NA,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''Address1'',1,1) as POLGEN_PRODUCER_ADD,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''CityName'',1,1) as POLGEN_PRODUCER_CITY,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''StateAdd'',1,1) as POLGEN_PRODUCER_STATE,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''ZipCode'',1,1) as POLGEN_PRODUCER_ZIP,
  dbo.INT_GetDataFromPolgenCompanyStateInfo_BOR (''NAIC_ID'',1,1,agp.STATE_CD) as POLGEN_PRODUCER_NAIC,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''ClaimPhone'',1,1) as POLGEN_PRODUCER_PHONE,
  agp.*,
  ags1.*
  from grundy_policy agp left outer join grundy_schedule ags1 (nolock) on agp.POLICY_NUM = ags1.POLICY_NUM and agp.INCEPT_DATE = ags1.EFFECT_DATE and agp.TRANSDATE = ags1.TRANSDATE
  join grundy_policy_errors  (nolock) on agp.grundy_policy_id = grundy_policy_errors.grundy_policy_id
  where (upper(agp.trans_code) like ''%NEW%'' or agp.trans_code like ''%REN%'')
  and
  ( 	
    (
      (grundy_policy_errors.error_id in(926,927))
      and
      (agp.trans_code not like ''%RPT%'')
     )
     or
     (
       (grundy_policy_errors.error_id in(2,19))
       and
       (agp.trans_code like ''%RPT%'')
     )
    or
     (
       (grundy_policy_errors.error_id in(326))
       and
       (agp.trans_code like ''%REN%'')
       )     
   )
   and
   (
    (agp.recordstatus is null)
     or
    (agp.recordstatus not like ''%P%'')
   )
  ORDER BY agp.POLICY_NUM, case when year_01 is not null then year_01 else veh_year_1 end
  for xml auto

update gp set gp.recordstatus=case when gp.recordstatus is null then ''P'' 
                              else gp.recordstatus+''P'' end
from grundy_policy gp, grundy_policy_errors  gpe 
where gp.grundy_policy_id=gpe.grundy_policy_id
      and
      ((gp.recordstatus is null) or (gp.recordstatus not like ''%P%''))
      and
      ( 	
        (
          (gpe.error_id in(926,927))
          and
          (gp.trans_code not like ''%RPT%'')
        )
        or
        (
          (gpe.error_id in(2,19))
          and
          (gp.trans_code like ''%RPT%'')
        )
       or
          (
            (gpe.error_id in(326))
            and
            (gp.trans_code like ''%REN%'')
          )     
      )
      and
      ((upper(gp.trans_code) like ''%NEW%'') or (upper(gp.trans_code) like ''%REN%''))


' 
END
GO
