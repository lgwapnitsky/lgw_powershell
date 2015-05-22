IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_Coverage]') AND type in (N'U'))
DROP TABLE [dbo].[FT_Coverage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_Coverage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FT_Coverage](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyRowId] [int] NOT NULL,
	[CoverageCode] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AnnualPremium] [decimal](15, 2) NULL,
	[Exposure] [decimal](15, 2) NULL,
	[ExposureIndicator] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LimitAggregate] [float] NULL,
	[LimitOccurance] [float] NULL,
	[MedPayLimit] [decimal](15, 2) NULL,
	[MiscModifier1] [decimal](15, 2) NULL,
	[MiscModifier2] [decimal](15, 2) NULL,
	[PremOpsAggrrLimit] [decimal](15, 2) NULL,
	[PremOpsOccrLimit] [decimal](15, 2) NULL,
	[ProdAggrLimit] [float] NULL,
	[ProdOccrLimit] [decimal](15, 2) NULL,
	[StateCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Territory] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TownCode] [int] NULL,
	[TransactionCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransDate] [datetime] NULL,
	[PostalCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FT_Coverage] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_CoverageCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_CoverageCode]  DEFAULT ('') FOR [CoverageCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_AnnualPremium]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_AnnualPremium]  DEFAULT (0) FOR [AnnualPremium]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_Exposure]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_Exposure]  DEFAULT (0) FOR [Exposure]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_ExposureIndicator]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_ExposureIndicator]  DEFAULT ('') FOR [ExposureIndicator]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_LimitAggregate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_LimitAggregate]  DEFAULT (0) FOR [LimitAggregate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_LimitOccurance]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_LimitOccurance]  DEFAULT (0) FOR [LimitOccurance]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_MedPayLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_MedPayLimit]  DEFAULT (0) FOR [MedPayLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_MiscModifier1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_MiscModifier1]  DEFAULT (0) FOR [MiscModifier1]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_MiscModifier2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_MiscModifier2]  DEFAULT (0) FOR [MiscModifier2]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_PremOpsAggrrLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_PremOpsAggrrLimit]  DEFAULT (0) FOR [PremOpsAggrrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_PremOpsOccrLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_PremOpsOccrLimit]  DEFAULT (0) FOR [PremOpsOccrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_ProdAggrLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_ProdAggrLimit]  DEFAULT (0) FOR [ProdAggrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_ProdOccrLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_ProdOccrLimit]  DEFAULT (0) FOR [ProdOccrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_StateCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_StateCode]  DEFAULT ('') FOR [StateCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_Territory]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_Territory]  DEFAULT ('') FOR [Territory]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_TownCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_TownCode]  DEFAULT (0) FOR [TownCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_TransactionCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_TransactionCode]  DEFAULT ('') FOR [TransactionCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_TransDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_TransDate]  DEFAULT ('') FOR [TransDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_PostalCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_PostalCode]  DEFAULT ('') FOR [PostalCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Coverage_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Coverage] ADD  CONSTRAINT [DF_FT_Coverage_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FT_Coverage_FT_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[FT_Coverage]'))
ALTER TABLE [dbo].[FT_Coverage]  WITH NOCHECK ADD  CONSTRAINT [FK_FT_Coverage_FT_Policy] FOREIGN KEY([PolicyRowId])
REFERENCES [dbo].[FT_Policy] ([RowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FT_Coverage_FT_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[FT_Coverage]'))
ALTER TABLE [dbo].[FT_Coverage] CHECK CONSTRAINT [FK_FT_Coverage_FT_Policy]
GO
