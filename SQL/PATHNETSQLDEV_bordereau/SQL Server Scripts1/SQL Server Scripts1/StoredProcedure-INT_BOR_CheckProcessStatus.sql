IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_CheckProcessStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_BOR_CheckProcessStatus]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_CheckProcessStatus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--CREATE
CREATE      Procedure [dbo].[INT_BOR_CheckProcessStatus] 
	@BordereauName varchar(50),
	@PolicyType int,
	@BorId int,
	@IsProcessed bit Output
As
---------------------------------------------------------------------------------------------
-- Procedure [INT_BOR_CheckProcessStatus] - Check whether it is already processed
-- Developer:
-------------------------------------------------------------------------------------------
-- Changes:
-- FPT 13155 - F&W XML failed in production
--   Created by : Sandip Mazumdar 
--   Date       : 01-29-2009
-------------------------------------------------------------------------------------------
Set NoCount On

select @IsProcessed = 0

Declare @RowCount int


/* New Renewal Policy */
if((@PolicyType = 1) or (@PolicyType = 2))
Begin -- New Renewal


IF @BordereauName = ''AI''
Begin -- AI
select @RowCount = count(*) from AI_Policy_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
														and  @BorId>0   --13155
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
select @RowCount = count(*) from FWA_Policy_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
														 and  @BorId>0   --13155

If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- FWA


IF @BordereauName = ''FT''
Begin -- FT
select @RowCount = count(*) from FT_Policy_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
														and  @BorId>0   --13155
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- FT

/* FastCov - zq 7/10/2007 */
IF @BordereauName = ''FastCov''
Begin -- FastCov
select @RowCount = count(*) from FastCov_Policy_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
															 and  @BorId>0   --13155
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- FastCov

/* FastCovDO - smz 10/25/2007 */
IF @BordereauName = ''FastCovDO''
Begin -- FastCovDO
select @RowCount = count(*) from FastCovDO_Policy_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
															   and  @BorId>0   --13155	
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- FastCovDO

/* CPH - smz 10/25/2007 */
IF @BordereauName = ''CPH''
Begin -- CPH
select @RowCount = count(*) from CPH_Policy_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
														 and  @BorId>0   --13155
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- CPH

End -- New Renewal



/* Endorsement Policy */
if(@PolicyType = 3)
Begin -- Endorsement


IF @BordereauName = ''AI''
Begin -- AI
select @RowCount = count(*) from AI_Policy_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
														and  @BorId>0   --13155
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
select @RowCount = count(*) from FWA_Policy_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
														 and  @BorId>0   --13155
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- FWA

IF @BordereauName = ''CPH''
Begin -- CPH
select @RowCount = count(*) from CPH_Policy_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
														 and  @BorId>0   --13155
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- CPH

End -- Endorsement



/* Cancellation Policy */
if(@PolicyType = 4)
Begin -- Cancellation


IF @BordereauName = ''AI''
Begin -- AI
select @RowCount = count(*) from AI_Cancel_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
														and  @BorId>0   --13155
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
select @RowCount = count(*) from FWA_Cancel_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
														 and  @BorId>0   --13155
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- FWA

IF @BordereauName = ''CPH''
Begin -- CPH
select @RowCount = count(*) from CPH_Cancel_Errors where RowId = @BorId and ErrorId in (300,326,329,2,926,927,141)
														 and  @BorId>0   --13155
If(@RowCount > 0)
select @IsProcessed = 1
else
select @IsProcessed = 0
End -- CPH

End -- Cancellation


' 
END
GO
