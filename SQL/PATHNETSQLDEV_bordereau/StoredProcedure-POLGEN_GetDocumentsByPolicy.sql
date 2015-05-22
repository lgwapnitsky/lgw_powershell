IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_GetDocumentsByPolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_GetDocumentsByPolicy]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_GetDocumentsByPolicy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





CREATE        PROCEDURE dbo.POLGEN_GetDocumentsByPolicy

   @PolicyNumber as Varchar(255),
   @Process_Doc_Grp as int,
   @Endorse_Seq_Num  as int

AS
    SELECT distinct 
           DM.Document_ID,
           DM.Document_File_Name,
           DM.Document_Number,
           DM.Exclude_From_Invt_List,
           DM.Decl_Page_Verbage,
           DM.Decl_Page_Verbage,
           DM.Document_Editon,
           --DS.Policy_Image_Incl, We orginally had a different list of forms, a subset for grundy vs inaging
           1 as Policy_Image_Incl,
           DS.Agreed_Man,
           DS.Decl_Page_Verbage_Override,
           DS.Effective_Date,
           FC.Formula_Text,
           FC.Formula_Default_Value,
           FC.Formula_Type,
           DS.Attachment_Ind,
           DS.Document_State_ID,
           DM.Has_Invt_Variable,
           DM.Bypass_Elimination,
           DS.Bypass_Elimination as Bypass_Elim_Already_Issued,
           DS.Document_Order
      FROM POLGEN_Policy_History PH (nolock) left join POLGEN_Policy_Document_History PDH (nolock) on PH.Policy_Hist_ID = PDH.Policy_Hist_ID
           left join POLGEN_Document_State DS (nolock) on PDH.Document_State_ID = DS.Document_State_ID
           left join POLGEN_Document_Master DM (nolock) on DS.Document_ID = DM.Document_ID

           left join POLGEN_State_Codes SC (nolock) on DS.State_ID = SC.State_ID
           left join POLGEN_Formula_Conditions FC (nolock) on DS.Formula_ID = FC.Formula_ID

      WHERE PH.Policy_Num = @PolicyNumber	
            and
            PH.Process_Doc_Grp_ID = @Process_Doc_Grp
	    and 
            ( 
              (Endorse_Seq_Num = @Endorse_Seq_Num
               and 
               @Endorse_Seq_Num > 0
              )
              or
              @Endorse_Seq_Num < 1
            )
	
      Order By DS.Document_Order

      IF  @@error != 0
      BEGIN
        raiserror(''Failed in procedure POLGEN_GetDocumentsByPolicy'',16,1)
      END






' 
END
GO
