IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_SendMail_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_SendMail_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_SendMail_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE   proc [dbo].[INT_SendMail_BOR]
   @From			sysname    = NULL,      
   @From_Name		VARCHAR(2000) = NULL,  
   @To				VARCHAR(MAX)  = NULL, 
   @Subject         VARCHAR(2000),
   @Message         VARCHAR(2000)
as 
-------------------------------------------------------------------------------------------
-- Procedure [INT_SendMail_BOR] - Send mail from inside SQL Server
-- Developer: 
-------------------------------------------------------------------------------------------
-- Changes:
-- FPT 12938 - Test bordereau on pathnetsqldev
--   Created by : Sandip Mazumdar 
--   Date       : 04-03-2009
-- Notes : The current change is to make use of dbmail of sql 2005 instead of SMTP mail used in SQL 2000 
-------------------------------------------------------------------------------------------
SET NOCOUNT ON

exec msdb.dbo.sp_send_dbmail @profile_name = ''Bordereau_Prod'',
					@recipients=@To,
					@subject = @Subject,
					@body = @Message,
					@body_format = ''HTML''

' 
END
GO
