IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_DetermineReprint_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[INT_DetermineReprint_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_DetermineReprint_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

--select  dbo.INT_DetermineReprint_BOR(''RPT'')
--select  dbo.INT_DetermineReprint_BOR(''NEWRPT'')
--select  dbo.INT_DetermineReprint_BOR(''REN'')

create         FUNCTION dbo.INT_DetermineReprint_BOR 
	(@FieldName varchar(9))
RETURNS varchar(1)
AS
BEGIN
  DECLARE @OutputValue varchar(1) 
  if PatIndex(''%RPT%'', @FieldName) > 0 
     set @OutputValue = ''1''
  else
     set @OutputValue = '' ''

  RETURN @OutputValue

END


' 
END

GO
