IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PM_JudgmentMod]') AND type in (N'U'))
DROP TABLE [dbo].[PM_JudgmentMod]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PM_JudgmentMod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PM_JudgmentMod](
	[account_number] [int] NOT NULL,
	[DivisionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policy_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EffectiveYear] [int] NULL,
	[Reporting_Premium] [numeric](38, 2) NULL,
	[Monitored_Premium_NonUC] [numeric](38, 2) NULL,
	[Monitored_StandardPremium_NonUC] [float] NULL,
	[Monitored_Premium_UC] [numeric](38, 2) NULL,
	[Monitored_StandardPremium_UC] [float] NULL,
	[Monitored_Premium_GL] [numeric](38, 2) NULL,
	[Monitored_StandardPremium_GL] [float] NULL,
	[Monitored_Premium_Automobile] [numeric](38, 2) NULL,
	[Monitored_StandardPremium_Automobile] [float] NULL
) ON [PRIMARY]
END
GO
