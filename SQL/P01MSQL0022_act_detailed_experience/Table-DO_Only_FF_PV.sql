IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DO_Only_FF_PV]') AND type in (N'U'))
DROP TABLE [dbo].[DO_Only_FF_PV]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DO_Only_FF_PV]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DO_Only_FF_PV](
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coveragecode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[WP] [decimal](38, 2) NULL
) ON [PRIMARY]
END
GO
