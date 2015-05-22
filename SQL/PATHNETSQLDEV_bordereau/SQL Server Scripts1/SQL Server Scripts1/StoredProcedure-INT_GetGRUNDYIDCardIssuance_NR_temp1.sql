IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYIDCardIssuance_NR_temp1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYIDCardIssuance_NR_temp1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYIDCardIssuance_NR_temp1]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/*******************************************************************************
**		File: INT_GetGRUNDYIDCardIssuance_NR.sql
**		Name: INT_GetGRUNDYIDCardIssuance_NR
**
**		Return values:
**
**		Called by: BizTalk orchestration
**
**		Parameters: None
**
**		Auth: INTERFACE
********************************************************************************
** 		Change History
********************************************************************************
--------------------------------------------------------------------------------
-- 12/08/08	Zhaowei Qian	FP 7958 Grundy - Capture "Historical" for NY Historical ID Cards when address changes
--------------------------------------------------------------------------------
-- 1/15/09  Zhaowei Qian	FP 12938 Test Bordereau on pathnetsql (change from SQL 2000 to 2005)
--------------------------------------------------------------------------------
-- Changes:
-- FPT 12938 - Test bordereau on pathnetsqldev
--   Created by : Sandip Mazumdar 
--   Date       : 04-03-2009
-- Notes : This ticket changes are now for keeping bordereau and accessphly in the same server
  -- So er are removing server link whenever we are refering bordereau database  
-------------------------------------------------------------------------------------------
*******************************************************************************/

CREATE     PROC [dbo].[INT_GetGRUNDYIDCardIssuance_NR_temp1]
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
  10 as POLGEN_PROCDOCGRP,
  agp.trans_code as POLGEN_PROCDOCGRPSOURCE,
  ''   '' as POLGEN_ENDORSESEQNUM,
  '' '' as POLGEN_REPRINT,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''Full_Name'',1,1) as POLGEN_PRODUCER_NA,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''Address1'',1,1) as POLGEN_PRODUCER_ADD,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''CityName'',1,1) as POLGEN_PRODUCER_CITY,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''StateAdd'',1,1) as POLGEN_PRODUCER_STATE,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''ZipCode'',1,1) as POLGEN_PRODUCER_ZIP,
  dbo.INT_GetDataFromPolgenCompanyStateInfo_BOR (''NAIC_ID'',1,1,agp.STATE_CD) as POLGEN_PRODUCER_NAIC,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''ClaimPhone'',1,1) as POLGEN_PRODUCER_PHONE,
  agp.*,
  ags1.GRUNDY_Schedule_ID, ags1.POLICY_NUM, ags1.EFFECT_DATE, ags1.CAR_01, '''' as CHANGE_ADD, 
  ags1.ID_CARD_PR_01,ags1.YEAR_01, 
  ags1.MAKE_01, ags1.TYPE_01,ags1.VIN_SER_01,ags1.AMT_ACV_01, ags1.AMT_COMP_01, ags1.AMT_COLL_01, ags1.RecordStatus, 
  ags1.UpdateDate, ags1.REMT_P_FLAG  
from grundy_policy agp (nolock) join grundy_policy_errors (nolock) on agp.grundy_policy_id = grundy_policy_errors.grundy_policy_id
left outer join grundy_schedule ags1 on agp.POLICY_NUM = ags1.POLICY_NUM and agp.INCEPT_DATE = ags1.EFFECT_DATE and agp.TRANSDATE = ags1.TRANSDATE
where ((upper(agp.TRANS_CODE) like ''%NEW%'') or (upper(agp.TRANS_CODE) like ''%REN%''))
     and  
     agp.grundy_policy_id=grundy_policy_errors.grundy_policy_id 
     and 
     ((isnumeric(agp.BOD_INS_EP)=1) or (isnumeric(agp.BOD_INS_EO)=1))
     and agp.transdate=''20090720''

order by agp.POLICY_NUM
for xml auto
--, xmldata
' 
END
GO
