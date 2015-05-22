IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_FF_ONLY_Loss_Detail_Trend]') AND type in (N'U'))
DROP TABLE [dbo].[NPDO_FF_ONLY_Loss_Detail_Trend]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_FF_ONLY_Loss_Detail_Trend]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NPDO_FF_ONLY_Loss_Detail_Trend](
	[Coverage_id] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Claim_Number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accident_Year] [int] NULL,
	[Premium_State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Case_Loss] [decimal](38, 2) NULL,
	[Case_ALAE] [decimal](38, 2) NULL,
	[Paid_Loss] [decimal](38, 2) NULL,
	[Paid_ALAE] [decimal](38, 2) NULL,
	[Capped_Paid_Loss] [decimal](38, 2) NULL,
	[Reported_Claims] [decimal](38, 2) NULL,
	[Open_Claims] [decimal](38, 2) NULL,
	[Closed_With_Pay_Claims] [decimal](38, 2) NULL,
	[CWP_Claims_ex_ALAE_only] [decimal](38, 2) NULL,
	[Closed_Without_Pay_Claims] [decimal](38, 2) NULL,
	[Year_Closed] [int] NULL,
	[Month_Closed] [int] NULL
) ON [PRIMARY]
END
GO
