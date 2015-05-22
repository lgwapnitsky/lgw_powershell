IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_DeletePreviousRecords]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_BOR_DeletePreviousRecords]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_DeletePreviousRecords]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--CREATE
CREATE    Procedure [dbo].[INT_BOR_DeletePreviousRecords] 
	@BordereauName varchar(50),
	@PolicyType int,
	@BorId int
As
Set NoCount On

/* New Renewal Endorsement Policy */
if((@PolicyType = 1) or (@PolicyType = 2) or (@PolicyType = 3))
Begin -- PolicyType

if(@BordereauName = ''AI'')
Begin -- AI
delete from AI_Coverage where PolicyRowId = @BorId
End -- AI

if(@BordereauName = ''FWA'')
Begin -- FWA
delete from FWA_Coverage where PolicyRowId = @BorId
delete from FWA_Tax where PolicyRowId = @BorId
delete from FWA_Location where PolicyRowId = @BorId
End -- FWA


if(@BordereauName = ''FT'')
Begin -- FT
delete from FT_Coverage where PolicyRowId = @BorId
delete from FT_Tax where PolicyRowId = @BorId
End -- FT

/* FastCov - zq 7/10/2007 */
if(@BordereauName = ''FastCov'')
Begin -- FastCov
delete from FastCov_Coverage where PolicyRowId = @BorId
delete from FastCov_Tax where PolicyRowId = @BorId
--delete from FastCov_Location where PolicyRowId = @BorId
End -- FastCov

/* FastCovDO - smz 10/25/2007 */
if(@BordereauName = ''FastCovDO'')
Begin -- FastCovDO
delete from FastCovDO_Coverage where PolicyRowId = @BorId
delete from FastCovDO_Tax where PolicyRowId = @BorId
End -- FastCovDO

/* CPH - smz 10/25/2007 */
if(@BordereauName = ''CPH'')
Begin -- CPH
delete from CPH_Coverage where PolicyRowId = @BorId
delete from CPH_Tax where PolicyRowId = @BorId
End -- CPH

End  -- PolicyType




' 
END
GO
