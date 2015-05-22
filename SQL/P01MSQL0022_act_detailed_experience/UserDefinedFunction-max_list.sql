IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[max_list]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[max_list]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[max_list]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[max_list] (@V1 float = NULL,@V2 float = NULL,@V3 float = NULL,@V4 float = NULL,@V5 float = NULL,@V6 float = NULL,@V7 float = NULL,@V8 float = NULL,@V9 float = NULL) 
RETURNS float AS
BEGIN 

    
    Declare @MaxV float


    Set @MaxV = @V1
    If ((@MaxV IS NULL) OR ((@V2 IS NOT NULL) AND (@MaxV < @V2))) Set @MaxV = @V2
    If ((@MaxV IS NULL) OR ((@V3 IS NOT NULL) AND (@MaxV < @V3))) Set @MaxV = @V3
    If ((@MaxV IS NULL) OR ((@V4 IS NOT NULL) AND (@MaxV < @V4))) Set @MaxV = @V4
    If ((@MaxV IS NULL) OR ((@V5 IS NOT NULL) AND (@MaxV < @V5))) Set @MaxV = @V5
    If ((@MaxV IS NULL) OR ((@V6 IS NOT NULL) AND (@MaxV < @V6))) Set @MaxV = @V6
    If ((@MaxV IS NULL) OR ((@V7 IS NOT NULL) AND (@MaxV < @V7))) Set @MaxV = @V7
    If ((@MaxV IS NULL) OR ((@V8 IS NOT NULL) AND (@MaxV < @V8))) Set @MaxV = @V8
    If ((@MaxV IS NULL) OR ((@V9 IS NOT NULL) AND (@MaxV < @V9))) Set @MaxV = @V9

    
    Return(@MaxV)

END

' 
END

GO
