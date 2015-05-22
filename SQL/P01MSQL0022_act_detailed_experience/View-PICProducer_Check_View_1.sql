IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PICProducer_Check_View_1]'))
DROP VIEW [dbo].[PICProducer_Check_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PICProducer_Check_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PICProducer_Check_View_1
AS
SELECT     effectiveYear, PICProducer
FROM         dbo.PICProducer_Check
WHERE     (effectiveYear > 2003)
' 
GO
