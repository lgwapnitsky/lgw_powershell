IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_GRUNDY_Schedule]') AND type in (N'U'))
DROP TABLE [dbo].[Arch_GRUNDY_Schedule]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_GRUNDY_Schedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Arch_GRUNDY_Schedule](
	[Arch_GRUNDY_Schedule_ID] [int] IDENTITY(1,1) NOT NULL,
	[REC_NUM] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[POLICY_NUM] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ENDORSEMNT] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DATE_ISSUED] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INSURED] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EFFECT_DATE] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CAR_01] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ID_CARD_PR_01] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[YEAR_01] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MAKE_01] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TYPE_01] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VIN_SER_01] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMT_ACV_01] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMT_COMP_01] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMT_COLL_01] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TOT_ACV] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TOT_COMP] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TOT_COLL] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PRINT_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TRANS_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[REMT_P_FLG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RecordStatus] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[TransDate] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Arch_GRUNDY_Schedule] PRIMARY KEY CLUSTERED 
(
	[Arch_GRUNDY_Schedule_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_REC_NUM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_REC_NUM]  DEFAULT (' ') FOR [REC_NUM]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_POLICY_NUM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_POLICY_NUM]  DEFAULT (' ') FOR [POLICY_NUM]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_ENDORSEMNT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_ENDORSEMNT]  DEFAULT (' ') FOR [ENDORSEMNT]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_DATE_ISSUED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_DATE_ISSUED]  DEFAULT (' ') FOR [DATE_ISSUED]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_INSURED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_INSURED]  DEFAULT (' ') FOR [INSURED]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_EFFECT_DATE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_EFFECT_DATE]  DEFAULT (' ') FOR [EFFECT_DATE]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_CAR_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_CAR_01]  DEFAULT (' ') FOR [CAR_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_ID_CARD_PR_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_ID_CARD_PR_01]  DEFAULT (' ') FOR [ID_CARD_PR_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_YEAR_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_YEAR_01]  DEFAULT (' ') FOR [YEAR_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_MAKE_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_MAKE_01]  DEFAULT (' ') FOR [MAKE_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_TYPE_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_TYPE_01]  DEFAULT (' ') FOR [TYPE_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_VIN_SER_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_VIN_SER_01]  DEFAULT (' ') FOR [VIN_SER_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_AMT_ACV_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_AMT_ACV_01]  DEFAULT (' ') FOR [AMT_ACV_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_AMT_COMP_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_AMT_COMP_01]  DEFAULT (' ') FOR [AMT_COMP_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_AMT_COLL_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_AMT_COLL_01]  DEFAULT (' ') FOR [AMT_COLL_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_TOT_ACV]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_TOT_ACV]  DEFAULT (' ') FOR [TOT_ACV]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_TOT_COMP]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_TOT_COMP]  DEFAULT (' ') FOR [TOT_COMP]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_TOT_COLL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_TOT_COLL]  DEFAULT (' ') FOR [TOT_COLL]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_PRINT_FLAG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_PRINT_FLAG]  DEFAULT (' ') FOR [PRINT_FLAG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_TRANS_FLAG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_TRANS_FLAG]  DEFAULT (' ') FOR [TRANS_FLAG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_REMT_P_FLG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_REMT_P_FLG]  DEFAULT (' ') FOR [REMT_P_FLG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Schedule_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  CONSTRAINT [DF_Arch_GRUNDY_Schedule_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__arch_grun__Trans__0ADD8CFD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Schedule] ADD  DEFAULT (' ') FOR [TransDate]
END

GO
