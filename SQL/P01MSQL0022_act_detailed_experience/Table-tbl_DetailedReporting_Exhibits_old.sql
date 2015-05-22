IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_DetailedReporting_Exhibits_old]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_DetailedReporting_Exhibits_old]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_DetailedReporting_Exhibits_old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_DetailedReporting_Exhibits_old](
	[MatchKey] [int] NULL,
	[Category] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExhibitOrder] [int] NULL,
	[GroupingDesc] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group1] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group2] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group3] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group4] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSort1] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSortDirection1] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSort2] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSortDirection2] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupHeader1] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupHeader2] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupHeader3] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupHeader4] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DetailedSort1] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DetailedSortDirection1] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DetailedSort2] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DetailedSortDirection2] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MeasureList] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tbl_DetailedReporting_Exhibits_old]') AND name = N'IDX_ExhibitOrder')
CREATE NONCLUSTERED INDEX [IDX_ExhibitOrder] ON [dbo].[tbl_DetailedReporting_Exhibits_old]
(
	[ExhibitOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
