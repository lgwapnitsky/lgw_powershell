IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_Tax]') AND type in (N'U'))
DROP TABLE [dbo].[FT_Tax]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_Tax]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FT_Tax](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyRowId] [int] NULL,
	[StateCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxAmt] [decimal](15, 2) NULL,
	[TaxCode] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_FT_Tax] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Tax_StateCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Tax] ADD  CONSTRAINT [DF_FT_Tax_StateCode]  DEFAULT ('') FOR [StateCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Tax_TaxAmt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Tax] ADD  CONSTRAINT [DF_FT_Tax_TaxAmt]  DEFAULT (0) FOR [TaxAmt]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Tax_TaxCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Tax] ADD  CONSTRAINT [DF_FT_Tax_TaxCode]  DEFAULT ('') FOR [TaxCode]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FT_Tax_FT_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[FT_Tax]'))
ALTER TABLE [dbo].[FT_Tax]  WITH NOCHECK ADD  CONSTRAINT [FK_FT_Tax_FT_Policy] FOREIGN KEY([PolicyRowId])
REFERENCES [dbo].[FT_Policy] ([RowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FT_Tax_FT_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[FT_Tax]'))
ALTER TABLE [dbo].[FT_Tax] CHECK CONSTRAINT [FK_FT_Tax_FT_Policy]
GO
