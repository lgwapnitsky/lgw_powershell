IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_APPS_Only_Policies]') AND type in (N'U'))
DROP TABLE [dbo].[sb_APPS_Only_Policies]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_APPS_Only_Policies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_APPS_Only_Policies](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[accountnumber] [int] NOT NULL
) ON [PRIMARY]
END
GO
