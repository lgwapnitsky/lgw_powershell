IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CLaims_PremState_possibly_miscoded]') AND type in (N'U'))
DROP TABLE [dbo].[CLaims_PremState_possibly_miscoded]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CLaims_PremState_possibly_miscoded]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CLaims_PremState_possibly_miscoded](
	[Accountnumber] [int] NULL,
	[policy_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Claim_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accident_state] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Premium_State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_group] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accident_Year] [int] NULL,
	[Claim_desc] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CoverageGroup_Premium_in_Accident_State] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS] [decimal](38, 2) NULL
) ON [PRIMARY]
END
GO
