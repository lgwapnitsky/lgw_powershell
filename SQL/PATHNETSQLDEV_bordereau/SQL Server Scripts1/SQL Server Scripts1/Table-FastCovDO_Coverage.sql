IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FastCovDO_Coverage]') AND type in (N'U'))
DROP TABLE [dbo].[FastCovDO_Coverage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FastCovDO_Coverage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FastCovDO_Coverage](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyRowId] [int] NULL,
	[CoverageCode] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClassCode] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LLOB] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subline] [int] NULL,
	[AnnualPremium] [decimal](15, 2) NULL,
	[Exposure] [decimal](15, 2) NULL,
	[LimitAggregate] [float] NULL,
	[LimitOccurance] [float] NULL,
	[MedPayLimit] [decimal](15, 2) NULL,
	[MiscModifier1] [decimal](15, 2) NULL,
	[MiscModifier2] [decimal](15, 2) NULL,
	[ExposureIndicator] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RetroDate] [datetime] NULL,
	[PriorDate] [datetime] NULL,
	[Deductible] [float] NULL,
	[TownCode] [int] NULL,
	[Sharedlimitind] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransactionCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransactionDate] [datetime] NULL,
	[RiskCopayMoldCode] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FastCovDO_Coverage] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCovDO_Coverage_CoverageCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF_FastCovDO_Coverage_CoverageCode]  DEFAULT ('') FOR [CoverageCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCovDO_Coverage_ClassCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF_FastCovDO_Coverage_ClassCode]  DEFAULT ('') FOR [ClassCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCovDO_Coverage_LLOB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF_FastCovDO_Coverage_LLOB]  DEFAULT ('') FOR [LLOB]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCovDO_Coverage_Subline]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF_FastCovDO_Coverage_Subline]  DEFAULT (0) FOR [Subline]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Coverage_AnnualPremium]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Coverage_AnnualPremium]  DEFAULT (0) FOR [AnnualPremium]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Coverage_Exposure]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Coverage_Exposure]  DEFAULT (0) FOR [Exposure]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCovDO_Coverage_LimitAggregate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF_FastCovDO_Coverage_LimitAggregate]  DEFAULT (0) FOR [LimitAggregate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCovDO_Coverage_LimitOccurance]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF_FastCovDO_Coverage_LimitOccurance]  DEFAULT (0) FOR [LimitOccurance]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCovDO_Coverage_MedPayLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF_FastCovDO_Coverage_MedPayLimit]  DEFAULT (0) FOR [MedPayLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Coverage_MiscModifier1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Coverage_MiscModifier1]  DEFAULT (0) FOR [MiscModifier1]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Coverage_MiscModifier2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Coverage_MiscModifier2]  DEFAULT (0) FOR [MiscModifier2]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Coverage_ExposureIndicator]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Coverage_ExposureIndicator]  DEFAULT ('N') FOR [ExposureIndicator]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Coverage_RetroDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Coverage_RetroDate]  DEFAULT (getdate()) FOR [RetroDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Coverage_PriorDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Coverage_PriorDate]  DEFAULT (getdate()) FOR [PriorDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCovDO_Coverage_Deductible]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF_FastCovDO_Coverage_Deductible]  DEFAULT (0) FOR [Deductible]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Coverage_TownCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Coverage_TownCode]  DEFAULT (0) FOR [TownCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Coverage_Sharedlimitind]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Coverage_Sharedlimitind]  DEFAULT ('Y') FOR [Sharedlimitind]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Covera__TransactionCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Covera__TransactionCode]  DEFAULT ('') FOR [TransactionCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCovDO_Coverage_TransactionDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF_FastCovDO_Coverage_TransactionDate]  DEFAULT (getdate()) FOR [TransactionDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCovDO_Coverage_RiskCopayMoldCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF_FastCovDO_Coverage_RiskCopayMoldCode]  DEFAULT (0) FOR [RiskCopayMoldCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCovDO_Coverage_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCovDO_Coverage] ADD  CONSTRAINT [DF__FastCovDO_Coverage_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FastCovDO_Coverage_FastCovDO_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[FastCovDO_Coverage]'))
ALTER TABLE [dbo].[FastCovDO_Coverage]  WITH NOCHECK ADD  CONSTRAINT [FK_FastCovDO_Coverage_FastCovDO_Policy] FOREIGN KEY([PolicyRowId])
REFERENCES [dbo].[FastCovDO_Policy] ([RowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FastCovDO_Coverage_FastCovDO_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[FastCovDO_Coverage]'))
ALTER TABLE [dbo].[FastCovDO_Coverage] CHECK CONSTRAINT [FK_FastCovDO_Coverage_FastCovDO_Policy]
GO
