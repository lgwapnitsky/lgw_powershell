IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_PVCD_EPLId]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_PVCD_EPLId]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_PVCD_EPLId]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_PVCD_EPLId](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[coverage_group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[coverage_count] [int] NULL
) ON [PRIMARY]
END
GO
