IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPH_Coverage]') AND type in (N'U'))
DROP TABLE [dbo].[CPH_Coverage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPH_Coverage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CPH_Coverage](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyRowId] [int] NULL,
	[ActualPremium] [decimal](18, 0) NULL,
	[Exposure] [decimal](18, 0) NULL,
	[LimitIndividual] [float] NULL,
	[LimitOccurance] [float] NULL,
	[LimitAggregate] [float] NULL,
	[PremOpsAggrLimit] [decimal](18, 0) NULL,
	[PremOpsOccrLimit] [decimal](18, 0) NULL,
	[ProdAggrLimit] [decimal](18, 0) NULL,
	[ProdOccrLimit] [decimal](18, 0) NULL,
	[MedPayLimit] [decimal](18, 0) NULL,
	[StateCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PostalCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CoverageCode] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Deductible] [float] NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CPH_Coverage] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__Actua__44A01A3E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__Actua__44A01A3E]  DEFAULT (0) FOR [ActualPremium]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__Expos__477C86E9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__Expos__477C86E9]  DEFAULT (0) FOR [Exposure]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__Limit__SMZ477E9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__Limit__SMZ477E9]  DEFAULT (0) FOR [LimitIndividual]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__Limit__4E298478]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__Limit__4E298478]  DEFAULT (0) FOR [LimitOccurance]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__Limit__4D35603F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__Limit__4D35603F]  DEFAULT (0) FOR [LimitAggregate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__PremO__53E25DCE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__PremO__53E25DCE]  DEFAULT (0) FOR [PremOpsAggrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__PremO__54D68207]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__PremO__54D68207]  DEFAULT (0) FOR [PremOpsOccrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__ProdA__55CAA640]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__ProdA__55CAA640]  DEFAULT (0) FOR [ProdAggrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__ProdO__56BECA79]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__ProdO__56BECA79]  DEFAULT (0) FOR [ProdOccrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__MedPa__4F1DA8B1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__MedPa__4F1DA8B1]  DEFAULT (0) FOR [MedPayLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__State__57SMZEEB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__State__57SMZEEB]  DEFAULT ('') FOR [StateCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__Posta__57B2ESMZ]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__Posta__57B2ESMZ]  DEFAULT ('') FOR [PostalCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__Cover__57ESMZB2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__Cover__57ESMZB2]  DEFAULT ('') FOR [CoverageCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__Trans__57B2EEB2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__Trans__57B2EEB2]  DEFAULT ('') FOR [TransCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__CPH_Covera__Updat__58A712EB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Coverage] ADD  CONSTRAINT [DF__CPH_Covera__Updat__58A712EB]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CPH_Coverage_CPH_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[CPH_Coverage]'))
ALTER TABLE [dbo].[CPH_Coverage]  WITH NOCHECK ADD  CONSTRAINT [FK_CPH_Coverage_CPH_Policy] FOREIGN KEY([PolicyRowId])
REFERENCES [dbo].[CPH_Policy] ([RowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CPH_Coverage_CPH_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[CPH_Coverage]'))
ALTER TABLE [dbo].[CPH_Coverage] CHECK CONSTRAINT [FK_CPH_Coverage_CPH_Policy]
GO
