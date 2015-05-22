IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_PIC_Producer]') AND type in (N'U'))
DROP TABLE [dbo].[sb_PIC_Producer]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_PIC_Producer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_PIC_Producer](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[producercode] [int] NULL
) ON [PRIMARY]
END
GO
