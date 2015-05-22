IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GRUNDY_UMUIM]') AND type in (N'U'))
DROP TABLE [dbo].[GRUNDY_UMUIM]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GRUNDY_UMUIM]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GRUNDY_UMUIM](
	[GrundyUMUIMID] [int] IDENTITY(1,1) NOT NULL,
	[State] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subline] [smallint] NULL,
	[CoverageCode] [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LimitIndv] [float] NULL,
	[LimitOccurance] [float] NULL,
 CONSTRAINT [PK_GRUNDY_UMUIM] PRIMARY KEY CLUSTERED 
(
	[GrundyUMUIMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
