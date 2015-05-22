IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_NewRenewalAutoExpressAppInd]') AND type in (N'U'))
DROP TABLE [dbo].[sb_NewRenewalAutoExpressAppInd]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_NewRenewalAutoExpressAppInd]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_NewRenewalAutoExpressAppInd](
	[IDNum] [int] NOT NULL,
	[NewRenewalAutoV2ExpressAppInd] [varchar](43) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
