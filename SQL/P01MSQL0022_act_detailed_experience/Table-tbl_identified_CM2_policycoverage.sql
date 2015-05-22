IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_identified_CM2_policycoverage]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_identified_CM2_policycoverage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_identified_CM2_policycoverage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_identified_CM2_policycoverage](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coveragecode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sublinecode] [int] NOT NULL,
	[classcode] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[effectivedate] [datetime] NOT NULL,
	[expirationdate] [datetime] NOT NULL,
	[isocoveragecode] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[aqskey] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tbl_identified_CM2_policycoverage]') AND name = N'INDX_classcode_NC')
CREATE NONCLUSTERED INDEX [INDX_classcode_NC] ON [dbo].[tbl_identified_CM2_policycoverage]
(
	[classcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tbl_identified_CM2_policycoverage]') AND name = N'INDX_coveragecode_NC')
CREATE NONCLUSTERED INDEX [INDX_coveragecode_NC] ON [dbo].[tbl_identified_CM2_policycoverage]
(
	[coveragecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tbl_identified_CM2_policycoverage]') AND name = N'INDX_effectivedate_NC')
CREATE NONCLUSTERED INDEX [INDX_effectivedate_NC] ON [dbo].[tbl_identified_CM2_policycoverage]
(
	[effectivedate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tbl_identified_CM2_policycoverage]') AND name = N'INDX_expirationdate_NC')
CREATE NONCLUSTERED INDEX [INDX_expirationdate_NC] ON [dbo].[tbl_identified_CM2_policycoverage]
(
	[expirationdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tbl_identified_CM2_policycoverage]') AND name = N'INDX_isocoveragecode_NC')
CREATE NONCLUSTERED INDEX [INDX_isocoveragecode_NC] ON [dbo].[tbl_identified_CM2_policycoverage]
(
	[isocoveragecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tbl_identified_CM2_policycoverage]') AND name = N'INDX_policynumber_NC')
CREATE NONCLUSTERED INDEX [INDX_policynumber_NC] ON [dbo].[tbl_identified_CM2_policycoverage]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tbl_identified_CM2_policycoverage]') AND name = N'INDX_statecode_NC')
CREATE NONCLUSTERED INDEX [INDX_statecode_NC] ON [dbo].[tbl_identified_CM2_policycoverage]
(
	[statecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tbl_identified_CM2_policycoverage]') AND name = N'INDX_sublinecode_NC')
CREATE NONCLUSTERED INDEX [INDX_sublinecode_NC] ON [dbo].[tbl_identified_CM2_policycoverage]
(
	[sublinecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
