IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetACATownCode_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetACATownCode_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetACATownCode_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'







CREATE       proc dbo.INT_GetACATownCode_BOR 
  @Code       int OUTPUT,
  @CoverageType varchar(50),
  @State      varchar(50),
  @City       varchar(50),
  @Zip       varchar(50)
as

SET NOCOUNT ON


SET @Code = 0

select @State = upper(@State)
select @City = upper(@City)
select @CoverageType = upper(@CoverageType)
select @Zip = upper(@Zip)
select @Code = 0

IF(@CoverageType=''LIAB'')
BEGIN -- 1

IF((@State=''AL'')or(@State=''AR'')or(@State=''DE'')or(@State=''FL'')or(@State=''GA'')or(@State=''IL'')
    or(@State=''KY'')or(@State=''MN'')or(@State=''NC'')or(@State=''ND'')or(@State=''NJ'')or(@State=''NY'')
    or(@State=''SC''))
BEGIN -- 11

if exists(select * from ACA_TownCode where State=@State and Zip=@zip and city is null)
select top 1 @Code = TownCode from ACA_TownCode where State=@State and Zip=@zip and city is null

if exists(select * from ACA_TownCode where State=@State and City=@City and State is null)
select top 1 @Code = TownCode from ACA_TownCode where State=@State and City=@City and State is null

if exists(select * from ACA_TownCode where State=@State and Zip=@zip and City=@City)
select top 1 @Code = TownCode from ACA_TownCode where State=@State and Zip=@zip and City=@City

END -- 11

END -- 1

IF(@CoverageType=''AUTO'')
BEGIN -- 2

IF((@State=''AL'')or(@State=''AR'')or(@State=''DE'')or(@State=''FL'')or(@State=''GA'')or(@State=''IL'')
    or(@State=''KY'')or(@State=''MN'')or(@State=''NC'')or(@State=''ND'')or(@State=''NJ'')or(@State=''NY'')
    or(@State=''SC'')or(@State=''TX'')or(@State=''MA''))
BEGIN -- 21

if exists(select * from ACA_TownCode where State=@State and Zip=@zip and city is null)
select top 1 @Code = TownCode from ACA_TownCode where State=@State and Zip=@zip and city is null

if exists(select * from ACA_TownCode where State=@State and City=@City and State is null)
select top 1 @Code = TownCode from ACA_TownCode where State=@State and City=@City and State is null

if exists(select * from ACA_TownCode where State=@State and Zip=@zip and City=@City)
select top 1 @Code = TownCode from ACA_TownCode where State=@State and Zip=@zip and City=@City

END -- 21

END -- 2


' 
END
GO
