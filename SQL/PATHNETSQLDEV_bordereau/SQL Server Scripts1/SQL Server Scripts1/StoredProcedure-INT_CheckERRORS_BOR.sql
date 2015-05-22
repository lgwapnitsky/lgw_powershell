IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_CheckERRORS_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_CheckERRORS_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_CheckERRORS_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE              proc dbo.INT_CheckERRORS_BOR 
  @IsProcessed       char(1) OUTPUT,
  @Bor_Name          varchar(20),
  @Bor_id            int,
  @Bor_Status        varchar(10)
as


SET NOCOUNT ON


DECLARE @RowCount int
select @RowCount = -1

IF @Bor_Name = ''ACA''
BEGIN -- 1

IF @Bor_Status=''A'' or @Bor_Status=''CLEAR''
SELECT @IsProcessed = ''Y''
ELSE
BEGIN -- 12
IF @Bor_Status=''N'' or @Bor_Status=''R'' or @Bor_Status=''C''
SELECT @RowCount = count(*) from ACA_ERRORS where ACA_ID=@Bor_id and ERROR_ID in (300,326,329,2,926,927,141)

IF (@RowCount > 0) 
SELECT @IsProcessed = ''Y''
ELSE
SELECT @IsProcessed = ''N''
END -- 12

END -- 1

-- GRUNDY
ELSE IF @Bor_Name = ''GRUNDY''
BEGIN -- 2

IF @Bor_Status=''C''
SELECT @RowCount = count(*) from GRUNDY_Cancel_ERRORS where Grundy_Cancel_ID=@Bor_id and ERROR_ID in (300,326,329,2,926,927,141,148)

If ((@Bor_Status = ''N'')or(@Bor_Status = ''R''))
SELECT @RowCount = COUNT(*) FROM GRUNDY_Policy_ERRORS where Grundy_Policy_ID=@Bor_id and ERROR_ID in (300,326,329,2,926,927,141,19)

If (@Bor_Status = ''A'')
SELECT @RowCount = COUNT(*) FROM GRUNDY_Policy_ERRORS where Grundy_Policy_ID=@Bor_id and ERROR_ID in (300,326,329,2,926,927,141,19)

IF (@RowCount > 0) 
SELECT @IsProcessed = ''Y''
ELSE
SELECT @IsProcessed = ''N''

END -- 2


' 
END
GO
