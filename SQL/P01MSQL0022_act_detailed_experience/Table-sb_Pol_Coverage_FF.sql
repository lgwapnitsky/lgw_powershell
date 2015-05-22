IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Pol_Coverage_FF]') AND type in (N'U'))
DROP TABLE [dbo].[sb_Pol_Coverage_FF]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Pol_Coverage_FF]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_Pol_Coverage_FF](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Policy_FF_Cov_DO] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_FF_Cov_EPL] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_FF_Cov_Fid] [varchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_FF_Cov_WPV] [varchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_FF_Cov_Internet] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
