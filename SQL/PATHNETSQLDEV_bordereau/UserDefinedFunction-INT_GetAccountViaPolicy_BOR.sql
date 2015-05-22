IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetAccountViaPolicy_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[INT_GetAccountViaPolicy_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetAccountViaPolicy_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE        FUNCTION dbo.[INT_GetAccountViaPolicy_BOR] 
	(@Policy varchar(15))
RETURNS int
AS
-------------------------------------------------------------------------------------------
-- Procedure [INT_GetAccountViaPolicy_BOR] - Get account number from policy
-- Developer: 
-------------------------------------------------------------------------------------------
-- Changes:
-- FPT 12938 - Test bordereau on pathnetsqldev
--   Created by : Sandip Mazumdar 
--   Date       : 04-03-2009
-- Notes : This ticket changes are now for keeping bordereau and accessphly in the same server
  -- So er are removing server link whenever we are refering bordereau database  
-------------------------------------------------------------------------------------------
BEGIN
  Declare @accountnumber int 
  select @accountnumber = accountnumber
     from accessphly.dbo.policy  
     where Policynumber = @Policy
  if @accountnumber is null
  	select @accountnumber = 0
  RETURN @accountnumber

END

' 
END

GO
