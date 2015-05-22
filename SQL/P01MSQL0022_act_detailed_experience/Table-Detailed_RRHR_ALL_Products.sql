IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detailed_RRHR_ALL_Products]') AND type in (N'U'))
DROP TABLE [dbo].[Detailed_RRHR_ALL_Products]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detailed_RRHR_ALL_Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detailed_RRHR_ALL_Products](
	[idnum] [int] NOT NULL,
	[accountnumber] [int] NULL,
	[entitystate] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[company] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[programdesc] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[region] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriter] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[typedesc] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[effectiveYear] [int] NULL,
	[effectiveMonth] [int] NULL,
	[effectivedate] [datetime] NULL,
	[product] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[priorpolicynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[submmissions] [int] NOT NULL,
	[submissionPremium] [float] NULL,
	[Submission_Declined] [int] NOT NULL,
	[Quote_Declined] [int] NOT NULL,
	[Quoted] [int] NOT NULL,
	[quotedPremium] [float] NULL,
	[Bound_But_Not_Quoted] [int] NOT NULL,
	[Bound] [int] NOT NULL,
	[boundPremium] [float] NULL,
	[Submission_result] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
