IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FastCov_Coverage]') AND type in (N'U'))
DROP TABLE [dbo].[FastCov_Coverage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FastCov_Coverage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FastCov_Coverage](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyRowId] [int] NULL,
	[CoverageCode] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClassCode] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActualPremium] [decimal](15, 2) NULL,
	[Limit] [float] NULL,
	[LimitAggregate] [float] NULL,
	[LimitOccurance] [float] NULL,
	[PremOpsAggrLimit] [decimal](15, 2) NULL,
	[PremOpsOccrLimit] [decimal](15, 2) NULL,
	[ProdAggrLimit] [decimal](15, 2) NULL,
	[ProdOccrLimit] [decimal](15, 2) NULL,
	[MedPayLimit] [decimal](15, 2) NULL,
	[Exposure] [decimal](15, 2) NULL,
	[Deductible] [float] NULL,
	[ExperienceModifier] [decimal](15, 2) NULL,
	[ScheduleModifier] [decimal](15, 2) NULL,
	[State] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransactionCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FastCov_Coverage] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_CoverageCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_CoverageCode]  DEFAULT ('') FOR [CoverageCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_ClassCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_ClassCode]  DEFAULT ('') FOR [ClassCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Covera__Annua__44A01A3E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF__FastCov_Covera__Annua__44A01A3E]  DEFAULT (0) FOR [ActualPremium]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_Limit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_Limit]  DEFAULT (0) FOR [Limit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_LimitAggregate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_LimitAggregate]  DEFAULT (0) FOR [LimitAggregate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_LimitOccurance]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_LimitOccurance]  DEFAULT (0) FOR [LimitOccurance]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_PremOpsAggrLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_PremOpsAggrLimit]  DEFAULT (0) FOR [PremOpsAggrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_PremOpsOccrLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_PremOpsOccrLimit]  DEFAULT (0) FOR [PremOpsOccrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_ProdAggrLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_ProdAggrLimit]  DEFAULT (0) FOR [ProdAggrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_ProdOccrLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_ProdOccrLimit]  DEFAULT (0) FOR [ProdOccrLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_MedPayLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_MedPayLimit]  DEFAULT (0) FOR [MedPayLimit]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Covera__Expos__477C86E9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF__FastCov_Covera__Expos__477C86E9]  DEFAULT (0) FOR [Exposure]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_Deductible]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_Deductible]  DEFAULT (0) FOR [Deductible]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Covera__Expos__4870AB22]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF__FastCov_Covera__Expos__4870AB22]  DEFAULT (0) FOR [ExperienceModifier]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_ScheduleModifier]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_ScheduleModifier]  DEFAULT (0) FOR [ScheduleModifier]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastCov_Coverage_State]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF_FastCov_Coverage_State]  DEFAULT ('') FOR [State]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Covera__Trans__57B2EEB2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF__FastCov_Covera__Trans__57B2EEB2]  DEFAULT ('') FOR [TransactionCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__FastCov_Covera__Updat__58A712EB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastCov_Coverage] ADD  CONSTRAINT [DF__FastCov_Covera__Updat__58A712EB]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FastCov_Coverage_FastCov_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[FastCov_Coverage]'))
ALTER TABLE [dbo].[FastCov_Coverage]  WITH CHECK ADD  CONSTRAINT [FK_FastCov_Coverage_FastCov_Policy] FOREIGN KEY([PolicyRowId])
REFERENCES [dbo].[FastCov_Policy] ([RowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FastCov_Coverage_FastCov_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[FastCov_Coverage]'))
ALTER TABLE [dbo].[FastCov_Coverage] CHECK CONSTRAINT [FK_FastCov_Coverage_FastCov_Policy]
GO
