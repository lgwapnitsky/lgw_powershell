IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UC_Rating_Matrix_Construction]') AND type in (N'U'))
DROP TABLE [dbo].[UC_Rating_Matrix_Construction]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UC_Rating_Matrix_Construction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UC_Rating_Matrix_Construction](
	[Product] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Wind] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tier] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UC Construction] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Low] [float] NULL,
	[High] [float] NULL,
	[F8] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[F9] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
