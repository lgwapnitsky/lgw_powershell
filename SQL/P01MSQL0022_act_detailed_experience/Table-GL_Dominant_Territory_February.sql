IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GL_Dominant_Territory_February]') AND type in (N'U'))
DROP TABLE [dbo].[GL_Dominant_Territory_February]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GL_Dominant_Territory_February]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GL_Dominant_Territory_February](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sublinecode] [int] NOT NULL,
	[territory] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[GL_Territory_Max_Premium] [decimal](10, 2) NULL,
	[GL_Territory_Dominant] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Territory_Dominant_percent] [float] NULL,
	[GL_Dom_Terr_Description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Dom_Region_in_State] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
