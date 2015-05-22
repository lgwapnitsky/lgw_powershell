IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_CM_OCC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_CM_OCC](
	[companycode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[acctngyear] [int] NOT NULL,
	[accountnumber] [int] NOT NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[effectivedate] [datetime] NOT NULL,
	[expirationdate] [datetime] NOT NULL,
	[coverage_state] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coveragecode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[premiumeffectivedate] [datetime] NOT NULL,
	[premiumexpirationdate] [datetime] NOT NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[aslobcode] [int] NOT NULL,
	[aslobcode_Current] [int] NOT NULL,
	[sublinecode] [int] NOT NULL,
	[classcode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[isocoveragecode_calc] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[aslobCode_Final] [float] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND name = N'INDX_acctngyear')
CREATE NONCLUSTERED INDEX [INDX_acctngyear] ON [dbo].[Policy_CM_OCC]
(
	[acctngyear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND name = N'INDX_aslobcode_Current_NC')
CREATE NONCLUSTERED INDEX [INDX_aslobcode_Current_NC] ON [dbo].[Policy_CM_OCC]
(
	[aslobcode_Current] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND name = N'INDX_classcode_NC')
CREATE NONCLUSTERED INDEX [INDX_classcode_NC] ON [dbo].[Policy_CM_OCC]
(
	[classcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND name = N'INDX_coverage_state_NC')
CREATE NONCLUSTERED INDEX [INDX_coverage_state_NC] ON [dbo].[Policy_CM_OCC]
(
	[coverage_state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND name = N'INDX_coveragecode_NC')
CREATE NONCLUSTERED INDEX [INDX_coveragecode_NC] ON [dbo].[Policy_CM_OCC]
(
	[coveragecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND name = N'INDX_policynumber_NC')
CREATE NONCLUSTERED INDEX [INDX_policynumber_NC] ON [dbo].[Policy_CM_OCC]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND name = N'INDX_premiumeffectivedate_NC')
CREATE NONCLUSTERED INDEX [INDX_premiumeffectivedate_NC] ON [dbo].[Policy_CM_OCC]
(
	[premiumeffectivedate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND name = N'INDX_premiumexpirationdate_NC')
CREATE NONCLUSTERED INDEX [INDX_premiumexpirationdate_NC] ON [dbo].[Policy_CM_OCC]
(
	[premiumexpirationdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_CM_OCC]') AND name = N'INDX_sublinecode_NC')
CREATE NONCLUSTERED INDEX [INDX_sublinecode_NC] ON [dbo].[Policy_CM_OCC]
(
	[sublinecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
