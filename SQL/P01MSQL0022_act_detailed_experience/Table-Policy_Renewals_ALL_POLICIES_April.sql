IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Renewals_ALL_POLICIES_April]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Renewals_ALL_POLICIES_April]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Renewals_ALL_POLICIES_April]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Renewals_ALL_POLICIES_April](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[prior_policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_2] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_3] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_4] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_5] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_6] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_7] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_8] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Renewals] [int] NULL,
	[New_Renew_Automatic_Prior_Policy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Automatic_Prior_Policy_2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Automatic_Prior_Policy_3] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Automatic_Prior_Policy_4] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Automatic_Prior_Policy_5] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
