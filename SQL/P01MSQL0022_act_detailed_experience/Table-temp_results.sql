IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_results]') AND type in (N'U'))
DROP TABLE [dbo].[temp_results]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_results]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_results](
	[filter] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cnt] [int] NULL
) ON [PRIMARY]
END
GO
