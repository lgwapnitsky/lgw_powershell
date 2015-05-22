IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FPT15868_TMP_GRUNDY_Vehicle]') AND type in (N'U'))
DROP TABLE [dbo].[FPT15868_TMP_GRUNDY_Vehicle]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FPT15868_TMP_GRUNDY_Vehicle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FPT15868_TMP_GRUNDY_Vehicle](
	[GRUNDY_Vehicle_ID] [int] NOT NULL,
	[POLICY_NUM] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ENDORSEMNT] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[RecordStatus] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[REMT_P_FLAG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes1] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes2] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes3] [nvarchar](74) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransDate] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
