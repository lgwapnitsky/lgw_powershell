IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_UpdateGRUNDYPolicyNumber_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_UpdateGRUNDYPolicyNumber_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_UpdateGRUNDYPolicyNumber_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/****** Object:  Stored Procedure dbo.INT_UpdateGRUNDYPolicyNumber_BOR    Script Date: 7/5/2006 8:53:53 AM ******/










CREATE      proc dbo.INT_UpdateGRUNDYPolicyNumber_BOR 
  @Bor_id            int,
  @PolicyNumber      varchar(20),
  @Bor_Status        varchar(1)
as

SET NOCOUNT ON



IF ((@Bor_Status = ''N'')or(@Bor_Status = ''R'')or(@Bor_Status = ''A''))
UPDATE GRUNDY_Policy set GenPolicyNumber=@PolicyNumber where GRUNDY_policy_ID = @Bor_id

' 
END
GO
