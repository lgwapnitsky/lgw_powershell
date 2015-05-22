IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_greatest]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_greatest]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_greatest]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function fn_greatest(@number1 float, @number2 float=0,@number3 float=0,@number4 float=0,@number5 float=0,@number6 float=0,
@number7 float=0,@number8 float=0,@number9 float=0,@number10 float=0)
returns float

as
begin
return case when @number1>=@number2 and @number1>=@number3 and @number1>=@number4 and @number1>=@number5 and 
@number1>=@number6 and @number1>=@number7 and @number1>=@number9 and @number1>=@number9 and @number1>=@number10
then @number1 
 when  @number2>=@number3 and @number2>=@number4 and @number2>=@number5 and 
@number2>=@number6 and @number2>=@number7 and @number2>=@number9 and @number2>=@number9 and @number2>=@number10
then @number2 
 when @number3>=@number4 and @number3>=@number5 and 
@number3>=@number6 and @number3>=@number7 and @number3>=@number9 and @number3>=@number9 and @number3>=@number10
then @number3 
 when   @number4>=@number5 and 
@number4>=@number6 and @number4>=@number7 and @number4>=@number9 and @number4>=@number9 and @number4>=@number10
then @number4 
 when @number5>=@number6 and @number5>=@number7 and @number5>=@number9 and @number5>=@number9 and @number5>=@number10
then @number5 
 when @number6>=@number7 and @number6>=@number9 and @number6>=@number9 and @number6>=@number10
then @number6 
 when @number7>=@number9 and @number7>=@number9 and @number7>=@number10
then @number7 
 when  @number8>=@number9 and @number8>=@number10
then @number8
 when  @number9>=@number10
then @number9 
else @number10
end
end ' 
END

GO
