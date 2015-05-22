IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetDataFromPolgenCompanyInfo_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[INT_GetDataFromPolgenCompanyInfo_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetDataFromPolgenCompanyInfo_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'






CREATE       FUNCTION dbo.INT_GetDataFromPolgenCompanyInfo_BOR 
	(@FieldName varchar(100),@ProductInfoId int, @CompanyId int)
RETURNS varchar(100)
AS
BEGIN
  DECLARE @OutputValue varchar(100) 

  SELECT @OutputValue = case @FieldName 
  WHEN ''Full_Name'' THEN (SELECT Full_Name from POLGEN_Company_Info WHERE Company_ID=@CompanyId and Product_Info_ID=@ProductInfoId) 
  WHEN ''Address1'' THEN (SELECT Address1 from POLGEN_Company_Info WHERE Company_ID=@CompanyId and Product_Info_ID=@ProductInfoId) 
  WHEN ''CityName'' THEN (SELECT CityName from POLGEN_Company_Info WHERE Company_ID=@CompanyId and Product_Info_ID=@ProductInfoId) 
  WHEN ''StateAdd'' THEN (SELECT StateAdd from POLGEN_Company_Info WHERE Company_ID=@CompanyId and Product_Info_ID=@ProductInfoId) 
  WHEN ''ZipCode'' THEN (SELECT ZipCode from POLGEN_Company_Info WHERE Company_ID=@CompanyId and Product_Info_ID=@ProductInfoId) 
  WHEN ''ClaimPhone'' THEN (SELECT ClaimPhone from POLGEN_Company_Info WHERE Company_ID=@CompanyId and Product_Info_ID=@ProductInfoId) 
  ELSE ''''
  End

  RETURN @OutputValue

END







' 
END

GO
