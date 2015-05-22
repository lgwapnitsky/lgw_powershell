IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_CleanErrors]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_BOR_CleanErrors]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_CleanErrors]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create  Procedure [dbo].[INT_BOR_CleanErrors]
	@BordereauName varchar(10)='''',
	@BorStatus char(1)='''',
	@BorId int=0
As
-------------------------------------------------------------------------------------------
-- Procedure [INT_BOR_CleanErrors] 
-- Developer: Sandip Mazumdar 
-- PARAMETERS:
--		@BordereauName	:	Name of Bordereau
--							Type	:Char(10)
--							Values	:Any valid Bordereaux name
--		@BorStatus		:	Whether newrenewal or Cancellation
--							Type	:Char(1)
--							Values:  ''N'' or ''C''
--  
-------------------------------------------------------------------------------------------
-- Changes:
-- FPT 13600 - Biztalk errors to be cleared 
--   Created by : Sandip Mazumdar 
--   Date       : 03-30-2009  
-------------------------------------------------------------------------------------------
Set NoCount On
--FPT 13600
Declare @PolNum    varchar(10),
		@EffDate   varchar(10),
		@TransDate varchar(10),
		@IssueDate varchar(10)
--FPT 13600
/* New Renewal Policy */
If @BorStatus = ''N''
Begin -- New Renewal

	IF upper(@BordereauName) = ''FWA''
	Begin -- FWA
		Delete from FWA_Policy_Errors where RowId = @BorId
		Delete from FWA_Coverage where PolicyRowId = @BorId
		Delete from FWA_Location where PolicyRowId = @BorId
		Delete from FWA_Tax where PolicyRowId = @BorId
		Delete from FWA_Policy where RowId = @BorId
	End -- FWA

	IF upper(@BordereauName) = ''CPH''
	Begin -- CPH
		Delete from CPH_Policy_Errors where RowId = @BorId
        Delete from CPH_Coverage where PolicyRowId = @BorId
		Delete from CPH_Tax where PolicyRowId = @BorId
		Delete from CPH_Policy where RowId = @BorId
	End -- CPH
--FPT 13600
	IF upper(@BordereauName) = ''GRUNDY''
	Begin -- Grundy
        Select  @PolNum=policy_num,  @EffDate=INCEPT_Date,@TransDate=TRANSDATE from 
        GRUNDY_Policy where Grundy_policy_id = @BorId
		Delete from GRUNDY_Policy_Errors where Grundy_policy_id = @BorId
        exec [dbo].[INT_DeleteGrundySchedule_BOR] @PolNum, @EffDate ,@TransDate
        Delete from GRUNDY_Policy where Grundy_policy_id = @BorId
	End -- Grundy
--FPT 13600
End -- New Renewal

/* Cancellation Policy */
If @BorStatus = ''C''
Begin -- Cancellation

	IF @BordereauName = ''FWA''
	Begin -- FWA
		delete from FWA_Cancel_Errors where RowId = @BorId
		delete from FWA_Cancel where RowId = @BorId
	End -- FWA

	IF @BordereauName = ''CPH''
	Begin -- CPH
		delete from CPH_Cancel_Errors where RowId = @BorId
		delete from CPH_Cancel where RowId = @BorId
	End -- CPH
--FPT 13600
	IF @BordereauName = ''GRUNDY''
	Begin -- GRUNDY
		delete from GRUNDY_Cancel_Errors where GRUNDY_Cancel_ID = @BorId
		delete from GRUNDY_Cancel where GRUNDY_Cancel_ID = @BorId
	End -- GRUNDY
--FPT 13600
End -- Cancellation
--FPT 13600
If @BorStatus = ''E''
Begin -- Endorsement
	IF @BordereauName = ''GRUNDY''
	Begin -- GRUNDY
		Select  @PolNum=policy_num,  @EffDate=INCEPT_Date, @IssueDate= ISSUE_DATE, @TransDate=TRANSDATE 
        from GRUNDY_Policy where Grundy_policy_id = @BorId
		exec [dbo].[INT_DeleteGrundyEndorsements_BOR] @PolNum, @EffDate, @IssueDate ,@TransDate
		Delete from GRUNDY_Policy_Errors where Grundy_policy_id = @BorId
        exec [dbo].[INT_DeleteGrundySchedule_BOR] @PolNum, @EffDate ,@TransDate
        Delete from GRUNDY_Policy where Grundy_policy_id = @BorId
    End --GRUNDY
End -- Endorsement
--FPT 13600
' 
END
GO
