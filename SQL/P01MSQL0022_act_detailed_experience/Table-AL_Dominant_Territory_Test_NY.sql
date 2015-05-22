IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AL_Dominant_Territory_Test_NY]') AND type in (N'U'))
DROP TABLE [dbo].[AL_Dominant_Territory_Test_NY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AL_Dominant_Territory_Test_NY]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AL_Dominant_Territory_Test_NY](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[classcode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CoverageGroup] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sublinecode] [int] NOT NULL,
	[territory] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[AL_Territory_Max_Premium] [decimal](10, 2) NULL,
	[AL_Territory_Dominant] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AL_Territory_Dominant_percent] [float] NULL,
	[AL_Dom_Terr_Description] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AL_Dom_Region_in_State] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
