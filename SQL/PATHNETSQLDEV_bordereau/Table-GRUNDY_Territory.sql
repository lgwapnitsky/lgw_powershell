IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GRUNDY_Territory]') AND type in (N'U'))
DROP TABLE [dbo].[GRUNDY_Territory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GRUNDY_Territory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GRUNDY_Territory](
	[State] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ZipCode] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Occurances] [smallint] NULL,
	[Territory] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Percentage] [decimal](15, 4) NULL
) ON [PRIMARY]
END
GO
