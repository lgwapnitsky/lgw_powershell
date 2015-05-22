IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detailed_Experience_Prior_Claims_NPDO]') AND type in (N'U'))
DROP TABLE [dbo].[Detailed_Experience_Prior_Claims_NPDO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detailed_Experience_Prior_Claims_NPDO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detailed_Experience_Prior_Claims_NPDO](
	[Policy_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Prior_Claims] [decimal](38, 2) NULL
) ON [PRIMARY]
END
GO
