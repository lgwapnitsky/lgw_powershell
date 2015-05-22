IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_Replacement]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Document_Replacement]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_Replacement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Document_Replacement](
	[Replacement_ID] [int] NOT NULL,
	[Document_ID] [int] NOT NULL,
	[Old_Document_ID] [int] NOT NULL,
 CONSTRAINT [PK_POLGEN_Document_Replacement] PRIMARY KEY NONCLUSTERED 
(
	[Replacement_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_Replacement]') AND name = N'IX_POLGEN_Document_Replacement')
CREATE UNIQUE CLUSTERED INDEX [IX_POLGEN_Document_Replacement] ON [dbo].[POLGEN_Document_Replacement]
(
	[Document_ID] ASC,
	[Old_Document_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Document_Replacement_POLGEN_Document_Master]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_Replacement]'))
ALTER TABLE [dbo].[POLGEN_Document_Replacement]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Document_Replacement_POLGEN_Document_Master] FOREIGN KEY([Document_ID])
REFERENCES [dbo].[POLGEN_Document_Master] ([Document_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Document_Replacement_POLGEN_Document_Master]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Document_Replacement]'))
ALTER TABLE [dbo].[POLGEN_Document_Replacement] CHECK CONSTRAINT [FK_POLGEN_Document_Replacement_POLGEN_Document_Master]
GO
