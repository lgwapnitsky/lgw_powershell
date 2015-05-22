IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetDataFromPolgenCompanyStateInfo_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[INT_GetDataFromPolgenCompanyStateInfo_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetDataFromPolgenCompanyStateInfo_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE   FUNCTION dbo.INT_GetDataFromPolgenCompanyStateInfo_BOR 
	(@FieldName varchar(100),
         @ProductInfoId int, 
         @CompanyId int,
         @StateCode Char(2))
RETURNS varchar(100)
AS
BEGIN
  DECLARE @OutputValue varchar(100) 

  SELECT @OutputValue = case @FieldName 
  WHEN ''NAIC_ID''
    THEN 
    (SELECT css.NAIC_ID
       from  POLGEN_Company_Info ci (nolock) left join POLGEN_Company_State_Specific css (nolock) on ci.Company_ID = css.Company_ID
             left join POLGEN_State_Codes sc (nolock) on css.State_ID = sc.State_ID
       WHERE ci.Company_ID=@CompanyId
             and 
             ci.Product_Info_ID=@ProductInfoId 
             and 
             sc.State_Code=@StateCode) 
    ELSE ''''
  End

  RETURN isnull(@OutputValue,'''')

END








' 
END

GO
