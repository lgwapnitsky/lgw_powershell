IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Quote_excluded]') AND type in (N'U'))
DROP TABLE [dbo].[sb_Quote_excluded]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Quote_excluded]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_Quote_excluded](
	[lpolnum] [char](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyid] [int] NOT NULL,
	[QuoteExcludedUser] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
