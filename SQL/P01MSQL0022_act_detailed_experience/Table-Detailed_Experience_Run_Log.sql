IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detailed_Experience_Run_Log]') AND type in (N'U'))
DROP TABLE [dbo].[Detailed_Experience_Run_Log]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detailed_Experience_Run_Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detailed_Experience_Run_Log](
	[Step_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Run_Year] [int] NOT NULL,
	[Run_Month] [int] NOT NULL,
	[Start_Time] [datetime] NULL,
	[End_Time] [datetime] NULL
) ON [PRIMARY]
END
GO
