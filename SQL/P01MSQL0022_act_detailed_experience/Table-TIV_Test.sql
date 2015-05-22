IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIV_Test]') AND type in (N'U'))
DROP TABLE [dbo].[TIV_Test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIV_Test]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TIV_Test](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TIV] [float] NULL,
	[coverage_form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Number_of_Buildings] [int] NULL,
	[FA_Number_of_Locations] [int] NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
