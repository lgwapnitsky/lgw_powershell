IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HUBDynamicPrompt_InterimFieldsBK]') AND type in (N'U'))
DROP TABLE [dbo].[HUBDynamicPrompt_InterimFieldsBK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HUBDynamicPrompt_InterimFieldsBK]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HUBDynamicPrompt_InterimFieldsBK](
	[Policynumber_or_PATHID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LargeAccounts_Ind] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SubProduct] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Auto_withExpressConv] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PriorityAccountLevelcurrent] [int] NULL
) ON [PRIMARY]
END
GO
