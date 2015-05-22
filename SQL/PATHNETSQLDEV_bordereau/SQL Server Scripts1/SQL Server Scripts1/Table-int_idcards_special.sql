IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[int_idcards_special]') AND type in (N'U'))
DROP TABLE [dbo].[int_idcards_special]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[int_idcards_special]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[int_idcards_special](
	[transid] [int] IDENTITY(1,1) NOT NULL,
	[policy_num] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[transdate] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[runstatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[transid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[int_idcards_special]') AND name = N'ind_policyTransdate_special')
CREATE NONCLUSTERED INDEX [ind_policyTransdate_special] ON [dbo].[int_idcards_special]
(
	[policy_num] ASC,
	[transdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[int_idcards_special]') AND name = N'ind_Transdate_special')
CREATE NONCLUSTERED INDEX [ind_Transdate_special] ON [dbo].[int_idcards_special]
(
	[transdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
