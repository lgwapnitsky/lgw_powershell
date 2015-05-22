IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_Master]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Document_Master]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_Master]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Document_Master](
	[Document_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Info_ID] [int] NOT NULL,
	[Document_Number] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Document_Editon] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Effective_Date] [datetime] NULL,
	[Document_Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Document_Status] [tinyint] NOT NULL,
	[Document_File_Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Decl_Page_Verbage] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Document_Order] [int] NULL,
	[Exclude_From_Invt_List] [int] NULL,
	[Has_Invt_Variable] [int] NULL,
	[Bypass_Elimination] [int] NULL,
 CONSTRAINT [PK_Document_Master] PRIMARY KEY CLUSTERED 
(
	[Document_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_Document_Master] UNIQUE NONCLUSTERED 
(
	[Product_Info_ID] ASC,
	[Document_Number] ASC,
	[Document_Editon] ASC,
	[Effective_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Document_Master_Document_Editon]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Document_Master] ADD  CONSTRAINT [DF_POLGEN_Document_Master_Document_Editon]  DEFAULT ('') FOR [Document_Editon]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Document_Master_Document_Order]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Document_Master] ADD  CONSTRAINT [DF_POLGEN_Document_Master_Document_Order]  DEFAULT (0) FOR [Document_Order]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Document_Master_Exclude_From_Invt_List]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Document_Master] ADD  CONSTRAINT [DF_POLGEN_Document_Master_Exclude_From_Invt_List]  DEFAULT (0) FOR [Exclude_From_Invt_List]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Document_Master_Has_Invt_Variable]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Document_Master] ADD  CONSTRAINT [DF_POLGEN_Document_Master_Has_Invt_Variable]  DEFAULT (0) FOR [Has_Invt_Variable]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Document_Master_Bypass_Elimination]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Document_Master] ADD  CONSTRAINT [DF_POLGEN_Document_Master_Bypass_Elimination]  DEFAULT (0) FOR [Bypass_Elimination]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_Master_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_Master]'))
ALTER TABLE [dbo].[POLGEN_Document_Master]  WITH CHECK ADD  CONSTRAINT [FK_Document_Master_Company_Info] FOREIGN KEY([Product_Info_ID])
REFERENCES [dbo].[POLGEN_Product_Info] ([Product_Info_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_Master_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_Master]'))
ALTER TABLE [dbo].[POLGEN_Document_Master] CHECK CONSTRAINT [FK_Document_Master_Company_Info]
GO
