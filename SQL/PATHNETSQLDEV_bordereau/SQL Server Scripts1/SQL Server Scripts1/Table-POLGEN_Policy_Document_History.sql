IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_Document_History]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Policy_Document_History]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_Document_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Policy_Document_History](
	[Policy_Doc_Hist_ID] [int] IDENTITY(1,1) NOT NULL,
	[Policy_Hist_ID] [int] NULL,
	[Document_State_ID] [int] NULL,
	[Printed_For_Cust] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Policy_Document_History] PRIMARY KEY CLUSTERED 
(
	[Policy_Doc_Hist_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_Document_History]') AND name = N'IX_Policy_Document_History')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Policy_Document_History] ON [dbo].[POLGEN_Policy_Document_History]
(
	[Policy_Hist_ID] ASC,
	[Document_State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Policy_Document_History_POLGEN_Policy_History]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_Document_History]'))
ALTER TABLE [dbo].[POLGEN_Policy_Document_History]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Policy_Document_History_POLGEN_Policy_History] FOREIGN KEY([Policy_Hist_ID])
REFERENCES [dbo].[POLGEN_Policy_History] ([Policy_Hist_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Policy_Document_History_POLGEN_Policy_History]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_Document_History]'))
ALTER TABLE [dbo].[POLGEN_Policy_Document_History] CHECK CONSTRAINT [FK_POLGEN_Policy_Document_History_POLGEN_Policy_History]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Policy_Document_History_Document_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_Document_History]'))
ALTER TABLE [dbo].[POLGEN_Policy_Document_History]  WITH CHECK ADD  CONSTRAINT [FK_Policy_Document_History_Document_State] FOREIGN KEY([Document_State_ID])
REFERENCES [dbo].[POLGEN_Document_State] ([Document_State_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Policy_Document_History_Document_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Policy_Document_History]'))
ALTER TABLE [dbo].[POLGEN_Policy_Document_History] CHECK CONSTRAINT [FK_Policy_Document_History_Document_State]
GO
