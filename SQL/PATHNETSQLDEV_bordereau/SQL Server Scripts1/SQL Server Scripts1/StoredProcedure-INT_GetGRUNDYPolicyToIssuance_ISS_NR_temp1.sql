IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_NR_temp1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_NR_temp1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_NR_temp1]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE            proc [dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_NR_temp1]
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
  and agp.transdate=''20090720''
  ORDER BY agp.POLICY_NUM, case when year_01 is not null then year_01 else veh_year_1 end
  for xml auto
' 
END
GO
