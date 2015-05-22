IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Peril_HU_PoorAccounts]') AND type in (N'U'))
DROP TABLE [dbo].[Peril_HU_PoorAccounts]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Peril_HU_PoorAccounts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Peril_HU_PoorAccounts](
	[Account_Number] [int] NULL,
	[coTVaR_100] [float] NULL,
	[currentearnedpremium] [decimal](38, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat] [decimal](38, 2) NULL,
	[Ultimate_LR] [decimal](38, 6) NULL,
	[Bad_Year_Count] [int] NULL
) ON [PRIMARY]
END
GO
