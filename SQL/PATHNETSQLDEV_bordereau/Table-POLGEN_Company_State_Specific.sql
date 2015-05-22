IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_State_Specific]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Company_State_Specific]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_State_Specific]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Company_State_Specific](
	[Company_ID] [int] NOT NULL,
	[State_ID] [int] NOT NULL,
	[NAIC_ID] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_POLGEN_Company_State_NAIC] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC,
	[State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_State_Specific]') AND name = N'IX_POLGEN_Company_State_NAIC')
CREATE NONCLUSTERED INDEX [IX_POLGEN_Company_State_NAIC] ON [dbo].[POLGEN_Company_State_Specific]
(
	[State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_State_Specific]') AND name = N'IX_POLGEN_Company_State_NAIC_1')
CREATE NONCLUSTERED INDEX [IX_POLGEN_Company_State_NAIC_1] ON [dbo].[POLGEN_Company_State_Specific]
(
	[State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Company_State_NAIC_POLGEN_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_State_Specific]'))
ALTER TABLE [dbo].[POLGEN_Company_State_Specific]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Company_State_NAIC_POLGEN_Company_Info] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[POLGEN_Company_Info] ([Company_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Company_State_NAIC_POLGEN_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_State_Specific]'))
ALTER TABLE [dbo].[POLGEN_Company_State_Specific] CHECK CONSTRAINT [FK_POLGEN_Company_State_NAIC_POLGEN_Company_Info]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Company_State_NAIC_POLGEN_State_Codes]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_State_Specific]'))
ALTER TABLE [dbo].[POLGEN_Company_State_Specific]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Company_State_NAIC_POLGEN_State_Codes] FOREIGN KEY([State_ID])
REFERENCES [dbo].[POLGEN_State_Codes] ([State_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Company_State_NAIC_POLGEN_State_Codes]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_State_Specific]'))
ALTER TABLE [dbo].[POLGEN_Company_State_Specific] CHECK CONSTRAINT [FK_POLGEN_Company_State_NAIC_POLGEN_State_Codes]
GO
