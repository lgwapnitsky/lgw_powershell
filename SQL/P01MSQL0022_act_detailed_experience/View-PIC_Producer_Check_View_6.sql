IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PIC_Producer_Check_View_6]'))
DROP VIEW [dbo].[PIC_Producer_Check_View_6]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PIC_Producer_Check_View_6]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PIC_Producer_Check_View_6
AS
SELECT     dbo.APPS_Only_Policies_2_test.policynumber, dbo.PIC_Producer_test.producercode, 
                      dbo.PIC_Producer_test.policynumber AS PIC_Producer_test_policynumber, dbo.APPS_Only_Policies_2_test.PICProducer, 
                      dbo.APPS_Only_Policies_2_test.PrimaryProducer, dbo.PATH_INFO_ONLY_test.PICProducer AS PathPICProducer, 
                      dbo.PATH_INFO_ONLY_test.PrimaryProducer AS PATHPrimaryProducer, 
                      dbo.PATH_INFO_ONLY_test.Policynumber_or_PATHID AS PATHPolicynumber_or_PATHID, 
                      dbo.APPS_Only_Policies_2_test.Policynumber_or_PATHID
FROM         dbo.PATH_INFO_ONLY_test LEFT OUTER JOIN
                      dbo.APPS_Only_Policies_2_test ON 
                      dbo.PATH_INFO_ONLY_test.Policynumber_or_PATHID = dbo.APPS_Only_Policies_2_test.Policynumber_or_PATHID AND 
                      dbo.PATH_INFO_ONLY_test.idnum = dbo.APPS_Only_Policies_2_test.idnum LEFT OUTER JOIN
                      dbo.PIC_Producer_test ON dbo.APPS_Only_Policies_2_test.policynumber = dbo.PIC_Producer_test.policynumber
' 
GO
