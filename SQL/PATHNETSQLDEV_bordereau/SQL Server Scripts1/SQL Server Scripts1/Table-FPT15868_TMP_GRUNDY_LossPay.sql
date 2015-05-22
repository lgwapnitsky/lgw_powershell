IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FPT15868_TMP_GRUNDY_LossPay]') AND type in (N'U'))
DROP TABLE [dbo].[FPT15868_TMP_GRUNDY_LossPay]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FPT15868_TMP_GRUNDY_LossPay]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FPT15868_TMP_GRUNDY_LossPay](
	[GRUNDY_LossPay_ID] [int] NOT NULL,
	[REC_NUM] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[POLICY_NUM] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SUB_AGENT] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ENDORSEMENT] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INSURED] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DATE_ISSUE] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EFFECT_DAT] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LOSS_PAY_1] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LOSS_PAY_1b] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LOSS_PAY_2] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LOSS_PAY_2b] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LOSS_PAY_3] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LOSS_PAY_3b] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LOSS_PAY_4] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LOSS_PAY_4b] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES_01] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES_02] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES_03] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[POST_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PRINT_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TRANS_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[REMT_P_FLG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RecordStatus] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[TransDate] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
