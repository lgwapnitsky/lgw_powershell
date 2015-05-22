IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FastCov_Policy]') AND type in (N'U'))
DROP TABLE [dbo].[FastCov_Policy]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FastCov_Policy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FastCov_Policy](
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
	[Phone] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Company] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AgencyNumber] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransactionCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransDate] [datetime] NULL,
	[GeneratedPolicyNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL,
	[AgentNumber] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RegionCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountNumber] [int] NULL,
 CONSTRAINT [PK_FastCov_Policy] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__Polic__04BA9F53]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__Polic__04BA9F53]  DEFAULT ('') FOR [PolicyNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__Effec__05AEC38C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__Effec__05AEC38C]  DEFAULT ('') FOR [EffectiveDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__Expir__06A2E7C5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__Expir__06A2E7C5]  DEFAULT ('') FOR [ExpirationDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__Name__07970BFE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__Name__07970BFE]  DEFAULT ('') FOR [Name]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__Addre__088B3037]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__Addre__088B3037]  DEFAULT ('') FOR [Address1]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__Addre__097F5470]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__Addre__097F5470]  DEFAULT ('') FOR [Address2]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__City__0A7378A9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__City__0A7378A9]  DEFAULT ('') FOR [City]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__State__0B679CE2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__State__0B679CE2]  DEFAULT ('') FOR [State]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__Posta__0C5BC11B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__Posta__0C5BC11B]  DEFAULT ('') FOR [PostalCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__Phone__0E44098D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__Phone__0E44098D]  DEFAULT ('') FOR [Phone]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Policy_Company]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF_FastCov_Policy_Company]  DEFAULT ('') FOR [Company]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Policy_Product]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF_FastCov_Policy_Product]  DEFAULT ('') FOR [Product]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Policy_AgencyNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF_FastCov_Policy_AgencyNumber]  DEFAULT ('') FOR [AgencyNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__Trans__13FCE2E3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__Trans__13FCE2E3]  DEFAULT ('') FOR [TransactionCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Policy_TransDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF_FastCov_Policy_TransDate]  DEFAULT ('') FOR [TransDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Policy_GeneratedPolicyNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF_FastCov_Policy_GeneratedPolicyNumber]  DEFAULT ('') FOR [GeneratedPolicyNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Policy__Updat__1E7A7156]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF__FastCov_Policy__Updat__1E7A7156]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Policy_AgentNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF_FastCov_Policy_AgentNumber]  DEFAULT ('') FOR [AgentNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Policy_RegionCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF_FastCov_Policy_RegionCode]  DEFAULT ('') FOR [RegionCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Policy_AccountNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Policy] ADD  CONSTRAINT [DF_FastCov_Policy_AccountNumber]  DEFAULT (1) FOR [AccountNumber]
END

GO
