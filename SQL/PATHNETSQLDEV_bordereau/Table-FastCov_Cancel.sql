IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FastCov_Cancel]') AND type in (N'U'))
DROP TABLE [dbo].[FastCov_Cancel]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FastCov_Cancel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FastCov_Cancel](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyNumber] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InsuredName] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[CancelType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CancelDate] [datetime] NULL,
	[CancelReason] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GeneratedPolicyNumber] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Cancel_PolicyNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Cancel] ADD  CONSTRAINT [DF_FastCov_Cancel_PolicyNumber]  DEFAULT ('') FOR [PolicyNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Cancel_InsuredName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Cancel] ADD  CONSTRAINT [DF_FastCov_Cancel_InsuredName]  DEFAULT ('') FOR [InsuredName]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Cancel_EffectiveDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Cancel] ADD  CONSTRAINT [DF_FastCov_Cancel_EffectiveDate]  DEFAULT ('') FOR [EffectiveDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Cancel_ExpirationDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Cancel] ADD  CONSTRAINT [DF_FastCov_Cancel_ExpirationDate]  DEFAULT ('') FOR [ExpirationDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Cancel_CancelType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Cancel] ADD  CONSTRAINT [DF_FastCov_Cancel_CancelType]  DEFAULT ('') FOR [CancelType]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Cancel_CancelDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Cancel] ADD  CONSTRAINT [DF_FastCov_Cancel_CancelDate]  DEFAULT ('') FOR [CancelDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Cancel_CancelReason]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Cancel] ADD  CONSTRAINT [DF_FastCov_Cancel_CancelReason]  DEFAULT ('') FOR [CancelReason]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Cancel_GeneratedPolicyNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Cancel] ADD  CONSTRAINT [DF_FastCov_Cancel_GeneratedPolicyNumber]  DEFAULT ('') FOR [GeneratedPolicyNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Cancel_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Cancel] ADD  CONSTRAINT [DF_FastCov_Cancel_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
