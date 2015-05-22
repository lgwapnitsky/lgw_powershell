IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_CLAIMS_12_Information_1_September]') AND type in (N'U'))
DROP TABLE [dbo].[ALL_CLAIMS_12_Information_1_September]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_CLAIMS_12_Information_1_September]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ALL_CLAIMS_12_Information_1_September](
	[Claimnumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accident_Year] [int] NULL,
	[Accident_Month] [int] NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Experienceproduct] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Reporting_group] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Incurred_Loss_ALAE_with_SS] [decimal](38, 2) NULL,
	[Claim_Incurred_Loss_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Max_Incurred_Loss] [float] NULL,
	[Max_Incurred_Loss_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Incurred_Loss_6_months] [float] NULL,
	[Incurred_Loss_18_months] [float] NULL,
	[Incurred_Loss_30_months] [float] NULL,
	[Incurred_Loss_3_months] [float] NULL,
	[Incurred_Loss_15_months] [float] NULL,
	[Incurred_Loss_27_months] [float] NULL,
	[Incurred_Loss_39_months] [float] NULL,
	[Incurred_Loss_51_months] [float] NULL,
	[Incurred_Loss_63_months] [float] NULL,
	[Incurred_Loss_75_months] [float] NULL,
	[Incurred_Loss_87_months] [float] NULL,
	[Incurred_Loss_99_months] [float] NULL,
	[Incurred_Loss_111_months] [float] NULL,
	[Incurred_Loss_12_months] [float] NULL,
	[Incurred_Loss_24_months] [float] NULL,
	[Incurred_Loss_36_months] [float] NULL,
	[Incurred_Loss_48_months] [float] NULL,
	[Incurred_Loss_60_months] [float] NULL,
	[Incurred_Loss_72_months] [float] NULL,
	[Incurred_Loss_84_months] [float] NULL,
	[Incurred_Loss_96_months] [float] NULL,
	[Incurred_Loss_108_months] [float] NULL,
	[Incurred_Loss_120_months] [float] NULL,
	[Capped_Incurred_Loss_3_months] [float] NULL,
	[Capped_Incurred_Loss_15_months] [float] NULL,
	[Capped_Incurred_Loss_27_months] [float] NULL,
	[Capped_Incurred_Loss_39_months] [float] NULL,
	[Capped_Incurred_Loss_51_months] [float] NULL,
	[Capped_Incurred_Loss_63_months] [float] NULL,
	[Capped_Incurred_Loss_75_months] [float] NULL,
	[Capped_Incurred_Loss_87_months] [float] NULL,
	[Capped_Incurred_Loss_99_months] [float] NULL,
	[Capped_Incurred_Loss_111_months] [float] NULL,
	[Capped_Incurred_Loss_12_months] [float] NULL,
	[Capped_Incurred_Loss_24_months] [float] NULL,
	[Capped_Incurred_Loss_36_months] [float] NULL,
	[Capped_Incurred_Loss_48_months] [float] NULL,
	[Capped_Incurred_Loss_60_months] [float] NULL,
	[Capped_Incurred_Loss_72_months] [float] NULL,
	[Capped_Incurred_Loss_84_months] [float] NULL,
	[Capped_Incurred_Loss_96_months] [float] NULL,
	[Capped_Incurred_Loss_108_months] [float] NULL,
	[Capped_Incurred_Loss_120_months] [float] NULL
) ON [PRIMARY]
END
GO
