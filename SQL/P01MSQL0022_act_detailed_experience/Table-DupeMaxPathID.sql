IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DupeMaxPathID]') AND type in (N'U'))
DROP TABLE [dbo].[DupeMaxPathID]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DupeMaxPathID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DupeMaxPathID](
	[Policynumber_or_PATHID_x] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaxIDNum] [int] NULL
) ON [PRIMARY]
END
GO
