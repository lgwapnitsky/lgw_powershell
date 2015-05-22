IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_GetDocumentFormula]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_GetDocumentFormula]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_GetDocumentFormula]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE       PROCEDURE dbo.POLGEN_GetDocumentFormula

   @DocumentID as INT


AS
     SELECT
       FC.Formula_Text
     FROM
       POLGEN_Document_Master DM (nolock),
       POLGEN_Document_State DS (nolock),
       POLGEN_Formula_Conditions FC (nolock)
     WHERE
       DM.Document_ID = DS.Document_ID
       AND
       DS.Formula_ID =  FC.Formula_ID
       AND
       FC.Formula_Status = 1

     IF  @@error != 0
     BEGIN
       raiserror(''Failed in procedure POLGEN_GetDocumentFormula'',16,1)
     END




' 
END
GO
