IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_GetDocumentFields]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_GetDocumentFields]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_GetDocumentFields]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





CREATE         PROCEDURE dbo.POLGEN_GetDocumentFields

   @DocumentID as INT

AS
    SELECT
      FNI.Field_Name_Text,
      FNI.Field_Occurs_On_PDF,
      FNI.Field_Start_Occurs_Here,
      FNI.Field_End_Occurs_Here,
      FNI.Ignore_Inclusion
    FROM
       POLGEN_Document_Master DM (nolock),
       POLGEN_Field_Name_Info FNI (nolock)
    WHERE
       DM.Document_ID = FNI.Document_ID
       AND
       DM.Document_ID = @DocumentID

    IF  @@error != 0
    BEGIN
      raiserror(''Failed in procedure POLGEN_GetDocumentFields'',16,1)
    END






' 
END
GO
