IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_DupePathID2]') AND type in (N'U'))
DROP TABLE [dbo].[sb_DupePathID2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_DupePathID2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_DupePathID2](
	[idnum] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policynumber_or_PATHID] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CurrentProductCode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PriorProductCode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
