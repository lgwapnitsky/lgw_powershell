IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SB_NewRenewalAuto]') AND type in (N'U'))
DROP TABLE [dbo].[SB_NewRenewalAuto]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SB_NewRenewalAuto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SB_NewRenewalAuto](
	[IDNum] [int] NOT NULL,
	[NewRenewalAutoV2] [varchar](19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
