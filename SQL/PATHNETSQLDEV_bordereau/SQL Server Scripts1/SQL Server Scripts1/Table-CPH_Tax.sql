IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPH_Tax]') AND type in (N'U'))
DROP TABLE [dbo].[CPH_Tax]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPH_Tax]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CPH_Tax](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyRowId] [int] NULL,
	[StateCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxAmt] [decimal](18, 0) NULL,
	[TaxCode] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_CPH_Tax] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_CPH_Tax_StateCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Tax] ADD  CONSTRAINT [DF_CPH_Tax_StateCode]  DEFAULT ('') FOR [StateCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_CPH_Tax_TaxAmt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Tax] ADD  CONSTRAINT [DF_CPH_Tax_TaxAmt]  DEFAULT (0) FOR [TaxAmt]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_CPH_Tax_TaxCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Tax] ADD  CONSTRAINT [DF_CPH_Tax_TaxCode]  DEFAULT ('') FOR [TaxCode]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CPH_Tax_FT_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[CPH_Tax]'))
ALTER TABLE [dbo].[CPH_Tax]  WITH NOCHECK ADD  CONSTRAINT [FK_CPH_Tax_FT_Policy] FOREIGN KEY([PolicyRowId])
REFERENCES [dbo].[CPH_Policy] ([RowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CPH_Tax_FT_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[CPH_Tax]'))
ALTER TABLE [dbo].[CPH_Tax] CHECK CONSTRAINT [FK_CPH_Tax_FT_Policy]
GO
