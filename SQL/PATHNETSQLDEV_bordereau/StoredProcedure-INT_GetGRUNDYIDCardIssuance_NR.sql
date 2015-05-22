IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYIDCardIssuance_NR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYIDCardIssuance_NR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYIDCardIssuance_NR]') AND type in (N'P', N'PC'))
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
-- 6/24/09  Sandip Mazumdar	FP 15072 Create a custom process to recreate idcards
---------------------------------------------------------------------------------
--	FP 15135		Grundy New/Renewal policies and vehicle schedule
--	Developer	:	Sandip Mazumdar
--	Date		:	7/20/2009	
--	Notes		:	If there is no vehicle attached to NR then that document should not be produced 
---------------------------------------------------------------------------------
*******************************************************************************/

CREATE     PROC [dbo].[INT_GetGRUNDYIDCardIssuance_NR]
as
--FPT 15135
--create temp. grundy_vehicle table which will be used for idcard printing on coverage endorsments,
--    as in case of coverage endorsement there is no data present in grundy_vehicle table.
select 1 as GRUNDY_Vehicle_ID,''0'' as AMT_ACV_01, ''0'' as AMT_COMP_01, ''0'' as AMT_COLL_01,''1'' as RecordStatus,
getdate() as UpdateDate,''*'' as REMT_P_FLAG,
 p.POLICY_NUM,p.VEH_EFF_DT as EFFECT_DATE,a.vehicleyear as  YEAR_01,
a.vehiclemake as MAKE_01,a.vehiclemodel as TYPE_01,a.vin as VIN_SER_01,p.ISSUE_DATE as DATE_ISSUE,''A'' as CODE_01,
c.CHANGE_ADD, p.transdate
into #grundy_vehicle 
from grundy_policy p,accessphly.dbo.accountvehicle a,
accessphly.dbo.policyvehicle v,grundy_coverage c
where p.GenPolicyNumber=v.policynumber and p.POLICY_NUM = c.POLICY_NUM AND p.VEH_EFF_DT = c.EFFECT_DATE
and p.ISSUE_DATE=c.DATE_ISSUE and c.CHANGE_ADD=''I'' 
and v.expirationdate>getdate() 
and v.accountvehicleid=a.accountvehicleid
and (p.recordstatus not like ''%I%''  --FPT 15072
   or p.policy_num + p.transdate in (select policy_num+transdate from int_idcards_special 
                                      where runstatus=1 and policy_num is not null) 
   or p.transdate in (select transdate from int_idcards_special where runstatus=1 and policy_num is null))
--FPT 15135
--Below, it selects from New and Renewal policies all idcards for printing 
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
     and  ( ( 
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
        --	FP 15135
          and  
           (ags1.policy_num is not null)
          )        
        ) 
     and
     (
       (agp.recordstatus is null)
       or
       (agp.recordstatus not like ''%I%'')
       --FPT 15072
      or agp.policy_num + agp.transdate in (select policy_num+transdate from int_idcards_special 
                                      where runstatus=1 and policy_num is not null) 
      or agp.transdate in (select transdate from int_idcards_special where runstatus=1 and policy_num is null)
     )
