IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_CreatePolicyDocumentHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_CreatePolicyDocumentHistory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_CreatePolicyDocumentHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE     PROCEDURE dbo.POLGEN_CreatePolicyDocumentHistory

@Policy_Hist_ID     as Int,
@DocumentStateID    as Int,
@Printed_For_Cust   as Char(1)

AS

Insert Into POLGEN_Policy_Document_History
  (
  Policy_Hist_ID,
  Document_State_ID,
  Printed_For_Cust 
  )
Values
  (
  @Policy_Hist_ID,
  @DocumentStateID,
  @Printed_For_Cust 
  )

IF  @@error != 0
  BEGIN
    raiserror(''Failed in procedure POLGEN_CreatePolicyDocumentHistory'',16,1)
  END


' 
END
GO
