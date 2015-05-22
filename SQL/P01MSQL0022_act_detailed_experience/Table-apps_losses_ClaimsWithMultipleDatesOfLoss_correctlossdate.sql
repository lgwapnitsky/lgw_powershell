IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[apps_losses_ClaimsWithMultipleDatesOfLoss_correctlossdate]') AND type in (N'U'))
DROP TABLE [dbo].[apps_losses_ClaimsWithMultipleDatesOfLoss_correctlossdate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[apps_losses_ClaimsWithMultipleDatesOfLoss_correctlossdate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[apps_losses_ClaimsWithMultipleDatesOfLoss_correctlossdate](
	[claim] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[lossdate] [datetime] NULL
) ON [PRIMARY]
END
GO
