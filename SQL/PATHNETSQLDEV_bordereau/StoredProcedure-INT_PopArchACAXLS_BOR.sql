IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_PopArchACAXLS_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_PopArchACAXLS_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_PopArchACAXLS_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'









CREATE  proc dbo.INT_PopArchACAXLS_BOR 
  @IDValue       int OUTPUT,
  @XLSName       varchar(100)
as

SET NOCOUNT ON


INSERT INTO Arch_ACA_XLS (XLS_Name) values (@XLSName)

SET @IDValue = @@IDENTITY

' 
END
GO
