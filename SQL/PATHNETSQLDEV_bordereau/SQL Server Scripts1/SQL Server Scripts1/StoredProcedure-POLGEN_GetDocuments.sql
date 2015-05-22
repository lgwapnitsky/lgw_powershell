IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_GetDocuments]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_GetDocuments]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_GetDocuments]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'














CREATE                       PROCEDURE dbo.POLGEN_GetDocuments

   @Product_Info_ID as Int,
   @Company_ID as Int,
   @Process_Doc_Grp_ID as Int,
   @StateID  as Varchar(2),
   @EffectDate  as Datetime,
   @ExDate  as Datetime


AS

--Update POLGEN_Document_state set Company_ID = 1
--Update POLGEN_Document_state set Agreed_Man = 0
--Update POLGEN_Document_state set Decl_Page_Verbage_Override = ""
--Update POLGEN_Document_Master set Decl_Page_Verbage = ""
--Update POLGEN_Document_state set Policy_Image_Incl = 1
--Update POLGEN_Document_Master set Exclude_From_Invt_List = 0


--POLGEN_GetDocuments 1,1,1,"PA","01/01/005","12/31/007"

    SELECT
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
      DS.Bypass_Elimination as Bypass_Elim_Already_Issued
      --DM.Has_Invt_Variable as Bypass_Elim_Already_Issued
    FROM 
      POLGEN_Document_State DS (nolock) left join POLGEN_Document_Master DM (nolock) on DM.Document_ID = DS.Document_ID
      left join POLGEN_State_Codes SC (nolock) on DS.State_ID = SC.State_ID
      left join POLGEN_Formula_Conditions FC (nolock) on DS.Formula_ID = FC.Formula_ID
    WHERE
      SC.State_Status = 1 
      AND 
      DM.Document_Status = 1
      AND
      DS.Product_Info_ID = @Product_Info_ID
      AND
      DS.Company_ID = @Company_ID
      AND
      DS.Process_Doc_Grp_ID = @Process_Doc_Grp_ID
      AND
      SC.State_Code = @StateID
      AND
      DS.Effective_Date <= @EffectDate
      and
      DS.Active_For_State = 1
    Order By
      DS.Document_Order


    IF  @@error != 0
    BEGIN
      raiserror(''Failed in procedure POLGEN_GetDocuments'',16,1)
    END





' 
END
GO
