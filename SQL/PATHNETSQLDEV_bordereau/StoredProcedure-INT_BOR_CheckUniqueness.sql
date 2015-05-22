IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_CheckUniqueness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_BOR_CheckUniqueness]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_CheckUniqueness]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*
-------------------------------------------------------------------------------------------
-- Procedure INT_BOR_CheckUniqueness - 
-- Developer:  
-- PARAMETERS:
-------------------------------------------------------------------------------------------
-- Change History:
-- FPT 12250		Production Issue - Cancel/Re-writes on F&W not working	
--	Developer	:	Sandip Mazumdar
--		Date	:	11/10/2008
--	Notes		:	Change Policy status check from bordereau to Accessphly.
-------------------------------------------------------------------------------------------
-- Changes:
-- FPT 12938 - Test bordereau on pathnetsqldev
--   Created by : Sandip Mazumdar 
--   Date       : 04-03-2009
-- Notes : This ticket changes are now for keeping bordereau and accessphly in the same server
  -- So er are removing server link whenever we are refering bordereau database  
-------------------------------------------------------------------------------------------
-- FPT 15237	:	FW Borderau not in APPS The Breathable Body, LLC - FW642GL-01
-- Developer	:	Prasanna Govindarajan
-- Date			:	02/23/2010
-- Notes		:	The Checks for the existence of a policy, where the policy number is 
					compared using the format ''%642GL%'' for a given effective & expiration 
					date. In this case there was another policy which is already processed 
					whose policy number (FW65642GL-01) satisfied the above format, with the 
					same effective & expiration date. The format can be changed to ''642GL%'', 
					to solve this issue.
-------------------------------------------------------------------------------------------
*/
Create Procedure  [dbo].[INT_BOR_CheckUniqueness] 
	@BordereauName varchar(50),
	@PolicyType int,
	@PolicyNumber varchar(15),
	@EffectiveDate datetime,
	@TransmissionDate datetime,
	@IsUnique bit Output
As
Set NoCount On

select @IsUnique = 1

/* New Renewal Policy */
if((@PolicyType = 1) or (@PolicyType = 2))
Begin -- New Renewal

--FPT 12250
--select @PolicyNumber = ''%'' + @PolicyNumber + ''%''
--	IF exists (select * from accessphly.dbo.policy where 
--		policystatus = ''02'' and		effectivedate =@EffectiveDate and 
--		policynumber like @PolicyNumber)
--
--		SET @IsUnique=0
--	Else
--		SET @IsUnique=1
-- 
IF @BordereauName=''CPH''
Begin -- CPH
 IF exists (SELECT * FROM cph_policy WHERE policynumber=@PolicyNumber and effectivedate=@EffectiveDate)
  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- CPH

IF @BordereauName=''FT''
Begin -- FT
 IF exists (SELECT * FROM FT_policy WHERE policynumber=@PolicyNumber and effectivedate=@EffectiveDate)
  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- FT

IF @BordereauName = ''AI''
Begin -- AI
 IF exists (SELECT * FROM AI_policy WHERE PolicyNumber=@PolicyNumber and EffectiveDate=@EffectiveDate)
  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA  
 --IF exists (SELECT * FROM FWA_policy (nolock) WHERE PolicyNumber=@PolicyNumber and EffectiveDate=@EffectiveDate)
 	select @PolicyNumber = @PolicyNumber + ''%''
	IF exists (select * from accessphly.dbo.policy 
		where 
		policystatus in  (''02'',''04'')    
        and
		effectivedate =@EffectiveDate and 
		policynumber like ''FW'' + @PolicyNumber)

  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- FWA

/* FastCov */
IF @BordereauName = ''FastCov''
Begin -- FastCov
 IF exists (SELECT * FROM FastCov_policy (nolock) WHERE PolicyNumber=@PolicyNumber and EffectiveDate=@EffectiveDate and TransDate=@TransmissionDate)
  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- FastCov
/* FastCovDO */
IF @BordereauName = ''FastCovDO''
Begin -- FastCovDO
 IF exists (SELECT * FROM FastCovDO_policy (nolock) WHERE PolicyNumber=@PolicyNumber and EffectiveDate=@EffectiveDate and TransactionDate=@TransmissionDate)
  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- FastCovDO


End -- New Renewal




/* Endorsement Policy */
if(@PolicyType = 3)
Begin -- Endorsement


IF @BordereauName = ''FWA''
Begin -- FWA 
 IF exists (SELECT * FROM FWA_policy WHERE PolicyNumber=@PolicyNumber and TransactionCode = 55 and EffectiveDate=@EffectiveDate and TransDate=@TransmissionDate)
 
  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- FWA


End -- Endorsement




/* Cancellation Policy */
if(@PolicyType = 4)
Begin -- Cancellation

IF @BordereauName=''CPH''
Begin -- CPH
 IF exists (SELECT * FROM cph_Cancel WHERE policynumber=@PolicyNumber and CancelDate=@EffectiveDate)
  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- CPH

IF @BordereauName=''FT''
Begin -- FT
 IF exists (SELECT * FROM FT_Cancel WHERE policynumber=@PolicyNumber and CancelDate=@EffectiveDate)
  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- FT

IF @BordereauName = ''AI''
Begin -- AI
 IF exists (SELECT * FROM AI_Cancel WHERE PolicyNumber=@PolicyNumber and CancelDate=@EffectiveDate)
  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
 IF exists (SELECT * FROM FWA_Cancel  WHERE PolicyNumber=@PolicyNumber and CancelDate=@EffectiveDate)
  SET @IsUnique=0
 else
  SET @IsUnique=1
End -- FWA

End -- Cancellation
' 
END
GO
