IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetACAProcessedRows_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetACAProcessedRows_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetACAProcessedRows_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'












CREATE      proc dbo.INT_GetACAProcessedRows_BOR 
  @Rows int OUTPUT
as

SET NOCOUNT ON



if exists(SELECT * from Arch_ACA_XLS where totalnoofrows <> rowsprocessed)
SELECT @Rows = sum(RowsProcessed) from Arch_ACA_XLS where totalnoofrows <> rowsprocessed
else
SELECT @Rows = 0

' 
END
GO
