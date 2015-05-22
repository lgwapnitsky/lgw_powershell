IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FPT15868_TMP_GRUNDY_Coverage]') AND type in (N'U'))
DROP TABLE [dbo].[FPT15868_TMP_GRUNDY_Coverage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FPT15868_TMP_GRUNDY_Coverage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FPT15868_TMP_GRUNDY_Coverage](
	[GRUNDY_Coverage_ID] [int] NOT NULL,
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
