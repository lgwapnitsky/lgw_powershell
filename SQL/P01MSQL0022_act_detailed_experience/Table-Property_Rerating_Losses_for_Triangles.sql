IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Property_Rerating_Losses_for_Triangles]') AND type in (N'U'))
DROP TABLE [dbo].[Property_Rerating_Losses_for_Triangles]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Property_Rerating_Losses_for_Triangles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Property_Rerating_Losses_for_Triangles](
	[claim_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coverage_id] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Accident_state] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Incurred_Loss] [numeric](38, 2) NULL
) ON [PRIMARY]
END
GO
