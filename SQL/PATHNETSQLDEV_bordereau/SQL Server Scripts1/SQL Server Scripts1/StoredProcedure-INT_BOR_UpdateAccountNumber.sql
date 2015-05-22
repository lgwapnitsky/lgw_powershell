IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_UpdateAccountNumber]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_BOR_UpdateAccountNumber]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_UpdateAccountNumber]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


--CREATE 
CREATE     Procedure [dbo].[INT_BOR_UpdateAccountNumber] 
	@BordereauName varchar(50),
	@PolicyType int,
	@AccountNumber int,
	@BorId int
As
Set NoCount On


/* New Renewal Policy */
if((@PolicyType = 1) or (@PolicyType = 2))
Begin -- New Renewal


IF @BordereauName = ''FWA''
Begin -- FWA
Update FWA_Policy set AccountNumber = @AccountNumber where RowId = @BorId
End -- FWA


End -- New Renewal




/* Endorsement Policy */
if(@PolicyType = 3)
Begin -- Endorsement


IF @BordereauName = ''FWA''
Begin -- FWA
Update FWA_Policy set AccountNumber = @AccountNumber where RowId = @BorId
End -- FWA


End -- Endorsement




' 
END
GO
