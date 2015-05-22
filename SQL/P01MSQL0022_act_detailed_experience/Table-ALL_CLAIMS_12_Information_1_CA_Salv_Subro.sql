IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_CLAIMS_12_Information_1_CA_Salv_Subro]') AND type in (N'U'))
DROP TABLE [dbo].[ALL_CLAIMS_12_Information_1_CA_Salv_Subro]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALL_CLAIMS_12_Information_1_CA_Salv_Subro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ALL_CLAIMS_12_Information_1_CA_Salv_Subro](
	[Claimnumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CAT_EventID] [int] NULL,
	[Accident_Year] [int] NULL,
	[Accident_Month] [int] NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coveragecode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Salv_Subro] [decimal](38, 2) NULL,
	[Account_ProductType_P] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Claim_Salv_Subro_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Max_Salv_Subro] [float] NULL,
	[Max_Salv_Subro_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Salv_Subro_6_months] [float] NULL,
	[Salv_Subro_18_months] [float] NULL,
	[Salv_Subro_30_months] [float] NULL,
	[Salv_Subro_3_months] [float] NULL,
	[Salv_Subro_15_months] [float] NULL,
	[Salv_Subro_27_months] [float] NULL,
	[Salv_Subro_39_months] [float] NULL,
	[Salv_Subro_51_months] [float] NULL,
	[Salv_Subro_63_months] [float] NULL,
	[Salv_Subro_75_months] [float] NULL,
	[Salv_Subro_87_months] [float] NULL,
	[Salv_Subro_99_months] [float] NULL,
	[Salv_Subro_111_months] [float] NULL,
	[Salv_Subro_12_months] [float] NULL,
	[Salv_Subro_24_months] [float] NULL,
	[Salv_Subro_36_months] [float] NULL,
	[Salv_Subro_48_months] [float] NULL,
	[Salv_Subro_60_months] [float] NULL,
	[Salv_Subro_72_months] [float] NULL,
	[Salv_Subro_84_months] [float] NULL,
	[Salv_Subro_96_months] [float] NULL,
	[Salv_Subro_108_months] [float] NULL,
	[Salv_Subro_120_months] [float] NULL,
	[Capped_Salv_Subro_3_months] [float] NULL,
	[Capped_Salv_Subro_15_months] [float] NULL,
	[Capped_Salv_Subro_27_months] [float] NULL,
	[Capped_Salv_Subro_39_months] [float] NULL,
	[Capped_Salv_Subro_51_months] [float] NULL,
	[Capped_Salv_Subro_63_months] [float] NULL,
	[Capped_Salv_Subro_75_months] [float] NULL,
	[Capped_Salv_Subro_87_months] [float] NULL,
	[Capped_Salv_Subro_99_months] [float] NULL,
	[Capped_Salv_Subro_111_months] [float] NULL,
	[Capped_Salv_Subro_12_months] [float] NULL,
	[Capped_Salv_Subro_24_months] [float] NULL,
	[Capped_Salv_Subro_36_months] [float] NULL,
	[Capped_Salv_Subro_48_months] [float] NULL,
	[Capped_Salv_Subro_60_months] [float] NULL,
	[Capped_Salv_Subro_72_months] [float] NULL,
	[Capped_Salv_Subro_84_months] [float] NULL,
	[Capped_Salv_Subro_96_months] [float] NULL,
	[Capped_Salv_Subro_108_months] [float] NULL,
	[Capped_Salv_Subro_120_months] [float] NULL
) ON [PRIMARY]
END
GO
