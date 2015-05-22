IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[apps_losses_January]') AND type in (N'U'))
DROP TABLE [dbo].[apps_losses_January]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[apps_losses_January]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[apps_losses_January](
	[system] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[type] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[acct_mm] [int] NOT NULL,
	[acct_year] [int] NOT NULL,
	[company] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[account_number] [int] NOT NULL,
	[policy_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[insured_name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[effective_date] [datetime] NULL,
	[expiration_date] [datetime] NULL,
	[underwriter] [varchar](41) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[examiner] [varchar](41) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[claim_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[claim_desc] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[claim_status] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[type_of_loss] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[date_of_loss] [datetime] NOT NULL,
	[date_reported] [datetime] NOT NULL,
	[claim_open_date] [datetime] NOT NULL,
	[claim_close_date] [datetime] NULL,
	[product] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[exp_product] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[aslob] [int] NOT NULL,
	[subline] [int] NOT NULL,
	[coverage_id] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[class_code] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[premium_state] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[accident_state] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[territory] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[accident_year] [int] NULL,
	[total_case] [decimal](38, 2) NULL,
	[total_clae] [decimal](38, 2) NULL,
	[total_pdloss] [decimal](38, 2) NULL,
	[total_pdlae] [decimal](38, 2) NULL,
	[total_salvage] [decimal](38, 2) NULL,
	[total_subro] [decimal](38, 2) NULL,
	[curr_date_of_loss] [datetime] NULL
) ON [PRIMARY]
END
GO
