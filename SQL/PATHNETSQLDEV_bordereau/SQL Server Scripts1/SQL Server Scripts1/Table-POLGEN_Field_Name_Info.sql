IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Field_Name_Info]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Field_Name_Info]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Field_Name_Info]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Field_Name_Info](
	[Field_Name_ID] [int] IDENTITY(1,1) NOT NULL,
	[Document_ID] [int] NOT NULL,
	[Field_Name_Text] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Field_Rule_ID] [int] NULL,
	[Field_Occurs_On_PDF] [int] NOT NULL,
	[Field_Start_Occurs_Here] [int] NULL,
	[Field_End_Occurs_Here] [int] NOT NULL,
	[Ignore_Inclusion] [int] NULL,
	[User_Field_Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Field_Name_Info] PRIMARY KEY CLUSTERED 
(
	[Field_Name_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_Field_Name_Info] UNIQUE NONCLUSTERED 
(
	[Document_ID] ASC,
	[Field_Name_Text] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Field_Name_Info_Field_Occurs_On_PDF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Field_Name_Info] ADD  CONSTRAINT [DF_POLGEN_Field_Name_Info_Field_Occurs_On_PDF]  DEFAULT (0) FOR [Field_Occurs_On_PDF]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Field_Name_Info_Field_Start_Occurs_Here]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Field_Name_Info] ADD  CONSTRAINT [DF_POLGEN_Field_Name_Info_Field_Start_Occurs_Here]  DEFAULT (0) FOR [Field_Start_Occurs_Here]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Field_Name_Info_Field_End_Occurs_Here]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Field_Name_Info] ADD  CONSTRAINT [DF_POLGEN_Field_Name_Info_Field_End_Occurs_Here]  DEFAULT (0) FOR [Field_End_Occurs_Here]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Field_Name_Info_Ignore_Inclusion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Field_Name_Info] ADD  CONSTRAINT [DF_POLGEN_Field_Name_Info_Ignore_Inclusion]  DEFAULT (0) FOR [Ignore_Inclusion]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Field_Name_Info_POLGEN_Document_Master]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Field_Name_Info]'))
ALTER TABLE [dbo].[POLGEN_Field_Name_Info]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Field_Name_Info_POLGEN_Document_Master] FOREIGN KEY([Document_ID])
REFERENCES [dbo].[POLGEN_Document_Master] ([Document_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Field_Name_Info_POLGEN_Document_Master]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Field_Name_Info]'))
ALTER TABLE [dbo].[POLGEN_Field_Name_Info] CHECK CONSTRAINT [FK_POLGEN_Field_Name_Info_POLGEN_Document_Master]
GO
