IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetDataStateID_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[INT_GetDataStateID_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetDataStateID_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE        FUNCTION dbo.INT_GetDataStateID_BOR 
	(@StateCode varchar(2),@ProductInfoId int)
RETURNS  int
AS
BEGIN
  DECLARE @OutputValue int
  
  SELECT @OutputValue = 0
  SELECT @OutputValue=State_ID from POLGEN_State_Codes WHERE State_Code=@StateCode and Product_Info_ID=@ProductInfoId

  RETURN @OutputValue

END


' 
END

GO
