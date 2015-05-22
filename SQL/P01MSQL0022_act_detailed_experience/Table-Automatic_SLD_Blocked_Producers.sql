IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Automatic_SLD_Blocked_Producers]') AND type in (N'U'))
DROP TABLE [dbo].[Automatic_SLD_Blocked_Producers]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Automatic_SLD_Blocked_Producers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Automatic_SLD_Blocked_Producers](
	[Producercode] [float] NULL,
	[Producer] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[F3] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
