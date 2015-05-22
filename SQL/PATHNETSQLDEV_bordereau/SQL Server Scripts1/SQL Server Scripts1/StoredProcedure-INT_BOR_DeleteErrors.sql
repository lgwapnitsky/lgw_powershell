IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_DeleteErrors]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_BOR_DeleteErrors]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_DeleteErrors]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE     Procedure [dbo].[INT_BOR_DeleteErrors]
	@BordereauName varchar(50),
	@PolicyType int,
	@BorId int
As
Set NoCount On

Declare @RowCount int

/* New Renewal Policy */
if((@PolicyType = 1) or (@PolicyType = 2))
Begin -- New Renewal


IF @BordereauName = ''AI''
Begin -- AI
select @RowCount = count(*) from AI_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
Delete from AI_Policy_Errors where RowId = @BorId
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
select @RowCount = count(*) from FWA_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
Delete from FWA_Policy_Errors where RowId = @BorId
End -- FWA

IF @BordereauName = ''FastCov''
Begin -- FastCov
select @RowCount = count(*) from FastCov_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
Delete from FastCov_Policy_Errors where RowId = @BorId
End -- FastCov

IF @BordereauName = ''FastCovDO''
Begin -- FastCovDO
select @RowCount = count(*) from FastCovDO_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
Delete from FastCovDO_Policy_Errors where RowId = @BorId
End -- FastCovDO

IF @BordereauName = ''FT''
Begin -- FT
select @RowCount = count(*) from FT_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
Delete from FT_Policy_Errors where RowId = @BorId
End -- FT

IF @BordereauName = ''CPH''
Begin -- CPH
select @RowCount = count(*) from CPH_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
Delete from CPH_Policy_Errors where RowId = @BorId
End -- CPH

End -- New Renewal




/* Endorsement Policy */
if(@PolicyType = 3)
Begin -- Endorsement


IF @BordereauName = ''AI''
Begin -- AI
select @RowCount = count(*) from AI_Policy_Errors where RowId = @BorId and ErrorId in (2)

IF(@RowCount <= 0)
Delete from AI_Policy_Errors where RowId = @BorId
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
select @RowCount = count(*) from FWA_Policy_Errors where RowId = @BorId and ErrorId in (2)

IF(@RowCount <= 0)
Delete from FWA_Policy_Errors where RowId = @BorId
End -- FWA

IF @BordereauName = ''CPH''
Begin -- CPH
select @RowCount = count(*) from CPH_Policy_Errors where RowId = @BorId and ErrorId in (2)

IF(@RowCount <= 0)
Delete from CPH_Policy_Errors where RowId = @BorId
End -- CPH

End -- Endorsement



/* Cancellation Policy */
if(@PolicyType = 4)
Begin -- Cancellation


IF @BordereauName = ''AI''
Begin -- AI
delete from AI_Cancel_Errors where RowId = @BorId
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
delete from FWA_Cancel_Errors where RowId = @BorId
End -- FWA

IF @BordereauName = ''CPH''
Begin -- CPH
delete from CPH_Cancel_Errors where RowId = @BorId
End -- CPH

End -- Cancellation



' 
END
GO
