IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetACATerritoryCode_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetACATerritoryCode_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetACATerritoryCode_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





CREATE     proc dbo.INT_GetACATerritoryCode_BOR 
  @Code       smallint OUTPUT,
  @State      varchar(50),
  @City       varchar(50)
as

SET NOCOUNT ON


DECLARE @RowCount As int
SET @RowCount = 0
SET @Code = 0

select @State = upper(@State)
select @City = upper(@City)

SELECT @RowCount = COUNT(*) FROM ACA_Territory where State = @State and City = @City

IF @RowCount = 0
BEGIN -- 1
IF EXISTS (SELECT * FROM ACA_Territory where State = @State and City = ''DEFAULT'')
SELECT top 1 @Code = Code FROM ACA_Territory where State = @State and City = ''DEFAULT''
END
ELSE  -- 1
SELECT top 1 @Code = Code FROM ACA_Territory where State = @State and City = @City

' 
END
GO
