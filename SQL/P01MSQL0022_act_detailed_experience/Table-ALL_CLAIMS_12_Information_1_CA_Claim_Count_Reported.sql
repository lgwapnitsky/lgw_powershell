IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_CLAIMS_12_Information_1_CA_Claim_Count_Reported]') AND type in (N'U'))
DROP TABLE [dbo].[ALL_CLAIMS_12_Information_1_CA_Claim_Count_Reported]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_CLAIMS_12_Information_1_CA_Claim_Count_Reported]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ALL_CLAIMS_12_Information_1_CA_Claim_Count_Reported](
	[Claimnumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[claim_status] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CAT_EventID] [int] NULL,
	[Accident_Year] [int] NULL,
	[Accident_Month] [int] NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Claim_Count_6_months] [int] NULL,
	[Claim_Count_18_months] [int] NULL,
	[Claim_Count_30_months] [int] NULL,
	[Claim_Count_3_months] [int] NULL,
	[Claim_Count_15_months] [int] NULL,
	[Claim_Count_27_months] [int] NULL,
	[Claim_Count_39_months] [int] NULL,
	[Claim_Count_51_months] [int] NULL,
	[Claim_Count_63_months] [int] NULL,
	[Claim_Count_75_months] [int] NULL,
	[Claim_Count_87_months] [int] NULL,
	[Claim_Count_99_months] [int] NULL,
	[Claim_Count_111_months] [int] NULL,
	[Claim_Count_12_months] [int] NULL,
	[Claim_Count_24_months] [int] NULL,
	[Claim_Count_36_months] [int] NULL,
	[Claim_Count_48_months] [int] NULL,
	[Claim_Count_60_months] [int] NULL,
	[Claim_Count_72_months] [int] NULL,
	[Claim_Count_84_months] [int] NULL,
	[Claim_Count_96_months] [int] NULL,
	[Claim_Count_108_months] [int] NULL,
	[Claim_Count_120_months] [int] NULL
) ON [PRIMARY]
END
GO
