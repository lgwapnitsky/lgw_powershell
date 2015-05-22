IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Policy_APPS_Premium]') AND type in (N'U'))
DROP TABLE [dbo].[sb_Policy_APPS_Premium]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Policy_APPS_Premium]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_Policy_APPS_Premium](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[PropertyCoverageForm] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
