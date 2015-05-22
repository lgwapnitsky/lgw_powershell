IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_Cancel]') AND type in (N'U'))
DROP TABLE [dbo].[FT_Cancel]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_Cancel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FT_Cancel](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyNumber] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[CancelDate] [datetime] NULL,
	[CancelType] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InsuredName] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_FT_Cancel] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Cancel_PolicyNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Cancel] ADD  CONSTRAINT [DF_FT_Cancel_PolicyNumber]  DEFAULT ('') FOR [PolicyNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Cancel_EffectiveDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Cancel] ADD  CONSTRAINT [DF_FT_Cancel_EffectiveDate]  DEFAULT ('') FOR [EffectiveDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Cancel_ExpirationDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Cancel] ADD  CONSTRAINT [DF_FT_Cancel_ExpirationDate]  DEFAULT ('') FOR [ExpirationDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Cancel_CancelDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Cancel] ADD  CONSTRAINT [DF_FT_Cancel_CancelDate]  DEFAULT ('') FOR [CancelDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Cancel_CancelType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Cancel] ADD  CONSTRAINT [DF_FT_Cancel_CancelType]  DEFAULT ('') FOR [CancelType]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Cancel_InsuredName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Cancel] ADD  CONSTRAINT [DF_FT_Cancel_InsuredName]  DEFAULT ('') FOR [InsuredName]
END

GO
