IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_History]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Policy_History]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Policy_History](
	[Policy_Hist_ID] [int] IDENTITY(1,1) NOT NULL,
	[Policy_Num] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Effect_Date] [datetime] NOT NULL,
	[Exp_Date] [datetime] NOT NULL,
	[Issue_Bind_Date] [datetime] NULL,
	[Document_File_Name] [varchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XML_Data] [varchar](6000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Company_ID] [int] NULL,
	[APPS_Account] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Transmit_Date] [datetime] NULL,
	[ReprintRequested] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Generation_Date] [datetime] NULL,
	[Process_Doc_Grp_ID] [int] NULL,
	[Company_Defined_Code] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorse_Seq_Num] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Policy_History] PRIMARY KEY CLUSTERED 
(
	[Policy_Hist_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_History]') AND name = N'IX_Policy_History')
CREATE NONCLUSTERED INDEX [IX_Policy_History] ON [dbo].[POLGEN_Policy_History]
(
	[Policy_Num] ASC,
	[Effect_Date] ASC,
	[Exp_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Policy_History_POLGEN_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_History]'))
ALTER TABLE [dbo].[POLGEN_Policy_History]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Policy_History_POLGEN_Company_Info] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[POLGEN_Company_Info] ([Company_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Policy_History_POLGEN_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_History]'))
ALTER TABLE [dbo].[POLGEN_Policy_History] CHECK CONSTRAINT [FK_POLGEN_Policy_History_POLGEN_Company_Info]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Policy_History_POLGEN_Process_Document_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_History]'))
ALTER TABLE [dbo].[POLGEN_Policy_History]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Policy_History_POLGEN_Process_Document_Groups] FOREIGN KEY([Process_Doc_Grp_ID])
REFERENCES [dbo].[POLGEN_Process_Document_Groups] ([Process_Doc_Grp_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Policy_History_POLGEN_Process_Document_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_History]'))
ALTER TABLE [dbo].[POLGEN_Policy_History] CHECK CONSTRAINT [FK_POLGEN_Policy_History_POLGEN_Process_Document_Groups]
GO