UNION
--FPT 15135
--Below, it selects from MTC policies all idcards for printing 
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
  ags1.GRUNDY_Vehicle_ID as GRUNDY_Schedule_ID,ags1.POLICY_NUM,ags1.EFFECT_DATE,1 as  CAR_01, '''' as CHANGE_ADD,''*'' as ID_CARD_PR_01,
  ags1.YEAR_01,ags1.MAKE_01,ags1.TYPE_01, ags1.VIN_SER_01,ags1.AMT_ACV_01, ags1.AMT_COMP_01, ags1.AMT_COLL_01, 
  ags1.RecordStatus, ags1.UpdateDate, ags1.REMT_P_FLAG
from grundy_policy agp (nolock) join grundy_policy_errors (nolock) on agp.grundy_policy_id = grundy_policy_errors.grundy_policy_id
left outer join grundy_vehicle ags1 (nolock) on agp.POLICY_NUM = ags1.POLICY_NUM and agp.VEH_EFF_DT = ags1.EFFECT_DATE
and agp.ISSUE_DATE = ags1.DATE_ISSUE and agp.TRANSDATE = ags1.TRANSDATE
where (not ((upper(agp.TRANS_CODE) like ''%NEW%'') or (upper(agp.TRANS_CODE) like ''%REN%'')))
     and
     ((isnumeric(BOD_INS_EP)=1) or (isnumeric(BOD_INS_EO)=1))
     and grundy_policy_errors.error_id in(2,19)         
     and
     (
       (agp.recordstatus is null)
       or
       (agp.recordstatus not like ''%I%'')
--FPT 15072
      or agp.policy_num + agp.transdate in (select policy_num+transdate from int_idcards_special 
                                      where runstatus=1 and policy_num is not null) 
      or agp.transdate in (select transdate from int_idcards_special where runstatus=1 and policy_num is null)
     )
	and
	ags1.CODE_01 in (''A'',''C'')

union
--FPT 15135
--Below, it selects from MTC policies for coverage endorsements, all idcards for printing 
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
  ags1.GRUNDY_Vehicle_ID as GRUNDY_Schedule_ID,ags1.POLICY_NUM,ags1.EFFECT_DATE,1 as  CAR_01,ags1.CHANGE_ADD,''*'' as ID_CARD_PR_01,
  ags1.YEAR_01,ags1.MAKE_01,ags1.TYPE_01, ags1.VIN_SER_01,ags1.AMT_ACV_01, ags1.AMT_COMP_01, ags1.AMT_COLL_01, 
  ags1.RecordStatus, ags1.UpdateDate, ags1.REMT_P_FLAG
from grundy_policy agp (nolock) join grundy_policy_errors (nolock) on agp.grundy_policy_id = grundy_policy_errors.grundy_policy_id
left outer join #grundy_vehicle ags1 on agp.POLICY_NUM = ags1.POLICY_NUM and agp.VEH_EFF_DT = ags1.EFFECT_DATE
and agp.ISSUE_DATE = ags1.DATE_ISSUE and agp.TRANSDATE = ags1.TRANSDATE
where (not ((upper(agp.TRANS_CODE) like ''%NEW%'') or (upper(agp.TRANS_CODE) like ''%REN%'')))
     and        
     agp.grundy_policy_id = grundy_policy_errors.grundy_policy_id
     and TRANS_CODE like ''%COV%''
     and
     ((isnumeric(BOD_INS_EP)=1) or (isnumeric(BOD_INS_EO)=1))
     and grundy_policy_errors.error_id in(2,19)         
     and
     (
       (agp.recordstatus is null)
       or
       (agp.recordstatus not like ''%I%'')
--FPT 15072
      or agp.policy_num + agp.transdate in (select policy_num+transdate from int_idcards_special 
                                      where runstatus=1 and policy_num is not null) 
      or agp.transdate in (select transdate from int_idcards_special where runstatus=1 and policy_num is null)
     )
	 and ags1.CODE_01 in (''A'')

order by agp.POLICY_NUM
for xml auto
--, xmldata
--FPT 15135
--Below it will update recordstatus so that these id cards will not pick in next run.
update gp set gp.recordstatus=case when gp.recordstatus is null then ''I'' 
                              else gp.recordstatus+''I'' end
from grundy_policy gp, grundy_policy_errors gpe  
where gp.grundy_policy_id=gpe.grundy_policy_id 
and ( 
        ( (gpe.error_id in(926,927)) and (gp.trans_code not like ''%RPT%''))
     or ( (gpe.error_id in(2,19))    and (gp.trans_code like ''%RPT%''))
     or ( (gpe.error_id in(326))     and (gp.trans_code like ''%REN%''))            
    )  
and ((gp.recordstatus is null) or (gp.recordstatus not like ''%I%''))
and ((upper(gp.trans_code) like ''%NEW%'') or (upper(gp.trans_code) like ''%REN%''))

update gp set gp.recordstatus=case when gp.recordstatus is null then ''I'' 
                              else gp.recordstatus+''I'' end
from grundy_policy gp, grundy_policy_errors gpe  
where gp.grundy_policy_id=gpe.grundy_policy_id and gpe.error_id in(2,19) 
and ((gp.recordstatus is null) or (gp.recordstatus not like ''%I%''))
and (not((upper(gp.trans_code) like ''%NEW%'') or (upper(gp.trans_code) like ''%REN%'')))

' 
END
GO
