IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_GetDocuIssuedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_GetDocuIssuedList]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_GetDocuIssuedList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




--exec POLGEN_GetDocuIssuedList ''GD14042954-00''


CREATE           PROCEDURE dbo.POLGEN_GetDocuIssuedList

@PolicyNumber as Varchar(255)

AS
    SELECT DS.Document_ID, 
           MAX(PH.Endorse_Seq_Num) as Endorse_Seq_Num,
           MAX(PH.Policy_Num) as Policy_Num
      FROM POLGEN_Policy_History PH (nolock) left join POLGEN_Policy_Document_History PDH (nolock) on PH.Policy_Hist_ID = PDH.Policy_Hist_ID
           left join POLGEN_Document_State DS (nolock) on PDH.Document_State_ID = DS.Document_State_ID
      Group by DS.Document_ID, 
               DS.Document_Order,
               PH.Policy_Num
      Having PH.Policy_Num = @PolicyNumber	
      Order By DS.Document_Order

      IF  @@error != 0
      BEGIN
        raiserror(''Failed in procedure POLGEN_GetDocuIssuedList'',16,1)
      END







' 
END
GO
