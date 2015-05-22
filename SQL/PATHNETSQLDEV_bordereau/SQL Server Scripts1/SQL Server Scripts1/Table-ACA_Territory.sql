IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACA_Territory]') AND type in (N'U'))
DROP TABLE [dbo].[ACA_Territory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACA_Territory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ACA_Territory](
	[State] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[City] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
