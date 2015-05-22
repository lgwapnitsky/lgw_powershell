IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Peril_HU_coTVaR]') AND type in (N'U'))
DROP TABLE [dbo].[Peril_HU_coTVaR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Peril_HU_coTVaR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Peril_HU_coTVaR](
	[Account_Number] [int] NULL,
	[coTVaR_100] [float] NULL
) ON [PRIMARY]
END
GO
