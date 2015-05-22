IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_GRUNDY_Vehicle]') AND type in (N'U'))
DROP TABLE [dbo].[Arch_GRUNDY_Vehicle]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_GRUNDY_Vehicle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Arch_GRUNDY_Vehicle](
	[Arch_GRUNDY_Vehicle_ID] [int] IDENTITY(1,1) NOT NULL,
	[REC_NUM] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[POLICY_NUM] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SUB_AGENT] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ENDORSEMNT] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INSURED] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DATE_ISSUE] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EFFECT_DATE] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CODE_01] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[YEAR_01] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MAKE_01] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TYPE_01] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VIN_SER_01] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMT_ACV_01] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMT_COMP_01] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMT_COLL_01] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TOT_ACV] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADD_PREM] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES_01] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES_02] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES_03] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MEMO_PREM] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[POST_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PRINT_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TRANS_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[REMT_P_FLG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RecordStatus] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[TransDate] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Arch_GRUNDY_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Arch_GRUNDY_Vehicle_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_REC_NUM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_REC_NUM]  DEFAULT (' ') FOR [REC_NUM]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_POLICY_NUM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_POLICY_NUM]  DEFAULT (' ') FOR [POLICY_NUM]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_SUB_AGENT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_SUB_AGENT]  DEFAULT (' ') FOR [SUB_AGENT]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_ENDORSEMNT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_ENDORSEMNT]  DEFAULT (' ') FOR [ENDORSEMNT]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_INSURED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_INSURED]  DEFAULT (' ') FOR [INSURED]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_DATE_ISSUE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_DATE_ISSUE]  DEFAULT (' ') FOR [DATE_ISSUE]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_EFFECT_DATE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_EFFECT_DATE]  DEFAULT (' ') FOR [EFFECT_DATE]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_CODE_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_CODE_01]  DEFAULT (' ') FOR [CODE_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_YEAR_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_YEAR_01]  DEFAULT (' ') FOR [YEAR_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_MAKE_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_MAKE_01]  DEFAULT (' ') FOR [MAKE_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_TYPE_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_TYPE_01]  DEFAULT (' ') FOR [TYPE_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_VIN_SER_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_VIN_SER_01]  DEFAULT (' ') FOR [VIN_SER_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_AMT_ACV_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_AMT_ACV_01]  DEFAULT (' ') FOR [AMT_ACV_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_AMT_COMP_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_AMT_COMP_01]  DEFAULT (' ') FOR [AMT_COMP_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_AMT_COLL_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_AMT_COLL_01]  DEFAULT (' ') FOR [AMT_COLL_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_TOT_ACV]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_TOT_ACV]  DEFAULT (' ') FOR [TOT_ACV]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_ADD_PREM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_ADD_PREM]  DEFAULT (' ') FOR [ADD_PREM]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_NOTES_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_NOTES_01]  DEFAULT (' ') FOR [NOTES_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_NOTES_02]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_NOTES_02]  DEFAULT (' ') FOR [NOTES_02]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_NOTES_03]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_NOTES_03]  DEFAULT (' ') FOR [NOTES_03]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_MEMO_PREM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_MEMO_PREM]  DEFAULT (' ') FOR [MEMO_PREM]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_POST_FLAG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_POST_FLAG]  DEFAULT (' ') FOR [POST_FLAG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_PRINT_FLAG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_PRINT_FLAG]  DEFAULT (' ') FOR [PRINT_FLAG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_TRANS_FLAG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_TRANS_FLAG]  DEFAULT (' ') FOR [TRANS_FLAG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_REMT_P_FLG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_REMT_P_FLG]  DEFAULT (' ') FOR [REMT_P_FLG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Vehicle_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  CONSTRAINT [DF_Arch_GRUNDY_Vehicle_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__arch_grun__Trans__0BD1B136]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Vehicle] ADD  DEFAULT (' ') FOR [TransDate]
END

GO
