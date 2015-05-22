IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetACATotalRows_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetACATotalRows_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetACATotalRows_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'












CREATE      proc dbo.INT_GetACATotalRows_BOR 
  @Rows int OUTPUT
as

SET NOCOUNT ON


if exists(SELECT * from Arch_ACA_XLS where totalnoofrows <> rowsprocessed)
SELECT @Rows = sum(TotalNoOfRows) from Arch_ACA_XLS where totalnoofrows <> rowsprocessed
else
SELECT @Rows = 0

' 
END
GO
