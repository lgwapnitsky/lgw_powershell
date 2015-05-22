IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PICProducer_Check]') AND type in (N'U'))
DROP TABLE [dbo].[PICProducer_Check]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PICProducer_Check]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PICProducer_Check](
	[effectiveYear] [int] NULL,
	[PICProducer] [varchar](102) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
