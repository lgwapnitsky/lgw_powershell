IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_PATHID]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_PATHID](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[idnum] [int] NOT NULL,
	[accountnumber] [int] NULL,
	[Evaluation_Year] [int] NULL,
	[Evaluation_Month] [int] NULL,
	[effectivedate] [datetime] NULL,
	[EffectiveYearMonth] [int] NULL,
	[Current_Year] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Current_Year_plus_one_month] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[programdesc] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[regioncode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwritername] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PIC_Producer] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[entityaddress] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[entitycity] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[entitystate] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[entityzip] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[companycode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productdesc] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[priorpolicynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
