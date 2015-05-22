IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_CLAIMS_12_Information_1_CA_InlandMarine_Paid_ALAE]') AND type in (N'U'))
DROP TABLE [dbo].[ALL_CLAIMS_12_Information_1_CA_InlandMarine_Paid_ALAE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_CLAIMS_12_Information_1_CA_InlandMarine_Paid_ALAE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ALL_CLAIMS_12_Information_1_CA_InlandMarine_Paid_ALAE](
	[Claimnumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CAT_EventID] [int] NULL,
	[Accident_Year] [int] NULL,
	[Accident_Month] [int] NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coveragecode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Paid_ALAE] [decimal](38, 2) NULL,
	[Account_ProductType_P] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Claim_Paid_ALAE_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Max_Paid_ALAE] [float] NULL,
	[Max_Paid_ALAE_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Paid_ALAE_6_months] [float] NULL,
	[Paid_ALAE_18_months] [float] NULL,
	[Paid_ALAE_30_months] [float] NULL,
	[Paid_ALAE_3_months] [float] NULL,
	[Paid_ALAE_15_months] [float] NULL,
	[Paid_ALAE_27_months] [float] NULL,
	[Paid_ALAE_39_months] [float] NULL,
	[Paid_ALAE_51_months] [float] NULL,
	[Paid_ALAE_63_months] [float] NULL,
	[Paid_ALAE_75_months] [float] NULL,
	[Paid_ALAE_87_months] [float] NULL,
	[Paid_ALAE_99_months] [float] NULL,
	[Paid_ALAE_111_months] [float] NULL,
	[Paid_ALAE_12_months] [float] NULL,
	[Paid_ALAE_24_months] [float] NULL,
	[Paid_ALAE_36_months] [float] NULL,
	[Paid_ALAE_48_months] [float] NULL,
	[Paid_ALAE_60_months] [float] NULL,
	[Paid_ALAE_72_months] [float] NULL,
	[Paid_ALAE_84_months] [float] NULL,
	[Paid_ALAE_96_months] [float] NULL,
	[Paid_ALAE_108_months] [float] NULL,
	[Paid_ALAE_120_months] [float] NULL,
	[Capped_Paid_ALAE_3_months] [float] NULL,
	[Capped_Paid_ALAE_15_months] [float] NULL,
	[Capped_Paid_ALAE_27_months] [float] NULL,
	[Capped_Paid_ALAE_39_months] [float] NULL,
	[Capped_Paid_ALAE_51_months] [float] NULL,
	[Capped_Paid_ALAE_63_months] [float] NULL,
	[Capped_Paid_ALAE_75_months] [float] NULL,
	[Capped_Paid_ALAE_87_months] [float] NULL,
	[Capped_Paid_ALAE_99_months] [float] NULL,
	[Capped_Paid_ALAE_111_months] [float] NULL,
	[Capped_Paid_ALAE_12_months] [float] NULL,
	[Capped_Paid_ALAE_24_months] [float] NULL,
	[Capped_Paid_ALAE_36_months] [float] NULL,
	[Capped_Paid_ALAE_48_months] [float] NULL,
	[Capped_Paid_ALAE_60_months] [float] NULL,
	[Capped_Paid_ALAE_72_months] [float] NULL,
	[Capped_Paid_ALAE_84_months] [float] NULL,
	[Capped_Paid_ALAE_96_months] [float] NULL,
	[Capped_Paid_ALAE_108_months] [float] NULL,
	[Capped_Paid_ALAE_120_months] [float] NULL
) ON [PRIMARY]
END
GO
