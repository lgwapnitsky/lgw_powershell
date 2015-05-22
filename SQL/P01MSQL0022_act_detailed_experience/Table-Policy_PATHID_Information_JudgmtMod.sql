IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_JudgmtMod]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_PATHID_Information_JudgmtMod]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_JudgmtMod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_PATHID_Information_JudgmtMod](
	[accountnumber] [int] NULL,
	[DivisionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[effectiveYear] [int] NULL,
	[currentwrittenpremium] [float] NULL,
	[policy_Reporting_Premium] [float] NULL,
	[policy_Percent_Monitored] [float] NULL,
	[policy_Judgment_Premium_NonUC] [float] NULL,
	[policy_Judgment_StandardPremium_NonUC] [float] NULL,
	[policy_Judgment_Mod_NonUC] [float] NULL,
	[policy_Judgment_Premium_UC] [float] NULL,
	[policy_Judgment_StandardPremium_UC] [float] NULL,
	[policy_Judgment_Mod_UC] [float] NULL,
	[policy_Judgment_Premium_GL] [float] NULL,
	[policy_Judgment_StandardPremium_GL] [float] NULL,
	[policy_Judgment_Mod_GL] [float] NULL,
	[policy_Judgment_Premium_Automobile] [float] NULL,
	[policy_Judgment_StandardPremium_Automobile] [float] NULL,
	[policy_Judgment_Mod_Automobile] [float] NULL,
	[AccountDiv_Reporting_Premium] [float] NULL,
	[AccountDiv_Percent_Monitored] [float] NULL,
	[AccountDiv_Judgment_Premium_NonUC] [float] NULL,
	[AccountDiv_Judgment_StandardPremium_NonUC] [float] NULL,
	[AccountDiv_Judgment_Mod_NonUC] [float] NULL,
	[AccountDiv_Judgment_Premium_UC] [float] NULL,
	[AccountDiv_Judgment_StandardPremium_UC] [float] NULL,
	[AccountDiv_Judgment_Mod_UC] [float] NULL,
	[AccountDiv_Judgment_Mod_NonUC_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountDiv_Judgment_Mod_UC_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policy_Judgment_Mod_GL_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policy_Judgment_Mod_Automobile_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
