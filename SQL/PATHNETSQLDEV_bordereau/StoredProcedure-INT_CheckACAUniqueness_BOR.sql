IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_CheckACAUniqueness_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_CheckACAUniqueness_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_CheckACAUniqueness_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'











CREATE     proc dbo.INT_CheckACAUniqueness_BOR 
  @ReturnValue       int OUTPUT,
  @MemberNumber      nvarchar(50),
  @EffDate           nvarchar(50),
  @Status            nvarchar(50),
  @CancelDate       nvarchar(50)
as

SET NOCOUNT ON


DECLARE @RowCount As int

If (@Status = ''C'')
SELECT @RowCount = COUNT(*) FROM ACA_Policies where [MEMBER#]= @MemberNumber and [CANCEL DATE]= @CancelDate
else if(@Status = ''CLEAR'')
SELECT @RowCount = COUNT(*) FROM ACA_Policies where [MEMBER#]= @MemberNumber and [CANCEL DATE]= @CancelDate and [EFF DATE]= @EffDate
else
SELECT @RowCount = COUNT(*) FROM ACA_Policies where [MEMBER#]= @MemberNumber and [EFF DATE]= @EffDate

-- Returns 1 if the record is new or else returns 2
IF @RowCount = 0
SET @ReturnValue = 1
ELSE
SET @ReturnValue = 2

' 
END
GO
