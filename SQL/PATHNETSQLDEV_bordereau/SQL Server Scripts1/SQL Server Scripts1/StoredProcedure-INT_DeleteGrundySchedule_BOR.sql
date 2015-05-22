IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_DeleteGrundySchedule_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_DeleteGrundySchedule_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_DeleteGrundySchedule_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/****** Object:  Stored Procedure dbo.INT_DeleteGrundySchedule_BOR    Script Date: 8/30/2006 2:04:50 PM ******/











CREATE         proc dbo.INT_DeleteGrundySchedule_BOR 
  @PolNum    varchar(10),
  @EffDate   varchar(10)
 ,@TransDate nvarchar(10) = ''0''
as

SET NOCOUNT ON



DELETE FROM GRUNDY_SCHEDULE WHERE policy_num=ltrim(rtrim(@PolNum)) and effect_date=ltrim(rtrim(@EffDate)) and transdate = @TransDate

' 
END
GO
