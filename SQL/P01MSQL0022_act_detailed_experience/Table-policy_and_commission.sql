IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[policy_and_commission]') AND type in (N'U'))
DROP TABLE [dbo].[policy_and_commission]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[policy_and_commission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[policy_and_commission](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Commission_pct] [float] NULL
) ON [PRIMARY]
END
GO
