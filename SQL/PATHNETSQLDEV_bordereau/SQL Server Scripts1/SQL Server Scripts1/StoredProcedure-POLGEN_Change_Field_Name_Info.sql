IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Change_Field_Name_Info]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_Change_Field_Name_Info]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Change_Field_Name_Info]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



Create      PROCEDURE dbo.POLGEN_Change_Field_Name_Info

      @Document_ID int,
      @Field_Name_Text varchar(255),
      @Field_Occurs_On_PDF int,
      @Field_Start_Occurs_Here int,
      @Field_End_Occurs_Here int,
      @Ignore_Inclusion int

AS

    Update dbo.POLGEN_Field_Name_Info
      set
      Field_Rule_ID =  0,
      Field_Occurs_On_PDF = @Field_Occurs_On_PDF,
      Field_Start_Occurs_Here = @Field_Start_Occurs_Here,
      Field_End_Occurs_Here = @Field_End_Occurs_Here, 
      Ignore_Inclusion = @Ignore_Inclusion,
      User_Field_Name = null
      where Document_ID = @Document_ID
            and 
            Field_Name_Text = @Field_Name_Text


IF  @@error != 0
  BEGIN
    raiserror(''Failed in procedure POLGEN_Insert_Field_Name_Info'',16,1)
  END



' 
END
GO
