IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_DupePathID]') AND type in (N'U'))
DROP TABLE [dbo].[sb_DupePathID]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_DupePathID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_DupePathID](
	[Policynumber_or_PATHID_x] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
