IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_DeleteERRORS_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_DeleteERRORS_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_DeleteERRORS_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/****** Object:  Stored Procedure dbo.INT_DeleteERRORS_BOR    Script Date: 7/11/2006 2:17:38 PM ******/

/****** Object:  Stored Procedure dbo.INT_DeleteERRORS_BOR    Script Date: 7/5/2006 8:53:53 AM ******/











CREATE         proc [dbo].[INT_DeleteERRORS_BOR] 
  @Bor_Name          varchar(20),
  @Bor_id            int,
  @Bor_Status        varchar(1) = ''N''
as

SET NOCOUNT ON



declare @COUNTROWS int,
        @Status int

select @COUNTROWS = -1

IF @Bor_Name = ''ACA''
BEGIN -- 1
	DELETE FROM ACA_ERRORS WHERE aca_id=@Bor_id
END -- 1

IF @Bor_Name = ''GRUNDY''
BEGIN -- 2

	IF @Bor_Status = ''C''
		DELETE FROM GRUNDY_CANCEL_ERRORS WHERE grundy_cancel_id=@Bor_id
	ELSE IF @Bor_Status = ''A''
	BEGIN -- 22
		-- Do not delete from the errors if the policy is successful endorsement - 2 Error Code
		select @COUNTROWS = count(*) from grundy_policy_errors where grundy_policy_id=@Bor_id and error_id in (2)

		IF(@COUNTROWS <= 0)
		DELETE FROM GRUNDY_POLICY_ERRORS WHERE grundy_policy_id=@Bor_id
	END -- 22
	ELSE
	BEGIN -- 21
		-- Do not delete from the errors if the policy is approved 926 Error Code
		select @COUNTROWS = count(*) from grundy_policy_errors where grundy_policy_id=@Bor_id and error_id in (926,927)

		IF(@COUNTROWS <= 0)
		DELETE FROM GRUNDY_POLICY_ERRORS WHERE grundy_policy_id=@Bor_id
	END -- 21

END --2


if((@Bor_Name <> ''ACA'') and (@Bor_Name <> ''GRUNDY''))
begin -- Fast Track

select @Status = case  
                       when @Bor_Status = ''C'' then 4
                       when @Bor_Status = ''A'' then 3
                       else 1
                 end 

Exec dbo.INT_BOR_DeleteErrors @Bor_Name, @Status, @Bor_id
 
end -- Fast Track






' 
END
GO
