IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_Policy]') AND type in (N'U'))
DROP TABLE [dbo].[FT_Policy]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_Policy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FT_Policy](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyNumber] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PostalCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fax] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneExt] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InsuredCarrierRoute] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InsuredNameType] [int] NULL,
	[TransactionCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxOnPremium] [int] NULL,
	[ProgramCode] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[GeneratedPolicyNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_FT_Policy] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_PolicyNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_PolicyNumber]  DEFAULT ('') FOR [PolicyNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_EffectiveDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_EffectiveDate]  DEFAULT ('') FOR [EffectiveDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_ExpirationDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_ExpirationDate]  DEFAULT ('') FOR [ExpirationDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_Name]  DEFAULT ('') FOR [Name]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy]  DEFAULT ('') FOR [Address1]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_Address2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_Address2]  DEFAULT ('') FOR [Address2]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_City]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_City]  DEFAULT ('') FOR [City]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_State]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_State]  DEFAULT ('') FOR [State]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_1]  DEFAULT ('') FOR [PostalCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_Fax]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_Fax]  DEFAULT ('') FOR [Fax]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_Phone]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_Phone]  DEFAULT ('') FOR [Phone]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_PhoneExt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_PhoneExt]  DEFAULT ('') FOR [PhoneExt]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_InsuredCarrierRoute]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_InsuredCarrierRoute]  DEFAULT ('') FOR [InsuredCarrierRoute]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_InsuredNameType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_InsuredNameType]  DEFAULT ('') FOR [InsuredNameType]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_TransactionCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_TransactionCode]  DEFAULT ('') FOR [TransactionCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_TaxOnPremium]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_TaxOnPremium]  DEFAULT ('') FOR [TaxOnPremium]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_ProgramCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_ProgramCode]  DEFAULT ('') FOR [ProgramCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_2]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_GeneratedPolicyNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy] ADD  CONSTRAINT [DF_FT_Policy_GeneratedPolicyNumber]  DEFAULT ('') FOR [GeneratedPolicyNumber]
END

GO
