IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHR_All_Policies_Price_Monitor_work]') AND type in (N'U'))
DROP TABLE [dbo].[RRHR_All_Policies_Price_Monitor_work]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHR_All_Policies_Price_Monitor_work]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHR_All_Policies_Price_Monitor_work](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[Standard_Curr_MIPS_WP] [decimal](38, 2) NULL,
	[Standard_Premium_Curr] [float] NULL,
	[Standard_Curr_MIPS_WP_GL] [float] NULL,
	[Standard_Curr_MIPS_WP_FA] [float] NULL,
	[Standard_Curr_MIPS_WP_FA_UC] [float] NULL,
	[Standard_Curr_MIPS_WP_FA_NonUC] [float] NULL,
	[Standard_Premium_Curr_GL] [float] NULL,
	[Standard_Premium_Curr_FA] [float] NULL,
	[Standard_Premium_Curr_FA_UC] [float] NULL,
	[Standard_Premium_Curr_FA_NonUC] [float] NULL,
	[Renewal_RCPrem_total] [float] NULL,
	[Renewal_RCPrem_GL] [float] NULL,
	[Renewal_RCPrem_FA] [float] NULL,
	[Renewal_RCPrem_FA_UC] [float] NULL,
	[Renewal_RCPrem_FA_NonUC] [float] NULL,
	[Prior_PolTerm_WP_total] [float] NULL,
	[Prior_PolTerm_WP_GL] [float] NULL,
	[Prior_PolTerm_WP_FA] [float] NULL,
	[Prior_PolTerm_WP_FA_UC] [float] NULL,
	[Prior_PolTerm_WP_FA_NonUC] [float] NULL,
	[Price_Monitor_Std_Cov_Grp_Monitored] [float] NULL,
	[Price_Monitor_Std_Cov_Grp_Monitored_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
