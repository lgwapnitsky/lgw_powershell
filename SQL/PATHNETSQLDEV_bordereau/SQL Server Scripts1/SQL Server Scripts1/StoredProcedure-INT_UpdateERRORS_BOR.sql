IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_UpdateERRORS_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_UpdateERRORS_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_UpdateERRORS_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


/****** Object:  Stored Procedure dbo.INT_UpdateERRORS_BOR    Script Date: 7/11/2006 2:17:38 PM ******/

/****** Object:  Stored Procedure dbo.INT_UpdateERRORS_BOR    Script Date: 7/5/2006 8:53:53 AM ******/














CREATE          proc [dbo].[INT_UpdateERRORS_BOR] 
  @Bor_Name          varchar(20),
  @Bor_id            int,
  @Error_id          int,
  @Bor_Status        varchar(1) = ''N''
as

SET NOCOUNT ON


declare @COUNTROWS int,
        @Status    int
select @COUNTROWS = -1

IF @Bor_Name = ''ACA''
BEGIN -- 1
	INSERT INTO ACA_ERRORS (ACA_ID, ERROR_ID) values (@Bor_id, @Error_id)

	INSERT INTO Arch_ACA_ERRORS (ACA_ID, ERROR_ID) values (@Bor_id, @Error_id)
END -- 1

IF @Bor_Name = ''GRUNDY''
BEGIN -- 2

	IF (@Bor_Status = ''C'')
	BEGIN  -- 22
		INSERT INTO GRUNDY_CANCEL_ERRORS(GRUNDY_CANCEL_ID, ERROR_ID) values (@Bor_id, @Error_id)

		insert into arch_grundy_cancel_errors(grundy_cancel_id,error_id) values (@Bor_id, @Error_id)
	END -- 22
	ELSE IF (@Bor_Status = ''A'')
	BEGIN -- 22
                -- Do not insert if there is a successful endorsement - 2 error code
		select @COUNTROWS = count(*) from grundy_policy_errors where grundy_policy_id=@Bor_id and error_id in (2)

		IF(@COUNTROWS <= 0)
		BEGIN -- 23
			INSERT INTO GRUNDY_POLICY_ERRORS(GRUNDY_POLICY_ID, ERROR_ID) values (@Bor_id, @Error_id)
		END -- 23

		insert into arch_grundy_policy_errors(grundy_policy_id,error_id) values (@Bor_id, @Error_id)
	END -- 22
	ELSE 
	BEGIN -- 21
                -- Do not insert if there is a successful approved policy - 926 error code
		select @COUNTROWS = count(*) from grundy_policy_errors where grundy_policy_id=@Bor_id and error_id in (926,927)

		IF(@COUNTROWS <= 0)
		BEGIN -- 23
			INSERT INTO GRUNDY_POLICY_ERRORS(GRUNDY_POLICY_ID, ERROR_ID) values (@Bor_id, @Error_id)
		END -- 23

		insert into arch_grundy_policy_errors(grundy_policy_id,error_id) values (@Bor_id, @Error_id)
	END -- 21

END --2


if((@Bor_Name <> ''ACA'') and (@Bor_Name <> ''GRUNDY''))
begin -- Fast Track

select @Status = case  
                       when @Bor_Status = ''C'' then 4
                       when @Bor_Status = ''A'' then 3
                       else 1
                 end 

Exec dbo.INT_BOR_UpdateErrors @Bor_Name, @Status, @Bor_id, @Error_id
 
end -- Fast Track




' 
END
GO
