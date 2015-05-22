IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GL_SS]') AND type in (N'U'))
DROP TABLE [dbo].[GL_SS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GL_SS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GL_SS](
	[Accountnumber] [int] NOT NULL,
	[Policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
