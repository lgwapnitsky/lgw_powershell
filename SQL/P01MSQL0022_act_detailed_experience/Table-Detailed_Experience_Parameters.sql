IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detailed_Experience_Parameters]') AND type in (N'U'))
DROP TABLE [dbo].[Detailed_Experience_Parameters]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detailed_Experience_Parameters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detailed_Experience_Parameters](
	[First_Year] [int] NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[Fiscal_AY_Month_Ending] [int] NULL,
	[Inforce_as_of_Cat_Model_Date] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InforceDate] [datetime] NULL,
	[Loss_Evaluation_Month] [float] NULL,
	[Loss_Evaluation_year] [float] NULL,
	[Fiscal_AY_Month_Ending_15_Month] [int] NULL
) ON [PRIMARY]
END
GO
