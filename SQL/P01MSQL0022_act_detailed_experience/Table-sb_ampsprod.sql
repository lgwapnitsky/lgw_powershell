IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_ampsprod]') AND type in (N'U'))
DROP TABLE [dbo].[sb_ampsprod]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_ampsprod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_ampsprod](
	[product] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[productName] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[productMix] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[prodMixName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[rptMixCode] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[reportMixName] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[prodRptMixSortOrder] [tinyint] NOT NULL,
	[productLine] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[prodLineName] [varchar](21) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[prodLineSortOrder] [tinyint] NOT NULL,
	[shortPlineName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
