IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GRUNDY_TerritoryAdditional]') AND type in (N'U'))
DROP TABLE [dbo].[GRUNDY_TerritoryAdditional]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GRUNDY_TerritoryAdditional]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GRUNDY_TerritoryAdditional](
	[State] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ZipCode] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Territory] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
