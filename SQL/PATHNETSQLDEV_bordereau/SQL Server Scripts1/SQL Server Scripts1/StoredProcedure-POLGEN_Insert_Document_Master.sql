IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Insert_Document_Master]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_Insert_Document_Master]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Insert_Document_Master]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE        PROCEDURE [dbo].[POLGEN_Insert_Document_Master]

      @Product_Info_ID			int,
      @Document_Number			varchar(255),
      @Document_Editon			varchar(255) = null,
      @Effective_Date			Datetime = null,
      @Document_Name			varchar(255) = null,
      @Document_Status			tinyint,
	  @Document_File_Name		varchar(255) = null,
	  @Decl_Page_Verbage		varchar(255) = null,
      @Document_Order			int,
      @Exclude_From_Invt_List	int = null,
      @Has_Invt_Variable		int = null,
      @Bypass_Elimination		int = null

AS
-- New
    Insert dbo.POLGEN_Document_Master
      ( Product_Info_ID, Document_Number, Document_Editon, Effective_Date,Document_Name,
      Document_Status, Document_File_Name,Decl_Page_Verbage,Document_Order, Exclude_From_Invt_List, 
      Has_Invt_Variable, Bypass_Elimination )
      values
      ( @Product_Info_ID, @Document_Number, @Document_Editon, @Effective_Date, @Document_Name,
        @Document_Status, @Document_File_Name, @Decl_Page_Verbage, @Document_Order, @Exclude_From_Invt_List,
        @Has_Invt_Variable, @Bypass_Elimination  )

IF  @@error != 0
  BEGIN
    raiserror(''Failed in procedure POLGEN_Insert_Document_State'',16,1)
  END

' 
END
GO
