IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_CLAIMS_12_Information_1_CA_InlandMarine_Case_Loss]') AND type in (N'U'))
DROP TABLE [dbo].[ALL_CLAIMS_12_Information_1_CA_InlandMarine_Case_Loss]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_CLAIMS_12_Information_1_CA_InlandMarine_Case_Loss]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ALL_CLAIMS_12_Information_1_CA_InlandMarine_Case_Loss](
	[Claimnumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CAT_EventID] [int] NULL,
	[Accident_Year] [int] NULL,
	[Accident_Month] [int] NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coveragecode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Case_Loss] [decimal](38, 2) NULL,
	[Account_ProductType_P] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Claim_Case_Loss_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Max_Case_Loss] [float] NULL,
	[Max_Case_Loss_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Case_Loss_6_months] [float] NULL,
	[Case_Loss_18_months] [float] NULL,
	[Case_Loss_30_months] [float] NULL,
	[Case_Loss_3_months] [float] NULL,
	[Case_Loss_15_months] [float] NULL,
	[Case_Loss_27_months] [float] NULL,
	[Case_Loss_39_months] [float] NULL,
	[Case_Loss_51_months] [float] NULL,
	[Case_Loss_63_months] [float] NULL,
	[Case_Loss_75_months] [float] NULL,
	[Case_Loss_87_months] [float] NULL,
	[Case_Loss_99_months] [float] NULL,
	[Case_Loss_111_months] [float] NULL,
	[Case_Loss_12_months] [float] NULL,
	[Case_Loss_24_months] [float] NULL,
	[Case_Loss_36_months] [float] NULL,
	[Case_Loss_48_months] [float] NULL,
	[Case_Loss_60_months] [float] NULL,
	[Case_Loss_72_months] [float] NULL,
	[Case_Loss_84_months] [float] NULL,
	[Case_Loss_96_months] [float] NULL,
	[Case_Loss_108_months] [float] NULL,
	[Case_Loss_120_months] [float] NULL,
	[Capped_Case_Loss_3_months] [float] NULL,
	[Capped_Case_Loss_15_months] [float] NULL,
	[Capped_Case_Loss_27_months] [float] NULL,
	[Capped_Case_Loss_39_months] [float] NULL,
	[Capped_Case_Loss_51_months] [float] NULL,
	[Capped_Case_Loss_63_months] [float] NULL,
	[Capped_Case_Loss_75_months] [float] NULL,
	[Capped_Case_Loss_87_months] [float] NULL,
	[Capped_Case_Loss_99_months] [float] NULL,
	[Capped_Case_Loss_111_months] [float] NULL,
	[Capped_Case_Loss_12_months] [float] NULL,
	[Capped_Case_Loss_24_months] [float] NULL,
	[Capped_Case_Loss_36_months] [float] NULL,
	[Capped_Case_Loss_48_months] [float] NULL,
	[Capped_Case_Loss_60_months] [float] NULL,
	[Capped_Case_Loss_72_months] [float] NULL,
	[Capped_Case_Loss_84_months] [float] NULL,
	[Capped_Case_Loss_96_months] [float] NULL,
	[Capped_Case_Loss_108_months] [float] NULL,
	[Capped_Case_Loss_120_months] [float] NULL
) ON [PRIMARY]
END
GO
