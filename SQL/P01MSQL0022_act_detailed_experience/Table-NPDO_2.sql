IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_2]') AND type in (N'U'))
DROP TABLE [dbo].[NPDO_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NPDO_2](
	[acctngmonth] [int] NOT NULL,
	[acctngyear] [int] NOT NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[WrittenPremium] [decimal](38, 2) NULL,
	[coverage_group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
