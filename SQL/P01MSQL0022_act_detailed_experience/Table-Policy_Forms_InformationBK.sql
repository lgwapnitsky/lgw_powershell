IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Forms_InformationBK]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Forms_InformationBK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Forms_InformationBK]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Forms_InformationBK](
	[idnum] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policynumber_or_PATHID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ratingsourcecode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RatingSystemID] [bigint] NULL,
	[FormID] [int] NULL,
	[Form_Number] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Form_Desc] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Form_Type] [int] NULL
) ON [PRIMARY]
END
GO
