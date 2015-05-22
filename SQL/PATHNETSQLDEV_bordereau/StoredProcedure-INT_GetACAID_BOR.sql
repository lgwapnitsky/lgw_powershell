IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetACAID_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetACAID_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetACAID_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'











CREATE     proc dbo.INT_GetACAID_BOR 
  @ReturnValue       int OUTPUT,
  @MemberNumber      nvarchar(50),
  @EffDate           nvarchar(50),
  @Status            nvarchar(50),
  @CancelDate       nvarchar(50)
as

SET NOCOUNT ON



If (@Status = ''C'')
SELECT @ReturnValue = max(ACA_ID) FROM ACA_Policies where [MEMBER#]= @MemberNumber and [CANCEL DATE]= @CancelDate
else if (@Status = ''CLEAR'')
SELECT @ReturnValue = max(ACA_ID) FROM ACA_Policies where [MEMBER#]= @MemberNumber and [CANCEL DATE]= @CancelDate and [EFF DATE]= @EffDate
else
SELECT @ReturnValue = max(ACA_ID) FROM ACA_Policies where [MEMBER#]= @MemberNumber and [EFF DATE]= @EffDate


' 
END
GO
