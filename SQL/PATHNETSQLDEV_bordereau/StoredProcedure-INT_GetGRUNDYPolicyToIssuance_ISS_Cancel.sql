IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_Cancel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_Cancel]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_Cancel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-------------------------------------------------------------------------------------------
-- Procedure [INT_GetGRUNDYPolicyToIssuance_ISS_Cancel] - 
-- Developer:  
-- PARAMETERS:
-------------------------------------------------------------------------------------------
-- Changes:
-- FPT 12938 - Test bordereau on pathnetsqldev
--   Created by : Sandip Mazumdar 
--   Date       : 04-03-2009
-- Notes : This ticket changes are now for keeping bordereau and accessphly in the same server
  -- So er are removing server link whenever we are refering bordereau database  
-------------------------------------------------------------------------------------------

CREATE      proc [dbo].[INT_GetGRUNDYPolicyToIssuance_ISS_Cancel]
as

select -- top 10
  gc.TRANSDATE as POLGEN_TRANSMISSIONDATE,
  1 as POLGEN_PRODUCTTYPE, 
  appspol.accountnumber as POLGEN_ACCOUNT,
  ''GRUNDY'' as POLGEN_COMPANYCODE,
  1 as POLGEN_COMPANYCODEID,
   gc.GRUNDY_Cancel_ID as POLGEN_POLICYIDKEY,
  ''PA'' as POLGEN_STATE_CD,
  appspol.effectivedate as POLGEN_INCEPT_DATE,
  appspol.expirationdate as POLGEN_EXP_DATE,
  dbo.INT_GetProcDocGrpVIATrans_BOR(''CAN'') as POLGEN_PROCDOCGRP,
  ''CAN'' as POLGEN_PROCDOCGRPSOURCE,
  gc.ENDORSEMNT as POLGEN_ENDORSESEQNUM,
  '' '' as POLGEN_REPRINT,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''Full_Name'',1,1) as POLGEN_PRODUCER_NA,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''Address1'',1,1) as POLGEN_PRODUCER_ADD,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''CityName'',1,1) as POLGEN_PRODUCER_CITY,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''StateAdd'',1,1) as POLGEN_PRODUCER_STATE,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''ZipCode'',1,1) as POLGEN_PRODUCER_ZIP,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''NAIC_ID'',1,1) as POLGEN_PRODUCER_NAIC,
  dbo.INT_GetDataFromPolgenCompanyInfo_BOR (''ClaimPhone'',1,1) as POLGEN_PRODUCER_PHONE,
  appspol.*,
  gc.*
  from accessphly.dbo.policy appspol,
       dbo.GRUNDY_Cancel gc
  where appspol.policynumber like ''GD'' + gc.POLICY_NUM +  ''%''
        and 
        appspol.policystatus = ''06''         
        and 
         (
           (gc.recordstatus is null)
           or
           (gc.recordstatus not like ''%P%'')
         )
order by gc.POLICY_NUM
for xml auto
--,xmldata


update gc set gc.recordstatus=case when gc.recordstatus is null then ''P'' 
                                   else gc.recordstatus+''P'' end
from accessphly.dbo.policy appspol,
       dbo.GRUNDY_Cancel gc
where appspol.policynumber like ''GD'' + gc.POLICY_NUM +  ''%''
      and
      ((gc.recordstatus is null) or (gc.recordstatus not like ''%P%''))        and 
        appspol.policystatus = ''06''         
        and 
         (
           (gc.recordstatus is null)
           or
           (gc.recordstatus not like ''%P%'')
         )


' 
END
GO
