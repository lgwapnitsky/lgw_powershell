IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[March_Table_Comparisons_Policy_Information]') AND type in (N'U'))
DROP TABLE [dbo].[March_Table_Comparisons_Policy_Information]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[March_Table_Comparisons_Policy_Information]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[March_Table_Comparisons_Policy_Information](
	[Column_Name] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Differences] [int] NULL
) ON [PRIMARY]
END
GO
