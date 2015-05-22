IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_CheckGRUNDYUniqueness_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_CheckGRUNDYUniqueness_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_CheckGRUNDYUniqueness_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE           proc dbo.INT_CheckGRUNDYUniqueness_BOR 
  @ReturnValue       int OUTPUT,
  @PolicyNumber      nvarchar(50),
  @Status            nvarchar(50),
  @Date       nvarchar(50),
  @IssueDate  nvarchar(50) = ''0''
 ,@TransDate nvarchar(10) = ''0''
as

SET NOCOUNT ON



DECLARE @RowCount As int
select @RowCount = 0

If (@Status = ''C'')
SELECT @RowCount = COUNT(*) FROM GRUNDY_Cancel where [POLICY_NUM]= @PolicyNumber and [EFFECT_DATE]= @Date

If ((@Status = ''N'')or(@Status = ''R''))
SELECT @RowCount = COUNT(*) FROM GRUNDY_Policy where [POLICY_NUM]= @PolicyNumber and [INCEPT_DATE]= @Date  and ((upper(trans_code) like ''%NEW%'') or (upper(trans_code) like ''%REN%'')) and transdate = @TransDate

If (@Status = ''A'')
SELECT @RowCount = COUNT(*) FROM GRUNDY_Policy where [POLICY_NUM]= @PolicyNumber and [VEH_EFF_DT]= @Date and [ISSUE_DATE]= @IssueDate  and (not ((upper(trans_code) like ''%NEW%'') or (upper(trans_code) like ''%REN%''))) and transdate = @TransDate


--else if(@Status = ''CLEAR'')
--SELECT @RowCount = COUNT(*) FROM ACA_Policies where [MEMBER#]= @MemberNumber and [CANCEL DATE]= @CancelDate and [EFF DATE]= @EffDate

-- Returns 1 if the record is new or else returns 2
IF @RowCount = 0
SET @ReturnValue = 1
ELSE
SET @ReturnValue = 2




' 
END
GO
