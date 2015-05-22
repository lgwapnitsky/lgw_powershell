IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_DupeMaxPathIDperProd]') AND type in (N'U'))
DROP TABLE [dbo].[sb_DupeMaxPathIDperProd]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_DupeMaxPathIDperProd]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_DupeMaxPathIDperProd](
	[Policynumber_or_PATHID_x] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaxIDNum] [int] NULL
) ON [PRIMARY]
END
GO
