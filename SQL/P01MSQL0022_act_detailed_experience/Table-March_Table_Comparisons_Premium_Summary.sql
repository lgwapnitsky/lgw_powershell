IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[March_Table_Comparisons_Premium_Summary]') AND type in (N'U'))
DROP TABLE [dbo].[March_Table_Comparisons_Premium_Summary]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[March_Table_Comparisons_Premium_Summary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[March_Table_Comparisons_Premium_Summary](
	[Column_calculation] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Differences] [int] NULL
) ON [PRIMARY]
END
GO
