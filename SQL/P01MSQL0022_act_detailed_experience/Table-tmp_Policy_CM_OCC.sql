IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tmp_Policy_CM_OCC]') AND type in (N'U'))
DROP TABLE [dbo].[tmp_Policy_CM_OCC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tmp_Policy_CM_OCC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tmp_Policy_CM_OCC](
	[companycode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[accountnumber] [int] NOT NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[effectivedate] [datetime] NOT NULL,
	[expirationdate] [datetime] NOT NULL,
	[coverage_state] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coveragecode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[premiumeffectivedate] [datetime] NOT NULL,
	[premiumexpirationdate] [datetime] NOT NULL,
	[sublinecode] [int] NOT NULL,
	[classcode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[acctngyear] [int] NOT NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[aslobcode] [int] NOT NULL,
	[aslobcode_Current] [int] NOT NULL
) ON [PRIMARY]
END
GO
