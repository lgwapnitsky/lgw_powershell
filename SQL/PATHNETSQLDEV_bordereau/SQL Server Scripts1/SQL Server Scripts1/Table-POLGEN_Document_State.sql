IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Document_State]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Document_State](
	[Document_State_ID] [int] IDENTITY(1,1) NOT NULL,
	[State_ID] [int] NOT NULL,
	[Product_Info_ID] [int] NOT NULL,
	[Document_ID] [int] NOT NULL,
	[Process_Doc_Grp_ID] [int] NOT NULL,
	[Document_Type_ID] [int] NOT NULL,
	[Company_ID] [int] NULL,
	[Formula_ID] [int] NULL,
	[Document_Order] [int] NULL,
	[Effective_Date] [datetime] NULL,
	[Policy_Image_Incl] [int] NULL,
	[Agreed_Man] [int] NULL,
	[Decl_Page_Verbage_Override] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Attachment_Ind] [int] NULL,
	[Active_For_State] [int] NULL,
	[Bypass_Elimination] [int] NULL,
 CONSTRAINT [PK_Document_State] PRIMARY KEY CLUSTERED 
(
	[Document_State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_Document_State] UNIQUE NONCLUSTERED 
(
	[State_ID] ASC,
	[Document_ID] ASC,
	[Formula_ID] ASC,
	[Product_Info_ID] ASC,
	[Process_Doc_Grp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Document_State_Policy_Image_Incl]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Document_State] ADD  CONSTRAINT [DF_POLGEN_Document_State_Policy_Image_Incl]  DEFAULT (0) FOR [Policy_Image_Incl]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Document_State_Agreed_Man]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Document_State] ADD  CONSTRAINT [DF_POLGEN_Document_State_Agreed_Man]  DEFAULT (0) FOR [Agreed_Man]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Document_State_Attachment_Ind]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Document_State] ADD  CONSTRAINT [DF_POLGEN_Document_State_Attachment_Ind]  DEFAULT (0) FOR [Attachment_Ind]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Document_State_Active_For_State]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Document_State] ADD  CONSTRAINT [DF_POLGEN_Document_State_Active_For_State]  DEFAULT (1) FOR [Active_For_State]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Document_State_Bypass_Elimination]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Document_State] ADD  CONSTRAINT [DF_POLGEN_Document_State_Bypass_Elimination]  DEFAULT (0) FOR [Bypass_Elimination]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_State_Document_Master]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State]  WITH CHECK ADD  CONSTRAINT [FK_Document_State_Document_Master] FOREIGN KEY([Document_ID])
REFERENCES [dbo].[POLGEN_Document_Master] ([Document_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_State_Document_Master]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State] CHECK CONSTRAINT [FK_Document_State_Document_Master]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_State_Document_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State]  WITH CHECK ADD  CONSTRAINT [FK_Document_State_Document_Type] FOREIGN KEY([Document_Type_ID])
REFERENCES [dbo].[POLGEN_Document_Type] ([Document_Type_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_State_Document_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State] CHECK CONSTRAINT [FK_Document_State_Document_Type]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_State_Formula_Conditions]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State]  WITH CHECK ADD  CONSTRAINT [FK_Document_State_Formula_Conditions] FOREIGN KEY([Formula_ID])
REFERENCES [dbo].[POLGEN_Formula_Conditions] ([Formula_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_State_Formula_Conditions]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State] CHECK CONSTRAINT [FK_Document_State_Formula_Conditions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_State_State_Codes]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State]  WITH CHECK ADD  CONSTRAINT [FK_Document_State_State_Codes] FOREIGN KEY([State_ID], [Product_Info_ID])
REFERENCES [dbo].[POLGEN_State_Codes] ([State_ID], [Product_Info_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_State_State_Codes]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State] CHECK CONSTRAINT [FK_Document_State_State_Codes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Document_State_POLGEN_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Document_State_POLGEN_Company_Info] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[POLGEN_Company_Info] ([Company_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Document_State_POLGEN_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State] CHECK CONSTRAINT [FK_POLGEN_Document_State_POLGEN_Company_Info]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Document_State_POLGEN_Process_Document_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Document_State_POLGEN_Process_Document_Groups] FOREIGN KEY([Process_Doc_Grp_ID])
REFERENCES [dbo].[POLGEN_Process_Document_Groups] ([Process_Doc_Grp_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Document_State_POLGEN_Process_Document_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_State]'))
ALTER TABLE [dbo].[POLGEN_Document_State] CHECK CONSTRAINT [FK_POLGEN_Document_State_POLGEN_Process_Document_Groups]
GO
