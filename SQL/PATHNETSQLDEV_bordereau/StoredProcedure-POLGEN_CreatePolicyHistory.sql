IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_CreatePolicyHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_CreatePolicyHistory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_CreatePolicyHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





CREATE         PROCEDURE dbo.POLGEN_CreatePolicyHistory

   @Policy_Num           as Varchar(50),
   @Effect_Date          as DateTime,
   @Exp_Date             as DateTime,
   @Issue_Bind_Date      as DateTime, 
   @Document_File_Name   as varchar(1024),
   @XML_Data             as varchar(6000),
   @Company_ID           as int,
   @APPS_Account         as varchar(255),
   @Transmit_Date        as DateTime,
   @ReprintRequested     as varchar(10),
   @Generation_Date      as DateTime,
   @Process_Doc_Grp_ID   as int,
   @Company_Defined_Code as varchar(50),
   @Endorse_Seq_Num      as varchar(50),
   @Identity             as INT Output


AS
insert Into POLGEN_Policy_History
  (
  Policy_Num,
  Effect_Date,
  Exp_Date,
  Issue_Bind_Date, 
  Document_File_Name,
  XML_Data,
  Company_ID,
  APPS_Account,
  Transmit_Date,
  ReprintRequested,
  Generation_Date,
  Process_Doc_Grp_ID,
  Company_Defined_Code,
  Endorse_Seq_Num
  ) 
Values 
  (
  @Policy_Num,
  @Effect_Date,
  @Exp_Date,
  @Issue_Bind_Date, 
  @Document_File_Name,
  @XML_Data,
  @Company_ID,
  @APPS_Account,
  @Transmit_Date,
  @ReprintRequested,
  @Generation_Date,
  @Process_Doc_Grp_ID,
  @Company_Defined_Code,
  @Endorse_Seq_Num
  )  

   SET @Identity=@@identity 

   IF  @@error != 0
   BEGIN
     raiserror(''Failed in procedure POLGEN_CreatePolicyHistory'',16,1)
   END






' 
END
GO
