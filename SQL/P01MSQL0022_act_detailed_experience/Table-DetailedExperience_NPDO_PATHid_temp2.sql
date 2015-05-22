IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetailedExperience_NPDO_PATHid_temp2]') AND type in (N'U'))
DROP TABLE [dbo].[DetailedExperience_NPDO_PATHid_temp2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetailedExperience_NPDO_PATHid_temp2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DetailedExperience_NPDO_PATHid_temp2](
	[idnum] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[createdate] [datetime] NOT NULL,
	[minidnum] [int] NULL
) ON [PRIMARY]
END
GO
