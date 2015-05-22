IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_FindPrevPolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_FindPrevPolicy]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_FindPrevPolicy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

--exec POLGEN_FindPrevPolicy 1, ''GD2222-00''

CREATE          PROCEDURE dbo.POLGEN_FindPrevPolicy

@CompanyID as int,
@PolicyNum as varchar(255)

AS

Declare @PrevPolicyNum as varchar(20)
Declare @PolicyNumLen as int
    

If @CompanyID =  1 -- Grundy specific
Begin
    -- get length of string
    Select @PolicyNumLen = DATALENGTH(@PolicyNum)
    -- get rid of last 3 characters, a Grundy specific rule
    Select @PrevPolicyNum = SUBSTRING(@PolicyNum, 1, @PolicyNumLen - 3) 


    Select top 1 * 
      From POLGEN_Policy_History (nolock)
      Where Policy_Num like @PrevPolicyNum + ''%''
            and 
            Policy_Num < @PolicyNum
      Order by Policy_Num desc
End

IF  @@error != 0
BEGIN
  raiserror(''Failed in procedure POLGEN_FindPrevPolicy'',16,1)
END




' 
END
GO
