IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_Endrs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_Endrs]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_Endrs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE     proc [dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_Endrs]
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
  dbo.INT_GetEndorsementPassed_BOR (agc1.ENDORSE_NUM,agl1.ENDORSEMENT,agv1.ENDORSEMNT) as POLGEN_ENDORSESEQNUM,
  --'''' as POLGEN_REPRINT,
  dbo.INT_GetTotCompCollByEnd_BOR (agv1.POLICY_NUM, agv1.ENDORSEMNT, agv1.DATE_ISSUE, agv1.EFFECT_DATE,agv1.TransDate) as POLGEN_REPRINT,  --fpt 5599
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''Full_Name'',1,1) as POLGEN_PRODUCER_NA,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''Address1'',1,1) as POLGEN_PRODUCER_ADD,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''CityName'',1,1) as POLGEN_PRODUCER_CITY,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''StateAdd'',1,1) as POLGEN_PRODUCER_STATE,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''ZipCode'',1,1) as POLGEN_PRODUCER_ZIP,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''NAIC_ID'',1,1) as POLGEN_PRODUCER_NAIC,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''ClaimPhone'',1,1) as POLGEN_PRODUCER_PHONE,
  agp.*,
  agc1.*, 
  agl1.*, 
  agv1.*
from grundy_policy agp (nolock) join grundy_policy_errors (nolock) on agp.grundy_policy_id = grundy_policy_errors.grundy_policy_id
left outer join grundy_coverage agc1 (nolock) on agp.POLICY_NUM = agc1.POLICY_NUM and agp.ISSUE_DATE = agc1.DATE_ISSUE and agp.VEH_EFF_DT = agc1.EFFECT_DATE and agp.TRANSDATE = agc1.TRANSDATE
left outer join grundy_losspay agl1 (nolock) on agp.POLICY_NUM = agl1.POLICY_NUM and agp.ISSUE_DATE = agl1.DATE_ISSUE and agp.VEH_EFF_DT = agl1.EFFECT_DAT and agp.TRANSDATE = agl1.TRANSDATE
left outer join grundy_vehicle agv1 (nolock) on agp.POLICY_NUM = agv1.POLICY_NUM and agp.ISSUE_DATE = agv1.DATE_ISSUE and agp.VEH_EFF_DT = agv1.EFFECT_DATE and agp.TRANSDATE = agv1.TRANSDATE
--left outer join POLGEN_Company_Info pgci (nolock) on  agp.POLGEN_PRODUCTTYPE = pgci.Product_Info_ID  and  agp.POLGEN_COMPANYCODEID = pgci.Company_ID
where NOT ((upper(agp.TRANS_CODE) like ''%NEW%'') or (upper(agp.TRANS_CODE) like ''%REN%'') or (upper(agp.TRANS_CODE) LIKE ''%CAN%''))

and
grundy_policy_errors.error_id in(2,19)
and
(
(agp.recordstatus is null)
or
(agp.recordstatus not like ''%P%'')
)

and ((agc1.grundy_coverage_id is not null) or (agl1.grundy_losspay_id is not null) or (agv1.grundy_vehicle_id is not null)) 
order by agp.POLICY_NUM
for xml auto
--,xmldata

update gp set gp.recordstatus=case when gp.recordstatus is null then ''P'' 
                              else gp.recordstatus+''P'' end

from grundy_policy gp, grundy_policy_errors gpe 
where gp.grundy_policy_id=gpe.grundy_policy_id
      and
      gpe.error_id in(2,19) 
      and 
      ((gp.recordstatus is null) or (gp.recordstatus not like ''%P%''))
      and
      Not ((upper(gp.trans_code) like ''%NEW%'') or (upper(gp.trans_code) like ''%REN%'') or (upper(gp.trans_code) like ''%CAN%''))


' 
END
GO
