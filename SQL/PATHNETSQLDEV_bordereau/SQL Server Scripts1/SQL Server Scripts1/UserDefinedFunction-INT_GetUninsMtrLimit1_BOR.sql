IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetUninsMtrLimit1_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[INT_GetUninsMtrLimit1_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetUninsMtrLimit1_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'




--select top 10 * from phlydev8.accessphly_qa.dbo.policy where Policynumber like ''gd%''
--select dbo.INT_GetUninsMtrLimit1_BOR (''PA'')

CREATE        FUNCTION dbo.INT_GetUninsMtrLimit1_BOR 
	(@State_CD varchar(2))
RETURNS varchar(25)
AS
BEGIN
  
  RETURN ''200.00''

END





' 
END

GO
