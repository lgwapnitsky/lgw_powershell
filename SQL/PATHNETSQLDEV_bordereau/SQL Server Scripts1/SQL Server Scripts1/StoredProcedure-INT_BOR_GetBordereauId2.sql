IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_GetBordereauId2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_BOR_GetBordereauId2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_GetBordereauId2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE     Procedure [dbo].[INT_BOR_GetBordereauId2] 
	@BordereauName varchar(50),
	@PolicyType int,
	@PolicyNumber varchar(15),
	@EffectiveDate datetime,
	@ExpirationDate datetime,
	@TransmissionDate datetime,
	@BordereauId int Output
As
Set NoCount On
-------------------------------------------------------------------------------------------
-- Procedure [INT_BOR_GetBordereauId2] - 
-- Developer:  
-- PARAMETERS:
-------------------------------------------------------------------------------------------
-- Change History:
-- FPT 12250		Production Issue - Cancel/Re-writes on F&W not working	
--	Developer	:	Sandip Mazumdar
--		Date	:	17/10/2008
--	Notes		:	If Policy got cancelled then return BordereauID=0.(FWA)
-------------------------------------------------------------------------------------------
--FPT 12250
Declare @gpolicynumber varchar(15),
		@policystatus  varchar(2)
/* New Renewal Policy */
if((@PolicyType = 1) or (@PolicyType = 2))
Begin -- New Renewal

IF @BordereauName=''CPH''
 Select @BordereauId=isnull((select top 1  rowid from cph_policy 
  where policynumber=@PolicyNumber and EffectiveDate=@EffectiveDate),0)

IF @BordereauName=''FT''
 Select @BordereauId=isnull((select top 1  rowid from ft_policy 
  where policynumber=@PolicyNumber and EffectiveDate=@EffectiveDate),0)

IF @BordereauName=''AI''
 Select @BordereauId=isnull((select top 1  rowid from AI_policy 
  where PolicyNumber=@PolicyNumber and EffectiveDate=@EffectiveDate),0)

IF @BordereauName=''FWA''
Begin
--	select @gpolicynumber=generatedpolicynumber from FWA_Policy where policynumber=@PolicyNumber 
--           and EffectiveDate=@EffectiveDate and ExpirationDate=@ExpirationDate and isnull(generatedpolicynumber,'''')>''''
--	select @policystatus=policystatus from apps.accessphly.dbo.policy where policynumber =@gpolicynumber
--	IF @policystatus=''06''  --FPT 12250 cancelled
--        Select @BordereauId=0
--	Else
		Select @BordereauId=isnull((select max(rowid) from FWA_policy     --fpt 12250
		where PolicyNumber=@PolicyNumber and EffectiveDate=@EffectiveDate and ExpirationDate=@ExpirationDate),0)
End

IF @BordereauName=''FT''
 Select @BordereauId=isnull((select top 1  rowid from FT_policy 
  where PolicyNumber=@PolicyNumber and EffectiveDate=@EffectiveDate),0)

/* FastCov -- zq 2007/07/10*/
IF @BordereauName=''FastCov''
 Select @BordereauId=isnull((select top 1  rowid from FastCov_policy 
  where PolicyNumber=@PolicyNumber and EffectiveDate=@EffectiveDate),0)

/* FastCovDO -- smz 2007/10/25*/
IF @BordereauName=''FastCovDO''
 Select @BordereauId=isnull((select top 1  rowid from FastCovDO_policy 
  where PolicyNumber=@PolicyNumber and EffectiveDate=@EffectiveDate),0)

End -- New Renewal

/* Endorsement Policy */
if(@PolicyType = 3)
Begin -- Endorsement

IF @BordereauName=''FWA''
 Select @BordereauId=isnull((select top 1  rowid from FWA_policy 
  where PolicyNumber=@PolicyNumber and TransactionCode = 55 and EffectiveDate=@EffectiveDate and TransDate=@TransmissionDate),0)

IF @BordereauName=''CPH''
 Select @BordereauId=isnull((select top 1  rowid from CPH_policy 
  where PolicyNumber=@PolicyNumber and EffectiveDate=@EffectiveDate),0)


End -- Endorsement

/* Cancel Policy */
if(@PolicyType = 4)
Begin -- Cancellation

IF @BordereauName=''FWA''
 Select @BordereauId=isnull((select top 1  rowid from FWA_cancel 
  where PolicyNumber=@PolicyNumber and CancelDate=@EffectiveDate),0)
IF @BordereauName=''CPH''
 Select @BordereauId=isnull((select top 1  rowid from CPH_cancel 
  where PolicyNumber=@PolicyNumber and CancelDate=@EffectiveDate),0)

End -- Cancellation
' 
END
GO
