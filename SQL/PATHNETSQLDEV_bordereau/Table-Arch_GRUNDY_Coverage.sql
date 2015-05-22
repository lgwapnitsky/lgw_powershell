IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_GRUNDY_Coverage]') AND type in (N'U'))
DROP TABLE [dbo].[Arch_GRUNDY_Coverage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_GRUNDY_Coverage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Arch_GRUNDY_Coverage](
	[Arch_GRUNDY_Coverage_ID] [int] IDENTITY(1,1) NOT NULL,
	[REC_NUM] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[POLICY_NUM] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SUB_AGENT] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ENDORSE_NUM] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INSURED] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DATE_ISSUE] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EFFECT_DATE] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CHANGE_ADD] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CHANGE_LIA] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NAME_INSUR] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COV_ADDRESS] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COV_CITY] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COV_STATE] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COV_ZIP] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BOD_INS] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMT_UNINSURED] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES_01] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES_02] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES_03] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[A_R_PREM_T] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[POST_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MEMO_PREM] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Medical_IND] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UNINSURED] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PRINT_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TRANS_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[REMT_P_FLG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PA_TORT] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Territory] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BrokerCod] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DirBill] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RecordStatus] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[TransDate] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_REC_NUM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_REC_NUM]  DEFAULT (' ') FOR [REC_NUM]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_POLICY_NUM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_POLICY_NUM]  DEFAULT (' ') FOR [POLICY_NUM]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_SUB_AGENT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_SUB_AGENT]  DEFAULT (' ') FOR [SUB_AGENT]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_ENDORSE_NUM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_ENDORSE_NUM]  DEFAULT (' ') FOR [ENDORSE_NUM]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_INSURED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_INSURED]  DEFAULT (' ') FOR [INSURED]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_DATE_ISSUE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_DATE_ISSUE]  DEFAULT (' ') FOR [DATE_ISSUE]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_EFFECT_DATE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_EFFECT_DATE]  DEFAULT (' ') FOR [EFFECT_DATE]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_CHANGE_ADD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_CHANGE_ADD]  DEFAULT (' ') FOR [CHANGE_ADD]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_CHANGE_LIA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_CHANGE_LIA]  DEFAULT (' ') FOR [CHANGE_LIA]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_NAME_INSUR]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_NAME_INSUR]  DEFAULT (' ') FOR [NAME_INSUR]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_COV_ADDRESS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_COV_ADDRESS]  DEFAULT (' ') FOR [COV_ADDRESS]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_COV_CITY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_COV_CITY]  DEFAULT (' ') FOR [COV_CITY]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_COV_STATE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_COV_STATE]  DEFAULT (' ') FOR [COV_STATE]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_COV_ZIP]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_COV_ZIP]  DEFAULT (' ') FOR [COV_ZIP]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_BOD_INS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_BOD_INS]  DEFAULT (' ') FOR [BOD_INS]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_AMT_UNINSURED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_AMT_UNINSURED]  DEFAULT (' ') FOR [AMT_UNINSURED]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_NOTES_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_NOTES_01]  DEFAULT (' ') FOR [NOTES_01]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_NOTES_02]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_NOTES_02]  DEFAULT (' ') FOR [NOTES_02]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_NOTES_03]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_NOTES_03]  DEFAULT (' ') FOR [NOTES_03]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_A_R_PREM_T]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_A_R_PREM_T]  DEFAULT (' ') FOR [A_R_PREM_T]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_POST_FLAG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_POST_FLAG]  DEFAULT (' ') FOR [POST_FLAG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_MEMO_PREM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_MEMO_PREM]  DEFAULT (' ') FOR [MEMO_PREM]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_Medical_IND]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_Medical_IND]  DEFAULT (' ') FOR [Medical_IND]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_UNINSURED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_UNINSURED]  DEFAULT (' ') FOR [UNINSURED]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_PRINT_FLAG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_PRINT_FLAG]  DEFAULT (' ') FOR [PRINT_FLAG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_TRANS_FLAG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_TRANS_FLAG]  DEFAULT (' ') FOR [TRANS_FLAG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_REMT_P_FLG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_REMT_P_FLG]  DEFAULT (' ') FOR [REMT_P_FLG]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_PA_TORT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_PA_TORT]  DEFAULT (' ') FOR [PA_TORT]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_Territory]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_Territory]  DEFAULT (' ') FOR [Territory]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_BrokerCod]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_BrokerCod]  DEFAULT (' ') FOR [BrokerCod]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_DirBill]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_DirBill]  DEFAULT (' ') FOR [DirBill]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Coverage_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  CONSTRAINT [DF_Arch_GRUNDY_Coverage_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__arch_grun__Trans__0DB9F9A8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Coverage] ADD  DEFAULT (' ') FOR [TransDate]
END

GO
