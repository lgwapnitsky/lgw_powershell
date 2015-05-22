IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetProcDocGrpVIATrans_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[INT_GetProcDocGrpVIATrans_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetProcDocGrpVIATrans_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE   FUNCTION dbo.INT_GetProcDocGrpVIATrans_BOR 
	(@TransCode varchar(9))
RETURNS int
AS
BEGIN
  DECLARE @Process_Doc_Grp_ID int

  SELECT Top 1 @Process_Doc_Grp_ID = Process_Doc_Grp_ID
  from dbo.POLGEN_Company_Doc_Grp (nolock)
  where Company_Defined_Code = right(@TransCode,LastCodeOnly)

  RETURN @Process_Doc_Grp_ID

END








' 
END

GO
