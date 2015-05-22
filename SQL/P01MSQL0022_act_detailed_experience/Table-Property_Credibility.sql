IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Property_Credibility]') AND type in (N'U'))
DROP TABLE [dbo].[Property_Credibility]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Property_Credibility]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Property_Credibility](
	[claimnumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[curr_year_of_loss] [int] NULL,
	[curr_month_of_loss] [int] NULL,
	[Total_Incurred_Loss_ALAE_with_SS] [decimal](38, 2) NULL,
	[Total_Incurred_Loss_with_SS] [decimal](38, 2) NULL,
	[Total_Incurred_Loss_ALAE_wo_SS] [decimal](38, 2) NULL,
	[Total_Incurred_Loss_wo_SS] [decimal](38, 2) NULL,
	[total_paid] [decimal](38, 2) NULL,
	[total_pdlae] [decimal](38, 2) NULL,
	[total_case] [decimal](38, 2) NULL,
	[total_clae] [decimal](38, 2) NULL,
	[total_salvage] [decimal](38, 2) NULL,
	[total_subro] [decimal](38, 2) NULL,
	[Claim_Status] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
