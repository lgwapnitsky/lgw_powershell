IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Process_Document_Groups]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Process_Document_Groups]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Process_Document_Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Process_Document_Groups](
	[Process_Doc_Grp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Info_ID] [int] NOT NULL,
	[Process_Desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Process_Document_Groups] PRIMARY KEY CLUSTERED 
(
	[Process_Doc_Grp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_Process_Document_Groups] UNIQUE NONCLUSTERED 
(
	[Process_Doc_Grp_ID] ASC,
	[Product_Info_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Process_Document_Groups_Product_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Process_Document_Groups]'))
ALTER TABLE [dbo].[POLGEN_Process_Document_Groups]  WITH CHECK ADD  CONSTRAINT [FK_Process_Document_Groups_Product_Info] FOREIGN KEY([Product_Info_ID])
REFERENCES [dbo].[POLGEN_Product_Info] ([Product_Info_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Process_Document_Groups_Product_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Process_Document_Groups]'))
ALTER TABLE [dbo].[POLGEN_Process_Document_Groups] CHECK CONSTRAINT [FK_Process_Document_Groups_Product_Info]
GO
