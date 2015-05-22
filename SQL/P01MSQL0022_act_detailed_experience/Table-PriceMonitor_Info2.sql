IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PriceMonitor_Info2]') AND type in (N'U'))
DROP TABLE [dbo].[PriceMonitor_Info2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PriceMonitor_Info2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PriceMonitor_Info2](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Standard_Curr_MIPS_WP] [float] NULL,
	[Standard_Curr_MIPS_WP_GL] [float] NULL,
	[Standard_Curr_MIPS_WP_FA] [float] NULL,
	[Standard_Curr_MIPS_WP_FA_UC] [float] NULL,
	[Standard_Curr_MIPS_WP_FA_NonUC] [float] NULL,
	[Standard_Premium_Curr] [float] NULL,
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
	[Prior_PolTerm_WP_FA_NonUC] [float] NULL
) ON [PRIMARY]
END
GO
