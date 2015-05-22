IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PIC_Producer_Check_View_5]'))
DROP VIEW [dbo].[PIC_Producer_Check_View_5]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PIC_Producer_Check_View_5]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PIC_Producer_Check_View_5
AS
SELECT     TOP (100) PERCENT effectiveYear, accountnumber, policynumber
FROM         dbo.Policy_PATHID_Information
WHERE     (PICProducer IS NULL)
GROUP BY effectiveYear, accountnumber, policynumber
ORDER BY effectiveYear, accountnumber, policynumber
' 
GO
