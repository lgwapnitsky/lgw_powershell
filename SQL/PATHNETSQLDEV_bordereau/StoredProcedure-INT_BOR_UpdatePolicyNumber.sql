IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_UpdatePolicyNumber]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_BOR_UpdatePolicyNumber]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_UpdatePolicyNumber]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


--CREATE
CREATE      Procedure [dbo].[INT_BOR_UpdatePolicyNumber] 
	@BordereauName varchar(50),
	@PolicyType int,
	@GeneratedPolicyNumber varchar(20),
	@BorId int
As
Set NoCount On


/* New Renewal Policy */
if((@PolicyType = 1) or (@PolicyType = 2))
Begin -- New Renewal


IF @BordereauName = ''AI''
Begin -- AI
Update AI_Policy set GeneratedPolicyNumber = @GeneratedPolicyNumber where RowId = @BorId
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
Update FWA_Policy set GeneratedPolicyNumber = @GeneratedPolicyNumber where RowId = @BorId
End -- FWA

IF @BordereauName = ''FT''
Begin -- FT
Update FT_Policy set GeneratedPolicyNumber = @GeneratedPolicyNumber where RowId = @BorId
End -- FT

IF @BordereauName = ''FastCov''
Begin -- FastCov
Update FastCov_Policy set GeneratedPolicyNumber = @GeneratedPolicyNumber where RowId = @BorId
End -- FastCov zq 07/10/2007

IF @BordereauName = ''FastCovDO''
Begin -- FastCovDO
Update FastCovDO_Policy set GeneratedPolicyNumber = @GeneratedPolicyNumber where RowId = @BorId
End -- FastCovDO smz 10/25/2007

IF @BordereauName = ''CPH''
Begin -- CPH
Update CPH_Policy set GeneratedPolicy = @GeneratedPolicyNumber where RowId = @BorId
End -- CPH

End -- New Renewal




/* Endorsement Policy */
if(@PolicyType = 3)
Begin -- Endorsement


IF @BordereauName = ''FWA''
Begin -- FWA
Update FWA_Policy set GeneratedPolicyNumber = @GeneratedPolicyNumber where RowId = @BorId
End -- FWA

IF @BordereauName = ''CPH''
Begin -- CPH
Update CPH_Policy set GeneratedPolicy = @GeneratedPolicyNumber where RowId = @BorId
End -- CPH

End -- Endorsement

/* Cancellation Policy */
if(@PolicyType = 4)
Begin -- Cancellation


IF @BordereauName = ''AI''
Begin -- AI
Update AI_Cancel set GeneratedPolicyNumber = @GeneratedPolicyNumber where RowId = @BorId
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
Update FWA_Cancel set GeneratedPolicyNumber = @GeneratedPolicyNumber where RowId = @BorId
End -- FWA

End -- Cancellation


' 
END
GO
