IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Insert_Document_State]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_Insert_Document_State]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Insert_Document_State]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE        PROCEDURE dbo.POLGEN_Insert_Document_State

      @StateCode   as Char(2),
      @Product_Info_ID int,
      @Document_ID int,
      @Process_Doc_Grp_ID int,
      @Document_Type_ID int,
      @Company_ID int,
      @Formula_ID int,
      @Document_Order int,
      @Eff_Date_New varchar(255),
      @Policy_Image_Inclusion_Indicator varchar(255),
      @Agreed_Mandatory varchar(255),
      @Decl_Page_Verbage_Override varchar(255),
      @Attachment_Ind int

AS

/******************************************************************************
**		File: POLGEN_Insert_Document_State.sql
**		Name: POLGEN_Insert_Document_State
**		Desc: Insert into Polgen_Document_state table
**
**		Return values:
** 
**		Called by: IT personnel
**              
**		Parameters: 
      @StateCode   as Char(2),
      @Product_Info_ID int,
      @Document_ID int,
      @Process_Doc_Grp_ID int,
      @Document_Type_ID int,
      @Company_ID int,
      @Formula_ID int,
      @Document_Order int,
      @Eff_Date_New varchar(255),
      @Policy_Image_Inclusion_Indicator varchar(255),
      @Agreed_Mandatory varchar(255),
      @Decl_Page_Verbage_Override varchar(255),
      @Attachment_Ind int
**
**		Auth: INTERFACE
**		Date: 
*******************************************************************************
**		Change History
********************************************************************************/
------------------------------------------------------------------------------------------
-- 6/1/09 		SMZ 	FPT 14528 Change FormulaField from Null to parameterised
-- 10/7/09   pvenkate   FPT 16628 CA Bill of rights needs to be added to all CA Auto policies
-------------------------------------------------------------------------------------------

-- New
    Insert dbo.POLGEN_Document_State
      (
      State_ID,
      Product_Info_ID,
      Document_ID,
      Process_Doc_Grp_ID,
      Document_Type_ID,
      Company_ID,
      Formula_ID,
      Document_Order,
      Effective_Date,
      Policy_Image_Incl,
      Agreed_Man,
      Decl_Page_Verbage_Override,
      Attachment_Ind
      )
      values
      (
      dbo.INT_GetDataStateID_BOR(@StateCode,1), -- OK
      @Product_Info_ID,
      @Document_ID,
      @Process_Doc_Grp_ID,
      @Document_Type_ID,
      @Company_ID,
      @Formula_ID,  --      NULL,    FPT 14528
      @Document_Order,
      case 
        WHEN @Eff_Date_New = null THEN null
        ELSE @Eff_Date_New
        END,
      case 
        WHEN @Policy_Image_Inclusion_Indicator in (''1'', ''Y'') THEN 1     -- FPT 16628
        ELSE 0
        END,
      case 
        WHEN  @Agreed_Mandatory in (''AM'', ''1'', ''Y'') THEN 1				-- FPT 16628
        ELSE 0
        END,
      @Decl_Page_Verbage_Override,
      @Attachment_Ind
      )

IF  @@error != 0
  BEGIN
    raiserror(''Failed in procedure POLGEN_Insert_Document_State'',16,1)
  END

' 
END
GO
