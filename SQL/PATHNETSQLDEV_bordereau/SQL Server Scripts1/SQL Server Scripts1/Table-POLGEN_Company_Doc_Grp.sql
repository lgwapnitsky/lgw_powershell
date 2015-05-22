IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Doc_Grp]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Company_Doc_Grp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Doc_Grp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Company_Doc_Grp](
	[Company_Doc_Grp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Process_Doc_Grp_ID] [int] NOT NULL,
	[Company_Defined_Code] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastCodeOnly] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_POLGEN_Company_Doc_Grp] PRIMARY KEY CLUSTERED 
(
	[Company_Doc_Grp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_POLGEN_Company_Doc_Grp_LastCodeOnly]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POLGEN_Company_Doc_Grp] ADD  CONSTRAINT [DF_POLGEN_Company_Doc_Grp_LastCodeOnly]  DEFAULT ('N') FOR [LastCodeOnly]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Company_Doc_Grp_POLGEN_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Doc_Grp]'))
ALTER TABLE [dbo].[POLGEN_Company_Doc_Grp]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Company_Doc_Grp_POLGEN_Company_Info] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[POLGEN_Company_Info] ([Company_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Company_Doc_Grp_POLGEN_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Doc_Grp]'))
ALTER TABLE [dbo].[POLGEN_Company_Doc_Grp] CHECK CONSTRAINT [FK_POLGEN_Company_Doc_Grp_POLGEN_Company_Info]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Company_Doc_Grp_POLGEN_Process_Document_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Doc_Grp]'))
ALTER TABLE [dbo].[POLGEN_Company_Doc_Grp]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Company_Doc_Grp_POLGEN_Process_Document_Groups] FOREIGN KEY([Process_Doc_Grp_ID])
REFERENCES [dbo].[POLGEN_Process_Document_Groups] ([Process_Doc_Grp_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Company_Doc_Grp_POLGEN_Process_Document_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Doc_Grp]'))
ALTER TABLE [dbo].[POLGEN_Company_Doc_Grp] CHECK CONSTRAINT [FK_POLGEN_Company_Doc_Grp_POLGEN_Process_Document_Groups]
GO
