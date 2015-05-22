IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_UpdateACAProcessedRows_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_UpdateACAProcessedRows_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_UpdateACAProcessedRows_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'









CREATE   proc dbo.INT_UpdateACAProcessedRows_BOR 
  @ACA_XLS_ID      int,
  @ProcessedRows       int 
as

SET NOCOUNT ON


UPDATE Arch_ACA_XLS SET RowsProcessed = @ProcessedRows 
WHERE Arch_ACA_XLS_ID = @ACA_XLS_ID

' 
END
GO
