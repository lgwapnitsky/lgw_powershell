IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Pol_Coverage_PV]') AND type in (N'U'))
DROP TABLE [dbo].[sb_Pol_Coverage_PV]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Pol_Coverage_PV]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_Pol_Coverage_PV](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Policy_PV_Cov_DO] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_PV_Cov_EPL] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_PV_Cov_Fid] [varchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_PV_Cov_Other] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[sb_Pol_Coverage_PV]') AND name = N'idx_src_pol')
CREATE NONCLUSTERED INDEX [idx_src_pol] ON [dbo].[sb_Pol_Coverage_PV]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
