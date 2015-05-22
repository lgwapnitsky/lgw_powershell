IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYID_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYID_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYID_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/****** Object:  Stored Procedure dbo.INT_GetGRUNDYID_BOR    Script Date: 8/30/2006 2:04:50 PM ******/



















CREATE             proc dbo.INT_GetGRUNDYID_BOR 
  @ReturnValue       int OUTPUT,
  @PolicyNumber      nvarchar(50),
  @Status            nvarchar(50),
  @Date       nvarchar(50),
  @IssueDate nvarchar(50) = ''0''
  ,@TransDate nvarchar(10) = ''0''
as

SET NOCOUNT ON


If (@Status = ''C'')
SELECT @ReturnValue = max(GRUNDY_Cancel_ID) FROM GRUNDY_Cancel where [POLICY_NUM]= @PolicyNumber and [EFFECT_DATE]= @Date

If ((@Status = ''N'')or(@Status = ''R''))
SELECT @ReturnValue = max(GRUNDY_Policy_ID) FROM GRUNDY_Policy where [POLICY_NUM]= @PolicyNumber and [INCEPT_DATE]= @Date and ((upper(trans_code) like ''%NEW%'') or (upper(trans_code) like ''%REN%''))  and transdate = @Transdate

If (@Status = ''A'')
SELECT @ReturnValue = max(GRUNDY_Policy_ID) FROM GRUNDY_Policy where [POLICY_NUM]= @PolicyNumber and [VEH_EFF_DT]= @Date and [ISSUE_DATE]= @IssueDate and (not ((upper(trans_code) like ''%NEW%'') or (upper(trans_code) like ''%REN%'')))  and transdate = @Transdate

/* -- TESTING
if(@ReturnValue is null)
select @ReturnValue = 0
*/








' 
END
GO
