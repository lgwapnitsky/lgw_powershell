IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_UpdateErrors]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_BOR_UpdateErrors]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BOR_UpdateErrors]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE     Procedure [dbo].[INT_BOR_UpdateErrors] 
	@BordereauName varchar(50),
	@PolicyType int,
	@BorId int,
	@ErrorId int
As
Set NoCount On
/*
-------------------------------------------------------------------------------------------
-- Procedure [INT_BOR_UpdateErrors]  
-- Developer:  
-- Created by:
-- PURPOSE: 
-- PARAMETERS:
--		NONE
-- DEV NOTES:
--		NONE
-------------------------------------------------------------------------------------------
-- Change History:
-------------------------------------------------------------------------------------------
--FPT 48610			Modify Interface database jobs to import new BondPro bordereau data into APPS
--	Developer	:	sysmun
--		Date	:	11/11/2011
--	Notes		:	Allow for BondPro policies to be approved through Proc 
-------------------------------------------------------------------------------------------
*/

Declare @RowCount int


/* New Renewal Policy */
if((@PolicyType = 1) or (@PolicyType = 2))
Begin -- New Renewal


IF @BordereauName = ''AI''
Begin -- AI
insert into AI_Policy_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
select @RowCount = count(*) from AI_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
insert into AI_Policy_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
insert into FWA_Policy_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
select @RowCount = count(*) from FWA_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
insert into FWA_Policy_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- FWA

IF @BordereauName = ''FT''
Begin -- FT
insert into FT_Policy_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
select @RowCount = count(*) from FT_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
insert into FT_Policy_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- FT

/* FastCov - zq 7/10/2007 */
IF @BordereauName = ''FastCov''
Begin -- FastCov
insert into FastCov_Policy_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
select @RowCount = count(*) from FastCov_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
insert into FastCov_Policy_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- FastCov

/* FastCovDO - smz 10/25/2007 */
IF @BordereauName = ''FastCovDO''
Begin -- FastCovDO
insert into FastCovDO_Policy_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
select @RowCount = count(*) from FastCovDO_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
insert into FastCovDO_Policy_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- FastCov

/* CPH - smz 11/09/2007 */
IF @BordereauName = ''CPH''
Begin -- CPH
insert into CPH_Policy_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
select @RowCount = count(*) from CPH_Policy_Errors where RowId = @BorId and ErrorId in (926, 927)

IF(@RowCount <= 0)
insert into CPH_Policy_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- CPH

/*SURETY - sysmun 11/14/2011*/
IF @BordereauName = ''SURETY''
BEGIN
	SELECT @RowCount = COUNT(*) FROM BondPro_PolicyErrors WHERE RowId = @BorId AND Error_Code IN (926, 927)

	IF (@RowCount <= 0)
		BEGIN
			UPDATE BondPro_PolicyErrors
			SET Error_Code = @ErrorId
			WHERE RowId = @BorId
		END
END

End -- New Renewal


/* Endorsement Policy */
if(@PolicyType = 3)
Begin -- Endorsement


IF @BordereauName = ''AI''
Begin -- AI
insert into AI_Policy_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
select @RowCount = count(*) from AI_Policy_Errors where RowId = @BorId and ErrorId in (2)

IF(@RowCount <= 0)
insert into AI_Policy_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
insert into FWA_Policy_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
select @RowCount = count(*) from FWA_Policy_Errors where RowId = @BorId and ErrorId in (2)

IF(@RowCount <= 0)
insert into FWA_Policy_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- FWA

IF @BordereauName = ''CPH''
Begin -- CPH
insert into CPH_Policy_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
select @RowCount = count(*) from CPH_Policy_Errors where RowId = @BorId and ErrorId in (2)

IF(@RowCount <= 0)
insert into CPH_Policy_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- CPH

/*SURETY - sysmun 11/14/2011*/
IF @BordereauName = ''SURETY''
BEGIN
	SELECT @RowCount = COUNT(*) FROM BondPro_PolicyErrors WHERE RowId = @BorId AND Error_Code IN (2)

	IF (@RowCount <= 0)
		BEGIN
			UPDATE BondPro_PolicyErrors
			SET Error_Code = @ErrorId
			WHERE RowId = @BorId
		END
END

End -- Endorsement

/* Cancellation Policy */
if(@PolicyType = 4)
Begin -- Cancellation

IF @BordereauName = ''AI''
Begin -- AI
insert into AI_Cancel_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
insert into AI_Cancel_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- AI

IF @BordereauName = ''FWA''
Begin -- FWA
insert into FWA_Cancel_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
insert into FWA_Cancel_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- FWA

IF @BordereauName = ''CPH''
Begin -- CPH
insert into CPH_Cancel_Errors_Archive(RowId, ErrorId) values (@BorId, @ErrorId)
insert into CPH_Cancel_Errors(RowId, ErrorId) values (@BorId, @ErrorId)
End -- CPH


End -- Cancellation


' 
END
GO
