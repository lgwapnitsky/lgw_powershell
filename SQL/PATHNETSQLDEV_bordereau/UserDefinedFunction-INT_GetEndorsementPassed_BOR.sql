IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetEndorsementPassed_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[INT_GetEndorsementPassed_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetEndorsementPassed_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



--select dbo.INT_GetEndorsementPassed_BOR (''222'',null,null)


CREATE        FUNCTION dbo.INT_GetEndorsementPassed_BOR 
	(@Veh_End varchar(3),@Cov_End varchar(3),@Los_End varchar(3))
RETURNS varchar(3)
AS
BEGIN
  DECLARE @OutputValue varchar(3) 


  SELECT @OutputValue = ''  ''
  if @Veh_End is Not null  
  	select @OutputValue = @Veh_End
  if @Cov_End is Not null  
  	select @OutputValue = @Cov_End
  if @Los_End is Not null  
  	select @OutputValue = @Los_End
  
  RETURN @OutputValue

END








' 
END

GO
