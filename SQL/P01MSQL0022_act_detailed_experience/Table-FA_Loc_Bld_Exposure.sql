IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_Loc_Bld_Exposure]') AND type in (N'U'))
DROP TABLE [dbo].[FA_Loc_Bld_Exposure]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_Loc_Bld_Exposure]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_Loc_Bld_Exposure](
	[policy_number] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[location] [smallint] NOT NULL,
	[building] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
